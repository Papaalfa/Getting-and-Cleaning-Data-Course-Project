
# The Code Book for the "averageSet"

## Overall description 

"averageSet" a resulting dataset being created by the run_analysis.R script placed in this repository. The base data set the averageSet is created from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables and observations

There are 68 variables and 180 observations in the resulting dataset.

### Observations

Each observation stands for an average of means and standard deviations from the initial Samsung dataset for each activity and each subject.

### Variables

The variables are:

**Activity.Label** - are labels for differents activities of subjects from the possible set of:  
1. WALKING  
2. WALKING_UPSTAIRS  
3. WALKING_DOWNSTAIRS  
4. SITTING  
5. STANDING  
6. LAYING  
      
**Subject** - are subjects IDs which can be from 1 to 30 indicating a certain person performing testings for the research.

**Average.*** - All the other 66 variables starting with "Average." are averages of the corresponding means and standard deviations from the initial Samsung dataset.   
The averages are taken for each activity and each subject. 
The initial variables are decribed in the features_info.txt file from the Samsung dataset.
