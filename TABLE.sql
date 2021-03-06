PROMPT MMS PROJECT DATA initializing....

SET FEEDBACK OFF --결과 행수 조회 OFF

SET DEFINE OFF --특수문자 입력 가능



-- 테이블 초기화

DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

DROP TABLE DOCTOR CASCADE CONSTRAINTS;

DROP TABLE PATIENT CASCADE CONSTRAINTS;

DROP TABLE APPOINTMENT CASCADE CONSTRAINTS;



--시퀀스 초기화

DROP SEQUENCE DOC_R1_SEQ;

DROP SEQUENCE DOC_R2_SEQ;

DROP SEQUENCE DOC_R3_SEQ;

DROP SEQUENCE DOC_R4_SEQ;

DROP SEQUENCE DOC_R5_SEQ;

DROP SEQUENCE DOC_R6_SEQ;

DROP SEQUENCE DOC_R7_SEQ;

DROP SEQUENCE DOC_R8_SEQ;

DROP SEQUENCE DOC_R9_SEQ;

DROP SEQUENCE DOC_R10_SEQ;

DROP SEQUENCE DOC_SEQ;

DROP SEQUENCE PAT_SEQ;

DROP SEQUENCE APP_SEQ;







PROMPT CREATING DEPARTMENT...

--------------------------------------------------------------------------------

CREATE TABLE DEPARTMENT(

  DEPT_NO VARCHAR2(10) PRIMARY KEY,

  DEPT_NAME VARCHAR2(30) NOT NULL

);



COMMENT ON COLUMN DEPARTMENT.DEPT_NO IS '과 번호';

COMMENT ON COLUMN DEPARTMENT.DEPT_NAME IS '과 이름';







PROMPT CREATING DOCTOR ...

--------------------------------------------------------------------------------

CREATE TABLE DOCTOR(

  DOC_NO VARCHAR2(20) PRIMARY KEY,

  DOC_NAME VARCHAR2(20) NOT NULL,

  DOC_ROOM NUMBER NOT NULL,

  DEPT_NO VARCHAR2(10) NOT NULL -- FK

);



ALTER TABLE DOCTOR

ADD CONSTRAINT DOC_DEPT_FK FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);



COMMENT ON COLUMN DOCTOR.DOC_NO IS '의사 번호';

COMMENT ON COLUMN DOCTOR.DOC_NAME IS '의사 이름';

COMMENT ON COLUMN DOCTOR.DOC_ROOM IS '진료실 번호';

COMMENT ON COLUMN DOCTOR.DEPT_NO IS '과 번호';







PROMPT CREATING PATIENT ...

--------------------------------------------------------------------------------

CREATE TABLE PATIENT(

  PAT_NO VARCHAR2(20) PRIMARY KEY,

  PAT_ID VARCHAR2(20) NOT NULL UNIQUE,

  PAT_PW VARCHAR2(20) NOT NULL,

  PAT_NAME VARCHAR2(10) NOT NULL,

  PAT_PHONE VARCHAR2(30) NOT NULL UNIQUE,

  PAT_SSN VARCHAR2(14) NOT NULL UNIQUE,

  PAT_EMAIL VARCHAR2(40),

  PAT_ADDRESS VARCHAR2(255) NOT NULL

);



COMMENT ON COLUMN PATIENT.PAT_NO IS '회원 번호';

COMMENT ON COLUMN PATIENT.PAT_ID IS '아이디';

COMMENT ON COLUMN PATIENT.PAT_PW IS '비밀번호';

COMMENT ON COLUMN PATIENT.PAT_NAME IS '회원 이름';

COMMENT ON COLUMN PATIENT.PAT_PHONE IS '전화번호';

COMMENT ON COLUMN PATIENT.PAT_SSN IS '주민등록번호';

COMMENT ON COLUMN PATIENT.PAT_EMAIL IS '이메일';

COMMENT ON COLUMN PATIENT.PAT_ADDRESS IS '주소';





COMMIT;

PROMPT CREATING APPOINTMENT...

--------------------------------------------------------------------------------

CREATE TABLE APPOINTMENT(

  APP_NO VARCHAR2(20) PRIMARY KEY,

  APP_DATE DATE NOT NULL,

  PAT_NO VARCHAR2(20) NOT NULL, --FK

  APP_FIRST CHAR(1) NOT NULL,

  DOC_NO VARCHAR2(20) NOT NULL, --FK

  DEPT_NO VARCHAR2(10) NOT NULL, --FK

  APP_MEMO VARCHAR2(300)

);



ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_PAT_FK FOREIGN KEY (PAT_NO) REFERENCES PATIENT(PAT_NO)

ON DELETE CASCADE;

ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_DOC_FK FOREIGN KEY (DOC_NO) REFERENCES DOCTOR(DOC_NO);

ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_DEPT_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);



