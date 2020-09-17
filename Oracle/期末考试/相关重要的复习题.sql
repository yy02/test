9. ����������ಿ����н�����Ա����Ա����ţ�Ա�����֣�Ա��н�ʣ����ڲ���id����������

1) ���������
select max(count(id))
from s_emp
group by dept_id;

2) ����������Ĳ���
select dept_id
from s_emp
group by dept_id
having count(id) = (
  select max(count(id))
  from s_emp
  group by dept_id
);

3) ������ಿ������͵�н��

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

4) ������ಿ������͵�н�ʵ�Ա��

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

-- ע�⣺ʹ��in������ʹ��=�������ܳ���

-- �����������
�ҳ�������� --> ����������Ĳ��� --> �Ĳ���Ա��н������ --> ȡ��һ��

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

����˼·��ȷ���𰸴���ԭ�����������˲��ű�û�й����������ѿ�������ĵ�һ�����������ֲ���ȷ��
���޸����£�

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


10. ����ƽ��н����͵Ĳ����е����н�ʣ����н�ʣ�ƽ��н�ʡ�

1) ƽ��н����͵Ĳ��ŵ�ƽ��н��
select min(avg(salary))
from s_emp
group by dept_id;

2) �������ƽ��н�ʵĲ���
select dept_id
from s_emp
group by dept_id
having avg(salary)=(
  select min(avg(salary))
  from s_emp
  group by dept_id
);

3) �ò��ŵ����н�ʣ����н�ʣ�ƽ��н�ʡ�
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