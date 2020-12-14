show user;

create table tbl_an_index_img (
ino      number not null 
, iname     varchar2(500) not null
, ilink      varchar2(500) not null
, status    number(1) default 1 not null
, primary key (ino)
, check (status in (0, 1))
);

create sequence inum
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;
    
    insert into tbl_an_index_img(ino, iname, ilink, status)
    values (inum.nextval, 'banner1.PNG', 'https://www.hyundaicard.com/index.jsp', default);

    insert into tbl_an_index_img(ino, iname, ilink, status)
    values (inum.nextval, 'banner2.PNG', 'https://elyon.game.daum.net/preorder/main', default);

    insert into tbl_an_index_img(ino, iname, ilink, status)
    values (inum.nextval, 'banner3.PNG', 'http://www.webzen.co.kr/', default);

    insert into tbl_an_index_img(ino, iname, ilink, status)
    values (inum.nextval, 'banner4.PNG', 'https://snulife.com/', default);




insert into tbl_boardkind(boardkindno, boardtypeno, boardname, tablename);




create table tbl_commu_member (    -- select 할때 필요할 값 비밀번호, 이메일, 커뮤멤버레벨VO
commuMemberNo            number not null
, fk_memberNo           number not null
, fk_levelNo            number default 1 not null
, nickname              varchar2(50) 
, point                 number default 0 not null
, check(point >= 0)
);

create sequence tbl_commu_member_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 101, 4, 4990);

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 102, 9, 9990);

commit;

select * from tbl_commu_member;

drop table tbl_commu_member purge;
drop sequence tbl_commu_member_seq;

drop table tbl_commu_member_level purge;
drop sequence tbl_commu_member_level_seq;

create table tbl_commu_member_level (
levelNo             number not null
, levelName         varchar2(50) not null
, levelPoint        number not null
, levelImg          varchar2(200) not null
, check(levelPoint >= 0)
);

create sequence tbl_commu_member_level_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;



desc tbl_member;

begin
    for i in 1..21 loop
        insert into tbl_commu_member_level(levelNo, levelName, levelPoint, levelImg)
        values(tbl_commu_member_level_seq.nextval, 'LEVEL'||i, 1000*i, 'level'||i||'.png');
    end loop;
end;

select *
from tbl_commu_member_level;

select *
from tbl_member;

select * 
from tbl_commu_member;

select *
from tbl_commu_member_level;

select m.memberno, fk_levelNo, nickname, point, m.name, m.email
from tbl_commu_member c
join
(select memberno, name, email
from tbl_member
where memberno = 'asdf' and pwd = 'qwe1234$') m
on c.fk_memberNo = m.memberno;

select levelno, levelName, levelPoint, levelImg
from tbl_commu_member_level
where levelNo = 2;

update tbl_commu_member set nickname = 
where commuMemberNo = ;

update tbl_commu_member_level set levelPoint = levelPoint - 1000;

commit;

select * from tab;
select * from TBL_DEPT;
select * from TBL_MEMBER;
select * from TBL_BOARD_HUMOR;

select * from TBL_BOARD_INFORMAL;
select * from TBL_BOARD_NOTICE;
select * from TBL_BOARDKIND;
select * from TBL_CATEGORY;

----- 장터 게시판의 boardTypeNo = 5

create table tbl_board_etcmarket(
boardNo               number                                not null         -- 시퀀스 고유넘버
, fk_boardKindNo      number                                not null         -- tbl_boardkind 참조!
, fk_memberNo         number                                not null         -- 유저넘버 (현재는 101, 102)
, categoryNo          number                                not null         -- 삽니다: 1 , 팝니다: 2,  무료나눔: 3,  거래완료: 4
, subject             varchar2(200)                         not null         -- 글제목
, regDate             date             default sysdate      not null         -- 등록일자
, editDate            date                                                   -- 글 수정 일자
, content             nvarchar2(2000)                                        -- 글 내용(null이 가능한 이유는 사진만 올리는 경우가 있기 때문에!)
, readCount           number           default 0                             -- 조회수 디폴트는 0
, status              number(1)        default 1                             -- 글상태 0 - 비활성화,  1 - 활성화
, fileExist           number(1)                             not null         -- 첨부 파일 존재 여부 0 - 없음 1 - 있음
, writerIp            varchar2(50)                          not null         -- 작성자 아이피주소
, price               number           default 0            not null         -- 다른게시판과 다르게 가격정보 무료나눔이 있으므로 0도 가능
, primary key (boardNo)
, check (status in (0, 1))
, check (fileExist in (0, 1))
);

create sequence tbl_board_etcmarket_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;

create table tbl_file (
fileNo              number          not null
, fk_boardKindNo    number          not null
, fk_boardNo        number          not null
, fileName          varchar2(50)    not null
, orgFileName       varchar2(200)   not null
, fileSize          varchar2(50)    not null
, primary key (fileNo)
);

create sequence tbl_file_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;


