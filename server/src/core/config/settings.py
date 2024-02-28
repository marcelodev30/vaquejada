from pydantic_settings import BaseSettings
from pydantic import Field

class Settings(BaseSettings):
    DB_URL: Field(default = "sqlite:///./vaquejada_db.db")


settings = Settings()