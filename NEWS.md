# ojothemes 2.0.0

## Breaking changes

* **The OJO theme and OJO colors have been removed.** `theme_ojo()`,
  `theme_ojo_base()`, `gt_ojo()`, `scale_color_ojo()`, `scale_fill_ojo()`,
  `palette_ojo_*`, and `ojo_set_theme(theme = "ojo")` are gone.
* **`okpi` is renamed to `opi`**: `theme_okpi()` → `theme_opi()`,
  `theme_okpi_base()` → `theme_opi_base()`, `gt_okpi()` → `gt_opi()`,
  `scale_color_okpi()` → `scale_color_opi()`, `scale_fill_okpi()` →
  `scale_fill_opi()`, `okpi_blue`/`red`/`yellow` (+ lights and palettes) →
  `opi_*`, `palette_okpi_main` → `palette_opi_main`,
  `GeomColOJO` → `GeomColOPI`, and `colOJO` → `colOPI`.
* **`Roboto Mono` and `Roboto Condensed` are no longer bundled, downloaded,
  or referenced.** Every theme now defaults to the bundled **Source Sans 3**
  (variable font, SIL OFL). No network access happens at package load.
* `ggplot2 (>= 4.0)` is now required.

## New features

* **Bundled, registered font.** Source Sans 3 ships inside the package
  (variable font, SIL OFL) and is registered explicitly via `systemfonts`
  at load time. No font installation, admin rights, or network required —
  plots render pixel-identically across Windows, macOS, and Linux.
* `ojo_fonts()` reports where every font known to ojothemes resolves from
  (`bundled`, `local`, `fetched`, `system`, or `missing`) with actionable
  diagnostics.
* **Enforced export.** New `ojo_save_png()` and `ojo_save_svg()` always
  render through ragg/svglite and accept dimensions in any unit (`in`,
  `px`, `pt`, `mm`, `cm`) so communications specs can be passed verbatim.
  `unit = "px"` is dpi-relative (default 72: 1 px = 1/72 in); `pt`, `mm`,
  and `cm` are absolute physical units. String dpi aliases (e.g.
  `"retina"`) are rejected in favor of explicit numbers.
* Proprietary fonts such as Adobe Myriad Pro are supported via the local
  `fonts/` drop-in workflow; see `ojo_fonts()` and the vignette.

# ojothemes 1.2.0

* Unreleased; superseded by 2.0.0.

# ojothemes 1.1.3 (2025-08-06)

* Fixes a bug that prevented spanner lines from showing up in `gt_okpi()`, etc.

# ojothemes 1.1.2 (2025-07-28)

* No really, it really does that now, trust me bro
* Uses `gt::cols_label_with` to change column name appearance to title case without changing underlying column names

# ojothemes 1.1.1 (2025-04-20)

* Actually does that...

# ojothemes 1.1.0 (2025-04-20)

* Brings clean "Title Case" to column headers created by gt_* functions using `{snakecase}`
