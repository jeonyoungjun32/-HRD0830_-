drop table member_tbl_ll

create table member_tbl_ll(
member_no number not null,
member_id varchar2(10) not null,
member_name varchar2(20) not null,
member_grade char(1),
member_hobby varchar2(100),
member_date date,
primary key(member_no)
);

--select2.jsp
select member_no ,member_id, member_name, req_date
from member_tbl_ll , friend_tbl_ll
where member_no = '1001'


select * from member_tbl_11

insert into member_tbl_ll values('1001','hong','홍길동','S','독서,운동,영화','18/01/10');
insert into member_tbl_ll values('1002','choi','최영분','A','영화','18/01/11');
insert into member_tbl_ll values('1003','park','박기자','A','독서','18/01/12');
insert into member_tbl_ll values('1004','lee','이은주','B','운동','18/01/13');
insert into member_tbl_ll values('1005','kang','강하나','S','','18/01/14');


drop table friend_tbl_ll

create table friend_tbl_ll(
req_member_no number not null,
res_member_no number,
req_date date,
allow_yn char(1)
);

insert into friend_tbl_ll values('1001','1002','18/09/20','Y');
insert into friend_tbl_ll values('1003','1001','18/09/21','Y');
insert into friend_tbl_ll values('1002','1004','18/09/21','Y');
insert into friend_tbl_ll values('1001','1005','18/09/22','N');
insert into friend_tbl_ll values('1002','1005','18/09/22','Y');
insert into friend_tbl_ll values('1005','1003','18/09/22','Y');


--insert.jsp에 자동 번호
select NVL(max(member_no),0)+1 as member_no 
from member_tbl_ll
--insert.jsp 날짜도 자동으로 ㅡㅡ
select to_char(sysdate,'yyyy/mm/dd')
from dual
	sql = "select to_char(sysdate,'yyyy-mm-dd') from dual";
--insertPro.jsp
insert into table member_tbl_ll values('넣','고','싶','은','거','넣어');

--select.jsp
select member_no, member_id, member_name,  
decode(member_grade,'S','특별회원','A','우수회원','B','일반회원'),
member_hobby, 
to_char(member_date,'yyyy.mm.dd')
from member_tbl_ll
order by 2

select member_no, member_id, member_name,  
decode(member_grade,'S','특별회원','A','우수회원','B','일반회원'),
member_hobby, 
to_char(member_date,'yyyy.mm.dd')
from member_tbl_ll
where member_no = '1002'
order by 2




--select2.jsp
select member_id, member_name, to_char(req_date,'yyyy-mm-dd') as req_date
from member_tbl_ll natural join friend_tbl_ll
where (member_no= req_member_no or member_no = res_member_no) and allow_yn= 'Y';
 
조인할 관계가 업슨넫요

