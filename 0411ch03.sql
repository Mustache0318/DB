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

/*튜플추가*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(11, '스포츠의학', '한솔의학서적', 90000);

INSERT INTO book(bookid, bookname, publisher)
VALUES(14, '스포츠의학', '한솔의학서적');

SELECT * from imported_book;

/*대량 삽입*/
INSERT INTO book(bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher, price
from imported_book;

/*업데이트*/
UPDATE customer
SET address='대한민국 부산'
WHERE custid=5;

SELECT * from customer;

UPDATE customer
set address=(SELECT address
            from customer
            WHERE name='김연아')
where name='박세리';

/*튜플 삭제*/
DELETE FROM customer
WHERE custid=5;

select * from customer;

ROLLBACK;