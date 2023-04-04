/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT bookname, price, price-saleprice
FROM book, orders, customer
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� �������� ���� ������ �̸�*/
SELECT bookname
FROM book
WHERE bookid NOT IN (SELECT bookid
                     FROM orders
                     WHERE custid IN (SELECT custid
                                      FROM customer
                                      WHERE customer.name LIKE '������'));
/*�ֹ����� ���� ���� �̸�*/
select name
from customer
where custid not in (select custid
                    from orders);

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT sum(saleprice) AS �Ѿ�, sum(saleprice)/count(*) AS ��ձݾ�
FROM orders;

/*���� �̸��� ���� ���ž�*/
SELECT name, sum(saleprice) AS ���ž�
FROM customer, orders
WHERE orders.custid = customer.custid
GROUP BY name;

/*���� �̸��� ���� ������ ���� ���*/
SELECT name, bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND orders.bookid=book.bookid
ORDER BY name;

/*������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�*/
SELECT orderid AS �ֹ���ȣ
FROM orders, book
WHERE Book.bookid=Orders.bookid AND price-saleprice=(SELECT MAX(price-saleprice)
                       FROM book, orders, customer
                       WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid);

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name
FROM customer, orders
WHERE orders.custid = customer.custid
GROUP BY name
HAVING (SUM(saleprice)/COUNT(name))>(SELECT sum(saleprice)/count(*) AS ��ձݾ� FROM orders);