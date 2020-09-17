--创建表
/*
create table 表明
(
	列名1 数据类型 [Default默认值] [约束]
	列名2 数据类型 [Default默认值] [约束]
	列名3 数据类型 [Default默认值] [约束]
	……
)
*/

/*
表明的限制：
	1）只能是字母，数字，_，$，#组成，并且第一个字符是字母；
	2）长度有限制，不能超过30；
	3）如果名字是由多个单词组成的，单词之间用_连接，不是驼峰命名法的连接方式；
	4）名字要有意义；
	5）不能使用SQL关键字。
	
建议：表明前加t_或s_
一张用户表，不能用user做关键字，因为user是SQL关键字。
*/

/*
数据类型：
	文本类型 VARCHAR(<值>)	CHAR(<值>)
	数值类型 NUMBER(<值>)	NUMBER(<值>,<值>)
	日期类型 DATE 精确到秒（年月日时分秒）	TIMESTAMP 精确到毫秒（从1970年1月1日开始）
	大数据类型 BLOB	CLOB
*/

--查看表的结构
/*desc 表名*/

--删除表
/*drop table 表名*/

/*约束：
	1）非空约束 not null
	2）唯一约束 unique
	3）检查约束 check
	4）主键约束 primary key
	5）外键约束 foreign key
*/

--创建一个学生表，包含姓名，学号，性别，年龄，班级
CREATE TABLE t_student
(
	id NUMBER(9),
	name VARCHAR2(55) CONSTRAINT t_student_name_nn NOT NULL,
	sno NUMBER(8),
	gender CHAR(1) DEFAULT 'F',
	age NUMBER(3),
	class_no NUMBER(8),
	CONSTRAINT t_student_id_pk PRIMARY KEY(id),
	CONSTRAINT t_student_sno_uk UNIQUE(sno),
	CONSTRAINT t_student_gender_ck CHECK(gender='F' OR gender='M')
);
--推荐使用表级约束