/*도서번호가 1인 도서의 이름*/
SELECT Bookname
FROM Book
WHERE bookid=1;

/*가격이 20000원 이상인 도서의 이름*/
SELECT bookname
FROM Book
WHERE price >= 20000;

/*박지성의 총 구매액*/
SELECT COUNT(*)
FROM Orders
WHERE custid=1;

/*박지성의 총 구매액2*/
SELECT SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*박지성이 구매한 도서의 수*/
SELECT COUNT(*)
FROM Orders
WHERE custid=1;

/*박지성이 구매한 도서의 수2*/
SELECT COUNT(*)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND customer.name LIKE '박지성';

/*박지성이 구매한 도서의 출판사의 수*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';
