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

The following screenshots will show that the best model from the exiperiment as a Voting Ensemble.  This model was then chosen to be used in the steps that will follow.

![image](https://user-images.githubusercontent.com/77330289/146930181-8d6a7789-4173-4bd5-8de7-53f9bdd70b58.png)

![image](https://user-images.githubusercontent.com/77330289/146930231-69a377d1-0792-4b49-a258-3820788d22f6.png)

![image](https://user-images.githubusercontent.com/77330289/146930251-db7a9cb0-4db5-482f-bf75-f6b3f20a0a80.png)

![image](https://user-images.githubusercontent.com/77330289/146930268-6c296491-0078-4813-85d5-83cb44f3a0da.png)

The third step in this project is to deploy the best model chosen from the Automated ML Experiment earlier.

The screenshot below shows the configuration setup for the deployment of the best model.  A name was provided for the deployed model, a brief description, container type was set as an Azure Container Instance and authentication was enabled.

![image](https://user-images.githubusercontent.com/77330289/146930569-38fb6bb1-3098-441b-90d7-03c80b1c5ffd.png)

The below screenshot shows the successful deployment of the best model, with a deployment state as healthy.  The screenshot also provides valuable information that will be used in the steps to follow.  The REST endpoint and Swagger URI is shown.
![image](https://user-images.githubusercontent.com/77330289/146930549-64ed3fe2-e323-42bf-bd5e-bebd53a73ce6.png)

The fourth step in this project was to enable logging.  In order to enable logging Azure Python SDK was used.  The python file provided in the starter_files folder (logs.py) was inspected and in order to work correctly a config.json file needs to be downloaded.  The config.json file contains detail about the Azure subscription and workspace.  The logs.py file was then modified to include my deployed model name and a line added to enable Application Insights (service.update(enable_app_insights=True)).  The logs.py file was executed in a terminal to enable Application Insights for the deployed model and to provide logging output.

The screenshot below shows that the Application Insights were successfully enabled.

![image](https://user-images.githubusercontent.com/77330289/146931997-de856c76-9f80-4251-a37a-c0057140514d.png)

The below screenshot shows that the logs.py file was executed in a terminal and logging information is then provided.

![image](https://user-images.githubusercontent.com/77330289/146932839-65174e42-ee03-4168-96a9-007d74f15fe2.png)

The fith step in this project was making use of Swagger Documentation to consume the deployed model endpoint.  The following steps needs to be completed in order to consume the enpoint using Swagger:
- The swagger.json file for the deployed model was downloaded.
- The port number in the swagger.sh file was changed from 80 to 9000.
- Execute the swagger.sh file (This will download the latest Swagger container and will run on port 9000).
- Execute the serve.py file (This will start a Python server on port 8000).
- Open up a browser and go to localhost.
- Enter http://localhost:8000/swagger.json to interact with the Swagger instance running, showing the documentation for the HTTP API of the model.

The below screenshot shows the execution of the swagger.sh file.

![image](https://user-images.githubusercontent.com/77330289/146937430-5970e9ec-05d4-418f-82d9-f283c33dadb3.png)

The below screenshot shows the execution of the python server.

![image](https://user-images.githubusercontent.com/77330289/146937554-695eb7ab-b27e-4690-a493-aa7cdfbd4c35.png)

The below screenshot shows that Swagger is running on a localhost, showing the HTTP API methods and responses of the deployed model.

![image](https://user-images.githubusercontent.com/77330289/146935589-af4d40f5-7c9f-4d3d-8e69-834afa6be2ba.png)

The below screenshot shows the get method of the deployed model.

![image](https://user-images.githubusercontent.com/77330289/146935658-d6b02cff-a9f8-4cbc-9bb5-b16ccb4732dc.png)

The below screenshot shows the post method containing the data structure that needs to be sent to the deployed model in order to obtain the prediction.

![image](https://user-images.githubusercontent.com/77330289/146935816-207cdec2-7b28-40d3-8939-958cc093f475.png)

The sixth step in this project was to consume the model endpoint using a python script.

The endpoints.py file was provided along with the starter_files folder.  In order to interact with my deployed model, I had to make a few modifications to the endpoints.py file.
- Authentication was enabled for my deployed model and thus I had to fetch the scoring_uri and key from the consume tab of my deployed model in Microsoft Azure Machine Learning Studio and add it to the endpoints.py file.
- I added to sets of data to the endpoints.py file which will return two predictions on wheter these clients will make a deposit at the bank.

I executed the enpoints.py file in a terminal and obtained two prediction which is shown in the screenshot below.

![image](https://user-images.githubusercontent.com/77330289/146937239-cafbce2a-0c49-4b01-bcd3-afd7c12de78d.png)

Benchmarking was suggested as an extra step.  I completed this extra step and will be shown in the standout suggestions section.

The last step in this project was to creat, publish and Consume a pipeline.

## Screen Recording
*TODO* Provide a link to a screen recording of the project in action. Remember that the screencast should demonstrate:

## Standout Suggestions
*TODO (Optional):* This is where you can provide information about any standout suggestions that you have attempted.
