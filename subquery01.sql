--subquery

--사번이 7844인 사원과 같은 부서인 사람들 조회 하는 방법
select *
from emp
where deptno = (select deptno
                from emp
                where empno = 7844);



select deptno
from emp
where empno = 7844;

select *
from emp2;

select *
from dept2;

select *
from dept2
where area = 'Pohang Main Office'

select *
from emp2
where deptno In (select dcode
                from dept2
                where area = 'Pohang Main Office');
                
                --in ( 0001, 1003, 1006, 1007);
                

select *
from emp2
where deptno =&dno;
-- =:dno 하면 결과값이 남아있는데 =&dno 하면 결과값이 초기화 된다.
select *
from emp2
where deptno =:dno;
------------------------------


select *
from emp2
where deptno In (select dcode
                from dept2
                where area = 'Pohang Main Office');
                

select *
from dept2
where area = 'Pohang Main Office'
And dcode = 1003;


select *
from emp2
where exists  (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);
-----------------
1.
emp2 테이블 활용
직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.


select 
            name, 
            position, 
            to_char(pay, '$999,999,999') as "SALARY"
from emp2
where pay > (select MIN(pay) 
from emp2 
where position = 'Section head')
order by salary desc;
------------------------------
2.
Student 테이블.
전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적네 나가는 학생보다
몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력

select
        name,
        grade,
        weight
from student
where WEIGHT < (select max(weight)
from student
where weight = '51')
order by weight desc;
----------------------------------
3.
emp2, dept2 활용
각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
부서명, 직원명, 연봉 출력
select 
        d.DNAME,
        e.name,
        to_char(pay, '$999,999,999') as "SALARY"
from 
        emp2 e, dept2 d
where e.deptno = d.dcode
and pay <all (
         select avg(pay)
         from emp2
         group by deptno
         )
         order by e.pay;
         
-----------------------------

-- 다중 컬럼 서브쿼리 
--student 테이블을 조회하여 각 학년별로 최대 몸무게를 가진 학생들의 학년과
--이름과 몸무게를 출력하세요,
select 
        name,
        grade,
        weight
from student
where (grade,weight) IN ( select grade, MAX(weight)
                          from student
                          group by grade );
-----------------------------------------------------------

--professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장
--오래된 교수의 교수번호와 이름,학과명을 출력하세요(입사일 순으로 오름차순 정렬하세요.)

select 
            p.profno, 
            p.name "PROF_NAME", 
            to_char(p.hiredate, 'YYYY-MM-DD') "HIREDATE", 
            d.dname "DEPT_NAME"
from 
            professor p, 
            department d
            
where (p.deptno, p.hiredate) IN (select deptno, MIN(hiredate)
                             from professor
                             group by deptno)
And p.deptno = d.deptno
order by p.hiredate;
-----------------------------------------------------------
2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
(연봉순으로 오름차순 정렬)

select 
        name,
        position,
        to_char(pay, '$999,999,999') "SALARY"
from emp2
where (position,pay) in(select position, max(pay)
                     from emp2
                     group by position)
order by pay;
-----------------------------------------------------------
--Emp2 테이블을 조회해서 직원들중에서자신의직급의평균연봉과같거나많이
--받는사람들의이름과직급, 현재연봉을출력하세요.
select
            name,
            position,
            TO_CHAR(pay,'$999,999,999') "SALARY"
from emp2 e1
where e1.pay >=  (select AVG(e2.pay)
                  from emp2 e2
                  where e2.position = e1.position);
-----------------------------------------------------------

select *
from emp2;

select *
from dept2;

--join
select   
        e.name, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;


--subquery
select dname
from dept2
where dcode =1006;

select 
        name, 
        (select dname 
        from dept2 
        where dcode = deptno) dname
        --where dcode > deptno) dname 다중행 결과를 만들어서 안된다.
from emp2;

select dname
        from dept2
        where dcode > 1010;
        
 -----------------------------------------------------------
 --직계함수랑 일반행이랑 같이 쓰는 경우 안된다. --avg(pay) 하면 안된다는 말 임.
 select deptno, AVG(pay)
 from emp2
 group by deptno;
 
 --
 --JAVA avgPay 자바에서는 이름을 이렇게 하지만
 --DB avg_pay 디비 에서는 이름을 이렇게 지은다.
 
            --pay 컬럼들의 평균값
select min(avg_pay) --컬럼명 AVG(pay) XX
from (select deptno, AVG(pay) avg_pay  --컬럼명  AVG(pay)
        from emp2
        group by deptno);

select 1+2+3 
result 
from dual;
 -----------------------------------------------------------

select empno, ename, job, '직원'
from emp;

select empno, ename, job, mgr, sal, comm, deptno
from emp;

select sal, mgr
from (
        select empno,ename,job,mgr,sal
        from emp) ;
        

select * from dept;

emp테이블과 dept테이블을 조회하여 부서번호와 부서별 최대급여 및 부서명을 출력하세요

--group by 로 집계 하고 -> join을 한거임.
select e.deptno, e.max_sal, d.dname
from (select deptno, max(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno;

--join -> group by

select deptno, max(sal)
from( select e.sal,e.deptno, d.dname
        from emp e, dept d
        where e.deptno = d.deptno)
group by deptno, dname;