COMMENT ON COLUMN APPOINTMENT.APP_NO IS '예약 번호';

COMMENT ON COLUMN APPOINTMENT.APP_DATE IS '예약 날짜';

COMMENT ON COLUMN APPOINTMENT.APP_MEMO IS '증상';

COMMENT ON COLUMN APPOINTMENT.PAT_NO IS '회원 번호';

COMMENT ON COLUMN APPOINTMENT.APP_FIRST IS '초진 여부';

COMMENT ON COLUMN APPOINTMENT.DOC_NO IS '담당의사 번호';

COMMENT ON COLUMN APPOINTMENT.DEPT_NO IS '과 번호';









COMMIT;

PROMPT LOADING DEPARTMENT ...

--------------------------------------------------------------------------------

INSERT INTO DEPARTMENT VALUES('M01','내과');

INSERT INTO DEPARTMENT VALUES('M02','외과');

INSERT INTO DEPARTMENT VALUES('M03','산부인과');

INSERT INTO DEPARTMENT VALUES('M04','성형외과');

INSERT INTO DEPARTMENT VALUES('M05','안과');

INSERT INTO DEPARTMENT VALUES('M06','정형외과');

INSERT INTO DEPARTMENT VALUES('M07','피부과');

INSERT INTO DEPARTMENT VALUES('M08','흉부외과');

INSERT INTO DEPARTMENT VALUES('M09','이비인후과');

INSERT INTO DEPARTMENT VALUES('M10','정신건강의학과');



COMMIT;

PROMPT LOADING DOCTOR ....

--------------------------------------------------------------------------------

-- 의사 50명

CREATE SEQUENCE DOC_SEQ -- DOC_NO SUQUENCE

START WITH 1

NOCYCLE

NOCACHE;





CREATE SEQUENCE DOC_R1_SEQ -- DOC_ROOM 내과 SEQUENCE

START WITH 101 MAXVALUE 199 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R2_SEQ -- DOC_ROOM 외과 SEQUENCE

START WITH 201 MAXVALUE 299 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R3_SEQ -- DOC_ROOM 산부인과 SEQUENCE

START WITH 301 MAXVALUE 399 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R4_SEQ -- DOC_ROOM 성형외과 SEQUENCE

START WITH 401 MAXVALUE 499 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R5_SEQ -- DOC_ROOM 안과 SEQUENCE

START WITH 501 MAXVALUE 599 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R6_SEQ -- DOC_ROOM 정형외과 SEQUENCE

START WITH 601 MAXVALUE 699 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R7_SEQ -- DOC_ROOM 피부과 SEQUENCE

START WITH 701 MAXVALUE 799 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R8_SEQ -- DOC_ROOM 흉부외과 SEQUENCE

START WITH 801 MAXVALUE 899 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R9_SEQ -- DOC_ROOM 이비인후과 SEQUENCE

START WITH 901 MAXVALUE 999 NOCYCLE NOCACHE;

CREATE SEQUENCE DOC_R10_SEQ -- DOC_ROOM 정신건강의학과 SEQUENCE

START WITH 1001 MAXVALUE 1099 NOCYCLE NOCACHE;





INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '한선기', DOC_R1_SEQ.NEXTVAL, 'M01');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '강중훈', DOC_R1_SEQ.NEXTVAL, 'M01');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '최만식', DOC_R1_SEQ.NEXTVAL, 'M01');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '정도연', DOC_R1_SEQ.NEXTVAL, 'M01');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '안석규', DOC_R1_SEQ.NEXTVAL, 'M01');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '성해교', DOC_R2_SEQ.NEXTVAL, 'M02');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '전우성', DOC_R2_SEQ.NEXTVAL, 'M02');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '엄정하', DOC_R2_SEQ.NEXTVAL, 'M02');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '심하균', DOC_R2_SEQ.NEXTVAL, 'M02');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '고승우', DOC_R2_SEQ.NEXTVAL, 'M02');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이중기', DOC_R3_SEQ.NEXTVAL, 'M03');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '감우섭', DOC_R3_SEQ.NEXTVAL, 'M03');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이태정', DOC_R3_SEQ.NEXTVAL, 'M03');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '안선기', DOC_R3_SEQ.NEXTVAL, 'M03');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김민종', DOC_R3_SEQ.NEXTVAL, 'M03');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '유재석', DOC_R4_SEQ.NEXTVAL, 'M04');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김은영', DOC_R4_SEQ.NEXTVAL, 'M04');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '윤성애', DOC_R4_SEQ.NEXTVAL, 'M04');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '신지원', DOC_R4_SEQ.NEXTVAL, 'M04');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '유정화', DOC_R4_SEQ.NEXTVAL, 'M04');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이서연', DOC_R5_SEQ.NEXTVAL, 'M05');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '은상연', DOC_R5_SEQ.NEXTVAL, 'M05');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '안상건', DOC_R5_SEQ.NEXTVAL, 'M05');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김성룡', DOC_R5_SEQ.NEXTVAL, 'M05');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이종진', DOC_R5_SEQ.NEXTVAL, 'M05');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '송성묵', DOC_R6_SEQ.NEXTVAL, 'M06');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박영선', DOC_R6_SEQ.NEXTVAL, 'M06');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김진서', DOC_R6_SEQ.NEXTVAL, 'M06');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박민준', DOC_R6_SEQ.NEXTVAL, 'M06');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박정훈', DOC_R6_SEQ.NEXTVAL, 'M06');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '최윤선', DOC_R7_SEQ.NEXTVAL, 'M07');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '홍유정', DOC_R7_SEQ.NEXTVAL, 'M07');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이하은', DOC_R7_SEQ.NEXTVAL, 'M07');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박원우', DOC_R7_SEQ.NEXTVAL, 'M07');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이준서', DOC_R7_SEQ.NEXTVAL, 'M07');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '유선화', DOC_R8_SEQ.NEXTVAL, 'M08');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '정동수', DOC_R8_SEQ.NEXTVAL, 'M08');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '주원호', DOC_R8_SEQ.NEXTVAL, 'M08');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '이영숙', DOC_R8_SEQ.NEXTVAL, 'M08');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김혜진', DOC_R8_SEQ.NEXTVAL, 'M08');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김영우', DOC_R9_SEQ.NEXTVAL, 'M09');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '공지후', DOC_R9_SEQ.NEXTVAL, 'M09');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박정웅', DOC_R9_SEQ.NEXTVAL, 'M09');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김정필', DOC_R9_SEQ.NEXTVAL, 'M09');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박지예', DOC_R9_SEQ.NEXTVAL, 'M09');



INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박민기', DOC_R10_SEQ.NEXTVAL, 'M10');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '양성철', DOC_R10_SEQ.NEXTVAL, 'M10');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '박종후', DOC_R10_SEQ.NEXTVAL, 'M10');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '김종수', DOC_R10_SEQ.NEXTVAL, 'M10');

INSERT INTO DOCTOR VALUES('D' || LPAD(DOC_SEQ.NEXTVAL, 2, '0'), '심민기', DOC_R10_SEQ.NEXTVAL, 'M10');





COMMIT;

PROMPT LOADING PATIENT...

--------------------------------------------------------------------------------

-- 환자 100

-- PAT_NO SUQUENCE

CREATE SEQUENCE PAT_SEQ 

START WITH 1

NOCYCLE

NOCACHE;



INSERT INTO PATIENT

VALUES 

('P000', 'mms', 'mms', '관리자', '010-9101-2211', '800914-1722006', 'admin@mms.com', '서울특별시 강남구 역삼동');

INSERT INTO PATIENT

VALUES 

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jjh1421', 'jh121212', '조재형', '010-2316-1121', '720114-1724266', 'jj@naver.com', '서울특별시 강남구 역삼동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jh31', 'jjh1004', '정지현', '010-1425-1001', '821110-1647215', 'jh31@naver.com', '대구광역시 동구 신암동');    

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'yesu1234', 'yesu1', '김예수', '010-1124-5511', '910114-2014121', 'jjh@gmail.com', '서울특별시 강서구 내발산동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'nasw', 'nsw1004', '나승원', '010-2384-2153', '730416-1724266', 'jjh@nate.com', '인천광역시 남구 숭의동');

INSERT INTO PATIENT

