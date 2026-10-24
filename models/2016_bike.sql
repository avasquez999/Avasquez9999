select
    t.RIDE_ID,
    t.TRIP_DATE,
    t.START_STATION_ID,
    t.END_STATION_ID,
    t.MEMBER_CASUAL,
    t.TRIP_DURATION_SECONDS,
    w.WEATHER,
    w.AVG_TEMP,
    w.AVG_PRESSURE,
    w.AVG_HUMIDITY,
    w.AVG_CLOUDS

from {{ ref('trip_fact') }} t
inner join {{ ref('daily_weather') }} w
    on t.TRIP_DATE = w.DAILY_WEATHER

where YEAR(t.TRIP_DATE) = 2016