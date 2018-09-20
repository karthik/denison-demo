# Package wraps the C++ Magick library

library(magick)
magick_config()
tiger <- image_read('http://jeroen.github.io/images/tiger.svg')
image_info(tiger)
tiger

image_write(tiger, format = "png", path = "tiger.png")


library(shiny)
library(magick)
runGitHub("jeroen/shinymagick")
