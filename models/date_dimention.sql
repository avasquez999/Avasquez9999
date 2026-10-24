with cte as (
    select
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,

        -- Fixed with single quotes around the column name
        {{ get_season('STARTED_AT') }} as STATION_OF_YEAR

    from {{ ref('stg_bike') }}
    where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'
)
select 
*
from cte


