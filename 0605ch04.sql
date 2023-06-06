CREATE VIEW VW_customer
as SELECT *
    FROM customer
    WHERE address like '%대한민국%';
    
SELECT *
FROM vw_customer;

/*뷰 수정, 주소가 대한민국인 고객의 정보를 영국으로 수정*/
CREATE OR REPLACE VIEW VW_customer(custid, name, address)
as SELECT custid, name, address
    FROM customer
    WHERE address like '%영국%';
    
SELECT *
FROM vw_customer;