VALUES 

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sekim', 'sooneeeee', '김순이', '010-9412-9381', '660812-2047413', 'soonee@gmail.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hail', 'hihihi', '박하일', '010-2419-8341', '420803-1040743', 'hipark@gmail.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'shkwon', 'shshsh11', '권상후', '010-2253-1921', '831117-1104825', 'shkwon@nate.com', '서울특별시 강서구 등촌동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'yalim', 'yayaya1234', '임영애', '010-9341-0078', '570414-2510121', 'young00@nate.com', '서울특별시 양천구 목동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jhyeom', 'jhjh1234', '염정하', '010-4112-9304', '891124-2011034', 'jhy111@naver.com', '대전광역시 서구 복수동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sool5', 'sososo55', '김술오', '010-2120-9101', '680114-1011824', 'sokim@daum.net', '서울특별시 용산구 후암동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'tsy1123', 'tststs1', '윤태서', '010-1410-0012', '010701-4011483', 'tsyoon11@naver.com', '서울특별시 여의도구 여의도동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'ynkim', 'ynk1000', '김연아', '010-8246-0912', '940812-2047413', 'yunakim@gmail.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hnna1234', 'hnna123', '나화남', '010-5289-7345', '360812-1728152', 'hnna1234@gmail.com', '경기도 성남시 수정구');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sylee123133', 'styee', '이선용', '010-1836-9745', '670119-1001415', 'sylee0@nate.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hkkim1', 'hkhk12313', '김화경', '010-8249-0760', '700125-2017523', 'hkk1111@gmail.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jmp123', 'jmjm111', '박지민', '010-1425-8522', '780812-2040124', 'jmp1234@gmail.com', '서울특별시 서초구 방배동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hkdong', 'hkd14', '홍길동', '010-4231-1020', '480130-1001214', 'hkd140@daum.net', '경기도 성남시 중원구');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hwkim', 'hwkim101', '김현월', '010-4120-9411', '690827-2042123', 'hwkim111@gmail.com', '경기도 성남시 수정구');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jjh1400', 'jjheeee', '전지현', '010-8245-9877', '670810-2040133', 'jjh1004@naver.com', '경기도 남양주시 평내동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'seongwan', 'swp1110', '박성완', '010-3112-5522', '030117-3047213', 'swpart1234@gmail.com', '경기도 고양시 일산동구');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'gschoi964', 'cgs9064', '최광석', '010-3001-5001', '900604-1923472', 'gschoi9064@gmail.com', '경기도 남양주시 호평동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jihojiho2', 'jhoo200', '김지호', '010-2292-1005', '960428-1522412', 'jihojiho2000@gmail.com', '경기도 남양주시 다산2동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jjchoi46', 'jj46', '최재정', '010-4865-5991', '930406-1023043', 'jjchoi46@gmail.com', '경기도 남양주시 금곡동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'onami', 'onam66', '오남이', '010-9091-7801', '921206-2643327', 'onami@gmail.com', '경기도 남양주시 일패동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jinhee35', 'leejh135', '이진희', '010-8723-1642', '950305-2222472', 'jinheeya@gmail.com', '경기도 남양주시 양정동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jihunyu74', 'yuyuyu7402', '유지훈', '010-1023-1022', '740902-1123176', 'yuyuyu7402@gmail.com', '경기도 남양주시 와부읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'seohyun312', 'shoh213', '오서현', '010-5943-3029', '010101-4232191', 'gschoi9064@gmail.com', '경기도 남양주시 진전읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jimins', 'jimins342', '박지민', '010-2019-2972', '981111-2114122', 'jimins9811@gmail.com', '경기도 남양주시 화도읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jiwoohime', 'jwl3223', '이지우', '010-1122-6722', '020924-4111247', 'jiwoohime402@gmail.com', '경기도 남양주시 퇴계원면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'syysong', 'yysong94', '송서윤', '010-2020-5638', '990229-2001192', 'songsong9292@gmail.com', '경기도 남양주시 별내동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hjun686', 'hjyu686', '유현준', '010-6809-6018', '880316-1994393', 'hjun819@gmail.com', '경기도 남양주시 도농동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'parksj67', 'sjarpk67', '박성준', '010-1123-0087', '791107-1036472', 'parksj@gmail.com', '경기도 남양주시 진건읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'yunu54', 'yunujini54', '윤우진', '010-2031-1772', '741013-2190883', 'yunujuni74@gmail.com', '경기도 남양주시 지금동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hyundo15', 'hyunwoodo15', '도현우', '010-2881-2020', '960921-1569372', 'hyunwoo95@gmail.com', '경기도 남양주시 오남읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'yuyejun', 'yyej25', '유예준', '010-2893-6721', '890520-1773433', 'yuyejun89@gmail.com', '경기도 남양주시 다산1동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'wjmin11', 'minjw43', '민지원', '010-1012-2030', '961212-2433611', 'mjwon1012@gmail.com', '경기도 구리시 갈매동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'seokgi', 'seokgi63', '신석기', '010-1920-6723', '700502-1023442', 'shinseok94@gmail.com', '경기도 구리시 사노동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sujune123', 'sujune2s', '김수준', '010-7422-2032', '981205-1422272', 'sujune72@gmail.com', '경기도 구리시 인창동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'armani', 'shoot1212', '김효진', '010-1003-5001', '850124-2920702', 'armani1212@gmail.com', '경기도 구리시 교문동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'yunamsang', 'sjew1223', '임준영', '010-9882-5067', '960628-1233472', 'yunamsang1223@gmail.com', '경기도 구리시 수택동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'kincidar', 'kinyu893', '성주안', '010-9000-1223', '961122-2832343', 'kincidar5773@gmail.com', '경기도 구리시 아천동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hololulu', 'alpaka3992', '차지원', '010-2012-1882', '940214-2998876', 'hololulu@gmail.com', '경기도 구리시 토평동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'shootingstar', 'imstar76', '임준영', '010-2830-3021', '821225-1003421', 'shiningstar@gmail.com', '경기도 구리시 동구동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'gugucon', 'ghost8823', '김지호', '010-2342-7766', '890812-1300873', 'gugucon1231@gmail.com', '경기도 구리시 교문1동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'kyochon', 'nenechick123', '이진우', '010-6733-0101', '840507-1113411', 'kyochon3001@gmail.com', '경기도 구리시 수택2동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jupazip', 'btear882', '한원우', '010-2331-6723', '910224-1113327', 'baeyale123@gmail.com', '경기도 하남시 배알미동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sinagong', 'howe122', '송한결', '010-8837-0166', '041201-4113466', 'sunsinag123@gmail.com', '경기도 하남시 선동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'boramsangjo', 'greoso123', '박다함', '010-7272-7777', '780418-2441477', 'daham78@gmail.com', '경기도 하남시 초일동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'daewang', 'sdwfkw882', '이지원', '010-9292-1717', '910713-2271070', 'daewang@gmail.com', '경기도 하남시 당정동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'collaboration77', 'cjdewf234', '유선기', '010-2342-0200', '800921-1234979', 'collabo992@gmail.com', '경기도 하남시 미사동');

