--1720411 
--郭守义

--1.查询s_emp表中按照薪资升序排序后的排在第4到6位的的三个员工信息
	select id,first_name,salary
	from
	(
	select rownum rn,id,first_name,salary
	from s_emp
	where rownum < 7
	order by salary asc
	)
	where rn > 3;

--2.列出平均薪水小于1400的所有部门的平均薪水及人数
	select dept_id,round(avg(salary)),count(id)
	from s_emp
	group by dept_id
	having avg(salary)<1400;

--3.查看薪资大于Chang员工薪资的员工的信息【Chang是last_name】
	select id,first_name,salary
	from s_emp
	where salary>(
	select salary
	from s_emp
	where last_name='Chang'
	);

--4.查看薪资大于Chang员工薪资或者所在部门在3号区域下的员工的信息
	select id,first_name,salary
	from s_emp
	where salary>(
	select salary
	from s_emp
	where last_name='Chang'
	)or dept_id in(
	select id
	from s_dept
	where region_id=3
	);

--5.查询部门人数最多的部门编号，部门名
	select *
	from (
	select count(e.id), e.dept_id did, d.name dname 
	from s_emp e 
	left join s_dept d 
	on e.dept_id=d.id 
	group by e.dept_id, d.name 
	order by count(e.id) desc
	) where rownum<=1;

	select e.dept_id, d.name, count(e.id)
	from s_emp e, s_dept d
	where e.dept_id=d.id 
	group by e.dept_id, d.name
	having count(e.id)=(
	select max(count(id))
	from s_emp
	group by dept_id
	);

--6.查找各部门的平均工资，包含字段部门编号，部门名，平均工资
	select e.dept_id,d.name,round(avg(e.salary))
	from s_emp e
	left join s_dept d
	on e.dept_id=d.id
	group by e.dept_id,d.name;
	

--7.查看薪资高于Chang员工经理薪资的员工信息
	select id,first_name,salary
	from s_emp
	where salary>(
	select salary
	from s_emp
	where id=(
	select manager_id
	from s_emp
	where last_name='Chang'
	));

--8.查看薪资大于Chang所在区域平均工资的员工信息
	select id,first_name,salary
	from s_emp
	where salary>(
	select avg(e.salary)
	from s_emp e
	left join s_dept d
	on e.dept_id=d.id
	group by d.region_id
	having d.region_id=(
	select region_id
	from s_dept
	where id=(
	select dept_id
	from s_emp
	where last_name='Chang'
	)));

--9.查看Chang员工所在部门其他员工薪资总和
	select sum(salary)
	from s_emp
	where dept_id =(
	select dept_id
	from s_emp e,s_dept d
	where e.dept_id=d.id
	and last_name='Chang')and(last_name!='Chang');

--10.统计不由11号和12号员工负责的客户的人数
	select count(id)
	from s_customer
	where sales_rep_id not in(11,12);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
