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
,chinaName           varchar2(30)                      -- 한자성명
,img                 VARCHAR2(200)                     -- 사진
,grade               number(5)                         -- 학년
,totalSemester       number(5)                         -- 현재이수학기
,enterDay            DATE default sysdate              -- 입학날짜
,graduateDay         DATE                              -- 졸업날짜
,postcode            varchar2(5)                       -- 우편번호
,address             varchar2(200)                     -- 주소
,detailaddress       VARCHAR2(50)                      -- 상세주소
,extraaddress        VARCHAR2(50)                      -- 참고주소
,absenceCnt          number(2) default 0               -- 휴학횟수
,graduateok          number(2) default 0               -- 졸업가능여부
,fk_regSeq           number              not null      -- 학적번호
,fk_deptSeq          number              not null      -- 학과번호
,constraint PK_tbl_member_memberNo primary key(memberNo)
,constraint FK_tbl_member_regSeq foreign key(fk_regSeq)
                                 references tbl_school_reg(regSeq)
,constraint FK_tbl_membert_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

desc tbl_member

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
create table tbl_certificate
(seq                number           not null
,kind               varchar2(20)
,grantstatus        number           default 0 
,grantdate          date             default sysdate
,returnreason       varchar2(200)
,fk_memberno        number
,constraint PK_tbl_certificate_seq primary key(seq)
,constraint FK_tbl_certificate_memberno foreign key(fk_memberno) 
                                   references tbl_member(memberno)
);

-- 증명서 테이블 시퀀스 생성
create sequence tbl_certificate_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------ 

------------------------------------------------------ 
-- 수강 테이블 생성
create table tbl_course
(
courseno        number          not null
,semester       number(10)      not null
,courseyear     varchar2(10)    not null    
,score          varchar2(10)
,recourse       number(5)       default 0
,fk_memberno    number          not null
,fk_subjectNo   varchar2(20)    not null
,constraint PK_tbl_course_courseno primary key(courseno)
,constraint FK_tbl_course_memberno foreign key(fk_memberno) 
                                   references tbl_member(memberno)
,constraint FK_tbl_course_subjectNo foreign key(fk_subjectNo) 
                                   references tbl_subject(subjectNo)                                   
);
-- 수강 테이블 시퀀스 생성
create sequence tbl_course_seq
start with 10
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_course
------------------------------------------------------ 

------------------------------------------------------ 
-- 건물 테이블 생성
create table tbl_building
(
buildno      number          
,buildname   varchar2(20)    not null
,constraint PK_tbl_tbl_building_buildno primary key(buildno)
);
-- 건물 테이블 시퀀스 생성
create sequence tbl_building_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

------------------------------------------------------ 

------------------------------------------------------ 
-- 강의실 테이블 생성
create table tbl_classroom
(
classno         number not null
,fk_buildno     number not null
,constraint PK_tbl_tbl_classroom_classno primary key(classno)
,constraint FK_tbl_classroom_buildno foreign key(fk_buildno) 
                                   references tbl_building(buildno)
);
------------------------------------------------------

------------------------------------------------------
-- 교수 테이블 생성
create table tbl_professor
(
professorno      number
,phonenum        varchar2(20)
,name            varchar2(20)
,roomno          number(5)
,email           varchar2(20)
,constraint PK_tbl_professor_professorno primary key(professorno)
)
-- 교수 테이블 시퀀스 생성
create sequence tbl_professor_seq
start with 10
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------

------------------------------------------------------
-- 과목 테이블 생성
create table tbl_subject
(
subjectNo           varchar2(20)    not null
,subjectName        varchar2(20)    not null
,credits            number(2)       not null
,grade              number(5)       not null
,mustStatus         number(2)       default 1 not null
,day                varchar2(20)    not null
,period             varchar2(40)    not null
,peopleCnt          number(5)       
,fk_classNo         number          not null
,fk_professorNo     number          not null
,fk_deptSeq         number          not null
,constraint PK_tbl_subject_subjectNo primary key(subjectNo)
,constraint FK_tbl_subject_classNo foreign key(fk_classNo) 
                                   references tbl_classroom(classno)
,constraint FK_tbl_subject_professorNo foreign key(fk_professorNo) 
                                   references tbl_professor(professorno)
,constraint FK_tbl_subject_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);
------------------------------------------------------

------------------------------------------------------
-- 학과 공지사항 테이블 생성
create table tbl_dept_notice
(
noticeNo          number          
,contents         varchar2(500)   
,subject          varchar2(500)
,writeDay         DATE            default sysdate
,fk_deptSeq       number          not null
,constraint PK_tbl_dept_notice_noticeNo primary key(noticeNo)
,constraint FK_tbl_dept_notice_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

-- 학과 공지사항 테이블 시퀀스 생성
create sequence tbl_dept_notice_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------

------------------------------------------------------
-- 과제 테이블 생성
create table tbl_homework
(
workNo              number          not null
, subject           varchar2(500)
, contents          varchar2(500)
, startDate         date            default sysdate
, endDate           date            
, fk_subjectNo      varchar2(20)    not null
,constraint PK_tbl_homework_workNo primary key(workNo)
,constraint FK_tbl_homework_subjectNo foreign key(fk_subjectNo) 
                                   references tbl_subject(subjectNo)
);

create sequence tbl_homework_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
