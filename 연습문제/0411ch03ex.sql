/*4-1*/
INSERT INTO book(bookname, publisher, price)
VALUES('스포츠세계', '대한미디어', 10000);
/*bookid가 없어서 삽입 불가, bookid를 넣어서 다시 삽입*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(12, '스포츠세계', '대한미디어', 10000);

/*4-2*/
DELETE FROM book
WHERE publisher='삼성당';

/*4-3*/
DELETE FROM book
WHERE publisher='이상미디어';
/*orders 테이블에서 참조 중. 삭제 할 수 없음.*/

/*4-4*/
UPDATE book
SET publisher='대한출판사'
WHERE publisher='대한미디어';

/*4-5*/
CREATE TABLE bookcompany(
name VARCHAR(20) PRIMARY KEY,
address VARCHAR(20),
begin DATE);

/*4-6*/
ALTER TABLE bookcompany ADD webaddress VARCHAR(30);

/*4-7*/
INSERT INTO bookcompany(name, address, begin, webaddress)
VALUES('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');
