declare
   deluser varchar2(40);
   i number;
begin
   deluser:= upper('easybuy');
   select COUNT(*) into i from all_users where username= deluser;
   IF i>0 then
       EXECUTE immediate 'DROP USER '||deluser||' CASCADE'; 
   END IF;
end;
/
CREATE USER easybuy IDENTIFIED BY easybuy;
GRANT CONNECT, RESOURCE TO easybuy;
conn easybuy/easybuy
show user
-- 如果表存在则删除，准备重新创建
CREATE OR REPLACE PROCEDURE dropObject(ObjName varchar2,ObjType varchar2)
IS
  v_counter number := 0;
BEGIN
  IF UPPER(ObjType) = 'TABLE' THEN
    SELECT COUNT(*) INTO v_counter FROM user_tables WHERE table_name = upper(ObjName);
    IF v_counter > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ' || ObjName || ' CASCADE CONSTRAINTS';
    END IF;
  END IF;
END;
/
-- 1. 创建用户表
exec dropObject('t_user','table');
CREATE TABLE t_user(
	id NUMBER(11),
	username VARCHAR2(255),
	password VARCHAR2(255),
	sex CHAR(1) DEFAULT 'F',
	id_number VARCHAR2(20),
	tel VARCHAR2(15),
	addr VARCHAR2(255),
	CONSTRAINT t_user_id_pk PRIMARY KEY(id),
	CONSTRAINT t_user_username_uk UNIQUE(username),
	CONSTRAINT t_user_sex_ck CHECK(sex='M' OR sex='F')
);

-- 2. 类别表
exec dropObject('t_product_category','table');
CREATE TABLE t_product_category(
	id NUMBER(11),
	name VARCHAR2(255),
	parent_id NUMBER(11),
	CONSTRAINT t_product_category_id_pk PRIMARY KEY(id)
);

--商品表
exec dropObject('t_product','table');
CREATE TABLE t_product(
	id NUMBER(11),
	name VARCHAR2(255),
	price NUMBER(9,2),
	stock NUMBER(5),
	cate_id NUMBER(11),
	CONSTRAINT t_product_id_pk PRIMARY KEY(id)
);

-- 订单表
exec dropObject('t_order','table');
CREATE TABLE t_order(
	id NUMBER(11),
	user_id number(11),
	product_id number(11),
	quantity number(7),
	CONSTRAINT t_order_id_pk PRIMARY KEY(id),
	CONSTRAINT t_order_user_id_fk FOREIGN KEY(user_id) REFERENCES t_user(id),
	CONSTRAINT t_order_product_id_fk FOREIGN KEY(product_id) REFERENCES t_product(id)
);


-- 数据
-- 增加用户数据
INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(1, 'ZhangSan', '1234','M', '12345678901234567890','13423698721','Shang Gench');

INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(2, 'LiSi', '1234','F', '12345678901234567891','13923698661','Shang Gench');

INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(3, 'WangWu', '1234','M', '12345678901234567892','13623608736','Shang Gench');

INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(4, 'ZhengLiu', '1234','F', '12345678901234567893','13173694629','Shang Gench');

INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(5, 'ZhuQi', '1234','M', '12345678901234567894','13875698755','Shang Gench');

INSERT INTO t_user
(id, username, password, sex, id_number, tel, addr)
VALUES 
(6, 'ZhaoBa', '1234','F', '12345678901234567895','13694692655','Shang Gench');

commit;

-- 增加类别数据
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(1,'FOOD',1);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(2,'BOOK',2);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(3,'SHOE',3);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(4,'3CProd',4);

INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(5,'Noodle',1);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(6,'Bread',1);

INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(7,'Paint',2);

INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(8,'Education',2);

INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(9,'RunShoe',3);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(10,'FootballShoe',3);

commit;

INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(11,'NoteBook',4);
 
INSERT INTO t_product_category
(id, name, parent_id)
VALUES
(12,'Mobile',4);

commit;

-- 增加产品数据
INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(1, 'EasyFood', 7.5, 1500, 5); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(2, 'ItalyNoodle', 12.8, 500, 5); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(3, 'FreshCake', 6.0, 120, 6); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(4, 'LittleCircle', 8.0, 90, 6); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(5, 'Comic', 29.0, 180, 7); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(6, 'WashPainting', 199.0, 60, 7); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(7, 'Programming', 99.0, 190, 8); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(8, 'Examing', 59.0, 700, 8); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(9, 'HuiLi', 129.0, 300, 9); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(10, 'ShuangXing', 109.0, 210, 9); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(11, 'Nike', 539.0, 100, 10); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(12, 'Adidas', 789.0, 60, 10); 

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(13, 'Lenvo', 5199.0, 120, 11);
 
INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(14, 'Dell', 6499.0, 100, 11);

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(15, 'HuaWei', 4999.0, 800, 12);

INSERT INTO t_product
(id, name, price, stock, cate_id)
VALUES
(16, 'Xiaomi', 2499.0, 300, 12);
commit;

-- t_order 数据
INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(1, 1, 2, 5);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(2, 1, 3, 2);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(3, 2, 5, 2);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(4, 2, 6, 1);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(5, 3, 7, 1);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(6, 3, 8, 5);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(7, 4, 11, 1);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(8, 4, 12, 2);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(9, 5, 14, 1);

INSERT INTO t_order
(id, user_id, product_id, quantity)
values
(10, 6, 15, 1);

commit;
