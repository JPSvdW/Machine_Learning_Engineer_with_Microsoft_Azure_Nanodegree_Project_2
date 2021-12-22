# Operationalizing Machine Learning

This is the second project for the Udacity Machine Learning Engineer with Microsoft Azure Nanodegree Program and relates to the operationalization of machine learning.

In this project I have imported and registerred a bank marketing dataset used to train a classification machine learning model using Automated Machine Learning in Azure Machine Learning Studio.  After the AutoML experiment finished the best model (VotingEnsemble) was chosen to be deployed using a an Azure Container Instance (ACI).  Application Insights and logging for the deployed model was enabled.  Swagger documentation was created for the deployed model HTTP API.  The model REST endpoint was then consumed using the Python SDK.  Finally a pipeline was created, published and consumed.

## Architectural Diagram
![image](https://user-images.githubusercontent.com/77330289/146950620-a655f479-9321-4eb8-a09d-4e8146b31a45.png)

1).  Register the Bank Marketing Dataset in Azure Machine Learning Studio.

2).  Create an Automated Machine Learning Experiment by creating a Standard_DS12_v2 compute cluster with minimum nodes of one and maximum nodes of six.  Enable explain best model and change exit criterion to one hour and concurrency to one less that the maximum nodes of the compute cluster.

3).  Choose the best model from the completed experiment and deploy using an Azure Container Instance and enable authentication.

4).  Enable Application Insights and logging for the deployed model to be able to monitor performace and any issues. 

5).  Create a python server and run the latest Swagger container and consume/interact with the Swagger instance running the documentation for the model HTTP API.

6).  Make use of the Python SDK and create a python file that will run against the model HTTP API and produce prediction outputs from the model.

7).  Make use of a Jupyter Notebook to create a pipeline to choose the best AutoML model and publish it.

## Key Steps
The first step of this project is authentication.  This step could not be completed using the virtual machine provided by this course.  I went ahead and skipped to the second step.

The second step in this project is to create an Automated ML Experiment.

In order to create an Automated ML Experiment the following steps were taken.

1). I had to upload and register the bankmarketing_train.csv to Microsoft Azure Machine Learning Studio.  The two screenshots below shows this step.

![image](https://user-images.githubusercontent.com/77330289/146927691-faec63e6-0612-4b44-8003-7eb2da178382.png)

![image](https://user-images.githubusercontent.com/77330289/146927731-2da425af-3247-4191-9c7c-57ce4f7049ae.png)

The bankmarketing_train.csv file contains fields pertaining to information gathered during a marketing outreach on whether a client will make a deposit to a bank

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

The seventh and final step in this project was to creat, publish and Consume a pipeline.  The following screenshots shows that I created, published and consumed a pipeline.

The three screenshot that follow shows that the pipeline runs was completed successfully.

![image](https://user-images.githubusercontent.com/77330289/147077939-b1fc94b6-4bac-4867-b907-f3f948b38475.png)

![image](https://user-images.githubusercontent.com/77330289/147078031-188b3a89-c869-468a-b919-30cc3ff34f4d.png)

![image](https://user-images.githubusercontent.com/77330289/147078124-3a7eabbd-01fe-423b-ae15-a3a5b05469db.png)

The below screenshot shows that the Bankmarketing dataset was registered with the AutoML module.

![image](https://user-images.githubusercontent.com/77330289/147078227-c66ac29d-e3a6-4566-bfd7-789d1ed7e4fd.png)

The below screenshot shows that the Pipeline REST endpoint is active.

![image](https://user-images.githubusercontent.com/77330289/147078749-57100274-71b5-4e55-8ee1-7d71abca3f14.png)

![image](https://user-images.githubusercontent.com/77330289/147078851-678879b6-3986-4b2f-b920-394152168227.png)

![image](https://user-images.githubusercontent.com/77330289/147078978-eb4fe70b-a3e1-4679-bc3b-5b7e6826f231.png)

The below screenshot shows that the "Use RunDetails Widget" contains the step runs.

![image](https://user-images.githubusercontent.com/77330289/146941783-d612f703-ab0d-4ddc-9f5b-c2bbcf3e89f6.png)

The two screenshots below shows the scheduled run in ML studio.

![image](https://user-images.githubusercontent.com/77330289/146941821-d90fdf6e-650e-4673-9119-8cd52a047695.png)

![image](https://user-images.githubusercontent.com/77330289/146941840-3b2439ba-73f2-46b5-8c4d-d562f5c84381.png)

The two screenshots below shows the resource clean-up of the compute instance and compute cluster.

![image](https://user-images.githubusercontent.com/77330289/146941927-e0efeb67-9ec2-429d-947e-5924b21b0a5a.png)

![image](https://user-images.githubusercontent.com/77330289/146941947-d4e2aec1-5db1-4d5c-a1e6-5224c8e7cc0c.png)

## Screen Recording
https://youtu.be/lqjhB5sy9o8

## Standout Suggestions

One of the standout suggestions was to run the Apache Benchmark (ab) against my deployed model's HTTP API.  I had to make sure that the Apache Benchmark command-line tool is installed.  Because the endpoint requires authentication, I had to replace the scoring_uri and key in the endpoint.py file with the correct uri and key that can be found under the consume tab of the deployed model.  After executing the endpoint.py file, a data.json file will be generated.  Only after the data.json file has been generated can the benchmark.sh file be executed.  Before the benchmark.sh file can be executed the scoring_uri and key must be replaced.  The benchmark.sh file was executed and a screenshot of the output is included below. 

![image](https://user-images.githubusercontent.com/77330289/147071411-94b89b6f-d328-42ef-b7fd-91ff12fbbb02.png)

The output shows that the HTTP requests was executed successfully and also provides the prediction output from the model endpoint.  Some more performace metrics like test time, number of successful requests, number of failed requests, total data transfered and received, metrics on connection times and percentage of requests served within a certain time was included in the response.

The full response is included as comments in the benchmark.sh file for further investigation.

