-- DDL (테이블 만들기)

CREATE TABLE new_table
(
    no NUMBER(3),
    name VARCHAR2(10),
    birth DATE 
);

select *
from new_table;

desc new_table;

select SYSDATE from dual;

create table tt02
(
    no Number(3,1) DEFAULT 0,
    name VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
    
);

select *
from tt02;

--테이블 복사

Create table dept3
as
select * from dept2;            --구조 + 데이터 전체 복사

Create table dept4
as
select dcode, area from dept2; --컬럼 2개 +데이터복사

select * from dept4;

CREATE TABLE dept5 --컬럼구조만 복사(데이터x)
as
select *
from dept2
where 1=2; --거짓 조건


select *
from dept5;

--테이블 변경

--컬럼 추가
ALTER TABLE dept4
Add (location VARCHAR2(10));

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');

--임시부서 여부를 체크 컬럼명  temp_code 'y' 임시부서 , 'n' 정식부서
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

--컬럼 삭제
ALTER TABLE dept4
DROP COLUMN location;


create table dept 6
as
select * from dept 4;

select * from dept5;
select * from dept6;

--테이블 삭제 ( rollback 불가 복구 불가능)
drop table dept5;


truncate table dept6;