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


select * from tab;
select * from TBL_DEPT;
select * from TBL_MEMBER;
select * from TBL_SCHOOL_REG;

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
