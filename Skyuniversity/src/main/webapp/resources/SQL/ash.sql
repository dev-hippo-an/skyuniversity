show user;


update tbl_commu_member set point = 50000
where commuMemberNo = 0;

commit;
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
values (0, 0, 21, 0);

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 101, 4, 4990);

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 102, 9, 9990);

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 104, default, 0);

insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 105, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 106, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 108, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 109, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 110, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 111, default, 0);
insert into tbl_commu_member(commuMemberNo, fk_memberNo, fk_levelNo, point)
values (tbl_commu_member_seq.nextval, 112, default, 0);

commit;

update tbl_commu_member set fk_levelNo = 1
where commuMemberNo = 3;

select * from tbl_member order by 1;

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

select * from tbl_commu_member;
select * from TBL_BOARD_INFORMAL;
select * from TBL_BOARD_NOTICE;
select * from TBL_BOARDKIND;
select * from TBL_CATEGORY;

----- 장터 게시판의 boardTypeNo = 5

rollback;

select * from tbl_board_etcmarket order by 1;

drop table tbl_board_etcmarket purge;

create table tbl_board_etcmarket(
boardNo               number                                not null         -- 시퀀스 고유넘버
, fk_boardKindNo      number                                not null         -- tbl_boardkind 참조!
, fk_commuMemberNo    number                                not null         -- 유저넘버 (현재는 101, 102)
, categoryNo          number                                not null         -- 삽니다: 1 , 팝니다: 2,  무료나눔: 3,  거래완료: 4
, subject             varchar2(200)                         not null         -- 글제목
, regDate             date             default sysdate      not null         -- 등록일자
, editDate            date                                                   -- 글 수정 일자
, content             nvarchar2(2000)                                        -- 글 내용(null이 가능한 이유는 사진만 올리는 경우가 있기 때문에!)
, readCount           number           default 0                             -- 조회수 디폴트는 0
, status              number(1)        default 1                             -- 글상태 0 - 비활성화,  1 - 활성화
, writerIp            varchar2(50)                          not null         -- 작성자 아이피주소
, price               number           default 0            not null         -- 다른게시판과 다르게 가격정보 무료나눔이 있으므로 0도 가능
, fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(20201208092715353243254235235234.png)                                       
, orgFileName    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
, fileSize       number                           -- 파일크기  
, primary key (boardNo)
, check (status in (0, 1, 2))

);


create sequence tbl_board_etcmarket_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;

create table tbl_board_housemarket(
boardNo               number                                not null         -- 시퀀스 고유넘버
, fk_boardKindNo      number                                not null         -- tbl_boardkind 참조!
, fk_commuMemberNo    number                                not null         -- 유저넘버 (현재는 101, 102)
, categoryNo          number                                not null         -- 삽니다: 1 , 팝니다: 2,  무료나눔: 3,  거래완료: 4
, subject             varchar2(200)                         not null         -- 글제목
, regDate             date             default sysdate      not null         -- 등록일자
, editDate            date                                                   -- 글 수정 일자
, content             nvarchar2(2000)                                        -- 글 내용(null이 가능한 이유는 사진만 올리는 경우가 있기 때문에!)
, readCount           number           default 0                             -- 조회수 디폴트는 0
, status              number(1)        default 1                             -- 글상태 0 - 비활성화,  1 - 활성화
, writerIp            varchar2(50)                          not null         -- 작성자 아이피주소
, price               number           default 0            not null         -- 다른게시판과 다르게 가격정보 무료나눔이 있으므로 0도 가능
, fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(20201208092715353243254235235234.png)                                       
, orgFileName    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
, fileSize       number                           -- 파일크기  
, primary key (boardNo)
, check (status in (0, 1, 2))

);

create sequence tbl_board_housemarket_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;


