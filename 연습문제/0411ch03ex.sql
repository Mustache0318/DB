/*4-1*/
INSERT INTO book(bookname, publisher, price)
VALUES('����������', '���ѹ̵��', 10000);
/*bookid�� ��� ���� �Ұ�, bookid�� �־ �ٽ� ����*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(12, '����������', '���ѹ̵��', 10000);

/*4-2*/
DELETE FROM book
WHERE publisher='�Ｚ��';

/*4-3*/
DELETE FROM book
WHERE publisher='�̻�̵��';
/*orders ���̺��� ���� ��. ���� �� �� ����.*/

/*4-4*/
UPDATE book
SET publisher='�������ǻ�'
WHERE publisher='���ѹ̵��';

/*4-5*/
CREATE TABLE bookcompany(
name VARCHAR(20) PRIMARY KEY,
address VARCHAR(20),
begin DATE);

/*4-6*/
ALTER TABLE bookcompany ADD webaddress VARCHAR(30);

/*4-7*/
INSERT INTO bookcompany(name, address, begin, webaddress)
VALUES('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');
