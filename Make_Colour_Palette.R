# Make a colour palette in R using viridis or RColorBrewer and visualize it
### Deon de Jager 12-04-2022

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# 1. Viridis (best for continuous scales, but can also be used for discrete)
## Viridis is great, because
## 1. It is beautiful
## 2. The colours are perfectly perceptually uniform (even in black and white)
## 3. The colours are perceived by the by the most common form of colour blindness
## Source: https://www.r-bloggers.com/2018/07/ggplot2-welcome-viridis/

## Load packages (install them first if need be, e.g. install.packages("scales"))
library(viridisLite)
library(scales)
library(RColorBrewer)

## Make palette with custom number of colours
### To see the scales (options) available in the viridis package, type ?viridis
### Here I use the plasma scale, but others can be used, e.g. viridisLite::mako()
pal <- viridisLite::plasma(9)
pal # Prints the hex codes

## Visualize the colours with the show_col function of the scales package
show_col(pal)

## Start or end the palette at a different point
pal1 <- viridisLite::plasma(n=9, begin=0.1)
pal1
show_col(pal1)

pal2 <- viridisLite::plasma(n=9, end=0.95)
pal2
show_col(pal2)

## Others
pal3 <- viridisLite::turbo(9, direction = -1, begin = 0.1, end = 0.9)
show_col(pal3)

## Save colour palette to file
pdf(file = "Colour_palette_pal2.pdf") # Create PDF file
show_col(pal2) # Write plot to PDF file
dev.off() # Close PDF file
## The plot is saved in your current working directory, 
## which can be checked with: getwd()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# 2. RColorBrewer (better for discrete data, but limited number of colours)
## Sometimes viridis is not great for discrete colour palettes,
## in which case you can use RColorBrewer: https://colorbrewer2.org/ (or see code below)
## but it is not really have the flexibility of viridis
## See ?RColorBrewer for help

### Show all palettes in RColorBrewer
display.brewer.all()

### Show only colour blind friendly palettes
display.brewer.all(colorblindFriendly = T)

### Create a divergent colour palette
div_brewer_pal <- brewer.pal(9, "RdYlBu")
show_col(div_brewer_pal)

### Save palette to file
pdf(file = "Colour_palette_div_brewer_pal.pdf") # Create PDF file
show_col(div_brewer_pal) # Write plot to PDF file
dev.off() # Close PDF file

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
