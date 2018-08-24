#' Dependency
#'
#' Add apoint dependency.
#'
#' @param cdn Whether to use local or CDN files.
#'
#' @examples
#' library(aframer)
#'
#' browse_aframe(
#'   a_scene(
#'     a_dependency(),
#'     apoint_dependency()
#'   )
#' )
#'
#' @note Source \link[aframer]{a_dependency} \emph{before} \code{apoint_dependency}.
#'
#' @export
apoint_dependency <- function(cdn = FALSE){
  .get_dependency(
    script = "aframe-point-component.min.js",
    cdn = cdn
  )
}

#' Point
#'
#' Add a point.
#'
#' @param size Point size.
#' @param ... Any aframer element or option.
#'
#' @examples
#' library(aframer)
#'
#' browse_aframe(
#'   a_scene(
#'     a_dependency(),
#'     apoint_dependency(),
#'     a_point(5, color = "blue", perspective = FALSE, position = "0 1 -200"),
#'     a_point(5, color = "red", perspective = FALSE, position = "5 0 -250"),
#'     a_point(2, color = "black", perspective = FALSE, position = "-7 3 -100")
#'   )
#' )
#'
#' @export
a_point <- function(size, ...){

  if(missing(size))
    stop("must pass size", call. = FALSE)

  aframer::a_primitive(
    "point",
    list(
      size = size,
      ...
    )
  )
}

#' Add stars
#'
#' Add stars background.
#'
#' @param ... Any aframer element or option.
#'
#' @examples
#' library(aframer)
#'
#' browse_aframe(
#'   a_scene(
#'     a_dependency(),
#'     apoint_dependency(),
#'     a_sky(color = "#000"),
#'     a_stars()
#'   )
#' )
#'
#' @export
a_stars <- function(...){

  tags <- htmltools::tagList(
    aframer::a_entity(
      light = "type: ambient; color: #fff"
    ),
    aframer::a_sphere(
      position = "0 0 0",
      perspective = "true",
      radius = "0.2",
      color = "#69d",
      id = "earth-too-big"
    ),
    a_point(
      position = "0 0 0",
      color = "#fff",
      size = "0.1",
      perspective = "true"
    ),
    ...,
    htmltools::HTML(
      "<script>
       const mul = x => 0.07 * x
       const points = document.querySelector('a-point')
       setTimeout(function() {
            points.components.point.setPoints(
                hygdata
                .map(star => [mul(star.x), mul(star.y), mul(star.z)]))
        }, 1000)
      </script>
      "
    )
  )

  stars <- htmltools::htmlDependency(
    name = "starsdata",
    version = "0.0.1",
    src = system.file("js", package = "apoint"),
    script = "hygdata.js"
  )

  htmltools::tagList(tags, stars)
}