create table tbl_board_bookmarket(
boardNo               number                                not null         -- 시퀀스 고유넘버
, fk_boardKindNo      number                                not null         -- tbl_boardkind 참조!
, fk_commuMemberNo    number                                not null         -- 유저넘버 (현재는 101, 102)
, categoryNo          number                                not null         -- 삽니다: 1 , 팝니다: 2,  무료나눔: 3,  거래완료: 4
, subject             varchar2(200)                         not null         -- 글제목
, regDate             date             default sysdate      not null         -- 등록일자
, editDate            date                                                   -- 글 수정 일자
, content             nvarchar2(2000)                                        -- 글 내용(null이 가능한 이유는 사진만 올리는 경우가 있기 때문에!)
, readCount           number           default 0                             -- 조회수 디폴트는 0
, status              number(1)        default 1                             -- 글상태 0 - 비활성화,  1 - 활성화
, writerIp            varchar2(50)                          not null         -- 작성자 아이피주소
, price               number           default 0            not null         -- 다른게시판과 다르게 가격정보 무료나눔이 있으므로 0도 가능
, fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(20201208092715353243254235235234.png)                                       
, orgFileName    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
, fileSize       number                           -- 파일크기  
, primary key (boardNo)
, check (status in (0, 1, 2))

);

create sequence tbl_board_bookmarket_seq
start with 1         -- 첫번째 출발은 1부터 한다.
increment by 1        -- 증가치 값
nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
nominvalue          -- 최소값이 없다.
nocycle             -- 반복이 없는 직진
nocache;


select boardKindNo, boardTypeNo, boardName
from tbl_boardkind
where boardKindNo = ;

commit;

drop table tbl_board_bookmarket purge;
drop sequence tbl_board_bookmarket_seq ;


select * from tbl_board_bookmarket order by 1 desc;
select * from tbl_boardkind;
select * from tbl_category;
select * from tbl_commu_member;
select * from tbl_commu_member_level;

