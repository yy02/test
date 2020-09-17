--1.使用union关键字，查询所有员工编号大于10或者小于20的员工。
select first_name,id
from s_emp
where id>10
UNION
select first_name,id
from s_emp
where id<20;
	
--2.使用union关键字，查询所有工资大于1000，或者是42号部门的员工。
select id, salary, dept_id
from s_emp 
where salary > 1000
union
select id, salary, dept_id
from s_emp 
where dept_id = 42;
	
--3.使用intersect关键字，查询所有员工编号大于10并且小于20的员工。
select first_name,id
from s_emp
where id>10
intersect
select first_name,id
from s_emp
where id<20;
	
--4.使用intersect关键字，查询所有工资大于1000，并且是42号部门的员工。
select id, salary, dept_id
from s_emp 
where salary > 1000
intersect
select id, salary, dept_id
from s_emp 
where dept_id = 42;
	
--5.查询员工表中的前10行，查询员工编号，名字。
select id,first_name,rownum
from s_emp
where rownum<11;
	
--6.查询员工表中的第11行~20行，查询员工编号，名字。
select id,first_name,rownum
from s_emp
where rownum<=20
minus
select id,first_name,rownum
from s_emp
where rownum<=10;
	
--7.查询前10人的id，名字，薪资，rownum，并按照薪资升序排列。
select id,first_name,salary,rownum
from s_emp
where rownum<=10
order by salary asc;
	
--8.查询出每个部门的人数
select dept_id,count(id)
from s_emp
group by dept_id;
	
--9.统计每个销售人员对应的客户数量。
select sales_rep_id,count(id)
from s_customer
group by sales_rep_id;
	
--10.统计每个区域的部门的数量，显示区域id，区域名字，该区域的部门数量，并按区域id升序排序。
select d.region_id,r.name,count(d.id)
from s_dept d,s_region r
where d.region_id=r.id
group by d.region_id,r.name
order by d.region_id asc;

--11.统计1号区域每个部门的人数。
select e.dept_id, count(e.dept_id)
from s_emp e, s_dept d
where e.dept_id=d.id and d.region_id=1
group by e.dept_id;

--12.统计每个区域员工的数量，平均薪资。
select r.id,count(r.id),avg(e.salary)
from s_emp e,s_dept d,s_region r
where e.dept_id=d.id(+) and d.region_id=r.id(+)
group by r.id;

--13.查询出41号部门的平均薪资
select d.id,avg(e.salary)
from s_emp e,s_dept d
where e.dept_id=d.id and d.id=41
group by d.id;

select avg(salary)
from s_emp
where dept_id=41;

select dept_id,avg(salary)
from s_emp
group by dept_id
having dept_id = 41;
	
--14.查询出每个员工薪资都高于1000的部门编号，部门平均薪资，人数。
select dept_id,avg(salary),min(salary)
from s_emp
group by dept_id
having min(salary)>1000;
