#########################################################################
################## Graphics for Sara's Gator ESA story ################
######################### Joan Meiners 2017 #############################

setwd("/Users/joanmeiners/Dropbox/NOLA.com/ESA_series_for_Sara/alligators")

library(ggplot2)

# load data
gators = read.csv("alligators.csv", header = TRUE)
View(gators)

# remove first three rows, unreliable/unusable data
colnames(gators) = c("Year", "Thousands_Nests", "Length", "Bonus_season")

# change classes
gators$Thousands_Nests = as.numeric(as.character(gators$Thousands_Nests))
gators$Length = as.numeric(as.character(gators$Length))
gators$Bonus_season = as.numeric(as.character(gators$Bonus_season))

# make new column
gators$Nests = as.numeric(gators$Thousands_Nests*1000)

# plot gator nests and length over time
quartz(width = 10, height = 6)
ggplot(gators, aes(x = Year, y =Nests)) +
  geom_point() + 
  geom_smooth(method = "lm", color = "darkgreen") +
  xlab("Year") + ylab("Estimated Number of Nests") +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=15)) +
  theme(axis.text = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=10)) +
  scale_x_continuous(breaks=c(1970, 1980, 1990, 2000, 2010, 2017)) +
  scale_y_continuous(labels = function(x) paste0(scales::comma(x)))

tiff(filename = "Gators", units = "in", compression = "lzw", res = 300, width = 10, height = 6)
dev.off()
