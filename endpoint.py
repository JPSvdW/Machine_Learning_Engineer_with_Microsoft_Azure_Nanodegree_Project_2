import requests
import json

# URL for the web service, should be similar to:
# 'http://8530a665-66f3-49c8-a953-b82a2d312917.eastus.azurecontainer.io/score'
scoring_uri = 'http://66d42ca0-d163-431c-89e5-e21b1cb28e86.southcentralus.azurecontainer.io/score'
# If the service is authenticated, set the key or token
key = 'L7SyFchwgeiVS8W7GSjZ8HD43mgg1S6V'

# Two sets of data to score, so we get two results back
data = {"data":
        [
          {
 	    "age": 20,
      	    "job": "admin",
      	    "marital": "single",
      	    "education": "high.school",
      	    "default": "no",
      	    "housing": "yes",
      	    "loan": "yes",
      	    "contact": "cellular",
      	    "month": "jun",
      	    "day_of_week": "mon",
      	    "duration": 120,
      	    "campaign": 2,
      	    "pdays": 999,
      	    "previous": 0,
       	    "poutcome": "failure",
     	    "emp.var.rate": 1.4,
      	    "cons.price.idx": 92.90,
      	    "cons.conf.idx": -36.2,
      	    "euribor3m": 2.4,
      	    "nr.employed": 6000
          },
          {
            "age": 40,
      	    "job": "technician",
      	    "marital": "married",
      	    "education": "high.school",
      	    "default": "no",
      	    "housing": "no",
      	    "loan": "no",
      	    "contact": "telephone",
      	    "month": "may",
      	    "day_of_week": "fri",
      	    "duration": 180,
      	    "campaign": 5,
      	    "pdays": 999,
      	    "previous": 1,
       	    "poutcome": "nonexistent",
     	    "emp.var.rate": 1.8,
      	    "cons.price.idx": 95.90,
      	    "cons.conf.idx": -43.30,
      	    "euribor3m": 2.40,
      	    "nr.employed": 8000
          },
      ]
    }
# Convert to JSON string
input_data = json.dumps(data)
with open("data.json", "w") as _f:
    _f.write(input_data)

# Set the content type
headers = {'Content-Type': 'application/json'}
# If authentication is enabled, set the authorization header
headers['Authorization'] = f'Bearer {key}'

# Make the request and display the response
resp = requests.post(scoring_uri, input_data, headers=headers)
print(resp.json())


