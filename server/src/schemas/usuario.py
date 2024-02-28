from src.schemas.schemas import BaseSchema
from typing import Annotated,Optional
from pydantic import Field

class UsuarioCreate(BaseSchema):
    nome:Annotated[str,Field(description = 'Nome do usuario',examples = 'marcelo',max_length=50)]
    email:Annotated[str,Field(description = 'Email do usuario',examples='usuario@gmail.com',max_length=45)]
    telefone:Annotated[str,Field(description='Telefone do usuario',examples='8399999999',max_length=11)]
    senha:Annotated[str,Field(description = 'Senha do usuario',examples='dasdJHK232')]
    pix:Optional[Annotated[str,Field(description = 'Chave pix do usuario')]]

class Login(BaseSchema):
    email:Annotated[str,Field(description='Email do usuario',examples='ash@gmail.com')]
    senha:Annotated[str,Field(description = 'Senha do usuario',examples='dasdJHK232')]