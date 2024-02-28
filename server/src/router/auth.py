from fastapi import APIRouter,Depends,status,HTTPException
from sqlalchemy.orm import Session
from src.schemas.usuario import Login, UsuarioCreate
from src.core.database.connect import get_db
from src.providers.hash import generate_hash,check_hash
from src.providers.token import generate_token
from src.repository.usuario import RepositoryUsuario

router = APIRouter()

@router.post('/signup',status_code=status.HTTP_201_CREATED)
async def SetSignup(usuario: UsuarioCreate,db:Session=Depends(get_db)):
    if  RepositoryUsuario(db).SetByEmail(usuario.email):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail = 'já existe um usuário com esse email'
        )
    usuario.senha = generate_hash(usuario.senha)
    return RepositoryUsuario(db).setCreate(usuario)

@router.post('/login',status_code=status.HTTP_202_ACCEPTED)
async def SetLogin(login:Login, db:Session = Depends(get_db)):
    usuario =RepositoryUsuario(db).SetByEmail(login.email)
    if not usuario:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail = 'User not found'
        )
    if not check_hash(login.senha,usuario.senha):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail = 'senha not found'
        )
    return {
        'usuario':usuario,
        'acess_token':generate_token({'sub':usuario.email})
    }