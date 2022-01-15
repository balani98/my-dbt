{{ config(materialized='table') }}

with student as (
    select * from {{ source('DEMO_DB', 'STUDENT') }}
),
class as (
    select * from {{ source('DEMO_DB', 'CLASS') }}
)
select * from student S join class T ON S.name = T.students_name

