-- 2024-11-12 연습문제

연습문제 

1. Dept2 테이블에 아래와 같은내용으로새로운부서정보를입력하세요.
* 부서번호 : 9010
* 부서명 : temp_10
* 상위부서 : 1006
* 지역 : temp area

2. Dept2 테이블에 아래와 같은 내용으로 특정컬럼에만정보를입력하세요
* 부서번호 : 9020
* 부서명 : temp_20
* 상위부서 : Business Department ( 1006 번 부서 )

3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서
professor4 테이블에 한꺼번에 입력하는 쿼리를 쓰세요. ( ITAS 방법을 사용하세요 )

4. Professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.


INSERT INTO DEPT2
VALUES (9010, 'temp_10', 1006, 'temp area');

INSERT INTO DEPT2
VALUES (9020, 'temp_20', 1006, 'temp area');

CREATE TABLE professor4         --ddl 은 커밋 롤백 불가능 -- dml은 가능
as
select profno, name, pay
from professor
where profno <= 3000;

CREATE TABLE professor5
as
select profno, name, pay
from professor
where 1=2;

select *
from professor4;

INSERT INTO professor5
select profno, name, pay
from professor
where profno <= 3000;



select *
from professor
where name = 'Sharon Stone';

UPDATE professor
set bonus = 100
where name = 'Sharon Stone';