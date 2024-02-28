from fastapi import FastAPI
from pydantic import BaseModel
from typing import List
from uuid import uuid4
from src.models import models
from src.core.database.connect import Base,engine
from src.router import auth as auth_router

app = FastAPI()

class solitacao(BaseModel):
    id:str
    usuario_id:int
    tipo:str

nodificacao= List[solitacao]
models.Base.metadata.create_all(bind=engine)

app.include_router(auth_router.router,prefix='/auth')

@app.post('/')
async def root():
    return

@app.post('me/salitacao/')
def createNotifi(token):
    nodificacao.append(solitacao(id=str(uuid4()),usuario_id=token,tipo='user'))

@app.post('me/salitacao/{Operacao}')
def createNotif(token:str,tipodeOperacao:str,Operacao:str):
    if Operacao == 'admin':
        pass

@app.get('me/salitacao/')
def noti():
    pass