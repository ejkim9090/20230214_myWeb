DROP TABLE TEST_MEMBER CASCADE CONSTRAINTS;
CREATE TABLE TEST_MEMBER(
 ID CHAR(1),
 PASSWD VARCHAR2(15 BYTE) NOT NULL,
 NAME VARCHAR2(20 BYTE) NOT NULL,
 EMAIL VARCHAR2(30 BYTE),
 CONSTRAINT PK_MEMBER PRIMARY KEY (ID)
);
INSERT ALL
    INTO TEST_MEMBER VALUES('admin','admin', '관리자','admin@test.or.kr')
    INTO TEST_MEMBER VALUES('user11','pass11','사용자1','user11@test.or.kr')
    INTO TEST_MEMBER VALUES('user22','pass22','사용자2','user22@test.or.kr')
SELECT * FROM DUAL;
COMMIT;
DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE TABLE BOARD (
BOARD_NUM NUMBER, -- 게시글 번호
BOARD_TITLE VARCHAR2(50), -- 게시글 제목
BOARD_WRITER VARCHAR2(15), -- 게시글 작성자
BOARD_CONTENT VARCHAR2(2000), -- 게시글 내용
BOARD_ORIGINAL_FILENAME VARCHAR2(100), -- 업로드한 원래 파일명
BOARD_RENAME_FILENAME VARCHAR2(100), -- 바뀐 파일명
BOARD_DATE DATE DEFAULT SYSDATE,-- 게시글 올린 날짜
BOARD_LEVEL NUMBER DEFAULT 0,-- 글레벨 : 원글 0, 원글의 답글 1, 답글의 답글 2
BOARD_REF NUMBER, -- 원글일때는 자기번호, 답글일 때 참조하는 원글 번호
BOARD_REPLY_SEQ NUMBER DEFAULT 0, -- 답글의 순번
BOARD_READCOUNT NUMBER DEFAULT 0, -- 조회수
CONSTRAINT PK_BOARD PRIMARY KEY (BOARD_NUM),
CONSTRAINT FK_BOARD_WRITER FOREIGN KEY (BOARD_WRITER) REFERENCES TEST_MEMBER (ID) ON DELETE SET NULL,
CONSTRAINT FK_BOARD_REF FOREIGN KEY (BOARD_REF) REFERENCES BOARD (BOARD_NUM) ON DELETE CASCADE
);


-- insert 문 3개 정도 확인
-- 원글
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'a','user11','aa',     null, null, default, DEFAULT, (select NVL(MAX(BOARD_NUM), 0)+1 from board), DEFAULT,        DEFAULT);
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'b','user11','bb',     null, null, default, DEFAULT, (select NVL(MAX(BOARD_NUM), 0)+1 from board), DEFAULT,        DEFAULT);
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'c','user11','cc',     null, null, default, DEFAULT, (select NVL(MAX(BOARD_NUM), 0)+1 from board), DEFAULT,        DEFAULT);
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'&title','user11','&content',     null, null, default, DEFAULT, (select NVL(MAX(BOARD_NUM), 0)+1 from board), DEFAULT,DEFAULT);
-- 답글 (원글 2)
update board set  BOARD_REPLY_SEQ = BOARD_REPLY_SEQ+1 
    where board_reply_seq > (select board_reply_seq from board where board_num = 2)
        and BOARD_REF = (select BOARD_REF from board where board_num = 2)
;
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'2답','user11','2답',     null, null, default,   
    (select board_level+1 from board where board_num=2), 
    (select BOARD_REF from board where board_num = 2), 
    (select BOARD_REPLY_SEQ+1 from board where board_num=2),        DEFAULT);
-- 답글 (글 6)
update board set  BOARD_REPLY_SEQ = BOARD_REPLY_SEQ+1 
    where board_reply_seq > (select board_reply_seq from board where board_num = 6)
        and BOARD_REF = (select BOARD_REF from board where board_num = 6)
;
insert into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'6답','user11','6답',     null, null, default,   
    (select board_level+1 from board where board_num=6), 
    (select BOARD_REF from board where board_num = 6), 
    (select BOARD_REPLY_SEQ+1 from board where board_num=6),        DEFAULT);
-- 답글 (&)
update (select BOARD_REPLY_SEQ from board where board_ref = 6) 
        set  BOARD_REPLY_SEQ = BOARD_REPLY_SEQ+1 
    where board_reply_seq > (select board_reply_seq from board where board_num = 6)
;
insert all into board values((select NVL(MAX(BOARD_NUM), 0)+1 from board),'6답','user11','6답',     null, null, default,   
    blevel,     bref,     bseq,        DEFAULT)
    select board_level+1 blevel, board_ref bref, board_reply_seq+1 bseq from board where board_num=6;
select * from board;
select * from board
    order by board_ref desc, board_reply_seq asc;
select to_char(board_date, 'yyyy-mm-dd hh24:mi:ss') from board
    order by board_ref desc, board_reply_seq asc;

(select board_level+1 from board where board_num=2);
(select BOARD_REPLY_SEQ+1 from board where board_num=2);
(select board_level+1 from board where board_num=6);
(select BOARD_REPLY_SEQ+1 from board where board_num=6);



-- 과제
--페이징처리중이다. 3번째글-7번째글까지 나타내주세요.
select *
    from  (select rownum rn, tbl_1.*  
        from      (select rownum xn, BOARD_NUM,BOARD_TITLE, BOARD_WRITER, BOARD_CONTENT 
                            , BOARD_ORIGINAL_FILENAME, BOARD_RENAME_FILENAME,BOARD_DATE 
                            , BOARD_LEVEL, BOARD_REF, BOARD_REPLY_SEQ,BOARD_READCOUNT 
                from board 
                order by board_ref desc, board_reply_seq asc) tbl_1
    ) tbl_2
    where rn between 3 and 7
;

delete from board where board_num=3;
commit;



select * from board
    order by board_ref desc, board_reply_seq asc;

desc board;

select count(*) cnt from board
;

-- select 문도 화면설계서 대로 잘 나오는지 확인
--6- select  
--1-    from  
--2-        join  on/using
--3-    where 
--4-    group by
--5-    having
--7-    order by
--;




































INSERT INTO TEST_MEMBER VALUES('user3','user3', '사용자3','user3@test.or.kr');
select * from test_member;
commit;
INSERT INTO TEST_MEMBER VALUES('user4','user4', '사용자4','user4@test.or.kr');
select * from test_member;
--잠시대기. 아래 명령어는 sql plus에서 실행함
INSERT INTO TEST_MEMBER VALUES('user5','user5', '사용자5','user5@test.or.kr');
commit;
select * from test_member;
---
delete from test_member where id='user5';
update test_member set name='kh' where id='user5';
commit;

-- 로그인 성공여부만 알아오기
select count(*) from test_member where id='user3' and passwd='user2';
-- 로그인한 계정 정보도 알아오기
select id, name, email from test_member where id='user3' and passwd='user3';

select passwd from test_member where id='user3';
select count(*) cnt from test_member where id= 'a' id and passwd= 'a'
;

desc Test_Member;
SELECT * FROM Test_Member;

