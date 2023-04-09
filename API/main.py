# first import the fastapi library
from fastapi import FastAPI
from models import  *

import os
import pymongo
import certifi

app = FastAPI()
mongo_db_url = os.environ.get("MONGO_DB_URL")
db_client = pymongo.MongoClient(mongo_db_url, tlsCAFile = certifi.where())


# an endpoint to list all the medications 
@app.get("/medications", response_model=list[Medication])
def list_medications(type: MedicationType | None = None)->list[Medication]:
    # get all the medications that are currently stored in the database
    # using the optional query parameter type, we can return all the medications of the said type
    if type is not None: 
        search_parameter = {"medication_type": type}
        medications = db_client.MedigoApp.Medication.find(search_parameter)
    else:
        medications = db_client.MedigoApp.Medication.find()
    medication_list = []
    for med in medications:
        # we then need to convert the dictionary or (json) objects from the db in python classes 
        # in this case our pydantic class Medication 
        # using the ** we deconstruct the dictionary and use it to create a new Medication Object
        med = Medication(**med)
        # add the medications to the medication list
        medication_list.append(med)
    return medication_list

# an endpoint to list all the prescriptions 
@app.get("/{userId}/prescriptions")
def list_prescriptions(userId:str) -> list[Prescription]:
    # first get all the prescriptions in the database for a particular user
    search_parameter = {}
    prescriptions = db_client.MedigoApp.Prescription.find()



