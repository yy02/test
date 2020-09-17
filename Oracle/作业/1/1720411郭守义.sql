create table t_user		--�û���
(
	id varchar(10) primary key,
	username varchar(10) unique,
	password varchar(10),
	sex varchar(2) [default'��'],
	id_number varchar(18),				--���֤��
	tel varchar(11),
	addr varchar(20),
)
go
create t_produte_categoryb		--��Ʒ������
(
	id varchar(10) primary key,
	name varchar(10),
)
go
create t_produte_categorys		--��ƷС����
(
	id varchar(10) primary key,			--�����
	name varchar(10),
	parent_id varchar(10),				--��������id
)
go
create t_produte		--��Ʒ��
(
	id varchar(10) primary key,
	name varchar(10),
	price number(5,2),
	stock int,							--���
	cate_id varchar(10),				--��Ӧ�Ĵ����
	cate_child_id varchar(10),			--��Ӧ��С���
)
go
create t_order		--������
(
	id varchar(10) primary key,
	user_id varchar(10),				--�û�id
	total number(5,2),					--�ܶ�
	order_date date,					--�µ�ʱ��
	name varchar(10),					--�ջ�������
	tel varchar(11),					--�ջ��˵绰
	addr varchar(20),					--�ջ��˵�ַ
	status int check(status=0 or status=1 or status=2 or status=3),							--����״̬
)
go
create t_order_detial	--������ϸ��
(
	id varchar(10) primary key,
	order_id varchar(10) foreign key,	--������id
	product_id varchar(10) foreign key, --��Ʒ��id
	price number(5,2),					--��Ʒ����
	quantity int,						--����
	cost number(5,2),					--�ܶ�
)




insert into t_user values (01,'��һ','a1234','��',320721199635416398,12548963254,'�Ϻ�')
insert into t_user values (02,'�Ŷ�','b1234','Ů',320721198563416384,19874568423,'�Ϻ�')
insert into t_user values (03,'����','c1234','��',320721196541321456,13698563269,'�Ϻ�')
insert into t_user values (04,'����','d1234','��',320721196236874569,18916008565,'�Ϻ�')

insert into t_produte_categoryb values(01,'ʳƷ')
insert into t_produte_categorys values(02,'������',01)
insert into t_produte_categorys values(03,'����',01)
insert into t_produte_categoryb values(04,'����')

insert into t_produte values (01,'����',8,66,01,02)
insert into t_produte values (02,'������',2,85,01,03)

insert into t_order values (01,'01',48,'2019/9/12/15.30','��һ','12548963254','�Ϻ�',1)
insert into t_order values (02,'03',8,'2019/9/12/16.02','����','13698563269','�Ϻ�',0)
insert into t_order values (03,'04',16,'2019/9/11/17.30','����','18916008565','�Ϻ�',3)

insert into t_order_detial values (01,01,01,8,6,48)
insert into t_order_detial values (02,02,02,2,4,8)
insert into t_order_detial values (03,03,02,2,8,16)





















