CREATE table newbook(
bookid number PRIMARY KEY,
bookname VARCHAR(20) not null,
publisher VARCHAR(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));

CREATE TABLE newcustomer(
custid NUMBER PRIMARY key,
name VARCHAR(40),
address VARCHAR(40),
phone VARCHAR(30));

CREATE table neworders(
orderid NUMBER , 
custid NUMBER not null,
bookid NUMBER not null,
saleprice NUMBER , 
orderdate DATE ,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES newcustomer(custid) on DELETE CASCADE);

ALTER TABLE newbook ADD isbn VARCHAR2(13);

SELECT * from newbook;

ALTER TABLE newbook MODIFY isbn NUMBER;

SELECT * from newbook;
SELECT * from newcustomer;
SELECT * from neworders;

DROP TABLE newbook;

SELECT * from book;

/*Ʃ���߰�*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(11, '����������', '�Ѽ����м���', 90000);

INSERT INTO book(bookid, bookname, publisher)
VALUES(14, '����������', '�Ѽ����м���');

SELECT * from imported_book;

/*�뷮 ����*/
INSERT INTO book(bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher, price
from imported_book;

/*������Ʈ*/
UPDATE customer
SET address='���ѹα� �λ�'
WHERE custid=5;

SELECT * from customer;

UPDATE customer
set address=(SELECT address
            from customer
            WHERE name='�迬��')
where name='�ڼ���';

/*Ʃ�� ����*/
DELETE FROM customer
WHERE custid=5;

select * from customer;

ROLLBACK;