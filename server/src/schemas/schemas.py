from pydantic import BaseModel

class Usertipo(BaseModel):
    id_user:int
    tipo:int    

class Pedido_type(BaseModel):
   id: int
   operação:str
    

class nodificacao(BaseModel):
    id: int
    id_user: int
    id_root: int
    solicitacao:str

class BaseSchema(BaseModel):
    class Config:
        extra = 'forbid'
        from_attributes = True