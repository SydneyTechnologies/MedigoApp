from pydantic import BaseModel

class AuthUser(BaseModel):
    # this class is for user authentication
    email: str
    password: str

class AuthUserTokens(BaseModel):
    access_token: str
    refresh_token: str
    