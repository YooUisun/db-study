--practice 2024-11-07


--1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 
--학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

SELECT 
        S.NAME STU_NAME, 
        S.DEPTNO1 DEPTNO1, 
        D.DNAME DEPT_NAME
FROM 
        STUDENT S, 
        DEPARTMENT D
WHERE 
        S.DEPTNO1 = D.DEPTNO



--2. emp2 테이블과 p_grade 테이블을 조회하여
--현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
--해당 직급의 연봉의 하한금액과
--상한 금액을 아래 결과 화면과 같이 출력하세요.

SELECT 
        e.name,
        e.position,
        TO_CHAR(e.pay, '999,999,999') PAY,
        TO_CHAR(p.s_pay, '999,999,999') LowPAY,
        TO_CHAR(p.e_pay, '999,999,999') HighPAY
from 
        emp2 e, 
        p_grade p
where 
        e.position is not null
AND     
        e.position = p. position(+); -- (+) 넣으면 안 뜨던 BOSS가 나온다.
        
--3. Emp2 테이블과 p_grade 테이블을 조회하여
--사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
--예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
--나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.

SELECT 
    e.name AS NAME,
    TRUNC((TO_DATE('2010-05-30') - e.birthday) / 365 + 1, 0) AS "현재나이",
    e.POSITION AS 지금포지션,
    g.POSITION AS 그나이에맞는포지션
FROM 
    Emp2 e
JOIN 
    p_grade g 
ON 
    TRUNC((TO_DATE('2010-05-30') - e.birthday) / 365 + 1, 0) BETWEEN g.s_age AND g.e_age;
    
--------------------
select
    e.name,
    TO_CHAR(TO_DATE('2010-05-30'),'YYYY') -TO_CHAR(birthday, 'YYYY') + 1 한국나이,
    e.position as 지금포지션,
    p.position as 지금나이에맞는포지션
from
        emp2 e, 
        p_grade p
where 
        TO_CHAR(TO_DATE('2010-05-30'), 'YYYY') - TO_CHAR(birthday, 'YYYY') +1
        between p.s_age
        And p.e_age
        
        
--customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 
--낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때 
--Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.

select
        c.gname, c.point, g.gname
from 
        customer c, gift g
where 
    c.point >=g.g_start
and 
g.gname = 'Notebook'

--professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요. 
--단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select 
        p1.profno,
        p1.name, 
        P1.hiredate,
        COUNT(p2.profno) count

from
        professor p1, 
        professor p2
        
where
    p1.hiredate > p2. hiredate(+)
    
group by 
        p1.profno, 
        p1.name, 
        p1.hiredate

order by P1.hiredate;

----------------------------------------
select
        profno,
        name,
        hiredate,
        RANK() OVER (ORDER BY hiredate) - 1 COUNT
from professor;


--emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 
--인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select 
        e1.empno,
        e1.ename,
        e1.hiredate,
        COUNT(e2.empno) count

from 
    emp e1, 
    emp e2
where
    e1.hiredate > e2. hiredate(+)
group by e1.empno, e1.ename, e1.hiredate
order by hiredate

select *
from emp;