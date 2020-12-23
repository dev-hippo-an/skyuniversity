show user;

select * from tab;

select * from tbl_member;

desc tbl_member;

memberno, pwd, name, mobile, email, birth, jubun, engname, chinaname, grade, enterday, graduateday, absencecnt, , fk_regseq, fk_deptseq, address, detailaddress, extraaddress, img, graduateok, currentsemester

select count(*)
from tbl_member
where memberno='108' and pwd='245976f7bf72702514cd146d10f8b342d7ef30045822fa2c411f62f29e133326';

create table tbl_certificatekind (
certificateno        NUMBER not null
, certificatename       varchar2(50) not null
, charge            number default 0 not null
, constraint PK_ tbl_certificatekind_no primary key(certificateno)
);


