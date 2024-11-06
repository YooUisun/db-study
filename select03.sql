--복수행 함수

Count (대상) 갯수

select count (*)
from emp;

select count(empno), count(*)
from emp;

-- null 은 갯수 안 세짐
select count(job), count(mgr), count(hiredate), count(comm)
from emp;

select count(*)
from emp
where comm is not null;

select sum(sal), count(*)
from emp;

--10번,20번 부서 다니는 얘들 총 몇 명? 총 급여 얼마?

select count(*), sum(sal)
from emp
where deptno in (10, 20);
--출력 해보면 다니는 사람 6명 총 급여는 15,525 불 

--학생들 사이에서 가장 큰 키와 가장 작은 키, 평균값을 구해보자.
select 
    avg(height),   
    max(height), 
    min(height), 
    stddev(height), 
    variance(height)
--    ,
--    height,
--    NVL(height,130)
from student;

select...
from...
where...
group by
having
order by

select deptno, avg(sal)
from emp
--where sal >= 2000
group by deptno
having AVG(sal) >= 2000;


1) 급여가 1500 이상인 직원들만 대상으로, 부서별 평균 급여 계산

select deptno, AVG(sal)
from emp
where sal >= 1500
group by deptno;
2) 부서별 평균 급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 1500
;

------
student 각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

select grade, avg(weight)
from student
group by grade
having avg(weight) >= 65
;
--
student 4 학년을 제외하고
각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

select grade, avg(weight)
from student
where grade <>4
group by grade
having avg (weight) >=65
;

select deptno,job ,ROUND (avg(sal), 1)
from emp
group by deptno, job; 

select deptno,job ,ROUND (avg(sal), 1)
from emp
group by ROLLUP (deptno, job); 


select *
from emp
where job = 'SALESMAN' AND deptno =30;

GROUP BY ROLLUP(deptno, job);
1) deptno, job 그룹화
2) deptno 그룹화 계를 냄
3) ()그룹화 계를 냄

group by ROLLUP( ( deptno, job) );
1) (deptno, job) 그룹화
2) ()그룹화 계

select deptno, job ,ROUND(AVG(sal), 1)
from emp
group by ROLLUP( (deptno, job) ) ;

GROUP BY ROLLUP (deptno, job, mgr);
1) deptno, job, mgr 그룹
2) deptno, job 계
3) deptno 계
4) () 계
GROUP BY ROLLUP (deptno, (job, mgr ) );
 1) deptno, job ,mgr 그룹
 2) deptno 계
 3) () 계
 
 
select deptno, job , mgr, ROUND(avg(sal), 1)
from emp
group by rollup (deptno, job, mgr);

select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job, mgr);



-- RANK DENSE RANK 순위를 메겨보자
-- 급여가 높을수록 1위인 차트를 만들어보자.

순위 RANK() OVER (order by 정렬기준)
그룹단위로 순위를 나타내고 싶을때는 RANK() OVER (PARTITION BY 기준 order by 정렬기준)
                              --             group by 
SELECT ename,
       sal, 
       RANK() OVER (ORDER BY sal desc),
       DENSE_RANK() OVER (ORDER BY sal desc)
FROM emp;
--order by sal;

--RANK 는 공동 6위가 있으면 그 다음엔 8위로 되는데
-- DENSE_RANK는 공동 6위가 있으면 그 다음은 7위가 된다.
SELECT
        name,
        height,
        RANK() OVER (order by height desc) 순위1,
        DENSE_RANK() OVER (order by height desc) 순위2,
        grade,
        RANK() OVER (partition by grade order by height desc) 순위3,
        DENSE_RANK() OVER (partition by grade order by height desc) 순위4
FROM student
order by grade, height desc;