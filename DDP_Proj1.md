Predicting MPG of Your Car!!!
========================================================
author: Ram
date: Sat Sep 13 23:50:31 2014
transition: fade

About the App
========================================================

The MPG App is the first of its kind app that can predict 
the MPG (Miles/(US) gallon) for your car based on the 
following input parameters

- Number of cylinders
- Gross horsepower
- Weight (lb/1000)
- Transmission (Automatic, Manual)
- Number of forward gears

About the Dataset
========================================================
<small style="font-size:0.9em">
The App was created using the mtcars dataset. The data was 
extracted from the 1974 Motor Trend US magazine, and 
comprises fuel consumption and 10 aspects of automobile 
design and performance for 32 automobiles (1973-74 models).
</small>
<small style="font-size:.4em">


```r
summary(mtcars$hp)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   52.0    96.5   123.0   147.0   180.0   335.0 
```

```r
summary(mtcars$wt)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1.51    2.58    3.32    3.22    3.61    5.42 
```

```r
levels(mtcars$am)
```

```
[1] "Auto"   "Manual"
```

```r
levels(mtcars$cyl)
```

```
[1] "4" "6" "8"
```

```r
levels(mtcars$gear)
```

```
[1] "3" "4" "5"
```
</small>

About the Model
========================================================

The website for the App is https://rsb4114.shinyapps.io/Project1/

The regression model was created using caret package

model <- train(mpg~hp+cyl+gear+am+wt, data = mtcars, method = "lm")


Thank You
========================================================
I hope you had fun playing with my app!! Please do recommend it to your friend :) 
