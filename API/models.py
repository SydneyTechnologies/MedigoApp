# here we will define the models to be used for our application
from pydantic import BaseModel, Field
from typing import Any
from bson import ObjectId
from enum import Enum 
from datetime import datetime
from bson import json_util


class MedicationType(str , Enum):
    Pain_killers = "pain killers"
    Analgesics = "analgesics"
    Hygiene = "hygiene"
    Anti_inflammatory = "anti-inflammatory"

class MaritalStatus(str, Enum):
    single = "single"
    married = "married"
    divorced = "divorced"
    widowed = "widowed"



class Issuer(BaseModel):
    name: str


class AuthLogin(BaseModel):
    email: str
    password: str

class User(BaseModel):
    # needed for authentication 
    email: str
    password: str

    mobile: str | None = None
    Nationality: str
    full_name: str
    date_of_birth: str = Field(default=str(datetime.today()))
    marital_status: MaritalStatus
    insurance_no: str
    trusted_personnel: list[str] | None = None


    def __str__(self) -> str:
        return self.email

    class Config:
        allow_population_by_field_name = True
        schema_extra = {
            "example":{
            "email": "example@example.com",
            "password": "password123",
            "mobile": "123-456-7890",
            "Nationality": "USA",
            "full_name": "John Doe",
            "date_of_birth":
            "2023-04-10",
            "marital_status": MaritalStatus.single,
            "insurance_no": "123456789",
            "trusted_personnel": ["Jane Doe", "Bob Smith"],
        }
    }


class Medication(BaseModel):
    name: str 
    purpose: str
    image: str
    description: str | None = None
    medication_type: MedicationType
    expiration_date: str = Field(default=str(datetime.today()))

    class Config:
        title = 'Medication'
        description = 'A data model for storing information about medications'
        allow_population_by_field_name = True
        schema_extra = {
        "example": {
            "name": "Aspirin",
            "purpose": "Pain relief",
            "image": "https://www.example.com/aspirin.jpg",
            "description": "Aspirin is a nonsteroidal anti-inflammatory drug (NSAID) used to treat pain, fever, and inflammation.",
            "medication_type": "analgesics",
            "expiration_date": "2024-04-10"
        }
        }


class AuthToken(BaseModel):
    access_token: str
    refresh_token: str
    
class PrescribedMedication(Medication):
    instructions: str
    issuer: Issuer | None = None
    patient: User

    class Config:
        title = 'Prescribed Medication'
        description = 'A data model for storing information about prescribed medications'
        allow_population_by_field_name = True
    
class Prescription(BaseModel):
    patient: User
    prescription_date:str = Field(default=str(datetime.today()))
    prescription_list: list[PrescribedMedication]

    class Config:
        title = 'Prescription'
        description = 'A data model for storing information about a prescription'
        allow_population_by_field_name = True