#' add_wfu_watermark
#' @description This function adds the WFU logo as a watermark to any
#'     ggplot2 graph
#' @param alpha the opacity
#' @importFrom grDevices rgb
#' @export

add_wfu_watermark <- function(alpha = .2){

  m <- png::readPNG(system.file("img", "wfu_bw.png",
                                package="wfutemplates"), FALSE)

  m2 <- array(1, dim = c(550, 864, 4))

  m2[,,-4] <-m

  w <- matrix(grDevices::rgb(m2[,,1],m2[,,2],m2[,,3], m2[,,4]*alpha), nrow=dim(m)[1])


  ggplot2::annotation_custom(xmin=-Inf, ymin=-Inf, xmax=Inf, ymax=Inf,
                    grid::rasterGrob(w))
}

#' @example
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   add_wfu_watermark()+
#'   geom_point()+
#'   theme_minimal()
