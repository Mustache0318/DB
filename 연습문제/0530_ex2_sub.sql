/*��ø����(nested subquery) -where��- �񱳿�����*/
SELECT orderid, custid, saleprice
FROM orders md
WHERE saleprice > (select avg(saleprice)
                    from orders so
                    where md.custid=so.custid);
                    
select avg(saleprice)
from orders so
where custid=1;

select sum(saleprice) "Total"
from orders
where custid in (select custid
                from customer
                where address like '%���ѹα�%');
                
select custid
from customer
where address like '%���ѹα�%';

select *
from orders;

select orderid, saleprice
from orders
where saleprice > all(select saleprice
from orders
where custid=3);

select saleprice
from orders
where custid=3;


select sum(saleprice) "total"
from orders od
where exists(select *
from customer cs
where address like '%���ѹα�%' and cs.custid = od.custid);