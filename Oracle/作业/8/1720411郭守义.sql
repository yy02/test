--1720411 郭守义
--1.查询员工薪资大于1000的所有员工编号，名字，薪资，部门编号，部门名字，并按薪资降序排序。

select e.id,e.first_name,e.salary,e.dept_id,d.name
from s_emp e
left join s_dept d
on e.dept_id=d.id
where e.salary>1000
order by e.salary desc;


--2.查询员工：薪资高于同样职称(title)的员工的平均薪资,查询结果包含员工id，名字，职称和薪资，并按职称降序排列。

select e.id,e.first_name,e.title,e.salary
from s_emp e,(
select  title,avg(salary) avgsalary
from s_emp
group by title
) a
where e.title=a.title
and e.salary>a.avgsalary
order by title desc; 

--3.查询有员工的部门，显示部门id和部门名。

select distinct e.dept_id,d.name
from s_emp e
left join s_dept d
on e.dept_id=d.id
where d.id in(
select dept_id 
from s_emp);

--4.查询薪资最高的5个人的id，名字，薪资。

select * from(
select id,first_name,salary
from s_emp
order by salary desc
)
where rownum<6;

--5.查询部门平均薪资高于公司平均薪资的部门编号，部门名，部门平均薪资。

select e.dept_id,d.name,avg(e.salary)
from s_emp e
left join s_dept d
on e.dept_id=d.id
group by e.dept_id,d.name
having avg(e.salary)>(
select avg(salary)
from s_emp);

--6.41号部门员工薪资增加10%。

update s_emp
set salary=salary*1.1
where dept_id=41;

--7.查找和Mai(first_name)一个部门和一样职称(title)的所有员工。

select e.id,e.first_name,e.title
from s_emp e
left join s_dept d
on e.dept_id=d.id
where e.title in(
select title
from s_emp
where first_name='Mai'
)and e.dept_id in (
select dept_id
from s_emp
where first_name='Mai'
);

--8.查询人数高于44号部门人数的部门编号，部门人数。

select dept_id,count(id)
from s_emp
group by dept_id
having count(id)>(
select count(id)
from s_emp
group by dept_id
having dept_id=44);

--9.查找人数最多部门中薪资最低员工的员工编号，员工名字，员工薪资，所在部门id，部门名。

select b.id, b.first_name, b.salary, b.dept_id, b.name
from (
select e.id, e.first_name, e.salary, a.dept_id, d.name
from (
select t.dept_id, d.name
from (
select dept_id,count(dept_id)
from s_emp
group by dept_id
order by count(dept_id) desc
) t, s_dept d
where t.dept_id=d.id
and rownum<2
) a, s_dept d, s_emp e
where a.dept_id=d.id
and e.dept_id=d.id
order by e.salary asc
) b
where rownum<2;

--10.查找平均薪资最低的部门中的最低薪资，最高薪资，平均薪资。

select min(salary),max(salary),avg(salary)
from s_emp
where dept_id=(
select dept_id
from (
select dept_id,avg(salary)
from s_emp
group by dept_id
order by avg(salary) asc
)
where rownum<2
);


