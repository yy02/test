create user oaec identified by 1234;
grant connect,resource to oaec;
alter session nls_date_language=english;

/*1.
查询所有员工的first_name和last_name,要求查询结果为一列，用逗号隔开，并且列名为Name*/
select first_name||','||last_name Name 
from s_emp

/*2.	查看员工的员工id，名字和年薪,年薪列名为annual（注意如果有提成，需要算进去）*/
select id,last_name,salary*12*(1+NVL(commission_pct,0)/100) as annual from S_EMP;

/*3.
查看员工的员工id，全名和职位名称，全名和职位名称合并成一列显示，且格式为：姓 名，职位名称*/
select id,(first_name ||' '|| last_name ||','|| title) as "姓   名,   职位名称"
from s_emp

/*4.
查看员工号1,3,5,7,9员工的工资
*/
select id,salary
from s_emp
where id in(1,3,5,7,9)

/*5.
查看员工名字长度不小于5，且第四个字母为n字母的员工id和工资
*/
select id,salary
from s_emp
where first_name like '___n_%'

/*6.
查看员工部门为41 或者 44号部门且工资小于1000的员工id和名字
*/
select id,first_name
from s_emp
where dept_id in (41,44) and salary<1000

/*7.
显示员工姓氏中第三个字母为“a”(不区分大小写)的所有员工的名字和姓氏
*/
select first_name,last_name
from s_emp
where regexp_like(last_name,'^..a','i')

/*8.
显示员工姓氏中有“a”和“e”的所有员工的姓氏和名字
*/
select first_name,last_name
from s_emp
where last_name like '%a%e%' or LAST_NAME like '%e%a%'

/*9.
显示在92年入职的所有员工的姓氏和录用日期,并按照姓氏升序排序 
*/
select last_name,start_date
from s_emp
where start_date>to_date('1992-01-01','yyyy-mm-dd')
order by last_name asc

/*10.
查询有销售代表的客户名，销售编号
*/
select name,id
from s_customer
where sales_rep_id is not null

/*11.
查询92年9月1号以来下单(date_ordered)所有的订单编号,下单时间，订单总额
s_ord表
*/
select id,date_ordered,total
from s_ord
where date_ordered>to_date('1992-09-01','yyyy-mm-dd')

/*12.
查询包含be的所有的员工名字,不区分大小写
*/
select first_name
from s_emp
where regexp_like(first_name,'^*be','i')














