library(rvg)
library(tidyverse)
library(officer)

#sample data
dat <- data.frame(x = rnorm(100, 10),
                  y = rnorm(100, 100),
                  z = rnorm(100, 1))

#make an empty ppt
read_pptx() %>% 
  #add a slide, must specify the slide layout and layout name
  add_slide(layout="Title and Content", master="Office Theme") %>%
  #specify what you want on the slide (code = ...)
  #type="body" means the plots going in the body part of the layout
  #width and height are in inches
  ph_with_vg(code = plot(dat$x, dat$y, main="Edit me!", pch=16), type="body", width=6, height=4) %>%
  #output your ppt (target argument is just the file destination/name)
  print(target="plot.pptx")


#make some other plots, say some figures for a manuscript
f1 <- ggplot(dat, aes(x,y)) + geom_point()
f2 <- ggplot(dat, aes(z)) + geom_histogram()
f3 <- ggplot(dat, aes(y,z)) + geom_line()

#store your plots in a list to reference
plots <- list(f1, f2, f3)

#function to print each plot in list on new page
plotsToPPT <- function(plotList, target) {
  #create an empty doc
  doc <- read_pptx()
  for (i in plotList){
    #each plot is put on a separate page in the ppt
    add_slide(doc, layout = "Title and Content", master = "Office Theme") %>%
      #call your ggplots individually using ggobj arg.
      ph_with_vg(ggobj = i, type = "body")
  }
  #output your ppt to the intended file name
  print(doc, target = target)
}

plotsToPPT(plots, "manuscriptPlots.pptx")