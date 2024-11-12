--dml

--데이터 저장 INSERT
--데이터 수정 UPDATE
--데이터 삭제 DELETE
--데이터 병합 MERGE

INSERT INTO 테이블명 (컬럼명...)
VALUES (데이터 값...);

INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table (name, birth, no)
VALUES ('이름2', SYSDATE, 2);

INSERT INTO new_table (name, birth, no)
VALUES ('이름3', '2002-02-15', 3);

INSERT INTO new_table (name, birth, no)
VALUES ('이름4', TO_DATE('2001-10-25'), 4);

--컬럼명 생략
--전체 컬럼에 저장하는 경우 + 순서
INSERT INTO new_table 
VALUES (5, '이름5', SYSDATE);

INSERT INTO new_table (no, name)
VALUES (6, '이름6');

INSERT INTO new_table 
VALUES (7, '이름7', null);

--여러개를 동시에 삽입(저장) INSERT ALL
INSERT ALL
INTO tt02 VALUES (7, '이름7', NULL)
INTO tt02 VALUES (8, '이름9', NULL)
INTO tt02 VALUES (9, '이름9', NULL)
INTO tt02 VALUES (10, '이름10', NULL)
SELECT * FROM dual;

INSERT INTO tt02 -- 저장되는 타입은 number 3, varchar2, date
SELECT 11, '샘플', SYSDATE FROM dual;

insert into tt02
select deptno, loc, sysdate from dept;

select *
from tt02;

---

INSERT INTO tt02 (no)
VALUES (1);

INSERT INTO tt02 (no, name, hiredate)
VALUES (2, null, null);



--Update 수정

UPDATE 테이블명
SET 컬럼명 = 값
WHERE 조건;

--임시부서 여부를 체크   컬럼명 temp_code   'Y' 임시부서 , 'N' 정식부서
select * from dept4;

UPDATE dept4
SET temp_code = 'N';

UPDATE dept4
SET temp_code = 'Y'
WHERE dcode = 2000;

select *
from dept4
where temp_code = 'Y';


CREATE TABLE professor2
AS
SELECT * FROM professor;

select *
from professor2
where position = 'assistant professor';

UPDATE professor2
--SET bonus = 200  --200으로 저장
SET bonus = bonus + 200  --200을 인상
where position = 'assistant professor';

commit;
rollback;

select *
from dept4
where dcode = 2000;

UPDATE dept4
SET location = 'Asan'
where dcode = 2000;

INSERT INTO dept4
VALUES (2001, 'Asan Office', 'Asan', 'Y');

--데이터 삭제 DELETE  (rollback 가능 /자동commit X)
select * from dept4;

DELETE FROM dept4;


SELECT *
--DELETE
FROM dept4
WHERE temp_code = 'Y';




