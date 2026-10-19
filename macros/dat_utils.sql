{% macro get_season(x) %}
    CASE
        WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (12, 1, 2) THEN 'WINTER'
        WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (3, 4, 5) THEN 'SPRING'
        WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (6, 7, 8) THEN 'SUMMER'
        WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (9, 10, 11) THEN 'AUTUMN'
        ELSE NULL
    END
{% endmacro %}