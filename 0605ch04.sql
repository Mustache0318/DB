CREATE VIEW VW_customer
as SELECT *
    FROM customer
    WHERE address like '%대한민국%';
    
SELECT *
FROM vw_customer;

CREATE VIEW vw_Orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
as SELECT od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
    FROM Orders od, Customer cs, Book bk
    WHERE od.custid=cs.custid AND od.bookid=bk.bookid;
    
SELECT orderid, bookname, saleprice
FROM vw_Orders
WHERE name='김연아';

/*뷰 수정, 주소가 대한민국인 고객의 정보를 영국으로 수정*/
CREATE OR REPLACE VIEW VW_customer(custid, name, address)
as SELECT custid, name, address
    FROM customer
    WHERE address like '%영국%';
    
SELECT *
FROM vw_customer;
    
DROP VIEW vw_Customer;

SELECT *
FROM vw_customer;


