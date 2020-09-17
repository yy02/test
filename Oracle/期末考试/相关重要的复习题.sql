9. 查找人数最多部门中薪资最低员工的员工编号，员工名字，员工薪资，所在部门id，部门名。

1) 做多的人数
select max(count(id))
from s_emp
group by dept_id;

2) 有最多人数的部门
select dept_id
from s_emp
group by dept_id
having count(id) = (
  select max(count(id))
  from s_emp
  group by dept_id
);

3) 人数最多部门中最低的薪资

select dept_id, min(salary) min_sal
from s_emp
group by dept_id
having dept_id in (
  select dept_id
  from s_emp
  group by dept_id
  having count(id) = (
    select max(count(id))
    from s_emp
    group by dept_id
  )
);

4) 人数最多部门中最低的薪资的员工

select e.id eid, e.first_name ename, e.dept_id, d.name dname, e.salary
from s_emp e, s_dept d 
where e.dept_id=d.id
and (e.dept_id, e.salary) in (
  select dept_id, min(salary) min_sal
  from s_emp
  group by dept_id
  having dept_id in (
    select dept_id
    from s_emp
    group by dept_id
    having count(id) = (
      select max(count(id))
      from s_emp
      group by dept_id
    )
  )
);  

-- 注意：使用in操作，使用=操作可能出错。

-- 另外的做法：
找出最多人数 --> 有最多人数的部门 --> 改部门员工薪资排序 --> 取第一个

SELECT e.id,e.first_name,e.salary,e.dept_id,d.name
FROM (
      SELECT e.id,e.first_name,e.salary,e.dept_id,d.name
      FROM s_dept d,s_emp e
      WHERE d.id=e.dept_id
      AND e.dept_id in(
       SELECT e.dept_id
       FROM s_emp e 
       GROUP BY e.dept_id
       HAVING COUNT(e.id) IN(
             SELECT MAX(COUNT(e.id))
	         FROM s_emp e
	         GROUP BY e.dept_id
            )
           )
        ORDER BY e.salary ASC		   
     ) e,s_dept d
WHERE rownum<=1;

上述思路正确，答案错误，原因是最后关联了部门表没有关联条件，笛卡尔积后的第一条，部门名字不正确。
简单修改如下：

SELECT *
FROM (
      SELECT e.id,e.first_name,e.salary,e.dept_id,d.name
      FROM s_dept d,s_emp e
      WHERE d.id=e.dept_id
      AND e.dept_id in(
       SELECT e.dept_id
       FROM s_emp e 
       GROUP BY e.dept_id
       HAVING COUNT(e.id) IN(
             SELECT MAX(COUNT(e.id))
	         FROM s_emp e
	         GROUP BY e.dept_id
            )
           )
        ORDER BY e.salary ASC		   
     ) e
WHERE rownum<=1;


10. 查找平均薪资最低的部门中的最低薪资，最高薪资，平均薪资。

1) 平均薪资最低的部门的平均薪资
select min(avg(salary))
from s_emp
group by dept_id;

2) 具有最低平均薪资的部门
select dept_id
from s_emp
group by dept_id
having avg(salary)=(
  select min(avg(salary))
  from s_emp
  group by dept_id
);

3) 该部门的最低薪资，最高薪资，平均薪资。
select min(salary) min_sal, max(salary) max_sal, avg(salary) avg_sal
from s_emp
group by dept_id
having dept_id in (
  select dept_id
  from s_emp
  group by dept_id
  having avg(salary)=(
    select min(avg(salary))
    from s_emp
    group by dept_id
  )
);