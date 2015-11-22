List of variables:


activity_labels: Activity Labels data farameread from activity_labels.txt
test_s: Subject data for "test" set read from subject_test.txt
test_x: Test data for "test" set read from X_test.txt
test_y: Activity data for "test" set read from y_test.txt

train_s: Subject data for "train" set read from subject_train.txt
train_x: Test data for "train" set read from X_train.txt
train_y: Activity data for "train" set read from y_train.txt

features: Measurment names read from features.txt

s: All of subject data (test + train)
x: All of test data (test + train)
y: All of activity data (test + train)

desiredFeatures: mean and STD measurment names

meansAndDevs: Subset of test data with only mean and STD measurements

all: combination of subject, activity and test data


meansSubjectActivity: Final data frame thhat contains mean of each measurment per subject and activity.
