--数值函数
	round()         --四舍五入
	trunc()         --截取
	mod()           --取余
	ceil()          --向上取整
	floor()         --向下取整
  
--日期函数
	months_between(date1,date2);		--两个时间的月份差，包含小数
	add_month(date,n)		--增加月份
	add_month(date,n*12)	--增加年份
	sysdate+n 				--增加天数n
	
	
	
	
--单行函数   日期函数
--2018年7月1日到现在经历了多少个月？
select months_between(sysdate,'1-jul-18') from dual;
select floor(months_between(sysdate,'1-jul-18')) from dual;--取整数

--三个月后的今天？两年后的今天？
select add_months(sysdate,1) from dual;
select sysdate+2 from dual;
select sysdate+10/24 from dual;  --增加小时

--下个星期六的日期
select next_day(sysdate,'saturday') from dual;

--本月最后一天的日期是？
select last_day(sysdate) from dual;

/*
select round(sysdate,'year') from dual;
select round(sysdate,'mm') from dual;
select round(sysdate,'dd') from dual;
*/

--今年的起始日期
select trunc(sysdate,'mon') from dual;
	
--本周的星期一日期是？
select next_day(sysdate,'monday') from dual;

--员工表中查询进入公司的周数
--先计算天数，然后天数除以7得到的就是周数
select id,first_name,floor((sysdate-start_date)/7) weeks
from s_emp;

--查询员工进入公司的月数
select id,first_name,round(months_between(sysdate,start_date)) months
from s_emp;

--当前时间，按年月日，时分秒来显示
select to_char(sysdate,'yyyy-mm-dd hh-mm-ss') from dual;

/*
不超过800的，税率为0。
800 – 900, 税率为0.09。
900 -  1000，税率为0.20，
1000 -  1100，税率为0.30，
1100 – 1200，税率0.40，
1200 – 1300，税率0.42，
1300 – 1400，税率0.44，
其他，税率0.45。
*/
select salary,
		case
			when salary<=800 then 0
			when salary<=900 then 0.09
			when salary<=1000 then 0.20
			when salary<=1100 then 0.30
			when salary<=1200 then 0.40
			when salary<=1300 then 0.42
			when salary<=1400 then 0.44
			else 0.45
		end tax
	from s_emp;
	
--
select id,decode(sign(salary-1250),1,'高薪','低薪') salary_lv
from s_emp;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	