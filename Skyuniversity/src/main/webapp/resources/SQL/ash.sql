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
