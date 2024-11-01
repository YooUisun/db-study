/*
1. 조회 SELECT

SELECT 사용방법 :

SELECT 조회 대상 컬럼명 FROM 테이블명;

select * from dept;
* : 전체 ALL 이라는 의미 

테이블구조 확인 (Describe)
DESC 테이블명;

조회 데이터 리터럴 활용!
SELECT '문자', 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)

SELECT 컬럼명 AS "컬럼별칭" 
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭 
FROM 테이블명;

*/

select * from dept; -- DEPT 테이블에 있는 모든 컬럼을 조회 하겠다 라는 뜻.

select * from dept2; -- DEPT2 테이블에 있는 모든 컬럼을 조회하겠다 라는 뜻.

select * from emp; -- emp 테이블에 있는 모든 컬럼을 조회하겠다 라는 뜻.

select MGR, sal from emp; -- emp 테이블에 있는 MGR 이랑 SAL 컬럼을 조회 하겠다.

--가독성을 생각해서 작성을 한다고 한다면
SELECT * 
FROM emp; 
-- 이렇게 작성하면 된다.

SELECT 
    EMPNO,
    ENAME,
    job
    FROM emp;
    --이런식으로 가독성 좋게 한다.
    -- SELECT 끝.
    
    
    --DESC 시작
DESC emp; --emp 테이블의 구조를 보여달라 라는 뜻 


SElect empno, ename, '그냥문자', 999 FROM emp;

SElect '그냥문자', 999, q'[요기 안에다 1203'asdf'asdf]' FROM emp; 


--칼럼명 변경방법
SELECT ename AS "이름",
        empno "사번",
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급"
FROM emp;


중복값 제거 할땐 distinct 사용
--select distinct job 
--from emp; 

DISTINCT

select * from emp;

select DISTINCT job --job 중복제거 조회
from emp;

select Distinct deptno -- deptno 부서번호 중복제거 조회
from emp;


select Distinct (deptno) -- deptno 부서번호 중복제거 조회 괄호를 써서 사용도 가능함
from emp;

select Distinct deptno, job     --두개 조합 중복 제거
from emp;

|| 연결 연산자
select '나는' || '배가 고프다' from dept;

select deptno || dname AS "부서번호이름",
       deptno || dname "부서번호이름",
       deptno || dname 부서번호이름
from dept;

select deptno+10,
       deptno+20,
       deptno+30
from dept;


select deptno+ deptno+deptno
from dept;

select name ||'''s ID:   '||id||  ',weight is '|| weight || 'kg' AS "ID AND WEIGHT"

from Student;

select ename || '(' || job || ') ,' || ename || '''' || job|| '''' AS "NAME AND JOB"

from emp;

select ename || '''s sal is $' ||sal as"name and sal"

from emp;

where 조건 
찾고 싶은 조건 (결과 필터링)

SELECT ...
FROM ...
WHERE ...


select * 
from emp;       --comm 성과급 으로 생각해보자

select *
from emp
where comm  is not null; -- 성과급 지급 대상자들만

select distinct deptno from emp;

--부서 번호 20번 부서에 속한 사람들의 이름과 급여를 보기
select ename, sal
from emp
where deptno = 20;

--emp 테이블 급여 2000 보다 적게 받는 사람들 목록
select *
from emp
where sal <2000;

--emp 테이블 직업이 clerk 인 사람들만 모아보기
select *
from emp
where job = 'CLERK';


--emp 테이블 직업이 clerk 이 아닌 사람들만 모아보기
select *
from emp
where job <> 'CLERK';
--where job != 'CLERK';

-- emp 테이블 급여가 2000~3000인 사람들만 조회하기
select *
from emp
--where sal >=2000 and sal <=3000;
where sal between 2000 and 3000; -- 나는 이렇게 쓰는거 더 편한듯 


-- student 테이블에서 1학년과 3학년만 조회 ( 1학년이거나 3학년이거나) 
select *
from student
--where grade = 1 or grade = 3;
where grade in (1,3); -- grade in (1,3) 1학년 이거나 3학년 이거나 확인할때 편한 듯


--student 테이블에서 1학년과 3학년만 제외하고 조회해보기
select *
from student
--where grade in(2,4);
where grade not in (1,3);       -- is null / is not null
--where grade <> 1 And grade <> 3;

---------------------
Like 패턴 검색
    LIKE %_
    %: 아무거나 애무갯수 0~n개
    _: 그 위치에 한 개
    
