declare
   deluser varchar2(40);
   i number;
begin
   deluser:= upper('gench');
   select COUNT(*) into i from all_users where username= deluser;
   IF i>0 then
       EXECUTE immediate 'DROP USER '||deluser||' CASCADE'; 
   END IF;
end;
/
CREATE USER gench IDENTIFIED BY gench;
GRANT CONNECT, RESOURCE TO gench;
conn gench/gench
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
-- 1. 创建学生表
exec dropObject('t_student','table');
/
CREATE TABLE t_student(
    id NUMBER(9),
	name VARCHAR2(25) CONSTRAINT t_student_name_nn NOT NULL,
	sno CHAR(9),
	gender CHAR(1) DEFAULT 'F',
	birthday DATE,
	class_no CHAR(9),
	CONSTRAINT t_student_id_pk PRIMARY KEY(id),
	CONSTRAINT t_student_sno_uk UNIQUE(sno),
	CONSTRAINT t_student_gender_ck CHECK(gender='F' OR gender='M')
);

-- 2. 创建教师表
exec dropObject('t_teacher','table'); 
CREATE TABLE t_teacher(
    id NUMBER(9),
	name VARCHAR2(25) CONSTRAINT t_teacher_name_nn NOT NULL,
	tno CHAR(9),
	gender CHAR(1) DEFAULT 'M',
	birthday DATE,
	title VARCHAR2(10),
	department VARCHAR2(15),
	CONSTRAINT t_teacher_id_pk PRIMARY KEY(id),
	CONSTRAINT t_teacher_tno_uk UNIQUE(tno),
	CONSTRAINT t_teacher_gender_ck CHECK(gender='F' OR gender='M')
);

-- 3. 创建课程表
exec dropObject('t_course','table'); 
CREATE TABLE t_course(
    id NUMBER(5),
	name VARCHAR2(55) CONSTRAINT t_course_name_nn NOT NULL,
	tid NUMBER(9),
	CONSTRAINT t_course_id_pk PRIMARY KEY(id),
	CONSTRAINT t_course_tid_fk FOREIGN KEY(tid) REFERENCES t_teacher(id)
);

-- 4. 创建成绩表
exec dropObject('t_score','table');
CREATE TABLE t_score(
    id NUMBER(9),
	sid NUMBER(9),
	cid NUMBER(5),
	score NUMBER(5,1),
	CONSTRAINT t_score_id_pk PRIMARY KEY(id),
	CONSTRAINT t_score_sid_fk FOREIGN KEY(sid) REFERENCES t_student(id),
	CONSTRAINT t_score_cid_fk FOREIGN KEY(cid) REFERENCES t_course(id)
);

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(1, 'ZengHua', '17ITS0008', 'M', to_date('1998-09-01','YYYY-MM-DD'), 'ITSE01');

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(2, 'KuangMin', '17ITS0005', 'M', to_date('1998-06-29','YYYY-MM-DD'), 'ITSE03');

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(3, 'WangLi', '17ITS0007', 'F', to_date('1999-04-11','YYYY-MM-DD'), 'ITSE01');

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(4, 'LiJun', '17ITS0001', 'M', to_date('1999-02-19','YYYY-MM-DD'), 'ITSE01');

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(5, 'WangFang', '17ITS0009', 'F', to_date('1998-11-21','YYYY-MM-DD'), 'ITSE03');

INSERT INTO t_student
(id, name, sno, gender, birthday, class_no)
VALUES
(6, 'LuJun', '17ITS0003', 'M', to_date('1998-10-15','YYYY-MM-DD'), 'ITSE03');
commit;

-- 增加教师
INSERT INTO t_teacher
(id, name, tno, gender, birthday, title, department)
VALUES
(1, 'LiCheng', '100804', 'M', to_date('1978-12-02','YYYY-MM-DD'), 'VProf', 'Computer');

INSERT INTO t_teacher
(id, name, tno, gender, birthday, title, department)
VALUES
(2, 'ZhangXu', '100856', 'M', to_date('1989-03-12','YYYY-MM-DD'), 'Lecturer', 'Electrical');

INSERT INTO t_teacher
(id, name, tno, gender, birthday, title, department)
VALUES
(3, 'WangPing', '100825', 'F', to_date('1992-05-05','YYYY-MM-DD'), 'Assistant', 'Computer');

INSERT INTO t_teacher
(id, name, tno, gender, birthday, title, department)
VALUES
(4, 'LiuBing', '100831', 'F', to_date('1995-08-14','YYYY-MM-DD'), 'Assistant', 'Electrical');
commit;

-- 增加课程
INSERT INTO t_course
(id, name, tid)
VALUES
(1, 'Computers', 3);

INSERT INTO t_course
(id, name, tid)
VALUES
(2, 'Operation System', 1);

INSERT INTO t_course
(id, name, tid)
VALUES
(3, 'Digital circuits', 2);

INSERT INTO t_course
(id, name, tid)
VALUES
(4, 'Advanced Mathematics', 4);
commit;

-- 增加成绩
INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(1, 6, 2, 86);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(2, 2, 2, 75);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(3, 5, 2, 68);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(4, 6, 1, 92);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(5, 2, 1, 88);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(6, 5, 1, 76);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(7, 4, 1, 64);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(8, 3, 1, 91);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(9, 1, 1, 78);
		 
INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(10, 4, 3, 85);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(11, 3, 3, 79);

INSERT INTO t_score
(id, sid, cid, score)	
VALUES
(12, 1, 3, 81);
commit;
