--1.��ѯ41�Ų���ÿ��Ա���ı�ţ����֣�������
	select e.id,e.first_name||','||e.last_name name,d.id
	from s_emp e,s_dept d
	where d.id=41;
	
	
--2.��ѯ1������ÿ��Ա���ı�ţ����֣�н�ʣ���������������н����������	
	select e.id,e.first_name||','||e.last_name name,e.salary,d.name ������
	from s_region r,s_emp e,s_dept d
	where r.id=1 and e.dept_id=d.id
	order by e.salary asc;
	
	
--3.��ѯ1������ÿ���ͻ������֣���������	
	select c.name,r.id
	from s_customer c,s_region r
	where c.region_id=1 and r.id=1;
	
	
--4.�г����пͻ�������,�����Ӧ�����۵�first_name,Ҫ��û�����۵Ŀͻ�Ҳ��ʾ����,���Ұ��տͻ������ֽ��������
	select c.name,e.first_name
	from s_customer c
	left join s_emp e
	on c.sales_rep_id=e.id; 
	order by c.name desc;
	
--5.�ҳ���ɵ���13��Ա�����������ż���ɣ�������Ϊ�գ���ʾ0��	
	select e.first_name||','||e.last_name name,d.id,NVL(e.commission_pct,0)
	from s_emp e
	left join s_dept d
	on e.dept_id=d.id where NVL(e.commission_pct,0)<13;
	
	
	select e.first_name||','||e.last_name name,d.id,nvl(e.commission_pct,0)
	from s_emp e,s_dept d
	where e.dept_id=d.id(+) and nvl(e.commission_pct,0)<13;
	
--6.��������нˮ����1500Ա����last_name,salary,������������нˮ��������
	select e.last_name,e.salary,d.id
	from s_emp e,s_dept d
	where e.dept_id=d.id and e.salary>1500
	order by e.salary asc;

--7.�г�н�ʸ������쵼������Ա����������Ա��id��������
	select e1.id,e1.first_name||','||e1.last_name name,e1.salary
	from s_emp e1,s_emp e2
	where e1.manager_id=e2.id and e1.salary>e2.salary
	order by e1.id asc;

--8.����5���������еĿͻ������ͻ���ţ���������
	select c.name �ͻ���,c.id,r.name ������
	from s_customer c,s_region r
	where c.region_id=r.id and r.id=5;

--9.����s_emp����ǰ3����¼
	select id,first_name||','||last_name name
	from s_emp
	where rownum<4;

--10.��ѯ��s_emp���еĵ�6��10����¼
	select id,first_name||','||last_name name,rownum
	from s_emp
	where rownum <=10
	minus
	select id,first_name||','||last_name name,rownum
	from s_emp
	where rownum <=5;

--11.��ѯ��ÿ�����������Ӧ����ϸ��Ϣ(s_ord,s_item,�ֶ�ѡ��һ���ּ���)
	select o.customer_id,o.date_ordered,i.item_id
	from s_ord o,s_item i
	where i.ord_id=o.id;

--12.��ѯ��100�Ŷ��������Ӧ����ϸ��Ϣ(s_ord,s_item,�ֶ�ѡ��һ���ּ���)
	select o.customer_id,o.date_ordered,i.item_id
	from s_ord o,s_item i
	where i.ord_id=o.id and o.id=100;

--13.��ѯ��ÿ���ͻ�������,��Ӧ����������,��Ӧ����������,���û��������ʾ��������
	select c.name �ͻ���,nvl(e.first_name,'��������') ������,r.name ������
	from s_customer c
	left join s_emp e
	on e.id=c.sales_rep_id
	left join s_region r
	on c.region_id=r.id;
	
	select c.name �ͻ���,nvl(e.first_name,'��������') ������,r.name ������
	from s_emp e,s_customer c,s_region r
	where c.sales_rep_id=e.id(+) and c.region_id=r.id(+);




































