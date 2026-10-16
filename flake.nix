{
  description = "ojothemes — OPI/TOK themes for ggplot2 and gt (R package)";

  inputs = {
    nixpkgs.url = "github:rstats-on-nix/nixpkgs/r-daily";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    # Suggests (and vignette) dependency; a private sibling package.
    ojodb = {
      url = "github:openjusticeok/ojodb/ojodb-v3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        let
          # Runtime deps (DESCRIPTION: Imports).
          rImports = with pkgs.rPackages; [
            colorspace
            dplyr
            ggplot2
            gt
            ragg
            rlang
            snakecase
            svglite
            systemfonts
            tidyselect
          ];

          # Suggests used by vignettes/tests; needed for `devtools::check()`.
          rSuggests = with pkgs.rPackages; [
            ggrepel
            knitr
            lubridate
            rmarkdown
            testthat
            tibble
            vdiffr
          ];

          rDev = with pkgs.rPackages; [
            devtools
            roxygen2
            rcmdcheck
            pkgload
            pkgbuild
          ];

          ojodb = inputs.ojodb.packages.${system}.ojodb;

          ojothemes = pkgs.rPackages.buildRPackage {
            name = "ojothemes";
            src = ./.;
            propagatedBuildInputs = rImports;
            nativeBuildInputs = with pkgs.rPackages; [ knitr rmarkdown ];
          };
        in
        {
          packages = {
            inherit ojothemes;
            default = ojothemes;
          };

          devShells.default = pkgs.mkShell {
            name = "ojothemes-dev";
            buildInputs = [ pkgs.R ] ++ rImports ++ rSuggests ++ rDev ++ [ ojodb ];
            packages = with pkgs; [ jarl arf air-formatter ];
            shellHook = ''
              echo "ojothemes dev shell — R -e 'devtools::check()'"
            '';
          };
        };
    };
}
