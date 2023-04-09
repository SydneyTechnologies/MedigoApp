# first import the fastapi library
from fastapi import FastAPI, HTTPException, status, Depends
from fastapi.responses import JSONResponse
from fastapi.security import OAuth2PasswordRequestForm
from models import  *
from utils import *
import os
app = FastAPI()


@app.post("/register", summary="This endpoint helps create users")
def register_user(user_data: User) -> User:
    # first we need to check if the user exists in our database 
    email = user_data.email
    if email is not None:
        email = db_client.MedigoApp.User.find_one({"email": email})
        if email is not None:
            # meaning the email exists then we want to raise an error and tell the user that a user already exists with this email
            raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User with this email already exist"
        )
        
        # if the email does not exist then we create a new user 
        # but before that we must hash the users password
        password = user_data.password
        # hashed password
        hashed_password = get_hashed_password(password=password)
        # now we swap the actual string password with the hashed variant
        user_data.password = hashed_password
        # now insert this new user into the database 
        # dob = user_data.date_of_birth
        # user_data.date_of_birth = str(dob)
        new_user = db_client.MedigoApp.User.insert_one(user_data.dict())

        inserted_user = db_client.MedigoApp.User.find_one({"_id": new_user.inserted_id})

        # convert the user document to a User object and return it
        inserted_user.pop("_id", None)
        return User(**inserted_user)
    
@app.post("/login", summary="Login User")
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user = db_client.MedigoApp.User.find_one({"email": form_data.username})
    if user is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Incorrect email or password"
        )
    # so the user exists in the db now we have to validate if the password is correct 
    entered_string_password = form_data.password
    hashed_user_password = User(**user).password

    if not verify_password(entered_string_password, hashed_user_password):
        # if the password does not match then raise an exception 
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Incorrect email or password"
        )
    
    # however if the data does exist and the passwords are the same then we return the access and refresh tokens 

    return {
        "access_token": create_access_token(user["email"]),
        "refresh_token": create_refresh_token(user["email"]),
    }

# an endpoint to list all the prescriptions 
@app.get("/prescriptions", summary="list all the prescriptions for the current user this is a protected route")
def list_prescriptions(user = Depends(get_current_user)) -> list[Prescription]:
    # first get all the prescriptions in the database for a particular user
    prescriptions = db_client.MedigoApp.Prescription.find({"patient": user})
    presciption_list = []
    for item in prescriptions:
        item.pop("_id")
        presciption_list.append(Prescription(**item))
    return presciption_list


# Create the CRUD endpoints
@app.post('/medications', response_model=Medication)
async def create_medication(medication: Medication):
    medication_dict = medication.dict()
    result = db_client.MedigoApp.Medication.insert_one(medication_dict)
    return Medication(**medication_dict)

@app.get('/medications/{medication_name}', response_model=Medication)
async def read_medication(medication_name: str):
    medication = db_client.MedigoApp.Medication.find_one({'name': medication_name})
    if medication:
        return medication
    else:
        raise HTTPException(status_code=404, detail='Medication not found')

@app.put('/medications/{medication_name}', response_model=Medication)
async def update_medication(medication_name: str, medication: Medication):
    medication_dict = medication.dict()
    result = db_client.MedigoApp.Medication.update_one({'name': medication_name}, {'$set': medication_dict})
    if result.modified_count == 1:
        medication_dict
        return Medication(**medication_dict)
    else:
        raise HTTPException(status_code=404, detail='Medication not found')

@app.delete('/medications/{medication_name}')
async def delete_medication(medication_name: str):
    result = db_client.MedigoApp.Medication.delete_one({'name': medication_name})
    if result.deleted_count == 1:
        return JSONResponse(content={'message': 'Medication deleted successfully'})
    else:
        raise HTTPException(status_code=404, detail='Medication not found')

# an endpoint to list all the medications 
@app.get("/medications", response_model=list[Medication], summary="This endpoint will list up all the medications in the database if no query parameter is specified")
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