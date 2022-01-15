{{ config(materialized='table') }}

with student as (
    select * from {{ ref('student_class') }}
),
class as (
    select * from {{ source('DEMO_DB', 'APPLICATION_STATUS') }}
)
select S.NAME,S.AGE,S.ADDRESS, S.BIRTHDAY, to_varchar('2013-04-05'::date, 'mon dd, yyyy') AS BIRTH
, S.CLASS, S.TEACHER,T.STATUS
 from student S join class T ON S.name = T.name  ORDER BY S.AGE ASC

