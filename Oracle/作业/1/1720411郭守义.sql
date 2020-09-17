create table t_user		--用户表
(
	id varchar(10) primary key,
	username varchar(10) unique,
	password varchar(10),
	sex varchar(2) [default'男'],
	id_number varchar(18),				--身份证号
	tel varchar(11),
	addr varchar(20),
)
go
create t_produte_categoryb		--商品大类别表
(
	id varchar(10) primary key,
	name varchar(10),
)
go
create t_produte_categorys		--商品小类别表
(
	id varchar(10) primary key,			--类别编号
	name varchar(10),
	parent_id varchar(10),				--所属类别的id
)
go
create t_produte		--商品表
(
	id varchar(10) primary key,
	name varchar(10),
	price number(5,2),
	stock int,							--库存
	cate_id varchar(10),				--对应的大类别
	cate_child_id varchar(10),			--对应的小类别
)
go
create t_order		--订单表
(
	id varchar(10) primary key,
	user_id varchar(10),				--用户id
	total number(5,2),					--总额
	order_date date,					--下单时间
	name varchar(10),					--收货人姓名
	tel varchar(11),					--收货人电话
	addr varchar(20),					--收货人地址
	status int check(status=0 or status=1 or status=2 or status=3),							--订单状态
)
go
create t_order_detial	--订单明细表
(
	id varchar(10) primary key,
	order_id varchar(10) foreign key,	--订单表id
	product_id varchar(10) foreign key, --商品表id
	price number(5,2),					--商品单价
	quantity int,						--数量
	cost number(5,2),					--总额
)




insert into t_user values (01,'张一','a1234','男',320721199635416398,12548963254,'上海')
insert into t_user values (02,'张二','b1234','女',320721198563416384,19874568423,'上海')
insert into t_user values (03,'张三','c1234','男',320721196541321456,13698563269,'上海')
insert into t_user values (04,'张四','d1234','男',320721196236874569,18916008565,'上海')

insert into t_produte_categoryb values(01,'食品')
insert into t_produte_categorys values(02,'方便面',01)
insert into t_produte_categorys values(03,'蛋糕',01)
insert into t_produte_categoryb values(04,'电器')

insert into t_produte values (01,'蛋糕',8,66,01,02)
insert into t_produte values (02,'方便面',2,85,01,03)

insert into t_order values (01,'01',48,'2019/9/12/15.30','张一','12548963254','上海',1)
insert into t_order values (02,'03',8,'2019/9/12/16.02','张三','13698563269','上海',0)
insert into t_order values (03,'04',16,'2019/9/11/17.30','张四','18916008565','上海',3)

insert into t_order_detial values (01,01,01,8,6,48)
insert into t_order_detial values (02,02,02,2,4,8)
insert into t_order_detial values (03,03,02,2,8,16)





















