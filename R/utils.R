.get_dependency <- function(script, cdn){

  if(isTRUE(cdn))
    path <- c(href = "https://unpkg.com/aframe-point-component/dist/")
  else
    path <- c(file = system.file("apoint", package = "apoint"))

  htmltools::htmlDependency(
    name = "apoint",
    version = "0.0.1",
    src = path,
    script = script
  )
}