select boardNo, fk_boardKindNo, fk_commuMemberNo, categoryNo, subject
                 , content, readCount, status, writerIp, price, fileName, orgFileName, fileSize
                 , regDate, editDate
                 
                 , categoryName
                 
                 , commuMemberNo, fk_memberNo, fk_levelNo, nickname, point
                 
                 , levelNo, levelName, levelPoint, levelImg
                 
                 , boardKindNo, boardTypeNo, boardName
                 , upCount
                 
		from 
		(
		    select row_number() over(order by e.status desc, boardNo desc)  as rno, e.boardNo, e.fk_boardKindNo, e.fk_commuMemberNo
                 , e.categoryNo, e.subject
                 , e.content, e.readCount, e.status, e.writerIp, e.price, e.fileName, e.orgFileName, e.fileSize
                 , to_char(e.regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate, to_char(e.editDate, 'yyyy-mm-dd hh24:mi:ss') as editDate
                 
                 , c.categoryName
                 
                 , m.commuMemberNo, m.fk_memberNo,  m.fk_levelNo, m.nickname, m.point
                 
                 , l.levelNo, l.levelName, l.levelPoint, l.levelImg
                 
                 , k.boardKindNo, k.boardTypeNo, k.boardName
                 
                 , nvl(g.upCount, 0) as upCount
                 
		    from tbl_board_etcmarket e join tbl_category c  
		    on e.categoryNo =  c.categoryNo
		    join tbl_commu_member m 
		    on e.fk_commuMemberNo = m.commuMemberNo
            join tbl_commu_member_level l
            on m.fk_levelNo = l.levelNo
            join tbl_boardkind k
            on e.fk_boardKindNo = k.boardKindNo 
            join tbl_board_good g
            on m.fk_memberNo = g.fk_memberNo
            left join (select fk_boardNo, count(*) as upCount
                    from tbl_board_bad
                    where fk_boardKindNo = 25
                    group by fk_boardNo
                ) g
            on  e.boardNo = g.fk_boardNo
		    where e.status >= 1
            
--            <if test='categoryNo != "" '>
--            and e.categoryNo = #{categoryNo}
--	        </if>
--		    <if test='searchWord != "" '>
--            and lower(${searchType}) like '%' || lower(#{searchWord}) || '%'
--	        </if>
		)T
where rno between 1 and 15
order by rno asc;

select * from tbl_board_etcmarket;


select fk_boardNo, count(*) as upCount
from tbl_board_good
where fk_boardKindNo = e.fk_boardKindNo and fk_boardNo = e.boardNo
group by fk_boardNo;

select * from tbl_board_etcmarket;

select e.boardNo, e.fk_boardKindNo, e.fk_commuMemberNo
	                 , e.categoryNo, e.subject, e.price
	                 , e.content, e.readCount, e.status, e.writerIp, e.fileName, e.orgFileName, e.fileSize
	                 , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate, to_char(editDate, 'yyyy-mm-dd hh24:mi:ss') as editDate
	                 
	                 , c.categoryName
	                 
	                 , m.commuMemberNo, m.fk_levelNo, m.nickname, m.point
	                 
	                 , l.levelNo, l.levelName, l.levelPoint, l.levelImg
	                 
	                 , k.boardKindNo, k.boardTypeNo, k.boardName
	                 
			    from tbl_board_etcmarket e join tbl_category c  
			    on e.categoryNo =  c.categoryNo
			    join tbl_commu_member m 
			    on e.fk_commuMemberNo = m.commuMemberNo
	            join tbl_commu_member_level l
	            on m.fk_levelNo = l.levelNo
	            join tbl_boardkind k
	            on e.fk_boardKindNo = k.boardKindNo
			    where e.status = 1 and boardNo = 5





select boardKindNo, boardTypeNo, boardName
		from tbl_boardkind
		where boardKindNo = 25;
        
        select categoryNo, fk_boardKindNo, categoryName
		from tbl_category
		where fk_boardKindNo = to_number('25');
        
        select count(*)
        from tbl_boardkind
        where boardKindNo = 2525;
        
        
        select * from tbl_commu_member;
        select * from tbl_commu_member_level;
        
insert into tbl_board_etcmarket(boardNo, fk_boardKindNo, fk_commuMemberNo, categoryNo, subject, regDate, content, readCount, status, writerIp, price, fileName, orgFileName, fileSize)
values(tbl_board_etcmarket_seq.nextval, ?, ?, ?, ?, default, ?, default, default, ?, ?, ?, ?, ?);

insert into tbl_board_etcmarket(boardNo, fk_boardKindNo, fk_commuMemberNo, categoryNo, subject, regDate, content, readCount, status, writerIp, price)
values(tbl_board_etcmarket_seq.nextval, ?, ?, ?, ?, default, ?, default, default, ?, ?);


update tbl_commu_member set point = point + to_number(#{point})
where commuMemberNo = #{fk_commuMemberNo}

select levelNo
from tbl_commu_member_level
where trunc(4000,-3)<= levelPoint and levelPoint <= 4000

update tbl_commu_member set fk_levelNo = #{levelNo}
where commuMemberNo = #{fk_commuMemberNo}

update tbl_commu_member set point = 3999
where commuMemberNo = 1;

update tbl_commu_member set fk_levelNo = 4
where commuMemberNo = 1;

commit;

select * from tbl_board_etcmarket order by 1 desc;
select * from tbl_commu_member;


update tbl_commu_member set point = 123121234
where commuMemberNo = 1;

update tbl_commu_member set fk_levelNo = 4
where commuMemberNo = 1;

commit;

select levelNo
from tbl_commu_member_level
where levelPoint <= #{point} and trunc( #{point} , -3) <= levelPoint


select rno, boardNo, fk_boardKindNo, fk_commuMemberNo, categoryNo, subject 
                 , content, readCount, status, writerIp, fileName, orgFileName, fileSize
                 , regDate, editDate, price
                 
                 , categoryName
                 
                 , commuMemberNo, fk_levelNo, nickname, point
                 
                 , levelNo, levelName, levelPoint, levelImg
                 
                 , boardKindNo, boardTypeNo, boardName
                 
		from 
			(
			    select row_number() over(order by e.status desc, boardNo desc)  as rno, e.boardNo, e.fk_boardKindNo, e.fk_commuMemberNo
	                 , e.categoryNo, e.subject, e.price
	                 , e.content, e.readCount, e.status, e.writerIp, e.fileName, e.orgFileName, e.fileSize
	                 , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate, to_char(editDate, 'yyyy-mm-dd hh24:mi:ss') as editDate
	                 
	                 , c.categoryName
	                 
	                 , m.commuMemberNo, m.fk_levelNo, m.nickname, m.point
	                 
	                 , l.levelNo, l.levelName, l.levelPoint, l.levelImg
	                 
	                 , k.boardKindNo, k.boardTypeNo, k.boardName
	                 
			    from tbl_board_etcmarket e join tbl_category c  
			    on e.categoryNo =  c.categoryNo
			    join tbl_commu_member m 
			    on e.fk_commuMemberNo = m.commuMemberNo
	            join tbl_commu_member_level l
	            on m.fk_levelNo = l.levelNo
	            join tbl_boardkind k
	            on e.fk_boardKindNo = k.boardKindNo
			    where e.status >= 1
--	            <if test='categoryNo != "" '>
--	            and e.categoryNo = #{categoryNo}
--		        </if>
--			    <if test='searchWord != "" '>
--	            and lower(${searchType}) like '%' || lower(#{searchWord}) || '%'
--		        </if>
			)T
		where rno between 16 and 30
		order by rno asc
        
        
        
        
        
        select e.boardNo, e.fk_boardKindNo, e.fk_commuMemberNo
	                 , e.categoryNo, e.subject, e.price
	                 , e.content, e.readCount, e.status, e.writerIp, e.fileName, e.orgFileName, e.fileSize
	                 , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate, to_char(editDate, 'yyyy-mm-dd hh24:mi:ss') as editDate
	                 
	                 , c.categoryName
	                 
	                 , m.commuMemberNo, m.fk_levelNo, m.nickname, m.point
	                 
	                 , l.levelNo, l.levelName, l.levelPoint, l.levelImg
	                 
	                 , k.boardKindNo, k.boardTypeNo, k.boardName
	                 
			    from tbl_board_etcmarket e join tbl_category c  
			    on e.categoryNo =  c.categoryNo
			    join tbl_commu_member m 
			    on e.fk_commuMemberNo = m.commuMemberNo
	            join tbl_commu_member_level l
	            on m.fk_levelNo = l.levelNo
	            join tbl_boardkind k
	            on e.fk_boardKindNo = k.boardKindNo
			    where e.status >= 1 and boardNo = 5;


select * from tbl_category;









-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select *
from tbl_board_etcmarket;

update tbl_board_etcmarket set categoryNo = #{categoryNo}, subject = #{subject}, editDate = syadate, content = #{content}, price = #{price}, fileName = #{fileName}, orgFileName = #{orgFileName}, fileSize = #{fileSize}
where boardNo = #{boardNo}

select * from tab;

commit;
select * from tbl_commu_member;
select * from tbl_board_good;
select * from tbl_board_bad;
select * from tbl_board_report
where fk_boardKindNo = 25 and fk_boardNo = 53;

delete from tbl_board_report
where fk_boardKindNo = 23;

delete from tbl_board_report
where fk_boardKindNo = 24;
delete from tbl_board_report
where fk_boardKindNo = 25;

commit;
select count(*)
from tbl_board_good
where fk_boardKindNo = #{boardKindNo} and fk_boardNo = #{boardNo};

select count(*)
		from tbl_board_report
		where fk_boardKindNo = 25 and fk_boardNo = 53;
        
        select * from tbl_member;
        
        update tbl_commu_member set nickname = '관리자(찐)'
        where commuMemberNo = 0;
        
        commit;
        
        select * from tbl_category;