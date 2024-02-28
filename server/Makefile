run:
	@uvicorn src.main:app --reload

alemibic_create:
	@alembic revision -m "Add a column"

alembic_upgrade:
	@alembic upgrade head