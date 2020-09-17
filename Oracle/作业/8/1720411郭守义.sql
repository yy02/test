--1720411 ������
--1.��ѯԱ��н�ʴ���1000������Ա����ţ����֣�н�ʣ����ű�ţ��������֣�����н�ʽ�������

select e.id,e.first_name,e.salary,e.dept_id,d.name
from s_emp e
left join s_dept d
on e.dept_id=d.id
where e.salary>1000
order by e.salary desc;


--2.��ѯԱ����н�ʸ���ͬ��ְ��(title)��Ա����ƽ��н��,��ѯ�������Ա��id�����֣�ְ�ƺ�н�ʣ�����ְ�ƽ������С�

select e.id,e.first_name,e.title,e.salary
from s_emp e,(
select  title,avg(salary) avgsalary
from s_emp
group by title
) a
where e.title=a.title
and e.salary>a.avgsalary
order by title desc; 

--3.��ѯ��Ա���Ĳ��ţ���ʾ����id�Ͳ�������

select distinct e.dept_id,d.name
from s_emp e
left join s_dept d
on e.dept_id=d.id
where d.id in(
select dept_id 
from s_emp);

--4.��ѯн����ߵ�5���˵�id�����֣�н�ʡ�

select * from(
select id,first_name,salary
from s_emp
order by salary desc
)
where rownum<6;

--5.��ѯ����ƽ��н�ʸ��ڹ�˾ƽ��н�ʵĲ��ű�ţ�������������ƽ��н�ʡ�

select e.dept_id,d.name,avg(e.salary)
from s_emp e
left join s_dept d
on e.dept_id=d.id
group by e.dept_id,d.name
having avg(e.salary)>(
select avg(salary)
from s_emp);

--6.41�Ų���Ա��н������10%��

update s_emp
set salary=salary*1.1
where dept_id=41;

--7.���Һ�Mai(first_name)һ�����ź�һ��ְ��(title)������Ա����

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

--8.��ѯ��������44�Ų��������Ĳ��ű�ţ�����������

select dept_id,count(id)
from s_emp
group by dept_id
having count(id)>(
select count(id)
from s_emp
group by dept_id
having dept_id=44);

--9.����������ಿ����н�����Ա����Ա����ţ�Ա�����֣�Ա��н�ʣ����ڲ���id����������

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

--10.����ƽ��н����͵Ĳ����е����н�ʣ����н�ʣ�ƽ��н�ʡ�

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


