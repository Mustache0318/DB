CREATE VIEW VW_customer
as SELECT *
    FROM customer
    WHERE address like '%���ѹα�%';
    
SELECT *
FROM vw_customer;

/*�� ����, �ּҰ� ���ѹα��� ���� ������ �������� ����*/
CREATE OR REPLACE VIEW VW_customer(custid, name, address)
as SELECT custid, name, address
    FROM customer
    WHERE address like '%����%';
    
SELECT *
FROM vw_customer;


