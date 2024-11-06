-- student 평균키를 구하고 싶은데 1학년,2학년 따로따로의 평균키를 구하고 싶음.
--학년별 평균키를 구하고 싶다.

--GROUP BY 특정 컬럼을 기준으로 그룹지어서 계산
--GROUP BY 에 명시된 컬럼은 같이 조회 가능하다.
SELECT 
        CASE 
           WHEN grade = 1 THEN '1학년'
           WHEN grade = 2 THEN '2학년'
           WHEN grade = 3 THEN '3학년'
           WHEN grade = 4 THEN '4학년'
       END AS 학년,
       AVG(height) AS 평균키
FROM student
GROUP BY grade;

select grade, avg(height) height
from student
group by grade
order by(height);


--EMP 전체 SAL 급여 평균

select 
    avg(sal) as 급여
from emp;

--EMP 30번 부서 사람들 평균급여

select 
    avg(sal) as 급여
from emp
where deptno = 30;

--EMP 각 부서별 평균 급여
SELECT 
    deptno AS 부서번호,
    AVG(sal) AS 평균급여
FROM emp
GROUP BY deptno;

--EMP 각 부서별 인원과 평균 급여
SELECT 
    deptno AS 부서번호,
    COUNT(*) AS 인원수,
    AVG(sal) AS 평균급여
FROM emp
GROUP BY deptno
ORDER BY DEPTNO;        --숫자대로 정렬 시키고 싶으면 ORDER BY 하기


--EMP 각 직업별 평균 급여
SELECT 
    job AS 직업,
    AVG(sal) AS 평균급여
FROM emp
GROUP BY job;
--EMP 각 직업별 가장 높은 급여 얼마?
SELECT  
    job AS 직업,
    MAX(sal) AS 높은급여
FROM emp
GROUP BY job;
--EMP 각 부서별 가장 높은 급여 얼마?
SELECT 
    deptno AS 부서번호,
    MAX(sal) AS 높은급여
FROM emp
GROUP BY deptno
ORDER BY deptno;