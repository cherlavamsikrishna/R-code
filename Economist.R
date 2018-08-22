#DATA Visualization

library(ggplot2)
library(data.table)

df <- fread('E:\\KITABE\\Economist_Assignment_Data.csv',drop = 1,sep = ",")
head(df)
summary(df)
p1 <- ggplot(df,aes(x = CPI,y = HDI,color = Region)) + geom_point(size = 4,shape = 3,stroke = 1)
print(p1)
p2 <- p1 + geom_smooth(aes(group = 1),method = 'lm',formula = y ~ log(x),se = F,color = 'red')
print(p2)
label_points <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                  "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                  "India", "Italy", "China", "South Africa", "Spane",
                  "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                  "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                  "New Zealand", "Singapore")
p3<- p2 + geom_text(aes(label = Country),colour = "black", fontface = "bold",data = subset(df,Country %in% label_points), check_overlap = TRUE )
print(p3)
p4 <- p3 + theme(panel.border = element_rect(linetype = "dashed", fill = NA),plot.title = element_text(hjust = 0.5),axis.text = element_text(colour = "blue"))
print(p4)
p5 <- p4 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10=least corrupt)",
                                limits = c(.9, 10.5),breaks=1:10) 
print(p5)

p6 <- p5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                                limits = c(0.2, 1.0))
print(p6)
p6 + ggtitle("Corruption and Human development")
library(ggthemes)
p6 + theme_economist_white()
  