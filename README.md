This repo contains run_analysis.R script for Coursera course Getting and Cleaning Data course projec.

Script reads in all data csv files, examines the dimensions to understand the data and relationships.

Test and training data are then combined using rbind.

"x" data frame contains all the activity results. In order to get only the mean and STD measurements, "x" is subsetted based on column names which are read/substituted from "features.txt" file into "desiredFeatures".

"meansAndDevs"" contains this subset of data.
The subject data ("s") and activity data ("y") are then combined with "meansAndDevs" using cbind into "all" data frame.

For Q5 of the project, "meansSubjectActivity" data frame is created using aggregate function on the "meansAndDevs" data frame. Result is writted to a text file calles "means_subject_activity.txt".

