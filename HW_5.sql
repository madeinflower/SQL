CREATE DATABASE shop;

USE shop;

CREATE TABLE SELLERS(
    SELL_ID    INTEGER, 
    SNAME      VARCHAR(20), 
    CITY       VARCHAR(20), 
    COMM       NUMERIC(2, 2),
    BOSS_ID    INTEGER
);

CREATE TABLE CUSTOMERS(
    CUST_ID    INTEGER, 
    CNAME      VARCHAR(20), 
    CITY       VARCHAR(20), 
    RATING     INTEGER
);

CREATE TABLE ORDERS(
    ORDER_ID   INTEGER, 
    AMT        NUMERIC(7,2), 
    ODATE      DATE, 
    CUST_ID    INTEGER,
    SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201, 'Олег', 'Москва', 0.12, 202);
INSERT INTO SELLERS VALUES(202, 'Лев', 'Сочи', 0.13, 204);
INSERT INTO SELLERS VALUES(203, 'Арсений', 'Владимир', 0.10, 204);
INSERT INTO SELLERS VALUES(204, 'Екатерина', 'Москва', 0.11, 205);
INSERT INTO SELLERS VALUES(205, 'Леонид', 'Казань', 0.15, NULL);

INSERT INTO CUSTOMERS VALUES(301, 'Андрей', 'Москва', 100);
INSERT INTO CUSTOMERS VALUES(302, 'Михаил', 'Тула', 200);
INSERT INTO CUSTOMERS VALUES(303, 'Иван', 'Сочи', 200);
INSERT INTO CUSTOMERS VALUES(304, 'Дмитрий', 'Ярославль', 300);
INSERT INTO CUSTOMERS VALUES(305, 'Руслан', 'Москва', 100);
INSERT INTO CUSTOMERS VALUES(306, 'Артём', 'Тула', 100);
INSERT INTO CUSTOMERS VALUES(307, 'Юлия', 'Сочи', 300);

INSERT INTO ORDERS VALUES(101, 18.69, '2022-03-10', 308, 207);
INSERT INTO ORDERS VALUES(102, 5900.1, '2022-03-10', 307, 204);
INSERT INTO ORDERS VALUES(103, 767.19, '2022-03-10', 301, 201);
INSERT INTO ORDERS VALUES(104, 5160.45, '2022-03-10', 303, 202);
INSERT INTO ORDERS VALUES(105, 1098.16, '2022-03-10', 308, 207);
INSERT INTO ORDERS VALUES(106, 75.75, '2022-04-10', 304, 202); 
INSERT INTO ORDERS VALUES(107, 4723, '2022-05-10', 306, 201);
INSERT INTO ORDERS VALUES(108, 1713.23, '2022-04-10', 302, 203);
INSERT INTO ORDERS VALUES(109, 1309.95, '2022-06-10', 304, 203);
INSERT INTO ORDERS VALUES(110, 9891.88, '2022-06-10', 306, 201);

SELECT s1.SNAME AS sname, s2.SNAME AS bossname
FROM SELLERS s1
LEFT JOIN SELLERS s2 ON s1.BOSS_ID = s2.SELL_ID;

SELECT c.CNAME AS cname, o.AMT AS amt
FROM CUSTOMERS c
JOIN ORDERS o ON c.CUST_ID = o.CUST_ID
WHERE o.AMT > 1000;

SELECT c.CNAME AS cname, s.SNAME AS sname
FROM CUSTOMERS c
JOIN ORDERS o ON c.CUST_ID = o.CUST_ID
JOIN SELLERS s ON o.SELL_ID = s.SELL_ID
WHERE c.CITY <> s.CITY;

SELECT s.SNAME AS sname, c.CNAME AS cname, s.CITY AS city
FROM CUSTOMERS c
JOIN ORDERS o ON c.CUST_ID = o.CUST_ID
JOIN SELLERS s ON o.SELL_ID = s.SELL_ID
WHERE c.CITY = s.CITY;



