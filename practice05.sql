-- 서브쿼리 연습


select 
        s.name STUD_NAME,
        s.deptno1 DEPT_NO,
        d.dname DEPT_NAME
from student s, department d
where s.deptno1 = d.deptno
And s.deptno1 = (select deptno1
                    from student
                    where name = 'Anthony Hopkins');


select deptno1
from student
where name = 'Anthony Hopkins';



professor, department 테이블 활용. 이름이 'Meg Ryan' 인 
교수보다 나중에 입사한 사람의 이름, 입사일, 학과명 을 출력하세요.

select 
        p.name,
        p.hiredate,
        d.dname
from professor p, department d
where p.hiredate > (select hiredate 
                  from professor
                  Where name ='Meg Ryan')
AND p.deptno = d.deptno
order by HIREDATE;

student 테이블, 1전공이 
201번 학과의 평균 몸무게보다 몸무게가 많이 나가는 학생들의 이름과 몸무게 출력하세요.

select name,WEIGHT
from student
where WEIGHT >(select avg(WEIGHT)   
              from student 
              where deptno1=201);