select * 
from emp
where ename Like '%MI%'; -- MI ~ ~MI ~MI~ 이라는 뜻 즉 %는 ~ 이라는 뜻 이다.
--where ename Like 'MI%' --MIND MOM Mountain 
--where ename = 'WARD';
-- '%AD' 하면 무슨무슨 AD를 가진걸 찾는거고
-- '%AD%' 하면 ~~AD~~ 를 가진 사람을 찾는거다
. 
-- 'AD%' 하면 AD 로 시작하는 걸 찾는거다.

select * 
from emp
where ename Like '_MI';  --  3글자에 2,3번째가 MI
where ename Like '_MI__'; -- 5글자에 2,3 자리에 MI가 있어야 한다. 
where ename Like '_MI%';  -- n개~글자수 2,3번째가 MI 여야 한다.

-- < <= > >=

select *
from emp
where hiredate > '1981-05-01';
--where hiredate = '81/05/01';

select *
from student;
----------------
정렬 ORDER By
* 정렬을 사용하지 않으면 순서보장x
order by 정렬한 기준이되는 컬럼명 [ASC|DESC] [오름차순|내림차순]

/*
select ...
from ...
order by ...
;
*/
select *
from student
order by name; -- name 기준 오름차순 정렬

select *
from student
order by name desc; -- name 기준 내림차순 정렬


select *
from student
order by grade desc; -- 학년기준 내림차순


select *
from student
order by birthday desc; -- 생일 기준 내림차순 (큰 수 -> 작은 수 방향)
                        -- 날짜에서 큰 수는? 더 최근/미래 작은수? 더 과거

select *
from student
where grade In (1,2,3) -- 학년이 1,2,3 학년만 조회
order by grade desc, height desc; -- 학년 오름차순 정렬 1순위는 학년 2순위는 키 내림차순


select *
from student
where grade In (1,2,3) -- 학년이 1,2,3 학년만 조회
order by grade,height; -- 학년 오름차순 정렬 1순위는 학년 2순위는 키 

-----------------------------------------------------
집합연산자
UNION = 합집합
UNION All = 합집합 (중복을 제거하지 않은것)
INTERSECT 교집합
MINUS 차집합

    조건(제약)
            1.컬럼 갯수 동일 해야한다.
            2.컬럼 데이터형 동일
            3.컬럼명은 상관없음

-- 학생들 중에 101번 학과 학생들과 102번 학과 학생들 조회
select *
from student
where deptno1 = 101;
union all
select *
from student
where deptno1 =102;

--각 테이블 조회 결과 갯수/타입이 일치하는 형태로 만들어서 결합
--타입의 순서도 똑같아야 한다. 학생이 숫자 였으면 교수도 숫자, 문자였으면 문자.
--넣을 숫자가 없으면 숫자 0 이라도 넣어서 맞춰줘야 한다.
select studno, name, deptno1        --숫자 문자 숫자 3개
from student
where deptno1 =101
union all
select profno, name ,deptno         --숫자 문자 숫자 3개 
from professor
where deptno= 101;



--------------갯수를 인위적으로 라도 맞춰줘야 한다.
select
    studno idno, 
    name, 
    deptno1 "deptno", 
    null AS "email" -- null 또는 '' 이라고 입력해도 된다.
from student
where deptno1 =101
union all
select 
    profno, 
    name, 
    deptno, email
from professor
where deptno = 101;

--divtype 한 개를 더 만들어서 보기쉽게 관리하는 방법임 1,2 로 넣어서 하는게 편하다고 함.

-- 칼럼을 한개 더 만들어서 보기 쉽게 관리하는 방법들 1 
select studno,name,deptno1,1 divtype
from student
where deptno1 = 101
union all
select profno,name,deptno,2
from professor
where deptno = 101;

-- 칼럼을 한개 더 만들어서 보기 쉽게 관리하는 방법들 2
select studno,name,deptno1,'STD' divtype
from student
where deptno1 = 101
union all
select profno,name,deptno,'PRF'
from professor
where deptno = 101;

-- 칼럼을 한개 더 만들어서 보기 쉽게 관리하는 방법들 3
select studno,name,deptno1,'학생' divtype
from student
where deptno1 = 101
union all
select profno,name,deptno,'교수'
from professor
where deptno = 101;

--101,201 학과를 듣는 사람들 찾아라 (교집합) 그럴땐 2가지 방법이 있는데 INTERSECT 를 쓰던가
--where deptno1 = 101 And deptno2 = 201; 이렇게 쓰던가 둘 중 하나 선택
select *
from student
where deptno1 = 101
INTERSECT
select *
from student
where deptno2 = 201;

select *
from student
where deptno1 = 101 And deptno2 = 201;

select *
from emp
where job = 'SALESMAN' And comm > 400
minus --차집합
select *
from emp --그동안 포상을 한 번 이라도 받은 직원 목록 emp_celebrate
where hiredate < '1982-01-01';

