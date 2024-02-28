from datetime import datetime
import uuid
from sqlalchemy import String,Integer,Enum,Float,func,Date,ForeignKey
from sqlalchemy.orm import Mapped,mapped_column,DeclarativeBase,Relationship
from typing import Literal

class Base(DeclarativeBase):
   id:Mapped[str] = mapped_column(String,unique=True,default=str(uuid.uuid4())) 
   
class Usuario(Base):
    __tablename__ = 'usuario'
    pk_id:Mapped[int]= mapped_column(Integer,primary_key=True,index=True)
    nome:Mapped[str] = mapped_column(String,nullable=False)
    email:Mapped[str]= mapped_column(String,nullable=False,unique=True)
    senha:Mapped[str]= mapped_column(String,nullable=False)
    telefone:Mapped[str]=mapped_column(String,nullable=False,unique=True)
    pix:Mapped[str] = mapped_column(String)
    tipo_user: Mapped[Literal["0", "1", "2"]] = mapped_column(Enum("0", "1", "2", name="tipo_user_enum"),default = "0")
    meus_eventos:Mapped['Eventos'] = Relationship(back_populates='user')

class Eventos(Base):
    __tablename__ = 'eventos'
    id_pk:Mapped[int] = mapped_column(Integer,primary_key=True,index=True)
    nome:Mapped[str] = mapped_column(String,nullable=False,unique=True)
    valor_senha:Mapped[float] = mapped_column(Float,nullable=False)
    quantidade_senhas:Mapped[int] = mapped_column(Integer,nullable=False)
    create_date: Mapped[datetime] = mapped_column(insert_default=func.now())
    data:Mapped[Date] = mapped_column(Date)
    id_user:Mapped[int] = mapped_column(Integer,ForeignKey('usuario.pk_id'))
    user:Mapped['Usuario']= Relationship(back_populates = 'meus_eventos')

