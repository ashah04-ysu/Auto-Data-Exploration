#a
auto=read.csv("C:\\Users\\ashah04\\Desktop\\Spring 2022\\DATX 5805\\ALL+CSV+FILES+-+2nd+Edition+-+corrected\\ALL CSV FILES - 2nd Edition\\Auto.csv", head=T)
dim(auto)
auto=na.omit(auto)
dim(auto)

summary(complete.cases(auto))
sapply(auto, class)

summary(auto)
head(auto)
unique(auto$name)
head(unique(auto$name[auto$origin==1]), 10)
head(unique(auto$name[auto$origin==2]), 10)
head(unique(auto$name[auto$origin==3]), 10)

auto$origin <- factor(auto$origin, levels=1:3, labels=c("U.S.", "Germany", "Japan"))
sapply(auto, class)
auto

quant <- sapply(auto, is.numeric)
quant

#b
sapply(auto[, quant], range)

#c
sapply(auto[, quant], function(x) signif(c(mean(x), sd(x)), 2))

#d
#Part1
#boxplot(auto$mpg, auto$cylinders, auto$displacement, auto$horsepower, auto$weight, auto$acceleration, auto$year)
boxplot(auto$mpg, auto$cylinders, auto$displacement, 
        auto$horsepower, auto$weight, auto$acceleration, 
        auto$year, data = auto, varwidth = TRUE, 
        log = "y", las = 1)
title("Weight vs. All Quantitatives")

boxplot(auto$mpg)
title("mpg BoxPlot")

boxplot(auto$cylinders)
title("cylinders BoxPlot")

boxplot(auto$displacement)
title("displacement BoxPlot")

boxplot(auto$horsepower)
title("horsepower BoxPlot")

boxplot(auto$weight)
title("weight BoxPlot")

boxplot(auto$acceleration)
title("acceleration BoxPlot")

boxplot(auto$year)
title("year BoxPlot")


boxplot(mpg ~cylinders, data = auto, varwidth = TRUE, log = "y", las = 1)
title("MPG vs. Cylinders")

#Part2
pie(table(auto$origin))

#part3

#name_id <- transform(auto, ID = as.numeric(factor(name)))
#name_id
#lapply(name_id, table)
#pie(table(name_id))

x <- barplot(table(auto$name), xaxt="n", space=5)
labs <- paste(names(table(auto$name)), "name")
text(cex=0.1, x=x-.25, y=-0.5, labs, xpd=TRUE, srt=90)

?barplot

#e
rand <- sample(0:86, 1)
rand

auto_rand <- auto[-c(rand), ]
auto_rand

#colMeans(c(auto_rand$mpg, auto_rand$cylinders, auto_rand$displacement, auto_rand$horsepower, auto_rand$weight, auto_rand$acceleration, auto_rand$year, na.rm=TRUE))
#colMeans(auto_rand)
#?colMeans

#mean(auto$mpg)
#colMeans(auto_rand$mpg)
#?array

#auto_randArray <-array(auto_rand, dim = length(auto_rand), dimnames = NULL)
#colMeans(c(auto_randArray$mpg, auto_randArray$cylinders, auto_randArray$displacement, auto_randArray$horsepower, auto_randArray$weight, auto_randArray$acceleration, auto_randArray$year, na.rm=TRUE))

#colMeans(c(auto_randArray))

mean(auto_rand$mpg)
mean(auto_rand$cylinders)
mean(auto_rand$displacement)
mean(auto_rand$horsepower)
mean(auto_rand$weight)
mean(auto_rand$acceleration)
mean(auto_rand$year)

range(auto_rand$mpg)
range(auto_rand$cylinders)
range(auto_rand$displacement)
range(auto_rand$horsepower)
range(auto_rand$weight)
range(auto_rand$acceleration)
range(auto_rand$year)


sd(auto_rand$mpg)
sd(auto_rand$cylinders)
sd(auto_rand$displacement)
sd(auto_rand$horsepower)
sd(auto_rand$weight)
sd(auto_rand$acceleration)
sd(auto_rand$year)


#f
library(pheatmap)
pheatmap(t(scale(as.matrix(auto[, quant]))), 
         annotation=auto["origin"],
         show_colnames=FALSE)

x <- auto$year
y <- auto$horsepower
plot(x,y, main ="compare between car year and horsepower", xlab="Year", ylab="horsepower", pch =19, frame = FALSE)

#abline(lm(y ~ x, data = auto), col = "Red")
lines(lowess(x, y), col = "blue")

x <- auto$year
y <- auto$weight
plot(x,y, main ="compare between car year and weight", xlab="Year", ylab="weight", pch =19, frame = FALSE)

abline(lm(y ~ x, data = auto), col = "Red")

x <- auto$origin
y <- auto$acceleration
plot(x,y, main ="compare between car origin and acceleration", xlab="origin", ylab="acceleration", pch =19, frame = FALSE)
abline(lm(y ~ x, data = auto), col = "blue")

#g
hist(auto$mpg, main = "Mpg Histogram", xlab = "mpg", col = "blue")
hist(auto$displacement, main = "Displacement Histogram", xlab = "Displacement", col = "green")
hist(auto$horsepower, main = "Horsepower Histogram", xlab = "Horsepower", col = "pink")
hist(auto$weight, main = "Weight Histogram", xlab = "Weight", col = "blue")
hist(auto$acceleration, main = "Acceleration Histogram", xlab = "Acceleration", col = "green")
hist(auto$cylinders, main = "Cylinders Histogram", xlab = "cylinders", col = "red")
hist(auto$year, main = "year Histogram", xlab = "year", col = "purple")
          