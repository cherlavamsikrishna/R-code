#Jai Ganesh Deva
getwd()
setwd("C:\\Users\\vamsi\\Desktop\\Dream Career")
library(data.table)


movie_df <- fread("Movie-Ratings.csv")

head(movie_df)
summary(movie_df)
colnames(movie_df) <- c("Film","Genre","CriticReviewRating", "AudienceRatings", "Budget","Year")
head(movie_df)




movie_df$Year <- factor(movie_df$Year)

str(movie_df)

#Distribution of Ratings

library(ggplot2)
pl <- ggplot(movie_df,aes(x=CriticReviewRating))
pl + geom_histogram(binwidth=10,color='blue',fill='pink') + ggtitle("Critic Ratings")+theme(plot.title = element_text(hjust = 0.5))


p2 <- ggplot(movie_df, aes(x = AudienceRatings))
p2 + geom_histogram(binwidth = 10,color = "green",fill = "blue") + ggtitle("Audience Ratings")+theme(plot.title = element_text(hjust = 0.5))

# AUDIENCE VS CRITICS


#point graph 
p3 <- ggplot(data = movie_df, aes(x = CriticReviewRating,y = AudienceRatings,color = Genre,size = Budget)) 
p3 + geom_point() +ggtitle("Critic vs Audience")+theme(plot.title = element_text(hjust = 0.5)) + geom_smooth(aes(group = 1),color = 'red')
print(p3)

#Line Graph
p3 + geom_line()+ggtitle("Critic vs Audience")+theme(plot.title = element_text(hjust = 0.5)) + geom_smooth(aes(group = 1),color = 'red')

# AUDIENCE VS BUDGET

p4 <- ggplot(data = movie_df, aes(x = Budget,y = AudienceRatings,color = Genre,size = Budget)) 
p4 + geom_point() + ggtitle("Budget vs Audience")+theme(plot.title = element_text(hjust = 0.5)) 



#Critics vs Budget
p5 <- ggplot(data = movie_df, aes(x = Budget,y = CriticReviewRating,color = Genre,size = Budget))
p5 + geom_point() + ggtitle("Budget vs Critics")+theme(plot.title = element_text(hjust = 0.5)) 

# Budget Distribution
#Histogram
p6 = ggplot(data = movie_df,aes(x = Budget))

p6 + geom_histogram(binwidth = 10, aes(fill = Genre),color = 'black') + ggtitle("Budget distribution") + theme(plot.title = element_text(hjust = 0.5)) 

#Density Charts

p7 = p6 + geom_density(aes(fill = Genre),position = 'stack')
print(p7)

# Statistical Tranformations


l <- ggplot(data = movie_df, aes(x = CriticReviewRating, y = AudienceRatings,color = Genre))
l + geom_point() + geom_smooth()

#Box Plots - Genre vs Ratings

m <- ggplot(data = movie_df,aes(x = Genre, y = AudienceRatings, color = Genre))
m + geom_boxplot(size = 1.1, alpha = 0.6) + geom_jitter()

n <- ggplot(data = movie_df,aes(x = Genre, y = CriticReviewRating, color = Genre))
n + geom_boxplot(size = 1.1, alpha = 0.6) + geom_jitter()

#Facets

w <- ggplot(data = movie_df, aes(x = CriticReviewRating, y= AudienceRatings,colour = Genre))

w + geom_point(size = 3)

w + geom_point(size = 3)+facet_grid(Genre~.)

w + geom_point(size = 3) + facet_grid(.~Year)

w + geom_point(size = 3) + facet_grid(Genre~Year)

w + geom_point(aes(size = Budget))+ facet_grid(Genre~Year) + coord_cartesian(ylim = c(0,100))










