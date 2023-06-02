SELECT custid "고객번호", round(sum(saleprice)/count(*),-2)"평균금액"
from orders
group by custid;

/*날짜의 이전 이후 계산*/
SELECT TO_DATE('2020-07-01','yyyy-mm-dd')+5 before,
TO_DATE('2020-07-01','yyyy-mm-dd')-5 after
from dual;

SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM Orders;

SELECT sysdate,
To_char(sysdate,'yyyy-dd-mm hh24:mi:ss') "SYSDATE_1"
FROM dual;

SELECT substr(name,1,1)"성",count(*)"인원"
FROM customer
GROUP BY substr(name,1,1);

/*null값을 다른 값으로 대치하는 nvl함수*/
SELECT name "이름", nvl(phone,'연락처 없음')"전화번호"
FROM customer;

/*sql 조회 결과를 순번으로 나타내는 rownum*/
SELECT ROWNUM "순번", custid,name,phone
FROM customer
WHERE rownum<=2;

/**/