--1. 아래 조건에 테이블 생성

* item_name 은 null 불가
* create_date 는 기본값 현재
* PK 는 no

T_ITEM_LIST 테이블
no NUMBER(6)
item_name VARCHAR2(24)
price NUMBER(6)
create_date DATE
---------------------------------------------------
Create table t_item_list (
    no number(6) primary key,
    item_name varchar2(24) not null,
    price number(6),
    create_date date default sysdate
);
DROP TABLE t_item_list;
/*

2. 다음 조건에 맞는 시퀀스를 생성하시오.

시퀀스명 : T_ITEM_LIST_PK_SEQ

*상세조건

1부터 시작하며 1씩 증가한다.

값의 범위는 1~999999

순환하지 않도록 한다.
*/
  CREATE SEQUENCE T_ITEM_LIST_PK_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    NOCYCLE;
    
    DROP SEQUENCE T_ITEM_LIST_PK_SEQ;
    
/*

3. 생성한 시퀀스의 값을 불러서 사용하는 방법을 작성하시오.

*/
        SELECT T_ITEM_LIST_PK_SEQ.CURRVAL 
        FROM DUAL;
        
        SELECT T_ITEM_LIST_PK_SEQ.NEXTVAL 
        FROM DUAL;
/*

4. 해당 시퀀스를 활용하여, 테이블에 INSERT 처리 하는 쿼리문을 작성하시오.

*/

        INSERT INTO T_ITEM_LIST (no, item_name, price, create_date)
        VALUES (T_ITEM_LIST_PK_SEQ.NEXTVAL, '테스트상품', 1000, sysdate);
        
        
        INSERT INTO T_ITEM_LIST (no, item_name, price)
        VALUES (T_ITEM_LIST_PK_SEQ.NEXTVAL, '테스트상품2', 120000);
        
        
        SELECT *
        FROM T_ITEM_LIST;
