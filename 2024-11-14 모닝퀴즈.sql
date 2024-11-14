1. 다음 두 명령어는 어떤 기능을 수행하는 명령어인지 작성하고,
두 기능의 차이점이 있다면 설명하시오.
DELETE FROM 테이블명;
1.데이터 삭제 롤백 가능
2.DML 명령어

TRUNCATE TABLE 테이블명;
1.데이터 초기화 롤백 불가능
2.DDL 명령어

2. 다음 조건에 따라 테이블을 생성하시오.
*내부 컬럼
ID : 숫자형 6자리
순번 : 숫자형 6자리
멤버ID : 문자형 24바이트, Null 안됨(꼭 입력해야함)
점수 : 숫자형 3자리
채점일시 : 날짜형, 단 입력된 값이 없을 경우 입력(현재)시간을 기본값으로 설정
※ 기본키(PK) : ID와 순번의 조합

delete t_member_point;
DROP TABLE T_MEMBER_POINT;

CREATE TABLE T_MEMBER_POINT (
    id number(6),
    no number(6),
    member_id VARCHAR2(24) NOT NULL,
    score number(3),
    exam_date DATE DEFAULT SYSDATE,
    CONSTRAINT T_MEMBER_POINT_PK PRIMARY KEY (id,no)
);

select *
from t_member_point;
3. 다음 조건에 맞는 시퀀스를 생성하시오. -> 생성한 시퀀스는 id 컬럼에 사용
시퀀스명 : T_MEMBER_POINT_PK_SEQ
*상세조건
1부터 시작하며 1씩 증가한다.
값의 범위는 1~999999
순환하지 않도록 한다.

CREATE SEQUENCE T_MEMBER_POINT_PK_SEQ
        start with 1
        increment by 1
        minvalue 1
        maxvalue 999999
        nocycle;
4. 생성한 시퀀스의 값을 불러서 임의의 데이터를 저장해보시오.
(*순번은 각 멤버ID 별로 자동 계산되어 저장하도록 해주세요)
- 시퀀스 사용 -> id
- 순번(no) -> 해당 학생이 시험을 치룬 회차 계산되서 저장
--

INSERT INTO T_MEMBER_POINT (id, no, member_id, score)
SELECT 
    T_MEMBER_POINT_PK_SEQ.NEXTVAL,
    NVL(SELECT MAX(no) + 1
        FROM T_MEMBER_POINT
        WHERE member_id = 'A'
    ), 1),
    'A',
    75
FROM DUAL;

INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'A'), 'A', 90, SYSDATE)
    ;
    
    INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'B'), 'B', 80, SYSDATE)
    ;
    
INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'C'), 'B', 75, SYSDATE)
    ;


INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'A'), 'A', 92, SYSDATE)
    ;

INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'B'), 'B', 85, SYSDATE)
    ;
    INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'B'), 'B', 95, SYSDATE)
    ;

INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'B'), 'B', 97, SYSDATE)
    ;
    
    INSERT INTO T_MEMBER_POINT (id, no, member_id, score, exam_date)
VALUES (
    T_MEMBER_POINT_PK_SEQ.nextval, 
    (SELECT NVL(MAX(no), 0) + 1 FROM T_MEMBER_POINT WHERE member_id = 'C'), 'C', 98, SYSDATE)
    ;
select *
from t_member_point
order by id,
no;

ALTER SEQUENCE T_MEMBER_POINT_PK_SEQ INCREMENT BY -100;

ALTER SEQUENCE T_MEMBER_POINT_PK_SEQ MINVALUE 1;

drop sequence T_MEMBER_POINT_PK_SEQ;

drop table T_MEMBER_POINT;

    delete from t_member_point
    where no = 1;
    
    