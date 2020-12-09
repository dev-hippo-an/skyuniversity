show user;
create table schoolreg
(
regseq      number not null     
,status  varchar2(20) not null
,constraint PK_tbl_schoolreg_regseq  primary key(regseq)
)

create sequence schoolregSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table dept
(
deptseq     number not null
deptname varchar2(20) not null
,constraint PK_tbl_dept_deptseq primary key(deptseq)
)

create sequence deptSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table member
(memberno            number                not null   -- 댓글번호
,pwd                 varchar2(100)         not null   -- 사용자ID
,name                varchar2(20)          not null   -- 성명
,email               varchar2(200)         not null   -- 댓글내용
,birth               varchar2()
,jubun     number               not null   -- 원게시물 글번호
,engname        number(1) default 1  not null   -- 글삭제여부
,chinaname                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
,grade                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,majordegree
,liberaldegree
,totalsemester
,enterday
,graduateday
,absencecnt
,fk_regseq
,fk_deptseq
,constraint PK_tbl_member_memberno primary key(memberno)
,constraint FK_tbl_member_regseq foreign key(fk_regseq)
                                    references schoolreg(regseq)
,constraint FK_tbl_membert_deptseq foreign key(fk_deptseq) 
                                      references dept(deptseq) on delete cascade
,constraint CK_tbl_comment_status check( status in(1,0) ) 
);

create sequence commentSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;