CREATE TABLE theater(
theaterid NUMBER PRIMARY KEY CHECK (theaterid >= 1 AND theaterid<=10),
theatername VARCHAR(10) NOT NULL,
location VARCHAR(10) NOT NULL);

CREATE TABLE hall(
theaterid NUMBER,
hallid NUMBER,
movie VARCHAR(20) NOT NULL,
price NUMBER NOT NULL CHECK(price <= 20000),
sit NUMBER NOT NULL,
PRIMARY KEY(theaterid, hallid),
FOREIGN KEY(theaterid) REFERENCES theater(theaterid) on DELETE CASCADE);

CREATE TABLE mcustomer(
custid NUMBER PRIMARY KEY,
custname VARCHAR(20) NOT NULL,
address VARCHAR(20));

CREATE TABLE reservation(
theaterid NUMBER,
hallid NUMBER,
custid VARCHAR(20),
sitnum NUMBER NOT NULL,
reservationdate DATE NOT NULL,
UNIQUE(custid, sitnum, reservationdate),
FOREIGN KEY(theaterid, hallid) REFERENCES hall(theaterid,hallid) on DELETE CASCADE,
PRIMARY KEY(theaterid, hallid, custid));

INSERT ALL
INTO theater(theaterid, theatername, location) VALUES(1, '�Ե�', '���')
INTO theater(theaterid, theatername, location) VALUES(2, '�ް�', '����')
INTO theater(theaterid, theatername, location) VALUES(3, '����', '���')
SELECT 1 FROM DUAL;

INSERT ALL
INTO hall(theaterid, hallid, movie, price, sit) VALUES(1, 1, '����� ��ȭ', 15000, 48)
INTO hall(theaterid, hallid, movie, price, sit) VALUES(3, 1, '���� ��ȭ', 7500, 120)
INTO hall(theaterid, hallid, movie, price, sit) VALUES(3, 2, '��մ� ��ȭ', 8000, 110)
SELECT 1 FROM DUAL;

INSERT ALL
INTO mcustomer(custid, custname, address) VALUES(3, 'ȫ�浿', '����')
INTO mcustomer(custid, custname, address) VALUES(4, '��ö��', '���')
INTO mcustomer(custid, custname, address) VALUES(9, '�ڿ���', '����')
SELECT 1 FROM DUAL;

INSERT ALL
INTO reservation(theaterid, hallid, custid, sitnum, reservationdate) VALUES(3, 2, 3, 15, '2020-09-01')
INTO reservation(theaterid, hallid, custid, sitnum, reservationdate) VALUES(3, 1, 4, 16, '2020-09-01')
INTO reservation(theaterid, hallid, custid, sitnum, reservationdate) VALUES(1, 1, 9, 48, '2020-09-01')
SELECT 1 FROM DUAL;

/*1-1*/
SELECT theatername, location FROM theater;

/*1-2*/
SELECT theatername
FROM theater
WHERE location='���';

/*1-3*/
SELECT custname
FROM mcustomer
WHERE address='���'
ORDER BY custname ASC;

/*1-4*/
SELECT theaterid, hallid, movie
FROM hall
WHERE price <= 8000;

/*1-5*/
SELECT custname
FROM reservation
JOIN mcustomer ON reservation.custid = mcustomer.custid
JOIN theater ON reservation.theaterid = theater.theaterid
WHERE mcustomer.address = theater.location;

/*2-1*/
SELECT COUNT(*) FROM theater;

/*2-2*/
SELECT SUM(price)/COUNT(movie) as average
FROM hall;

/*2-3*/
SELECT COUNT(custid)
FROM reservation
WHERE reservationdate='2020-09-01';

/*3-1*/
SELECT movie
FROM hall
JOIN theater ON theater.theaterid=hall.theaterid
WHERE theatername='����';

/*3-2*/
SELECT custname
FROM mcustomer
JOIN reservation ON reservation.custid=mcustomer.custid
JOIN theater ON theater.theaterid=reservation.theaterid
WHERE theatername='����';

/*3-3*/
SELECT SUM(price) as ��ü����
FROM hall
JOIN reservation ON reservation.hallid=hall.hallid AND reservation.theaterid=hall.theaterid
JOIN theater ON hall.theaterid=theater.theaterid
WHERE theatername='����';

/*4-1*/
SELECT theatername, COUNT(*)
FROM theater
JOIN hall ON theater.theaterid=hall.theaterid
GROUP BY theatername;

/*4-2*/
SELECT *
FROM hall
JOIN theater ON theater.theaterid=hall.theaterid
WHERE theater.location='���';

/*4-3*/
SELECT theatername, COUNT(custid)
FROM theater
LEFT JOIN reservation ON theater.theaterid=reservation.theaterid
GROUP BY theatername;

/*4-4*/
SELECT movie as ��ȭ, COUNT(custid) as ������
FROM hall
LEFT JOIN reservation ON hall.theaterid=reservation.theaterid AND hall.hallid=reservation.hallid
GROUP BY movie
ORDER BY '������';