INSERT INTO PATIENT

VALUES 

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'chuchu', 'chuta523', '추자현', '010-3012-1121', '751018-2024444', 'chuchugg@naver.com', '경기도 파주시 금촌동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'homerun', 'combackhome32', '이대호', '010-2832-5831', '800122-1648877', 'homerun12@naver.com', '경기도 파주시 아동동');    

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'toratora', 'toos342', '서장훈', '010-3443-2925', '810710-1082121', 'toratora@gmail.com', '경기도 파주시 야동동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'prepera43', 'nasung82', '나문희', '010-2302-3292', '691204-2334263', 'nnapre234@nate.com', '경기도 파주시 검산동');

INSERT INTO PATIENT

VALUES 

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'honghong', 'shinna992', '홍진영', '010-8762-2032', '860820-2065613', 'lalala@gmail.com', '경기도 파주시 맥금동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'bingrae', 'icecream452', '김샛별', '010-1133-4993', '761003-2022740', 'hipassion@gmail.com', '경기도 파주시 교하동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'iconic33', 'alal234', '박서준', '010-2003-4321', '871006-1007625', 'parkjjun@nate.com', '경기도 파주시 야당동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sareka', 'ajlksdfow141', '이사랑', '010-7661-7823', '800316-2501101', 'lovelove123@nate.com', '경기도 파주시 다율동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'narear132', 'jisie234', '박나래', '010-2019-9304', '941024-2881034', 'jhy332@naver.com', '경기도 파주시 오도동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'slel234', 'coske234', '박승희', '010-2802-9101', '890617-2012324', 'shpark1234@daum.net', '경기도 파주시 상지석동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'victory53', 'voos234', '이승기', '010-8821-0034', '030602-3023483', 'ssgkle@naver.com', '경기도 파주시 산남동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'shongie', 'ajklasf123', '현송월', '010-9399-2002', '900212-2239993', 'songwhoe@gmail.com', '경기도 파주시 동패동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'backerow124', 'jsooe234', '백지영', '010-3002-2932', '601210-2334253', 'bakke1234@gmail.com', '경기도 파주시 당하동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'nanda144', 'sjoefsf234', '유난희', '010-9009-9749', '802319-2901416', 'nakkf2230@nate.com', '경기도 파주시 문발동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'bangtan234', 'sooser234', '유정국', '010-8821-9922', '881205-1014524', 'ajjfe2523@gmail.com', '경기도 파주시 송촌동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'out12532', 'cokjjse253', '박병호', '010-9932-2284', '770812-1040121', 'osufj234@gmail.com', '경기도 파주시 목동동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jaosllwe234', 'sjjfsgg23', '정진철', '010-2832-2943', '960528-1002141', 'akajsfwe14@daum.net', '경기도 파주시 하지석동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'josjls42', 'joses32', '이채원', '010-1992-2095', '800712-2141112', 'sokkcle1414@gmail.com', '경기도 파주시 서패동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'leesiocje134', 'oosce24', '이숭윤', '010-9342-1888', '690408-1023103', 'syuet3234@naver.com', '경기도 파주시 신촌동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'dayoum14', 'sijjel243', '김대엽', '010-3000-3000', '030820-3017013', 'swpart1234@gmail.com', '경기도 파주시 연다산동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'sunengs25', 'jcjsle153', '주성욱', '010-7283-6672', '900604-1123979', 'aafgwe25@gmail.com', '경기도 파주시 와동동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'choigg234', 'hoence125', '최성일', '010-6731-0023', '900621-1521111', 'sunggood1123@gmail.com', '경기도 파주시 금릉동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'mysun1234', 'redsun9923', '전태양', '010-3992-8811', '950116-1029123', 'redsun123@gmail.com', '경기도 파주시 문산읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'dollyu123', 'ohmygod145', '이동녕', '010-2341-8231', '921002-1233327', 'isyuyu123@gmail.com', '경기도 파주시 파주읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jinsooe67', 'hwang231', '황강호', '010-7727-1123', '890210-1722470', 'goat2523@gmail.com', '경기도 파주시 법원읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'songtoyou', 'lsong234', '송병구', '010-9923-6627', '720620-1177176', 'yanolja@gmail.com', '경기도 파주시 조리읍');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'dominopizza', 'tasty1234', '김도우', '010-2019-9342', '010915-3112391', 'dowman124@gmail.com', '경기도 파주시 월롱면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hansole', 'sjosoef234', '박한솔', '010-3009-2992', '981111-1222222', 'solehan4234@gmail.com', '경기도 파주시 탄현면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'ghostman234', 'osi7234', '박령우', '010-1192-2302', '020324-3122147', 'jasmin123@gmail.com', '경기도 파주시 광탄면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jasminflower', 'flavor234', '어윤수', '010-8761-0231', '920124-1009888', 'yoman1234@gmail.com', '경기도 파주시 파평면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jogila', 'jose29923', '조성주', '010-0921-2318', '900221-1432393', 'yojo123@gmail.com', '경기도 파주시 적성면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'bunglusse34', 'genuousr234', '이병렬', '010-8888-1111', '701106-1011721', 'joke1417@gmail.com', '경기도 파주시 군내면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'giyong76', 'uskjfl2353', '김기용', '010-9821-2341', '781213-1900083', 'giyoung124@gmail.com', '경기도 파주시 진동면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'hansdelli', 'hanseman144', '한이석', '010-2020-9090', '910712-1666362', 'hanseman87@gmail.com', '경기도 파주시 진서면');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'jjakji', 'silk235', '조지현', '010-1090-1294', '800520-1773437', 'jjackji14@gmail.com', '경기도 파주시 금촌3동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'champion14', 'minho235', '이영호', '010-6614-3092', '880211-1334619', 'minwon235@gmail.com', '경기도 파주시 운정1동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'minwon24', 'gov24', '조연주', '010-1820-0102', '780502-2061442', 'shinsaegae@gmail.com', '경기도 광주시 경안동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'duolock', 'leejuhee22', '이주희', '010-4422-2032', '971104-2099272', 'duolock@gmail.com', '경기도 광주시 쌍렬동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'finally12', 'youcandoit123', '서현숙', '010-6113-6331', '830521-2923702', 'armani1212@gmail.com', '경기도 광주시 송정동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'samyang', 'ramen882', '안지현', '010-7362-9221', '900621-2200402', 'nuguri@gmail.com', '경기도 광주시 회덕동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'deette', 'espresso123', '신수인', '010-6000-5161', '970405-2802300', 'dalcomcoffee@gmail.com', '경기도 광주시 탄별동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'starbugs', 'expensive99', '김한나', '010-6664-9772', '920512-2998876', 'blackhoke@gmail.com', '경기도 광주시 목현동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'twosome', 'placeto234', '이하은', '010-1288-8230', '800812-2014218', 'orangejuice@gmail.com', '경기도 광주시 삼동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'goldbird', 'goldtime66', '김연정', '010-1982-3921', '900816-2000999', 'goldbird135@gmail.com', '경기도 광주시 중대동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'deepfog', 'grayfog124', '조아련', '010-5812-0007', '880807-2112311', 'deppfong123@gmail.com', '경기도 광주시 직동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'juilan', 'venusy982', '김은빈', '010-7761-9872', '800220-2133907', 'rallicate15@gmail.com', '경기도 광주시 태전동');

