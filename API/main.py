# first import the fastapi library
from fastapi import FastAPI
from models import  *

import os
import pymongo
import certifi

app = FastAPI()
mongo_db_url = os.environ.get("MONGO_DB_URL")
db_client = pymongo.MongoClient(mongo_db_url, tlsCAFile = certifi.where())


# lets first test if we have successfully connected to the mongodb atlas cluster
@app.get("/")
def list_collections():
    result = db_client.MedigoApp.list_collections
    return result
# an endpoint to list all the medications 
# @app.get("/medications", response_model=Medication)
# def list_medications():
#    # her
#     return



