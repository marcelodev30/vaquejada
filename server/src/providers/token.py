from jose import jwt
from datetime import datetime,timedelta

SECRET_KET = '967ebedd18483e4cfa3e18401388e2a4'
ALGORITHM = 'HS256'
EXPIRES_IN_MIN = 3000

def generate_token(data:dict):
    dados = data.copy()
    dados.update({'exp': datetime.utcnow() + timedelta(minutes=EXPIRES_IN_MIN)})
    return jwt.encode(dados,SECRET_KET,algorithm=ALGORITHM)

def check_token(token:str): 
    payload = jwt.decode(token,SECRET_KET,algorithms=[ALGORITHM])
    return payload.get('sub')
