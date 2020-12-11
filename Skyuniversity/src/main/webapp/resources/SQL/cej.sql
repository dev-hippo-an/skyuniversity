show user;
select * from tab;

------------------------------------------------------
-- 학적 테이블 생성
create table tbl_school_reg
(
regSeq      number       not null     
,status     varchar2(20) not null
,constraint PK_tbl_schoolreg_regSeq  primary key(regSeq)
)
insert into tbl_school_reg(regSeq, status)
values(tbl_school_reg_seq.nextval, '재학');
commit
-- 학적 시퀀스 생성
create sequence tbl_school_reg_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------

------------------------------------------------------
-- 학과 테이블 생성
create table tbl_dept
(
deptSeq     number not null
,deptName   varchar2(20) not null
,constraint PK_tbl_dept_deptSeq primary key(deptSeq)
)
-- 학과 시퀀스 생성
create sequence tbl_dept_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 학과 테이블 데이터 insert
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '경영학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '컴퓨터공학부');

------------------------------------------------------

------------------------------------------------------
-- 학생 테이블 생성
create table tbl_member
(memberNo            number                 not null   -- 학번
,pwd                 VARCHAR2(200)          not null   -- 비밀번호
,name                varchar2(20)           not null   -- 성명
,mobile              VARCHAR2(200)          not null   -- 연락처
,email               varchar2(200)          not null   -- 이메일
,birth               varchar2(20)                      -- 생년월일
,jubun               varchar2(200)          not null   -- 주민번호
,engName             varchar2(30)                      -- 영문성명
,chinaName           varchar2(30)                                    -- 1 : 사용가능한 글,  0 : 삭제된 글
,grade               number(5)                                 -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,majorDegree         number(5)
,liberalDegree       number(5) 
,totalSemester       number(5)
,enterDay            DATE default sysdate
,graduateDay         DATE
,absenceCnt          number(2) default 0
,fk_regSeq           number              not null
,fk_deptSeq          number              not null
,constraint PK_tbl_member_memberNo primary key(memberNo)
,constraint FK_tbl_member_regSeq foreign key(fk_regSeq)
                                 references tbl_school_reg(regSeq)
,constraint FK_tbl_membert_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

-- 학생 테이블 시퀀스 생성
create sequence tbl_member_seq
start with 100
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 학생 테이블 데이터 insert
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '홍길동', '010-1234-5678', 'hongkd@naver.com', '1997-01-27', '970127112 5678', '1', '1');
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '이순신', '010-9898-0101', 'leess@naver.com', '1995-03-11', '9503111324148', '1', '2');

-- 학생 테이블 전체 select
select *
from tbl_member
------------------------------------------------------

------------------------------------------------------
-- 증명서 테이블 생성
create table certificate


