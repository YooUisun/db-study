--Join 01

select *
from emp;

select *
from dept;

--조인 기준 deptno 가 같은

--select empno,ename,dname,loc, d.deptno
select e.empno, e.ename, d.dname, d.loc, d.deptno
--select *
from emp e, dept d
where e.deptno = d.deptno;


select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e inner join dept d
on e.deptno = d.deptno;

select *
from emp;

select *
from emp e, dept d;
--where e.deptno = d.deptno;


--student <-profno-> professor
select *
from student;



select *
from professor;

-- 둘 다 같은 방법임. 1번 학생이 교수가 누구인지 구하는 방법

select *
from student s, professor p 
where s.profno = p.profno;
 
 
select *
from student s inner join professor p 
on s.profno = p.profno;


--INNER JOIN vs OUTER JOIN
select *
from student s, professor p 
where s.profno = p.profno(+);

select *
from student s left outer join professor p
--from student s right outer join professor p
--from professor p left outer join student s
on s.profno = p. profno;

select *
from student;

select *
from professor;

select *
from department;

--학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 
--을Join하여 학생의 이름과학생의학과이름, 학생의지도교수이름을출력하세요

select s.name STU_NAME,d. dname DEPT_NAME , p.name PROF_NAME
from
        student s
        INNER JOIN professor P
        ON s.profno = p.profno
        INNER JOIN department d
        ON s.deptno1 = d.deptno;
        
--학생의 학과이름
SELECT a.name AS STU_NAME, d.dname AS DEPT_NAME, p.name AS PROF_NAME
FROM student a, professor p, department d
WHERE a.profno = p.profno
    AND p.deptno = d.deptno;
    

--교수학과이름, 학생학과이름
SELECT 
    s.name, 
    s.deptno1, 
    d.dname, 
    s.profno, 
    p.profno, 
    p.name AS PROF_NAME, 
    p.deptno
FROM student s, professor p, department d
WHERE s.profno = p.profno
    AND s.deptno1 = d.deptno
    AND p.deptno = d.deptno;
    
    

select *
from customer;

select *
from gift;

-- 1~65000 ~100000

select c.gname, c.point, g.gname
from customer c, gift g
where c.point between g.g_start and g.g_end;


--사번, 내 이름, 내 상사의 사번, 상사의 이름
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;


