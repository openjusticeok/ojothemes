# ojothemes

This package contains OK Policy branded themes for `{ggplot2}` plots and `{gt}` tables. There are currently three different looks available: 

- `"okpi"` is our default OK Policy branding,
- `"ojo"` is for the defunct Open Justice Oklahoma branding, and
- `"tok"` is for the Together Oklahoma theme.

## {ggplot2}

The OK Policy theme:
![image](https://github.com/user-attachments/assets/eabedacd-0f0e-4d1e-b07a-b3767105aa2a)

The OJO theme:
![image](https://github.com/user-attachments/assets/c02749a8-2b17-4e89-b981-7f9dba8735e0)


## {gt}

The OK Policy theme:
![image](https://github.com/user-attachments/assets/0ee2d764-fba3-4ea4-8480-dea51b08a5d0)

The OJO theme:
![image](https://github.com/user-attachments/assets/e159df30-96dc-4bfb-9e80-0b5eac36ed97)

## Font Size Heuristics

New in version 1.1.2: Automatic font size adjustment for plots with many labels.

When your plots have many axis labels (like 30+ district names), fonts are automatically scaled down to maintain readability. This feature can be controlled or disabled:

```r
# Automatic font scaling (default)
ggplot(data, aes(x = value, y = many_categories)) +
  geom_point() +
  theme_okpi()

# Disable automatic scaling  
theme_okpi(heuristics = "none")

# Manual control
adjustments <- calculate_font_size_heuristics(data, y_var = "categories")
theme_okpi(font_size_adjustments = adjustments)
```
