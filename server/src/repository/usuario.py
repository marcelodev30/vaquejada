from sqlalchemy.orm import Session
from sqlalchemy import select,delete,update
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException,status
from src.models.models import Usuario as Usuario_models
from src.schemas.usuario import UsuarioCreate

class RepositoryUsuario():
    def __init__(self,db:Session):
        self.db= db

    def setCreate(self,usuario:UsuarioCreate):
        user_db = Usuario_models(**usuario.model_dump())
        try:
            self.db.add(user_db)
            self.db.commit()
            self.db.refresh(user_db)
            return user_db
        except IntegrityError as erro:
            raise HTTPException(
                status_code = status.HTTP_400_BAD_REQUEST,
                detail = f'{str(erro)}'
            )
    def SetByEmail(self,email) -> Usuario_models:
        return self.db.execute(select(Usuario_models).where(Usuario_models.email == email)).scalars().first()