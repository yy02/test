--1.查询41号部门每个员工的编号，名字，部门名
	select e.id,e.first_name||','||e.last_name name,d.id
	from s_emp e,s_dept d
	where d.id=41;
	
	
--2.查询1号区域每个员工的编号，名字，薪资，部门名，并按照薪资升序排序	
	select e.id,e.first_name||','||e.last_name name,e.salary,d.name 部门名
	from s_region r,s_emp e,s_dept d
	where r.id=1 and e.dept_id=d.id
	order by e.salary asc;
	
	
--3.查询1号区域每个客户的名字，及区域名	
	select c.name,r.id
	from s_customer c,s_region r
	where c.region_id=1 and r.id=1;
	
	
--4.列出所有客户的名字,及其对应的销售的first_name,要求没有销售的客户也显示出来,并且按照客户的名字降序输出。
	select c.name,e.first_name
	from s_customer c
	left join s_emp e
	on c.sales_rep_id=e.id; 
	order by c.name desc;
	
--5.找出提成低于13的员工姓名，部门及提成，如果提成为空，显示0。	
	select e.first_name||','||e.last_name name,d.id,NVL(e.commission_pct,0)
	from s_emp e
	left join s_dept d
	on e.dept_id=d.id where NVL(e.commission_pct,0)<13;
	
	
	select e.first_name||','||e.last_name name,d.id,nvl(e.commission_pct,0)
	from s_emp e,s_dept d
	where e.dept_id=d.id(+) and nvl(e.commission_pct,0)<13;
	
--6.查找所有薪水大于1500员工的last_name,salary,部门名并按照薪水升序排序。
	select e.last_name,e.salary,d.id
	from s_emp e,s_dept d
	where e.dept_id=d.id and e.salary>1500
	order by e.salary asc;

--7.列出薪资高于其领导的所有员工，并按照员工id升序排序。
	select e1.id,e1.first_name||','||e1.last_name name,e1.salary
	from s_emp e1,s_emp e2
	where e1.manager_id=e2.id and e1.salary>e2.salary
	order by e1.id asc;

--8.查找5号区域所有的客户名，客户编号，区域名。
	select c.name 客户名,c.id,r.name 区域名
	from s_customer c,s_region r
	where c.region_id=r.id and r.id=5;

--9.查找s_emp表中前3条记录
	select id,first_name||','||last_name name
	from s_emp
	where rownum<4;

--10.查询出s_emp表中的第6到10条记录
	select id,first_name||','||last_name name,rownum
	from s_emp
	where rownum <=10
	minus
	select id,first_name||','||last_name name,rownum
	from s_emp
	where rownum <=5;

--11.查询出每个订单及其对应的明细信息(s_ord,s_item,字段选择一部分即可)
	select o.customer_id,o.date_ordered,i.item_id
	from s_ord o,s_item i
	where i.ord_id=o.id;

--12.查询出100号订单及其对应的明细信息(s_ord,s_item,字段选择一部分即可)
	select o.customer_id,o.date_ordered,i.item_id
	from s_ord o,s_item i
	where i.ord_id=o.id and o.id=100;

--13.查询出每个客户的名字,对应的销售名字,对应的区域名字,如果没有销售显示暂无销售
	select c.name 客户名,nvl(e.first_name,'暂无销售') 销售名,r.name 区域名
	from s_customer c
	left join s_emp e
	on e.id=c.sales_rep_id
	left join s_region r
	on c.region_id=r.id;
	
	select c.name 客户名,nvl(e.first_name,'暂无销售') 销售名,r.name 区域名
	from s_emp e,s_customer c,s_region r
	where c.sales_rep_id=e.id(+) and c.region_id=r.id(+);




































