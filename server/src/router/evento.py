from fastapi import APIRouter
from src.providers.auth import l 
router = APIRouter()

@router.post('/evento')
def criarEvento():
    pass
