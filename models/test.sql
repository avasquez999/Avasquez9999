select *
from {{ source('demo', 'bike') }}
results 10
