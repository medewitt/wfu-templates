#' Gggplot2 Theme for Presentations
#' @description This theme is a larger size for presentations consistent with
#'     the WFU style guide
#' @export

theme_pres_wake <- function(){
  theme(panel.background = element_blank(),
        plot.title = element_text(size = 24, family = "Times"),
        plot.subtitle = element_text(size = 18),
        plot.caption = element_text(size = 16),
        panel.grid = element_blank(),
        axis.title = element_text(size = 18),
        axis.text = element_text(size = 16),
        legend.background = element_rect(fill="transparent", colour=NA),
        legend.key = element_rect(fill="transparent", colour=NA),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12)
        )
}

#' @examples
#'  ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species))+
#'  geom_point()+
#'  theme_pres_wake()+
#'  scale_color_wake()+
#'  labs(
#'    title = "The is the Wake Forest Title",
#'    subtitle = "Yep"
#'  )
