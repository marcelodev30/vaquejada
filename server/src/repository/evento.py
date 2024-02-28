from sqlalchemy.orm import Session

class RepositoryEvento():
    def __init__(self,db:Session) :
        self.db = db

    def setCreate(self,idUser):
        pass