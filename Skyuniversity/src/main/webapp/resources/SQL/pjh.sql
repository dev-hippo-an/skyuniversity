show user;

select * from tab;

select * from tbl_member;

desc tbl_member;

memberno, pwd, name, mobile, email, birth, jubun, engname, chinaname, grade, enterday, graduateday, absencecnt, , fk_regseq, fk_deptseq, address, detailaddress, extraaddress, img, graduateok, currentsemester

select count(*)
from tbl_member
where memberno='108' and pwd='245976f7bf72702514cd146d10f8b342d7ef30045822fa2c411f62f29e133326';


SELECT * FROM USER_SEQUENCES;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------증명서종류테이블

create table tbl_certificateKind(
certificateKindSeq           number               not null         -- 증명서 구분 번호 (프라이머리키)
,certificateName     varchar2(50)         not null                -- 증명서 이름
,charge        number default 0  not null                           -- 증명서 종류별 수수료
,lang number(1) default 0 not null                                   -- 국문/영문 유무 
                                                                                              --국문만 가능하면 0, 국문/영문 둘 다 가능하면 1
,constraint PK_tbl_certificateKind_seq primary key(certificateKindSeq)
,constraint CK_tbl_certificateKind_lang check( lang in(1,0) )
);

create sequence certificateKindSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------증명서테이블

create table tbl_certificate (
certificateSeq                  number                                         not null                    -- 증명서 번호 pirmary키
,fk_certificateKindSeq      number                                        not null                    -- 증명서 종류 번호
,fk_memberNo                  number                                         not null                    -- 신청자 : 학번
,applicationDate                date                default sysdate   not null                      -- 신청일자
,count                                number                                         not null                     -- 발급부수
,grantDate                          date                default sysdate                                      --  승인일자
,grantStatus                       number          default 0                                                 -- 0 신청, 1 승인, 2 반려, 3보류
,returnreason                     varchar2(200)                                                                 -- 반려사유
,constraint PK_tbl_certificate_seq primary key(certificateSeq)
,constraint FK_tbl_certificate_kindSeq foreign key(fk_certificateKindSeq) references tbl_certificateKind(certificateKindSeq)
,constraint FK_tbl_certificate_memberNo foreign key(fk_memberNo) references tbl_member(memberno)
,constraint CK_tbl_certificate_grantStatus check( grantStatus in(0,1,2,3) )
);


-- 증명서 테이블 시퀀스 생성
create sequence certificateSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------공지테이블

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

drop sequence TBL_DEPTNOTICESEQ;
commit;

-- 학과 공지사항 테이블 시퀀스 생성
create sequence hsNoticeSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------학생테이블
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


select * from tbl_member;

update tbl_member set pwd='9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382';

commit;

show recyclebin;
purge recyclebin;