{% macro nulls_check(column_name) %}

     case when {{column_name}} isnull then '00000.00' else {{column_name}} end 
    {% endmacro %}