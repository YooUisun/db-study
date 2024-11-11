-- 2024-11-11 모닝퀴즈

emp2 dept2 테이블을 참고하여,
'AL Pacino'와 "같은 지역"에서
근무하는 직원들의 평균 연봉보다
많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.


SELECT e.empno AS 사번,
       e.name AS 이름, 
       e.deptno AS 부서번호,
       d.dname AS 부서이름,
       d.area AS 근무지역,
       e.pay AS 급여
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
AND e.pay > (
    SELECT AVG(e2.pay)
    FROM emp2 e2, dept2 d2
    WHERE e2.deptno = d2.dcode
    AND d2.area = (
        SELECT d3.area
        FROM emp2 e3, dept2 d3
        WHERE e3.deptno = d3.dcode
        AND e3.name = 'AL Pacino')
)
ORDER BY e.deptno;
-----------------------------------------------------------------------
select 
        e.empno,
        e.name,
        e.deptno,
        d.dname,
        d.area,
        e.pay
from emp2 e, dept2 d
where e.deptno = d.dcode
and e.pay >(select avg(e2.pay)
            from emp2 e2, dept2 d2
            where e2.deptno = d2.dcode);
 -----------------------------------------------------------------------
 --선생님이 한 것
select e.empno, e.name, e.deptno,
d.dname,
d.area,
e.pay
from emp2 e, dept2 d
where pay > (select AVG(pay)
             from emp2
             where deptno IN (select dcode
                                from dept2
                                where area = (select area
                                                from dept2 
                                                where dcode = (select deptno
                                                                from emp2
                                                                where name = 'AL Pacino'))))
And e.deptno = d.dcode;                                                                
-----------------------------------------------------------------------
                 