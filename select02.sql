/*
단일행 함수

임시로 사용하는 테이블 dual

*/

--INITCAP('ABCDE') 컬럼에 대한 내용을 넣겠다
--입력 값의 첫 글자만 대문자로 변환
SELECT ename, INITCAP('ABCDE'), INITCAP(ename)
FROM emp;

--LOWER(name) 전부 소문자
--UPPER(name) 전부 대문자
SELECT LOWER(name), UPPER(name)
FROM student;

--LENGTH('abcdefsdf') 입력된 문자열의 길이 값을 출력 
SELECT LENGTH('abcdefsdf')
FROM dept;

--제대로 작동하는지 확인하려면 실행해보면 됨
--임시로 사용하는 테이블 dual
SELECT * FROM dual;

SELECT ename, INITCAP('ABCDE'), INITCAP(ename)
FROM emp;

SELECT LOWER(name), UPPER(name)
FROM student;

SELECT LOWER(name), UPPER(name)
FROM student;

SELECT 
    LENGTH('abcdefgesf'), LENGTHB('abcdefgesf'),
    LENGTH('점심'), LENGTHB('점심')
FROM dual;    


SELECT *
FROM emp --이름이 5이상인 사람들
WHERE LENGTH(ename) >=5;


-- CONCAT 두 문자열을 결합해서 출력. || 연산자와 동일
SELECT '아침' || '점심' || '저녁', CONCAT('아침','점심')
FROM dual;

SELECT '아침' || '점심' || '저녁', CONCAT(CONCAT('아침','점심'),'저녁')
FROM dual;

--SUBSTR 앞의 문자를 기준으로 몇글자를 잘라내겠다
SELECT 
    SUBSTR('abcdefg', 2, 3), 
    --2번째 글자부터 시작해서 3개의 문자를 표현하겠다
    SUBSTR('abcdefg', 3, 5), 
    --3번째 글자부터 시작해서 5개의 문자를 표현하겠다
    SUBSTR('abcdefg',-5, 2)  
    --뒤에서부터 시작해서 5에서 2개를 뽑아라
FROM dual;

SELECT 
    name, 
    SUBSTR(jumin, 3, 4) birthday,
    SUBSTR(jumin, 3, 4) - 1 "birthday - 1"
FROM student
where deptno1 = 101
;

-- INSTR (대상, 찾는, 시작, 몇번째[1])
-- 시작위치 / 처음
SELECT 
    INSTR('2024/11/04 10/45/45', '/', 1),
    INSTR('2024/11/04 10/45/45', '/', 6),     --8번위치에 있다고 알려줌
    INSTR('2024/11/04 10/45/45', '/', 1, 4),
    INSTR('2024/11/04 10/45/45', '/', 6, 2),
    INSTR('2024/11/04 10/45/45', '/', 1, 5),
    INSTR('2024/11/04 10/45/45', '/', 16, 2)
FROM dual;

SELECT name, tel, INSTR(tel, ')')
FROM student
WHERE deptno1 = 201;

SELECT *
FROM student;

-- LPAD( ) 함수
-- 문 법: LPAD(‘문자열’ 또는 컬럼명, 자리수 , ’채울문자’ )
-- 예) student 테이블에서 1 전공이 201 번인 학과 학생들의 id 를 총 10자리로
--    출력하되 왼쪽 빈 자리는 ‘*’ 기호로 채우세요.

SELECT
    LPAD('문자', 10, '*'),
    LPAD('123', 5, 0),
    LPAD('33', 3, 0)
FROM dual;    

/*
10) RPAD( ) 함수
- 문 법: RPAD(‘문자열’ 또는 컬럼명, 자리수 , ‘채울문자’ )
예) emp 테이블에서 아래와 같이 deptno 가 10번인 사원들의 ename 을
10자리로 출력하되 오른쪽 빈자리에는 ‘-’ 로 채우세요.
*/

SELECT
    LPAD(id, 10, '*'),
    RPAD(id, 10, '*')
FROM student; 

SELECT LPAD(ename, 9, 123456789)
FROM emp;

/*
11) LTRIM( ) 함수
문 법: LTRIM(‘문자열’ 또는 컬럼명 , ‘제거할 문자’ )
12) RTRIM( ) 함수
- 문 법: RTRIM(‘문자열’ 또는 컬럼명, ‘제거할 문자’)
*/

