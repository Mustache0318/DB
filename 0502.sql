CREATE TABLE Summer(  
sid NUMBER, 
class VARCHAR2 (20), 
price NUMBER
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250 , 'FORTRAN', 20000);

SELECT *
FROM Summer;

SELECT sid, class
FROM Summer;

SELECT price
FROM Summer
WHERE class='C';

SELECT DISTINCT class
FROM Summer
WHERE price=(SELECT max(price)
            FROM Summer);
            
SELECT COUNT(*), SUM(price)
FROM Summer;

DELETE FROM Summer WHERE sid=200;

SELECT price "C 수강료"
FROM Summer
WHERE class='C';

INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

SELECT COUNT(*) as "수강인원"
FROM Summer;

SELECT COUNT(sid) as "수강인원"
FROM Summer;

SELECT COUNT(*) as "수강인원"
FROM Summer
WHERE sid is not null;

UPDATE Summer
SET price=15000
WHERE class='FORTRAN';

SELECT *
FROM Summer;

UPDATE Summer
SET price=20000
WHERE class='FORTRAN';

UPDATE Summer
SET price=15000
WHERE class='FORTRAN' AND sid=100;

SELECT *
FROM Summer;

DROP TABLE SummerPrice;
DROP TABLE SummerEnroll;

CREATE TABLE SummerPrice ( 
class VARCHAR(20), 
price INTEGER
);

CREATE TABLE SummerEnroll ( 
sid INTEGER, 
class VARCHAR(20) 
);

INSERT INTO SummerPrice VALUES ('FORTRAN', 20000); 
INSERT INTO SummerPrice VALUES ('PASCAL ', 15000); 
INSERT INTO SummerPrice VALUES ('C', 10000);

INSERT INTO SummerEnroll VALUES (100, 'FORTRAN'); 
INSERT INTO SummerEnroll VALUES (150, 'PASCAL'); 
INSERT INTO SummerEnroll VALUES (200, 'C'); 
INSERT INTO SummerEnroll VALUES (250, 'FORTRAN');

SELECT sid, class
FROM SummerEnroll;

SELECT price
FROM summerprice
WHERE class='C';

SELECT DISTINCT class
FROM SummerPrice
WHERE price=(SELECT MAX(price) FROM SummerPrice);

SELECT COUNT(*), SUM(price)
FROM SummerPrice, SummerEnroll
WHERE SummerPrice.class = SummerEnroll.class;

SELECT price "C 수강료"
FROM SummerPrice
WHERE class='C';

DELETE FROM SummerEnroll
WHERE sid=200;

SELECT *
FROM SummerEnroll;

SELECT price "C 수강료"
FROM SummerPrice
WHERE class='C';

INSERT INTO SummerPrice VALUES('JAVA', 25000);

SELECT *
FROM SummerPrice;

SELECT *
FROM SummerEnroll;

UPDATE SummerPrice
SET price=15000
WHERE class='FORTRAN';

SELECT price "FORTRAN 수강료"
FROM SummerPrice
WHERE class='FORTRAN';