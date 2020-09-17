declare
   deluser varchar2(40);
   i number;
begin
   deluser:= upper('items');
   select COUNT(*) into i from all_users where username= deluser;
   IF i>0 then
       EXECUTE immediate 'DROP USER '||deluser||' CASCADE'; 
   END IF;
end;
/
CREATE USER items IDENTIFIED BY items;
GRANT CONNECT, RESOURCE TO items;
conn items/items
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
-- 1. 创建产品表
exec dropObject('t_items','table');
CREATE TABLE t_items(
    id NUMBER(11),
    name varchar2(55) CONSTRAINT t_items_name_nn NOT NULL,
    price NUMBER(9,1),
    detail VARCHAR2(500),
    pic varchar2(99),
    createtime DATE,
    CONSTRAINT t_items_id_pk PRIMARY KEY(id)
);

-- 2. 客户表
exec dropObject('t_user','table');
CREATE TABLE t_user(
    id NUMBER(11),
    username varchar2(55) CONSTRAINT t_user_username_nn NOT NULL,
    birthday DATE,
    gender char(1) DEFAULT 'F',
    address varchar2(256),
	CONSTRAINT t_user_id_pk PRIMARY KEY(id),
	CONSTRAINT t_user_gender_ck CHECK(gender='F' OR gender='M')
);

-- 3. 订单表
exec dropObject('t_orders','table');
CREATE TABLE t_orders(
    id NUMBER(11),
    user_id NUMBER(11),
    order_no varchar2(32) CONSTRAINT t_orders_order_no_nn NOT NULL,
    createtime DATE,
    note varchar2(100),
	CONSTRAINT t_orders_id_pk PRIMARY KEY(id),
	CONSTRAINT t_orders_user_id_fk FOREIGN KEY(user_id) REFERENCES t_user(id)
);

-- 4. 订单表
exec dropObject('t_order_detail','table');
CREATE TABLE t_order_detail(
    id NUMBER(11),
    order_id NUMBER(11),
	item_id NUMBER(11),
    item_num NUMBER(9),
	CONSTRAINT t_order_detail_id_pk PRIMARY KEY(id),
	CONSTRAINT t_order_detail_order_id_fk FOREIGN KEY(order_id) REFERENCES t_orders(id),
	CONSTRAINT t_order_detail_item_id_fk FOREIGN KEY(item_id) REFERENCES t_items(id)
);

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(1, 'ZhangSan', to_date('1998-06-29','YYYY-MM-DD'), 'M', 'Shang Gench 222');

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(2, 'LiSi', to_date('1996-09-12','YYYY-MM-DD'), 'F', 'Shang Gench 201');

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(3, 'WangWu', to_date('1997-01-21','YYYY-MM-DD'), 'M', 'Shang Gench 321');

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(4, 'ZhengLiu', to_date('1997-09-20','YYYY-MM-DD'), 'F', 'Shang Gench 333');

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(5, 'ZhuQi', to_date('1998-03-19','YYYY-MM-DD'), 'M', 'Shang Gench 321');

INSERT INTO t_user
(id, username, birthday, gender, address)
VALUES 
(6, 'ZhaoBa', to_date('1996-10-22','YYYY-MM-DD'), 'F', 'Shang Gench 209');

commit;

-- 2 增加items数据
INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(1, 'EasyFood', 7.5, 'Taste Good', NULL, to_date('2018-12-22 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(2, 'ItalyNoodle', 12.8, 'Taste Good', NULL, to_date('2018-10-19 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(3, 'FreshCake', 6.0, 'Fresh, Smell Well', NULL, to_date('2019-03-28 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(4, 'LittleCircle', 8.0, 'Fresh, Sweet', NULL, to_date('2019-05-29 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(5, 'Comic', 29.0, 'Interesting', NULL, to_date('2019-06-16 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(6, 'WashPainting', 199.0, 'Relax', NULL, to_date('2019-08-09 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(7, 'Programming', 99.0, 'Easy to read', NULL, to_date('2019-08-27 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(8, 'Examing', 59.0, 'Good helper', NULL, to_date('2019-07-16 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(9, 'HuiLi', 129.0, 'Good, Speed', NULL, to_date('2019-05-18 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(10, 'ShuangXing', 109.0, 'Cheap, Good', NULL, to_date('2019-09-11 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(11, 'Nike', 539.0, 'Light, Speed', NULL, to_date('2019-01-27 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(12, 'Adidas', 789.0, 'Nobel, Speed', NULL, to_date('2019-09-28 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(13, 'Lenvo', 5199.0, 'Speed, Fashion', NULL, to_date('2019-10-10 17:10:01','YYYY-MM-DD HH24:MI:SS')); 
 
INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(14, 'Dell', 6499.0, 'Good, Fashion', NULL, to_date('2019-05-02 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(15, 'HuaWei', 4999.0, 'Good, Famous', NULL, to_date('2019-07-22 17:10:01','YYYY-MM-DD HH24:MI:SS')); 

INSERT INTO t_items
(id, name, price, detail, pic, createtime)
VALUES
(16, 'Xiaomi', 2499.0, 'Cheap, Good', NULL, to_date('2019-10-29 17:10:01','YYYY-MM-DD HH24:MI:SS')); 
commit;

-- 增加订单数据
INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(1, 1, '2019GEN11001', to_date('2019-10-29 13:10:10','YYYY-MM-DD HH24:MI:SS'),NULL);

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(2, 2, '2019GEN11002', to_date('2019-10-29 13:18:10','YYYY-MM-DD HH24:MI:SS'), 'Free mail fee.');

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(3, 2, '2019GEN11003', to_date('2019-10-29 14:10:10','YYYY-MM-DD HH24:MI:SS'), '');

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(4, 3, '2019GEN11004', to_date('2019-10-29 14:15:10','YYYY-MM-DD HH24:MI:SS'), NULL);

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(5, 4, '2019GEN11005', to_date('2019-10-29 15:03:10','YYYY-MM-DD HH24:MI:SS'),'Free mail fee.');

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(6, 5, '2019GEN11006', to_date('2019-10-29 15:15:10','YYYY-MM-DD HH24:MI:SS'), NULL);

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(7, 5, '2019GEN11007', to_date('2019-10-29 15:35:10','YYYY-MM-DD HH24:MI:SS'), 'RED');

INSERT INTO t_orders
(id, user_id, order_no, createtime, note)
VALUES
(8, 6, '2019GEN11008', to_date('2019-10-29 15:55:10','YYYY-MM-DD HH24:MI:SS'), NULL);
commit;

-- 增加订单详情数据
INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(1, 1, 1, 5);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(2, 1, 3, 2);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(3, 1, 2, 5);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(4, 2, 10, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(5, 2, 7, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(6, 2, 6, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(7, 3, 10, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(8, 3, 8, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(9, 3, 11, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(10, 4, 9, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(11, 4, 6, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(12, 4, 7, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(13, 5, 14, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(14, 5, 8, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(15, 5, 15, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(16, 6, 16, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(17, 6, 9, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(18, 7, 10, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(19, 7, 13, 1);

INSERT INTO t_order_detail
(id, order_id, item_id, item_num)
VALUES
(20, 8, 14, 1);

commit;