SELECT 
    LTRIM('abcd', 'a'),
    RTRIM('abcd', 'd'),
    RTRIM('abcd', 'b'),
    LTRIM('abcd', 'd'),
    LTRIM('abcd '),
    RTRIM(' abcd '),
    TRIM(' abcd ')
FROM dual;    

/*
13) REPLACE( ) 함수
- 문 법: REPLACE(‘문자열’ 또는 컬럼명 , ‘문자1’ , ’문자2’)
*/
-- 문자를 찾아서 다른것으로 바꾸겠다

SELECT
    REPLACE('abcde', 'c', '*'),
    REPLACE('2024-11-04', '-', '/')
FROM dual;


-----------------------
SELECT
    ROUND(1.66, 1),
    TRUNC(1.4567, 2),
    TRUNC(1.4567, -1),
    TRUNC(123.4567, -1),
    MOD(15,4),
    CEIL(123.133),
    FLOOR(123.1333),
    POWER(3,5)
FROM dual;    

--CEIL 가장가까운수중에 가장 큰정수

SELECT
    rownum, --행번호
    CEIL(rownum/3),  --1/3 = 0.33  2/3 = 0.66 3/3 = 1 4/3 = 1.33 1.66 2
    CEIL(rownum/4),  --1/4 = 0.25  2/4 = 0.5 3/4 = 0.75 5/4 = 1.25
    empno,
    ename
FROM emp    
WHERE deptno = 30;


SELECT
    null,
    SYSDATE, --현재시간 24/11/04 
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'), --앞에 날짜 - 뒤에 날짜(월로 환산)
    MONTHS_BETWEEN('2024-03-05', '2024-01-05'),
    ADD_MONTHS(SYSDATE, 3), --11/4 -> 3개월수
    LAST_DAY(SYSDATE), --28, 31, 30 그달의 마지막날
    NEXT_DAY(SYSDATE, '수'),
    NEXT_DAY(SYSDATE, '토')
FROM dual;

-- 다음에 오는 요일이 되는 날짜가 언제냐?
--NEXT_DAY()함수
SELECT
    ROUND(SYSDATE), -- 반올림 24/11/04 15:48:SS  12:00기준
    TRUNC(SYSDATE),  -- 버림
    TRUNC(123.113, 1), --소숫점 1째자리까지 쓰고 나머지 버림
    TRUNC(SYSDATE, 'MM'), --월을 기준으로 버림 Year Month Day
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1), --다음달 EX) 다음달까지 취소 가능할때 사용
    SYSDATE + 3, --3일뒤
    SYSDATE - 3, --3일전
    SYSDATE + 7,  --7일뒤
    --다음달의 첫날
    SYSDATE + 27,
    --오늘날짜기준으로 다음달의 첫날
    TRUNC(ADD_MONTHS(SYSDATE,1), 'MM'),
    LAST_DAY(SYSDATE)+1,
    --전월의 마지막 날
    TRUNC(SYSDATE, 'MM') - 1,
    LAST_DAY(ADD_MONTHS(SYSDATE, -1))
FROM dual;


-----------------------
SELECT 2 +'2' --자동형변환
FROM dual;

SELECT 2 || '123a' --자동형변환이 되는지 체크하면서 작성
FROM dual;

SELECT
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(502.23),
    SYSDATE,
    TO_CHAR(SYSDATE),  --날짜 -> 문자
    TO_CHAR(SYSDATE, 'YYYY'),  --2411/04 2024-11-04
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), --1~24까지 뜨게하는 방법
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR(ROUND(SYSDATE), 'YYYY-DD-DD HH:MI:SS')
    FROM dual;


--2024-11-05 수업
SELECT
    TO_CHAR(1234, '999999'),
    TO_CHAR(1234, '099999'),
    TO_CHAR(1234, '$99999'),
    '$' || 1234,
    TO_CHAR(1234, '99999.99'),
    TO_CHAR(1234, '99,999')
    FROM dual;

SELECT 
    EMPNO, 
    ENAME, 
    TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS HIREDATE, 
    TO_CHAR( (sal*12)+comm, '$999,999') SAL,
    TO_CHAR( ((sal*12)+comm) *1.15 , '$999,999') "15%인상"
FROM 
    EMP 
WHERE 
    COMM IS NOT NULL;

-- 문자 -> 날짜 TO_DATE
SELECT
    TO_DATE('2024-06-02') + 3,
    TO_DATE('2024/06/02') + 3,
    TO_DATE('24/06/02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02') +3,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024,01,05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YY')         --12년 10월 20일 -> 12월 10일 20년도
