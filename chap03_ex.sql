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
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';