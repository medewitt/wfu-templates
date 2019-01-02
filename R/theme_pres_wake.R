#' Gggplot2 Theme for Presentations
#' @description This theme is a larger size for presentations consistent with
#'     the WFU style guide
#' @export

theme_pres_wake <- function(){
  ggplot2::theme(panel.background = ggplot2::element_blank(),
        plot.title = ggplot2::element_text(size = 24, family = "Times"),
        plot.subtitle = ggplot2::element_text(size = 18),
        plot.caption = ggplot2::element_text(size = 16),
        panel.grid = ggplot2::element_blank(),
        axis.title = ggplot2::element_text(size = 18),
        axis.text = ggplot2::element_text(size = 16),
        legend.background = ggplot2::element_rect(fill="transparent", colour=NA),
        legend.key = ggplot2::element_rect(fill="transparent", colour=NA),
        legend.title = ggplot2::element_text(size = 14),
        legend.text = ggplot2::element_text(size = 12)
        )
}

#' @example
#'  ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species))+
#'  geom_point()+
#'  theme_pres_wake()+
#'  scale_color_wake()+
#'  labs(
#'    title = "The is the Wake Forest Title",
#'    subtitle = "Yep"
#'  )
