*NOTE:* This file is a template that you can use to create the README for your project. The *TODO* comments below will highlight the information you should be sure to include.


# Your Project Title Here

*TODO:* Write an overview to your project.

## Architectural Diagram
*TODO*: Provide an architectual diagram of the project and give an introduction of each step. An architectural diagram is an image that helps visualize the flow of operations from start to finish. In this case, it has to be related to the completed project, with its various stages that are critical to the overall flow. For example, one stage for managing models could be "using Automated ML to determine the best model". 

## Key Steps
The first step of this project is authentication.  This step could not be completed using the virtual machine provided by this course.  I went ahead and skipped to the second step.

The second step in this project is to create an Automated ML Experiment.

In order to create an Automated ML Experiment the following steps were taken.

1). I had to upload and register the bankmarketing_train.csv to Microsoft Azure Machine Learning Studio.  The two screenshots below shows this step.

![image](https://user-images.githubusercontent.com/77330289/146927691-faec63e6-0612-4b44-8003-7eb2da178382.png)

![image](https://user-images.githubusercontent.com/77330289/146927731-2da425af-3247-4191-9c7c-57ce4f7049ae.png)

2).  The second important step to be able to create an Automated ML Experiment is to configure a compute cluster.  A standard_DS12_V2 compute cluster with a minimum of one node and a maximum of 6 nodes was created.

3).  Now that a dataset has been registered and a compute cluster has been created, an Automated ML run can be created.  Thereafter, a automated ML experiment was created.  The following configuration was used for the Automated ML Experiment:
- Classification was used to predict the outcome.
- On exit criterion default time was reduced to 1 hour. (This is to reduce the training time due to the Virtual Machine Time limit)
- Concurrency was set to 5, which should always be one less than the maximum nodes specified in the compute cluster.
The following screenshot shows that the Automated ML Experiment has completed successfully.

![image](https://user-images.githubusercontent.com/77330289/146929209-0c0af3d9-5950-47ea-804b-5c0561b3a677.png)



## Screen Recording
*TODO* Provide a link to a screen recording of the project in action. Remember that the screencast should demonstrate:

## Standout Suggestions
*TODO (Optional):* This is where you can provide information about any standout suggestions that you have attempted.
