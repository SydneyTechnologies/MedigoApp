# first import the fastapi library
from fastapi import FastAPI
from models import  *

import os
import pymongo
import certifi

app = FastAPI()
database_url = os.environ.get("DATABASE_URL")
db_client = pymongo.MongoClient(database_url, tlsCAFile = certifi.where())

# an endpoint to list all the medications 
@app.get("/medications", response_model=Medication)
def list_medications():
    return



