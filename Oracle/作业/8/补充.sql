-- 查询每个部门最低薪资员工的员工编号，名字，薪资，部门编号，部门名字，部门人数，所在区域编号，区域名字, 按照部门编号升序排列。
select e.id eid, e.first_name ename, e.salary minsal, e.dept_id did, d.name dname, msalary.dept_count, r.id rid, r.name rname
from s_emp e
left join s_dept d
on e.dept_id=d.id
left join s_region r
on d.region_id=r.id
left join (
  select dept_id, min(salary) minsal, count(id) dept_count
  from s_emp
  group by dept_id  
) msalary
on d.id=msalary.dept_id
where e.salary=msalary.minsal
order by did;


select e.id eid, e.first_name ename, e.salary minsal, e.dept_id eid, d.name dname, dinfo.dept_count, r.id rid, r.name rname
from s_emp e, s_dept d, s_region r, (
  select dept_id, min(salary) minsal, count(id) dept_count
  from s_emp
  group by dept_id
) dinfo
where e.dept_id=d.id
and d.region_id=r.id
and d.id = dinfo.dept_id
and e.salary=dinfo.minsal;


-- 薪资高于所在部门平均薪资的员工信息：员工id，员工的名字，员工的薪资，员工部门id, 员工部门的平均薪资。
select e.id eid, e.first_name ename, e.salary, dinfo.dept_id did, dinfo.avg_sal
from s_emp e
left join (
  select dept_id, avg(salary) avg_sal
  from s_emp
  group by dept_id
) dinfo
on e.dept_id=dinfo.dept_id
where e.salary>dinfo.avg_sal
order by did, salary desc;

-- 统计每年入职的员工个数,要求显示年，人数，已经所有年的合计。
-- 重点是行列转换

select to_char(start_date,'yyyy') year, count(id) emp_count
from s_emp
group by to_char(start_date, 'yyyy');

select 
   sum(case  
      when year='1990' then emp_count   
   end) "1990", 	  
   max(case  
      when year='1991' then emp_count   
   end) "1991",
   min(case  
      when year='1992' then emp_count   
   end) "1992", 	
   avg(case  
      when year='1993' then emp_count   
   end) "1993",
   sum(emp_count) "total"   
from (
   select to_char(start_date,'yyyy') year, count(id) emp_count
   from s_emp
   group by to_char(start_date, 'yyyy')
); 


select sum(decode(year, '1990', emp_count)) "1990",
       sum(decode(year, '1991', emp_count)) "1991",
	   sum(decode(year, '1992', emp_count)) "1992",
	   sum(emp_count) "total"
from (
  select to_char(start_date, 'yyyy') year, count(id) emp_count
  from s_emp
  group by to_char(start_date,'yyyy')
);

      1990       1991       1992      total
---------- ---------- ---------- ----------
        10         11          4         25

SQL>

-- 查询员工表中的员工信息，按薪资降序排列，进行分页，每页5条记录，查询第3页。
select id, first_name,salary
from (
  select rownum rn, id, first_name,salary
  from (
    select id, first_name, salary
    from s_emp
    order by salary desc
  )
  where rownum<5*3+1
)
where rn>5*2;

-- select * 
-- from (
--   select rownum rn, e.* 
--   from (
--     select * 
--       from s_emp 
--       order by salary desc
--   ) e 
--   where rownum<pageCount*pageNo+1
-- ) 
-- where rn>pageCount*(pageNo-1);

-- 查询不是老板的员工
select id, first_name 
from s_emp 
where id not in
(
  select e2.id
  from s_emp e1, s_emp e2
  where e1.manager_id=e2.id
);

select id, first_name 
from s_emp 
where id not in
(
  select e2.id
  from s_emp e1
  left join s_emp e2
  on e1.manager_id=e2.id
);


select e.id 
from s_emp e
where not exists(
  select *
  from (
    select e2.id
    from s_emp e1
    left join s_emp e2
    on e1.manager_id=e2.id
  ) m
  where e.id=m.id  
);