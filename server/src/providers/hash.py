from passlib.context import CryptContext

pwd = CryptContext(schemes = ['bcrypt'])

def generate_hash(text):
    return pwd.hash(text)

def check_hash(text,hash):
    return pwd.verify(text,hash)