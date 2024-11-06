--모닝퀴즈

select  empno as 사번,
        name as 이름,
        birthday as 생년월일,
        hobby as 취미,
        pay as 급여,
        pay *1.5 as 성과급,
        REPLACE(EMP_TYPE,'employee', 'family') as 직원분류,
        TEL as TEL,
    CASE
        When pay between 35000001 And 45000000 then '하'
        When pay between 45000001 And 60000000 then '중'
        When pay >= 60000001 Then '상'
        Else '화이팅'
        End AS 급여수준
from emp2
where 
        TO_CHAR(birthday, 'YYYY') BETWEEN '1970' AND '1979'
        AND 
        SUBSTR(tel, 1, INSTR(tel, ')')-1) IN ('02', '031')


