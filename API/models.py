# here we will define the models to be used for our application
from pydantic import BaseModel, Field
import uuid
from enum import Enum 
from datetime import date


class MedicationType(str , Enum):
    Pain_killers = "pain killers"
    Analgesics = "analgesics"
    Hygiene = "hygiene"
    Anti_inflammatory = "anti-inflammatory"

class Issuer(BaseModel):
    name: str


class Medication(BaseModel):
    id = Field(default_factory=uuid.uuid4, alias="_id")
    name: str 
    purpose: str
    description: str | None = None
    medication_type: MedicationType
    expiration_date: date

    class Config:
        title = 'Medication'
        description = 'A data model for storing information about medications'
        allow_population_by_field_name = True


class PrescribedMedication(Medication):
    id = Field(default_factory=uuid.uuid4, alias="_id")
    instructions: str
    issuer: Issuer | None = None

    class Config:
        title = 'Prescribed Medication'
        description = 'A data model for storing information about prescribed medications'
        allow_population_by_field_name = True
    
class Prescription(BaseModel):
    id = Field(default_factory=uuid.uuid4, alias="_id")
    prescription_date: date
    prescription_list: list[PrescribedMedication]

    class Config:
        title = 'Prescription'
        description = 'A data model for storing information about a prescription'
        allow_population_by_field_name = True