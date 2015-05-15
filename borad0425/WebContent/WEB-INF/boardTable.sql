create table boardTable(
num number constraint boardTable_num_pk primary key,
writer varchar2(20) constraint boardTable_writer_nn not null,
cont varchar2(100),
edate date);
create sequence boardTable_seq
increment by 1
start with 1;