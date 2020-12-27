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
create table tbl_hsNotice
(
noticeNo                 number          not null                   -- 공지번호
,fk_deptSeq           number                                           -- 학과번호
,fk_subjectNo         varchar2(20)                                    -- 과목번호
--,fk_adminNo                number          not null              -- 공지글 작성한 관리자번호
,subject                   varchar2(500)  not null                -- 공지제목
,contents               varchar2(2000)   not null             -- 공지내용
,writeDay                date            default sysdate            -- 게시일자
,readCount             number default 0      not null       -- 글조회수
,fileName               varchar2(255)                                -- WAS(톰캣)에 저장될 파일명(20200725092715353243254235235234.png)
,orgFilename        varchar2(255)                                -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
,fileSize                  number                                           -- 파일크기
,status                   number(1)        not null                   -- 0 이면 전체공지, 1이면 학과공지, 2면 과목공지
,constraint PK_tbl_hsNotice_noticeNo primary key(noticeNo)
,constraint FK_tbl_hsNotice_deptSeq foreign key(fk_deptSeq)  references tbl_dept(deptSeq)
,constraint FK_tbl_hsNotice_subjectNo foreign key(fk_subjectNo)  references tbl_subject(subjectNo)
--,constraint FK_tbl_deptNotice_adminNo foreign key(fk_adminNo)  references tbl_admin(adminNo)
);


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
,constraint FK_tbl_member_regSeq foreign key(fk_regSeq)  references tbl_school_reg(regSeq)
,constraint FK_tbl_membert_deptSeq foreign key(fk_deptSeq)  references tbl_dept(deptSeq) 
);

alter table tbl_member
add (totalSemester       number(5));

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


-------------------------------------------------------------------------------------------일정테이블-------------------------------------------------------------------------------------------------------------------------------------

create table tbl_schedule
(
scheduleNo                 number          not null              -- 일정번호
,fk_deptSeq           number                                           -- 학과번호
,fk_subjectNo         varchar2(20)                                    -- 과목번호
,subject                   varchar2(500)  not null                -- 일정이름
,contents               varchar2(2000)                               -- 일정내용
,startDate                date                       not null            -- 일정 시작일자
,endDate                 date                       not null            -- 일정 종료일자
,status                   number(1)        not null                   -- 0 이면 전체일정, 1이면 학과일정, 2면 과목일정
,constraint PK_tbl_schedule_scheduleNo primary key(scheduleNo)
,constraint FK_tbl_schedule_deptSeq foreign key(fk_deptSeq)  references tbl_dept(deptSeq)
,constraint FK_tbl_schedule_subjectNo foreign key(fk_subjectNo)  references tbl_subject(subjectNo)
);

create sequence scheduleSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-------------------------------------------------------------------------------------------학기별성적테이블-------------------------------------------------------------------------------------------------------------------------------------

show recyclebin;
purge recyclebin;

commit;

select * from tbl_member where memberno = '108';

update tbl_member set engname='PARK JIHYUN' , chinaname='朴知賢' , grade=1 , postcode='03373' , address='서오릉로 15길 5' , detailaddress ='502호' ,img='parkjihyun.jpg'
where memberno = '108';

select * from tbl_dept
select * from tbl_school_reg;
desc tbl_member;

select 
name, memberno, 
memberNo, pwd, name,deptName, r.status, mobile, email, birth, jubun, engName, chinaName, img, grade, totalSemester , enterDay, graduateDay, postcode, address, detailaddress, extraaddress, absenceCnt, graduateok 

from tbl_member M JOIN tbl_dept D
 on  M.fk_deptSeq = D.deptSeq
 join tbl_school_reg R
 on m.fk_regseq = r.regseq
 where memberNo = '108'
 
   -- func_gender(jubun)만들기2
    create or replace function func_gender_2
        (p_jubun in varchar2) 
        return varchar2
    is 
        v_gender varchar2(6);
    begin
        select case when substr(p_jubun,7,1) in('2','4') then '여' else '남' end  -- select된 결과물을 변수에 담아줘야함
        into v_gender -- select된 결과물을 변수에 담는 키워드 : into
        from dual;              
        
        return v_gender;
    end func_gender_2;
    --Function FUNC_GENDER_2이(가) 컴파일되었습니다.
    
       select func_gender_2('9710202234567')
    from dual;
 
        select func_gender_2(jubun)
    from tbl_member;
 
  with V as (
       select case when substr(jubun,7,1)in('1','3') then '남' else '여' end as gender
       from employees
      )

       select decode(grouping(gender),0,gender,'전체') as 성별
            , count(*) as 인원수
       from V
       group by rollup(gender);
 
with v  as (
select name, memberno, pwd,
                    func_gender_2(jubun) as gender, 
                    grade, enterDay, chinaName, engname, graduateday, fk_regSeq, fk_deptSeq, totalSemester, email, img, postcode, address, detailaddress, extraaddress, birth,
                    8-absenceCnt as absenceCnt
from tbl_member
where memberNo='108' and pwd='9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382'
) 
 
select name, memberno, pwd,  gender, grade, enterDay, chinaName, engname, graduateday, fk_regSeq, fk_deptSeq, totalSemester, email, img, postcode, address, detailaddress, extraaddress, birth, absenceCnt, deptName, status
from V JOIN tbl_dept D
 on  V.fk_deptSeq = D.deptSeq
 join tbl_school_reg R
 on V.fk_regseq = r.regseq
 where memberNo = '108'
 
 desc tbl_certificateKind;
 select * from tbl_certificateKind;
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '재학증명서', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '졸업증명서', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '성적증명서', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '학적부', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '수료증명서', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '교육비납입증명서', 500, 1);
insert into tbl_certificateKind(certificateKindSeq, certificateName, charge, lang) values(certificateKindSeq.nextval,  '장학금수혜증명서', 500, 1);

select certificateKindSeq, certificateName, charge, lang
from tbl_certificateKind
order by 1;

desc tbl_certificate;
select * from tbl_certificate;

insert into tbl_certificate(certificateSeq, fk_certificateKindSeq, fk_memberNo, count, grantstatus) values(1,);
 commit;
 
 select 