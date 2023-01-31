# Auto Data Exploration and Analysis
This code analyzes the Auto dataset using various statistical and graphical techniques.

## Importing and Cleaning the Data
The data is imported using the `read.csv` function and stored in the `auto` variable. The `na.omit` function is used to remove missing values, and the resulting dimensions are displayed using the `dim` function. A summary of the complete cases is displayed using the `summary` function, and the `sapply` function is used to display the classes of all variables in the `auto` data frame.

## Summary Statistics
The `sapply` function is used to display the range of all quantitative variables in the `auto` data frame. The mean and standard deviation of all quantitative variables are displayed using the `sapply` function and the `mean` and `sd` functions.

## Graphical Analysis
The `boxplot` function is used to display boxplots for all quantitative variables in the `auto` data frame, as well as a boxplot of the relationship between `mpg` and `cylinders`. The `pie` function is used to display the distribution of `origin` in the `auto` data frame, and the `barplot` function is used to display the distribution of `name`.

## Sampling
A random observation is removed from the `auto` data frame and stored in the `auto_rand` variable. The mean and standard deviation of all quantitative variables in the `auto_rand` data frame are displayed using the `mean` and `sd` functions. The range of all quantitative variables in the `auto_rand` data frame is displayed using the `range` function.
