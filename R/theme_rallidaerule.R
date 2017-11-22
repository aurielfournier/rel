#' A custom ggplot2 theme to make plots the way I generally like them
#' 
#' there are no arguments
#' @keywords ggplot2 
#' @export
#' @examples 
#' ggplot(data=dat, aes(x=x, y=y))+
#'      geom_point()+
#'      theme_rallidaerule()


theme_rallidaerule <- function(){
  theme(axis.text.x = element_text(size=12,color="black"),
        axis.text.y = element_text(size=12,color="black"),
        axis.title.y=element_text(size=20),
        plot.background = element_blank(),
        panel.border=element_blank(),
        panel.grid.major= element_line(colour=NA), 
        panel.grid.minor=element_line(colour=NA),
        title=element_text(size=20),
        panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(colour="black"),
        axis.line.y=element_line(colour="black"),
        strip.background=element_rect(fill="white", color="black"),
        strip.text=element_text(size=15))
}
