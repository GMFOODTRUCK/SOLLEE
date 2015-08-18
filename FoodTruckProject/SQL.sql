SELECT * FROM EVENT;
SELECT * FROM CUSTOMER;
SELECT * FROM OWNER;
SELECT * FROM MENU;
SELECT * FROM SALES;
SELECT * FROM REVIEW;
SELECT * FROM FOODTRUCK;
SELECT * FROM TYPE;

update foodtruck set foodtrucklike=200 where foodtrucknum=5;
update foodtruck set foodtrucklike=300 where foodtrucknum=4;

SELECT foodtrucklike FROM FOODTRUCK where foodtrucknum=5;
commit

select sum(salesvalue) as ����
from sales
group by to_char(to_date(salesdate,'dd-mm-yyyy'), 'dd');

select sum(salesvalue) as �����հ� from sales group by salesdate;

create sequence sales_seq;

DELETE FROM SALES where s_num=15;

select s_value, s_date from sales where s_date between TRUNC(SYSDATE-7) and TRUNC(SYSDATE-1);

select case to_char(sysdate,'d')
    when '1' then '�Ͽ���' 
       when '2' then '������'
       when '3' then 'ȭ����'
       when '4' then '������'
       when '5' then '�����'
       when '6' then '�ݿ���'
       when '7' then '�����'
       end "������ ���ϸ�"
from dual;

SELECT TRUNC(SYSDATE,'D') as ù°���� FROM DUAL;

alter table sales rename column sales_value 	to salesvalue;
alter table sales rename column sales_num 		to salesnum;
alter table sales rename column sales_date 		to salesdate;
alter table sales rename column foodtruck_num 	to foodtrucknum;

alter table foodtruck modify foodtruckaddrlat number default 0;
update foodtruck set foodtruckaddrlat=35.5751597 where foodtrucknum =4;
update foodtruck set foodtruckaddralt=129.3086302 where foodtrucknum =4;

commit

alter table foodtruck add foodtruckaddrlat int default 0;
alter table foodtruck add foodtruckaddralt int default 0;
alter table foodtruck add foodtruckpic varchar(20);

commit

INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-16-2015','MM-DD-YYYY'), 2000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-17-2015','MM-DD-YYYY'), 3000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-18-2015','MM-DD-YYYY'), 4000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-19-2015','MM-DD-YYYY'), 5000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-20-2015','MM-DD-YYYY'), 6000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-21-2015','MM-DD-YYYY'), 7000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-22-2015','MM-DD-YYYY'), 8000);

INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-23-2015','MM-DD-YYYY'), 8000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-24-2015','MM-DD-YYYY'), 8000);

INSERT INTO SALES values(sales_seq.nextval, 4, default, 8000);
select salesvalue, to_char(sysdate, 'D') from sales where salesdate between TRUNC(SYSDATE) and TRUNC(SYSDATE+6) order by salesdate;

select * from sales where salesdate between TRUNC(SYSDATE, 'D') and TRUNC(SYSDATE, 'D')+6 order by salesdate;

select * from sales where s_date between TRUNC(SYSDATE-7) and TRUNC(SYSDATE-1) order by s_date;

alter table CUSTOMER modify c_bdate date default sysdate;
alter table sales add s_valus int;