INSERT INTO PATIENT

VALUES

('P' || LPAD(PAT_SEQ.NEXTVAL, 3, '0'), 'railcat235', 'hospitail883', '김승현', '010-3002-1001', '900801-1660077', 'bigtent9090@gmail.com', '경기도 광주시 남한산성면');







COMMIT;

PROMPT LOADING APPOINTMENT ...

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 예약 120

CREATE SEQUENCE APP_SEQ

START WITH 10001

NOCYCLE NOCACHE;



--입력중......





--18-06-01

--내과

INSERT INTO APPOINTMENT (APP_NO, APP_DATE, PAT_NO, APP_FIRST, DOC_NO, DEPT_NO, APP_MEMO)

VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P001', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '구토');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P002', 'Y', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P003', 'Y', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '복통');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P010', 'Y', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '타박상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P011', 'Y', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '');





--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P020', 'Y', 'D17', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D17'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P030', 'Y', 'D21', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D21'), '눈시림');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P031', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P040', 'Y', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '물리치료');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P050', 'Y', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '가려움증');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P051', 'Y', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '피부병');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P060', 'N', 'D37', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D37'), '이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P061', 'Y', 'D36', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D36'), '심장질환');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P062', 'N', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '이원');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P070', 'Y', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '우울증');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P071', 'Y', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-01 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P072', 'N', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '신경질환');

                                                                  