FROM dual;


--nvl

select
    sal,
    comm,
    sal*12+comm, -- 숫자*12 +null
    sal*12+ NVL(comm, 0)
from emp
where comm is not null;

select
            NVL(null, 10),
            NVL2(123, '있다', '없다'),
            NVL2(null, '있다', '널이다')
from dual;



--Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 아래와 같이 출력하세요. 
--단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.
select 
        profno,
        name,
        pay,
        bonus,
        to_char (pay *12+nvl(bonus, 0), '999,999') "TOTAl"
from professor
where deptno = 201;


--emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 
--comm 값이 있을 경우 'Exist' 을 출력하고 comm 값이 null 일 경우 'NULL' 을 출력하세요.
select 
        EMPNO,
        ENAME,
        COMM,
        NVL2(comm, 'Exist', 'NULL') "NVL2"
from emp
where deptno = 30;

--sal *12 +comm = 총 연봉 NVL NVL2


-- NVL이랑 NVL2 사용법
select 
        EMPNO,
        ENAME,
        COMM,
        sal*12 + comm TOTAL,
        sal*12 + NVL(comm, 0 ) TOTAL2,
        sal*12 + NVL2(comm, comm, 0) TOTAL3,
        NVL2(comm, sal*12+comm, sal*12) TOTAL4
from emp
where deptno = 30;





----- ********DECODE 매우 중요 **************

SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 20, '같다', NULL),
    DECODE(10, 20, '같다', NULL),
    DECODE(50, 30, '30이다', 40, '40이다', 50, '50이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', NULL),
    DECODE(40, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다')
FROM dual;

select
    deptno,name,
    DECODE( deptno, 101, '컴퓨터공학', '다른학과'),
        DECODE( deptno, 101, '컴퓨터공학', 'ETC학과'),
    DECODE( deptno, 101, '컴퓨터공학'),
    DECODE( deptno, 101, '컴퓨터공학', null)
from professor;

-- 101학과면 컴공 102년 멀티미디어 103은 소프트웨어 그 이외는 ETC로 해보자.
select
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', 102, '멀티미디어', 103, '소프트웨어', 'ETC') DNAME,
    deptno
from professor;


-- 조건? 참:거짓             조건? 참:거짓            조건? 참: (조건? 참:거짓)


--CASE

-- grade 학년
-- 1 1학년  2 2학년   3 3학년   4 4학년
-- 1 저학년 2 저학년 3고학년 4 고학년

select grade || '학년'
from student;
-- 1학년  2학년   3학년   4학년
select
    decode(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년') 구분,
    case GRADE
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
from student;


--2024-11-05  when 이랑 between 사용해보기

--1. student 테이블을 참고해서 진행하세요.
--학생들의 이름과 주민번호, 생일 그리고  jumin, birthday 참고해서 태어난 날짜별로 분기를 표시하는 쿼리를 작성하세요.
--태어난 월에 따라서 각 분기로 표시
--1~3 1분기
--4~6 2분기
--7~9 3분기
--10~12 4분기
SELECT name,
       jumin,
       birthday,
       CASE 
           WHEN birthday IS NULL THEN '알 수 없음'
           WHEN TO_CHAR(birthday, 'MM') BETWEEN '01' AND '03' THEN '1분기'
           WHEN TO_CHAR(birthday, 'MM') BETWEEN '04' AND '06' THEN '2분기'
           WHEN TO_CHAR(birthday, 'MM') BETWEEN '07' AND '09' THEN '3분기'
           WHEN TO_CHAR(birthday, 'MM') BETWEEN '10' AND '12' THEN '4분기'
       END AS 분기
FROM student;


--2.
--emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 출력하세요.
--단 급여등급은 sal 을 기준으로
--1 - 1000 이면 Level 1,
--1001 - 2000 이면 Level 2,
--2001 - 3000 이면 Level 3,
--3001 - 4000 이면 Level 4 ,
--4001 보다 많으면 Level 5 로 출력하세요.
 SELECT 
            empno,
            ename,
            sal,
            case
                when sal between '1' and '1000' then 'LEVEL1'
                when sal between '1001' and '2000' then 'LEVEL2'
                when sal between '2001' and '3000' then 'LEVEL3'
                when sal between '3001' and '4000' then 'LEVEL4'
                when sal > 4001 then 'level5'
                End "LEVEL(급여등급)"
 from emp;
