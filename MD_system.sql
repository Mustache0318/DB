/*������ȣ�� 1�� ������ �̸�*/
SELECT Bookname
FROM Book
WHERE bookid=1;

/*������ 20000�� �̻��� ������ �̸�*/
SELECT bookname
FROM Book
WHERE price >= 20000;

/*�������� �� ���ž�*/
SELECT COUNT(*)
FROM Orders
WHERE custid=1;

/*�������� �� ���ž�2*/
SELECT SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ������ ��*/
SELECT COUNT(*)
FROM Orders
WHERE custid=1;

/*�������� ������ ������ ��2*/
SELECT COUNT(*)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND customer.name LIKE '������';

/*�������� ������ ������ ���ǻ��� ��*/
SELECT COUNT(*)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';


/*���缭�� ������ �Ѽ�*/
SELECT COUNT(*)
FROM Book;

/*���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
SELECT COUNT (DISTINCT publisher)
FROM Book;

/*��� ���� �̸�,�ּ�*/
SELECT name, address
FROM customer;

/*2020 �� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE orderdate BETWEEN 2020-07-04 AND 2020-07-07;