--18-06-04

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P003', 'Y', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '복통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P005', 'Y', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '감기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P004', 'Y', 'D05', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D05'), '속쓰림');



--외과

--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P022', 'N', 'D15', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D15'), '이원');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P032', 'N', 'D23', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D23'), '빛번짐');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P033', 'Y', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P042', 'N', 'D27', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D27'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P052', 'Y', 'D32', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D32'), '두드러기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P053', 'Y', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '알레르기');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P062', 'N', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '이원');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-04 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P072', 'N', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '신경질환');





--18-06-05

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P006', 'Y', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P012', 'N', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '자상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P023', 'Y', 'D14', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D14'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P034', 'Y', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P043', 'Y', 'D29', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D29'), '디스크');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P054', 'Y', 'D33', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D33'), '');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P063', 'Y', 'D44', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D44'), '이물질');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-05 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P073', 'Y', 'D49', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D49'), '치매');





--18-06-07

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P002', 'N', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P007', 'Y', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P013', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P014', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P024', 'Y', 'D11', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D11'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P025', 'Y', 'D18', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D18'), '흉터제거');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P026', 'Y', 'D13', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D13'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P035', 'Y', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P036', 'N', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P037', 'Y', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P044', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '요통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P045', 'Y', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '어깨 결림');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P055', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '알레르기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P056', 'N', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '가려움증, 이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P057', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P064', 'Y', 'D41', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D41'), '이명');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P065', 'Y', 'D38', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D38'), '결핵');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-07 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P074', 'Y', 'D50', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D50'), '');











--18-06-08

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P008', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P009', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P015', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P016', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P027', 'Y', 'D19', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D19'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P028', 'Y', 'D12', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D12'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P038', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '안구 건조');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P039', 'Y', 'D21', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D21'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P046', 'N', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P047', 'Y', 'D27', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D27'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P058', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P059', 'Y', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '');

                                                                  

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P066', 'Y', 'D43', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D43'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P067', 'Y', 'D39', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D39'), '');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P075', 'Y', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-08 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P076', 'N', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '우울증');



--18-06-11

--내과

--외과                     

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P017', 'Y', 'D09', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D09'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P018', 'Y', 'D10', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D10'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P019', 'Y', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '타박상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P029', 'Y', 'D20', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D20'), '');

                                                                                                                                 

--안과

--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P048', 'Y', 'D28', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D28'), '손목 통증');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P049', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '');



--피부과

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P068', 'Y', 'D42', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D42'), '비염');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P069', 'Y', 'D40', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D40'), '비염');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P077', 'Y', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '심리 상담');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P078', 'Y', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-11 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P079', 'Y', 'D50', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D50'), '무기력증');



--18-06-12

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P080', 'Y', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P081', 'Y', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '복통');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P082', 'Y', 'D09', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D09'), '타박상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P083', 'Y', 'D09', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D09'), '');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P030', 'Y', 'D17', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D17'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P090', 'Y', 'D11', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D11'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P092', 'N', 'D23', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D23'), '빛번짐');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P093', 'Y', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P040', 'N', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '물리치료');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P041', 'N', 'D28', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D28'), '물리치료');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P096', 'Y', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '알레르기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P052', 'N', 'D32', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D32'), '두드러기');

                                                                  

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P096', 'Y', 'D41', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D41'), '이명');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P097', 'N', 'D42', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D42'), '비염');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P070', 'N', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '우울증');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-12 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P071', 'N', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');





--18-06-13

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P013', 'Y', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '감기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P054', 'Y', 'D05', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D05'), '속쓰림');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P048', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P009', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P084', 'N', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '자상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P063', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P024', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P045', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P085', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P086', 'Y', 'D09', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D09'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P087', 'Y', 'D10', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D10'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P088', 'Y', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '타박상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P025', 'N', 'D18', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D18'), '흉터제거');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P091', 'Y', 'D13', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D13'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P067', 'Y', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P058', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '안구 건조');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P049', 'Y', 'D21', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D21'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P094', 'Y', 'D29', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D29'), '디스크');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P095', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '요통');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P055', 'N', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '알레르기');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P056', 'N', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '가려움증, 이원');

                                                                  

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P069', 'N', 'D40', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D40'), '비염');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P076', 'N', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '우울증, 이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-13 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P077', 'N', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '심리 상담');







