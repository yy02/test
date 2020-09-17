--������
/*
create table ����
(
	����1 �������� [DefaultĬ��ֵ] [Լ��]
	����2 �������� [DefaultĬ��ֵ] [Լ��]
	����3 �������� [DefaultĬ��ֵ] [Լ��]
	����
)
*/

/*
���������ƣ�
	1��ֻ������ĸ�����֣�_��$��#��ɣ����ҵ�һ���ַ�����ĸ��
	2�����������ƣ����ܳ���30��
	3������������ɶ��������ɵģ�����֮����_���ӣ������շ������������ӷ�ʽ��
	4������Ҫ�����壻
	5������ʹ��SQL�ؼ��֡�
	
���飺����ǰ��t_��s_
һ���û���������user���ؼ��֣���Ϊuser��SQL�ؼ��֡�
*/

/*
�������ͣ�
	�ı����� VARCHAR(<ֵ>)	CHAR(<ֵ>)
	��ֵ���� NUMBER(<ֵ>)	NUMBER(<ֵ>,<ֵ>)
	�������� DATE ��ȷ���루������ʱ���룩	TIMESTAMP ��ȷ�����루��1970��1��1�տ�ʼ��
	���������� BLOB	CLOB
*/

--�鿴��Ľṹ
/*desc ����*/

--ɾ����
/*drop table ����*/

/*Լ����
	1���ǿ�Լ�� not null
	2��ΨһԼ�� unique
	3�����Լ�� check
	4������Լ�� primary key
	5�����Լ�� foreign key
*/

--����һ��ѧ��������������ѧ�ţ��Ա����䣬�༶
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
--�Ƽ�ʹ�ñ�Լ��