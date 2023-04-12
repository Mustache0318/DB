/*박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
SELECT bookname, price, price-saleprice
FROM book, orders, customer
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*박지성이 구매하지 않은 도서의 이름*/
SELECT bookname
FROM book
WHERE bookid NOT IN (SELECT bookid
                     FROM orders
                     WHERE custid IN (SELECT custid
                                      FROM customer
                                      WHERE customer.name LIKE '박지성'));
/*주문하지 않은 고객의 이름*/
select name
from customer
where custid not in (select custid
                    from orders);

/*주문 금액의 총액과 주문의 평균 금액*/
SELECT sum(saleprice) AS 총액, sum(saleprice)/count(*) AS 평균금액
FROM orders;

/*고객의 이름과 고객별 구매액*/
SELECT name, sum(saleprice) AS 구매액
FROM customer, orders
WHERE orders.custid = customer.custid
GROUP BY name;

/*고객의 이름과 고객이 구매한 도서 목록*/
SELECT name, bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND orders.bookid=book.bookid
ORDER BY name;

/*도서의 가격과 판매가격의 차이가 가장 많은 주문*/
SELECT orderid AS 주문번호
FROM orders, book
WHERE Book.bookid=Orders.bookid AND price-saleprice=(SELECT MAX(price-saleprice)
                       FROM book, orders, customer
                       WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid);

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name
FROM customer, orders
WHERE orders.custid = customer.custid
GROUP BY name
HAVING (SUM(saleprice)/COUNT(name))>(SELECT sum(saleprice)/count(*) AS 평균금액 FROM orders);