--18-06-14

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P015', 'Y', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '만성두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P085', 'Y', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P075', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '어지럼증');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P035', 'Y', 'D09', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D09'), '찰과상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P055', 'Y', 'D10', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D10'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P094', 'Y', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '타박상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P014', 'Y', 'D19', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D19'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P025', 'Y', 'D21', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D21'), '눈시림');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P024', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '');





--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P035', 'Y', 'D29', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '디스크');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P034', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '관절염');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P045', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P055', 'Y', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '가려움증');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P065', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '');

                                                                  

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P065', 'N', 'D43', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D43'), '');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P095', 'Y', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-14 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P078', 'N', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');







--18-06-15

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P021', 'Y', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P031', 'Y', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '속쓰림');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P041', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '배탈');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P022', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 13:00', 'RR-MM-DD HH24:MI'),

                                                                  'P032', 'Y', 'D10', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D10'), '');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P023', 'Y', 'D14', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D14'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P033', 'Y', 'D23', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D23'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P034', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '이물질');





--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P042', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P044', 'Y', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 13:00', 'RR-MM-DD HH24:MI'),

                                                                  'P072', 'Y', 'D32', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D32'), '');

                                                                  

--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P074', 'N', 'D42', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D42'), '');

                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P052', 'Y', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-15 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P082', 'Y', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');



--18-06-18

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P001', 'N', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '구토');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P004', 'N', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '두통');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P010', 'N', 'D06', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D06'), '타박상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P077', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '');





--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P020', 'N', 'D17', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D17'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P030', 'N', 'D21', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D21'), '눈시림');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P051', 'Y', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P040', 'N', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '물리치료');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P050', 'N', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '가려움증');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P060', 'N', 'D37', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D37'), '');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P071', 'N', 'D48', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D48'), '심리 상담');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-18 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P072', 'N', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '');

                                                                  



--18-06-19

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P003', 'N', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '복통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P004', 'Y', 'D05', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D05'), '');



--외과

--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P022', 'N', 'D15', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D15'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P032', 'N', 'D23', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D23'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P063', 'Y', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P042', 'N', 'D27', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D27'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P072', 'Y', 'D32', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D32'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P053', 'N', 'D31', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D31'), '알레르기');

                                                                                                                     

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-19 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P002', 'Y', 'D47', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D47'), '');





--18-06-20

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P096', 'Y', 'D03', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D03'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P012', 'N', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P023', 'N', 'D14', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D14'), '');



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P034', 'N', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P043', 'Y', 'D27', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D27'), '디스크');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P094', 'Y', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 15:00', 'RR-MM-DD HH24:MI'),

                                                                  'P063', 'N', 'D44', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D44'), '');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-20 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P073', 'N', 'D49', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D49'), '치매');





--18-06-21

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P002', 'N', 'D02', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D02'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P007', 'N', 'D04', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D04'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P013', 'N', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P064', 'Y', 'D07', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D07'), '');



--산부인과/성형외과



--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P035', 'N', 'D24', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D24'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P007', 'Y', 'D25', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D25'), '');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P064', 'Y', 'D30', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D30'), '요통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P065', 'Y', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '어깨 결림');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P015', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '알레르기');



--흉부외과/이비인후과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P094', 'Y', 'D41', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D41'), '이명');

                                                                                                                               

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-21 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P084', 'Y', 'D50', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D50'), '');











--18-06-22

--내과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P078', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '두통');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 12:00', 'RR-MM-DD HH24:MI'),

                                                                  'P079', 'Y', 'D01', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D01'), '');



--외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P085', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P086', 'Y', 'D08', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D08'), '찰과상');



--산부인과/성형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P047', 'Y', 'D19', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D19'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P048', 'Y', 'D11', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D11'), '');

                                                                                                                                 

--안과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P018', 'Y', 'D22', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D22'), '안구 건조');



--정형외과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P046', 'N', 'D26', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D26'), '이원');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P037', 'Y', 'D27', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D27'), '');



--피부과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 16:00', 'RR-MM-DD HH24:MI'),

                                                                  'P018', 'Y', 'D34', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D34'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 10:00', 'RR-MM-DD HH24:MI'),

                                                                  'P059', 'N', 'D35', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D35'), '');

                                                                  

--흉부외과/이비인후과                                                                                                                                 

--정신의학과

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 11:00', 'RR-MM-DD HH24:MI'),

                                                                  'P075', 'N', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '');

INSERT INTO APPOINTMENT VALUES ('A' || LPAD(APP_SEQ.NEXTVAL, 5, '0'), TO_DATE('18-06-22 14:00', 'RR-MM-DD HH24:MI'),

                                                                  'P076', 'N', 'D46', (SELECT DEPT_NO FROM DOCTOR WHERE DOC_NO = 'D46'), '우울증, 이원');



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







COMMIT;

PROMPT Complete...