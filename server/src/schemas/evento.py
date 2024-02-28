from src.schemas.schemas import BaseModel
from typing import Annotated
from pydantic import Field

class EventoCreate(BaseModel):
    nome:Annotated[str,Field(description='Nome do parque',examples='parque nao sei')]
    valor_senha:Annotated[float,Field(description='Valor de senha do evento',examples = 50.80)]
    quantidade_senhas :Annotated[int,Field(description='Quantidade de senhas do evento',examples=100)]
    data:Annotated[str,Field(description = 'data do evento',examples = '05/12/2023')]
    