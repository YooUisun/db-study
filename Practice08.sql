--practice

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);


--0~9999
--10000~19999
--20000~29999
--30000~39999

--1. 단순 계산먼저
    select 0 PRICE_GROUP, COUNT(*) PRODUCTS
    from product_quiz
    where price BETWEEN 0 AND 9999
UNION ALL
    select 10000, COUNT(*)
    from product_quiz
    where price BETWEEN 10000 AND 19999
UNION ALL
    select 20000, COUNT(*)
    from product_quiz
    where price BETWEEN 20000 AND 29999
UNION ALL
    select 30000, COUNT(*)
    from product_quiz
    where price BETWEEN 30000 AND 39999;
    
select 30000 PRICE_GROUP, (SELECT COUNT(*)
                from product_quiz
                where price BETWEEN 30000 AND 39999) PRODUCTS
from dual;


--2. group by 로 잘 묶어보자

만의자리수를 뽑아내면?;
select TRUNC(price/10000), price/10000
from product_quiz;
10000  1
9000   0
22000  2
15000  1
30000  3
17000  1

SELECT TRUNC(price/10000)*10000 price_group, COUNT(*) products
from product_quiz
group by TRUNC(price/10000)
order by price_group;


select CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0        --8000
            WHEN price BETWEEN 10000 AND 19999 THEN 10000  --12000  15000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END price_group,
        COUNT(*) products
from product_quiz
group by CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0        --8000
            WHEN price BETWEEN 10000 AND 19999 THEN 10000  --12000  15000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
         END
order by price_group
;


--3. group by... subquery 를.. 써본다면?

select * from product_quiz;

select price price_group, count(*) products
from (
    select product_id, product_code, TRUNC(price/10000) * 10000 price
    from product_quiz)
group by price
order by price
;


select price_group*10000 price_group, count(*) products
from (
    select product_id, product_code, TRUNC(price/10000) price_group
    from product_quiz)
group by price_group
order by price_group
;

select price price_group, count(*) products
from (
    select TRUNC(price/10000)*10000 price
    from product_quiz)
group by price
order by price
;



select *
from product_quiz;


SELECT price "PRICE_GROP" , COUNT(price) "PRODUCTS"
FROM (SELECT 
        CASE
        WHEN price BETWEEN 0 AND 9999 THEN '0' 
        WHEN price BETWEEN 10000 AND 19999 THEN '10000'
        WHEN price BETWEEN 20000 AND 29999 THEN '20000'
        WHEN price BETWEEN 30000 AND 39999 THEN '30000'
        END price
        FROM product_quiz) z 
GROUP BY price 
ORDER BY price ASC;


SELECT 
    FLOOR(PRICE/10000)*10000 AS PRICE_GROUP -- PRICE를 10,000원 단위로 내림하여 가격 그룹 생성
    ,COUNT(*) AS PRODUCTS                    -- 각 가격 그룹 내의 상품 개수를 계산
FROM product_quiz                            -- 데이터를 조회할 테이블 (product_quiz)
GROUP BY FLOOR(PRICE/10000)*10000            -- 10,000원 단위로 가격 그룹화
ORDER BY PRICE_GROUP;                        -- 가격 그룹을 오름차순으로 정렬


