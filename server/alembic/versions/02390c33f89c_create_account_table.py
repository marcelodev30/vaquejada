"""create account table

Revision ID: 02390c33f89c
Revises: 8cca9e43c286
Create Date: 2023-12-27 21:06:03.661727

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '02390c33f89c'
down_revision: Union[str, None] = '8cca9e43c286'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass


def downgrade() -> None:
    pass
