-- 2024-11-05 모닝퀴즈

--1. 학생들 중에 키가 160~175인 학생들의 학번/이름/아이디 와
-- 교수들 중에 101/102/103/201 학과에 속하면서 보너스를 받지 않는 교수들의
-- 교수번호/이름/아이디 를 모두 취합해서 한번에 보여주시오.

select 
        studno as 번호, 
        name as 이름,
        id as 아이디
from student
where height between 160 and 175
union all

select 
        profno as 교수번호,
        name as 이름,
        id as 아이디
from professor
where deptno in (101,102,103,201)
    and bonus is null;


SELECT 
    '이름: ' || name AS "이름",
    '아이디: ' || ID AS "아이디",
    '주민번호: ' || substr(jumin,1,6) || '-' || substr(jumin, 7,7) 주민번호
FROM student
ORDER BY name;
