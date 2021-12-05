1)
What is our overall conversion rate?
11.922503725782414 -> https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/models/marts/core/fact/fct_overall_conversion_rate.sql

What is our conversion rate by product?
https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/models/marts/core/fact/fct_product_conversion_rate.sql


Based on data it looks like customers prefer Orchid in flowering plants and Bamboo as non flowering plants. These plants jave longer shelf life.


2) 
Macro Created : https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/macros/nulls_check.sql
Used in : https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/models/marts/marketing/fact/fct_promo_status_with_macro.sql
Jinja SQL: https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/models/marts/marketing/fact/fct_promo_status_with_jinja.sql

3) Roles were granted in dbt_project.xml with on-run-end and post-hook

4)  Packages were used in model --> https://github.com/vpwhitedragon/dbt-course-Vishnu/blob/main/dbt-greenery/models/marts/marketing/fact/fct_promo_status_package.sql

5) DAG will be in the slack process


