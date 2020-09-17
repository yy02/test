create user oaec identified by 1234;
grant connect,resource to oaec;
alter session nls_date_language=english;

/*1.
��ѯ����Ա����first_name��last_name,Ҫ���ѯ���Ϊһ�У��ö��Ÿ�������������ΪName*/
select first_name||','||last_name Name 
from s_emp

/*2.	�鿴Ա����Ա��id�����ֺ���н,��н����Ϊannual��ע���������ɣ���Ҫ���ȥ��*/
select id,last_name,salary*12*(1+NVL(commission_pct,0)/100) as annual from S_EMP;

/*3.
�鿴Ա����Ա��id��ȫ����ְλ���ƣ�ȫ����ְλ���ƺϲ���һ����ʾ���Ҹ�ʽΪ���� ����ְλ����*/
select id,(first_name ||' '|| last_name ||','|| title) as "��   ��,   ְλ����"
from s_emp

/*4.
�鿴Ա����1,3,5,7,9Ա���Ĺ���
*/
select id,salary
from s_emp
where id in(1,3,5,7,9)

/*5.
�鿴Ա�����ֳ��Ȳ�С��5���ҵ��ĸ���ĸΪn��ĸ��Ա��id�͹���
*/
select id,salary
from s_emp
where first_name like '___n_%'

/*6.
�鿴Ա������Ϊ41 ���� 44�Ų����ҹ���С��1000��Ա��id������
*/
select id,first_name
from s_emp
where dept_id in (41,44) and salary<1000

/*7.
��ʾԱ�������е�������ĸΪ��a��(�����ִ�Сд)������Ա�������ֺ�����
*/
select first_name,last_name
from s_emp
where regexp_like(last_name,'^..a','i')

/*8.
��ʾԱ���������С�a���͡�e��������Ա�������Ϻ�����
*/
select first_name,last_name
from s_emp
where last_name like '%a%e%' or LAST_NAME like '%e%a%'

/*9.
��ʾ��92����ְ������Ա�������Ϻ�¼������,������������������ 
*/
select last_name,start_date
from s_emp
where start_date>to_date('1992-01-01','yyyy-mm-dd')
order by last_name asc

/*10.
��ѯ�����۴���Ŀͻ��������۱��
*/
select name,id
from s_customer
where sales_rep_id is not null

/*11.
��ѯ92��9��1�������µ�(date_ordered)���еĶ������,�µ�ʱ�䣬�����ܶ�
s_ord��
*/
select id,date_ordered,total
from s_ord
where date_ordered>to_date('1992-09-01','yyyy-mm-dd')

/*12.
��ѯ����be�����е�Ա������,�����ִ�Сд
*/
select first_name
from s_emp
where regexp_like(first_name,'^*be','i')














