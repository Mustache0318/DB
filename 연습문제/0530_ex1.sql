SELECT custid "����ȣ", round(sum(saleprice)/count(*),-2)"��ձݾ�"
from orders
group by custid;

/*��¥�� ���� ���� ���*/
SELECT TO_DATE('2020-07-01','yyyy-mm-dd')+5 before,
TO_DATE('2020-07-01','yyyy-mm-dd')-5 after
from dual;

SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM Orders;

SELECT sysdate,
To_char(sysdate,'yyyy-dd-mm hh24:mi:ss') "SYSDATE_1"
FROM dual;

SELECT substr(name,1,1)"��",count(*)"�ο�"
FROM customer
GROUP BY substr(name,1,1);

/*null���� �ٸ� ������ ��ġ�ϴ� nvl�Լ�*/
SELECT name "�̸�", nvl(phone,'����ó ����')"��ȭ��ȣ"
FROM customer;

/*sql ��ȸ ����� �������� ��Ÿ���� rownum*/
SELECT ROWNUM "����", custid,name,phone
FROM customer
WHERE rownum<=2;

/**/