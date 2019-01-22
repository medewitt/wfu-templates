#' Voroni Position Placement
#'
#'
#' @export
#'
#'

# position_furthest <- ggplot2::ggproto("position_furthest",
#   Position,
#   compute_panel = function(self, data, params, scales) {
#     groups <- unique(data$group)
#     if (length(groups) > 1) {
#       do.call(rbind,
#               lapply(groups, function(g) {
#                 distances <- FNN::get.knnx(subset(data, group != g)[, c("x", "y")],
#                                            subset(data, group ==g)[, c("x", "y")],
#                                            k = 1)
#                 subset(data, group == g)[which.max(distances$nn.dist), ]
#               }))
#     } else {
#       data[1, ]
#     }
#   }
# )

#'@example
#'library(ggplot2)
#'library(dplyr)
#'set.seed(42)
#'data <- data.frame(x = rnorm(20), y = rnorm(20))
#'data$group <- rep_len(letters[1:3], length.out = 20)

#'data %>%
#'  ggplot(aes(x,y, color = group))+
#'  geom_point(aes(color = group))+
#'  ggrepel::geom_label_repel(aes(label = group), position = position_furthest)+
#'  coord_fixed()
