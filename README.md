# apoint

Point component for [aframer](https://aframer.john-coene.com/)

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/apoint")
```

## Example

``` r
library(aframer)
library(apoint)

browse_aframe(
  a_scene(
    a_dependency(),
    apoint_dependency(),
    a_point(5, color = "blue", perspective = FALSE, position = "0 1 -200"),
    a_point(5, color = "red", perspective = FALSE, position = "5 0 -250"),
    a_point(2, color = "black", perspective = FALSE, position = "-7 3 -100")
  )
)
```

