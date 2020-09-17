-- 1.查询s_emp表中按照薪资升序排序后的排在第4到6位的的三个员工信息

select id, first_name, salary
from (
  select rownum rn, id, first_name, salary
  from (
    select id, first_name, salary
    from s_emp
    order by salary
  ) 
  where rownum<7
)
where rn>3;

select id, first_name, salary
from(
  select rownum rn, id, first_name, salary
  from (
    select id, first_name, salary
    from s_emp
    order by salary
  )
)  
where rn between 4 and 6;


-- 2.列出平均薪水小于1400的所有部门的平均薪水及人数

select dept_id, avg(salary) avg_sal, count(id)
from s_emp
group by dept_id
having avg(salary)<1400;

-- 列出平均薪水小于1400的所有部门的部门id， 部门名字，所在区域id， 和区域名字，平均薪水及人数
select d.id did, d.name dname, r.id rid, r.name rname, ds.avg_sal, ds.dept_count
from s_dept d, s_region r, (
  select dept_id, avg(salary) avg_sal, count(id) dept_count
  from s_emp
  group by dept_id
  having avg(salary)<1400
) ds
where d.region_id=r.id 
and d.id = ds.dept_id;


select d.id did, d.name dname, r.id rid, r.name rname, ds.avg_sal, ds.dept_count
from s_dept d
left join s_region r
on d.region_id=r.id
left join (   
  select dept_id, avg(salary) avg_sal, count(id) dept_count
  from s_emp
  group by dept_id
  having avg(salary)<1400
) ds
on d.id=ds.dept_id;  


-- 3.查看薪资大于Chang员工薪资的员工的信息【Chang是last_name】
select id, first_name, salary
from s_emp
where salary>(
  select salary
  from s_emp
  where last_name='Chang'
);

-- 查看薪资大于Chang员工薪资的员工的信息【Chang是last_name】并且和Elena的职称(title)一样
select id, first_name, salary, title
from s_emp
where salary>(
  select salary
  from s_emp
  where last_name='Chang'
) and 
title=(
  select title
  from s_emp
  where first_name='Elena'
);

-- 4.查看薪资大于Chang员工薪资或者所在部门在3号区域下的员工的信息
select e.id eid, e.first_name ename, e.salary, d.region_id
from s_emp e
left join s_dept d
on e.dept_id=d.id
where salary>(
  select salary
  from s_emp
  where last_name='Chang'
) OR
d.region_id=3;


-- 5.查询部门人数最多的部门编号，部门名
select dinfo.dept_id, d.name dname, dinfo.dept_count
from (
  select dept_id, count(id) dept_count
  from s_emp e
  group by dept_id
  order by dept_count desc
) dinfo
left join s_dept d
on dinfo.dept_id=d.id
where rownum<2;

select max(count(id))
from s_emp
group by dept_id;


select e.dept_id, d.name, count(e.id)
from s_emp e, s_dept d
where e.dept_id=d.id 
group by e.dept_id, d.name
having count(e.id)=(
  select max(count(id))
  from s_emp
  group by dept_id
);


-- 6.查找各部门的平均工资，包含字段部门编号，部门名，平均工资
select e.dept_id did, d.name dname, avg(e.salary)
from s_emp e
left join s_dept d
on e.dept_id=d.id
group by e.dept_id, d.name;



-- 7.查看薪资高于Chang员工经理薪资的员工信息
select id, first_name, title, salary
from s_emp
where salary>(
  select e2.salary
  from s_emp e1, s_emp e2
  where e1.manager_id=e2.id
  and e1.last_name='Chang'
);

-- 8.查看薪资大于Chang所在区域平均工资的员工信息
select id, first_name, salary
from s_emp
where salary>
(
   select avg(salary)
   from s_emp e, s_dept d
   where e.dept_id=d.id
   and d.region_id=(
      select region_id
	  from s_emp e, s_dept d
	  where e.dept_id=d.id
	  and e.last_name='Chang'
   )
);

--9.查看Chang员工所在部门其他员工薪资总和
select sum(salary)
from s_emp
where dept_id =  (
  select dept_id
  from s_emp
  where last_name='Chang'
) and 
last_name != 'Chang';


--10.统计不由11号和12号员工负责的客户的人数
select count(id)
from s_customer
where sales_rep_id not in (11,12);

select count(id)
from s_customer;

select count(id)
from s_customer
where sales_rep_id in (11,12);

select count(id)
from s_customer
where sales_rep_id not in (11,12) 
OR sales_rep_id is null;

select count(id)
from s_customer
where nvl(sales_rep_id, 0) not in (11,12);


