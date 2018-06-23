--------------------------------------------------------------------------------

CREATE TABLE DEPARTMENT(

  DEPT_NO VARCHAR2(10) PRIMARY KEY,

  DEPT_NAME VARCHAR2(30) NOT NULL

);

--------------------------------------------------------------------------------

CREATE TABLE DOCTOR(

  DOC_NO VARCHAR2(20) PRIMARY KEY,

  DOC_NAME VARCHAR2(20) NOT NULL,

  DOC_ROOM NUMBER NOT NULL,

  DEPT_NO VARCHAR2(10) NOT NULL -- FK

);

ALTER TABLE DOCTOR

ADD CONSTRAINT DOC_DEPT_FK FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);

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

--------------------------------------------------------------------------------

CREATE TABLE APPOINTMENT(

  APP_NO VARCHAR2(20) PRIMARY KEY,

  APP_DATE DATE NOT NULL,

  APP_MEMO VARCHAR2(300) ,

  PAT_NO VARCHAR2(20) NOT NULL, -- FK

  APP_FIRST CHAR(1) NOT NULL,

  DOC_NO VARCHAR2(20) NOT NULL, -- FK

  DEPT_NO VARCHAR2(10) NOT NULL -- FK

);

ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_PAT_FK FOREIGN KEY (PAT_NO) REFERENCES PATIENT(PAT_NO);

ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_DOC_FK FOREIGN KEY (DOC_NO) REFERENCES DOCTOR(DOC_NO);

ALTER TABLE APPOINTMENT

ADD CONSTRAINT APP_DEPT_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);

--------------------------------------------------------------------------------

INSERT INTO DEPARTMENT VALUES('D01','내과');

INSERT INTO DEPARTMENT VALUES('D02','외과');

INSERT INTO DEPARTMENT VALUES('D03','산부인과');

INSERT INTO DEPARTMENT VALUES('D04','성형외과');

INSERT INTO DEPARTMENT VALUES('D05','안과');

INSERT INTO DEPARTMENT VALUES('D06','정형외과');

INSERT INTO DEPARTMENT VALUES('D07','피부과');

INSERT INTO DEPARTMENT VALUES('D08','흉부외과');

INSERT INTO DEPARTMENT VALUES('D09','이비인후과');

INSERT INTO DEPARTMENT VALUES('D10','정신건강의학과');

--------------------------------------------------------------------------------

-- 의사 50

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



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '한선기', DOC_R1_SEQ.NEXTVAL, 'D01');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '강중훈', DOC_R1_SEQ.NEXTVAL, 'D01');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '최만식', DOC_R1_SEQ.NEXTVAL, 'D01');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '정도연', DOC_R1_SEQ.NEXTVAL, 'D01');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '안석규', DOC_R1_SEQ.NEXTVAL, 'D01');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '성해교', DOC_R2_SEQ.NEXTVAL, 'D02');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '전우성', DOC_R2_SEQ.NEXTVAL, 'D02');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '엄정하', DOC_R2_SEQ.NEXTVAL, 'D02');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '심하균', DOC_R2_SEQ.NEXTVAL, 'D02');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '고승우', DOC_R2_SEQ.NEXTVAL, 'D02');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이중기', DOC_R3_SEQ.NEXTVAL, 'D03');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '감우섭', DOC_R3_SEQ.NEXTVAL, 'D03');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이태정', DOC_R3_SEQ.NEXTVAL, 'D03');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '안선기', DOC_R3_SEQ.NEXTVAL, 'D03');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김민종', DOC_R3_SEQ.NEXTVAL, 'D03');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '유재석', DOC_R4_SEQ.NEXTVAL, 'D04');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김은영', DOC_R4_SEQ.NEXTVAL, 'D04');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '윤성애', DOC_R4_SEQ.NEXTVAL, 'D04');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '신지원', DOC_R4_SEQ.NEXTVAL, 'D04');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '유정화', DOC_R4_SEQ.NEXTVAL, 'D04');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이서연', DOC_R5_SEQ.NEXTVAL, 'D05');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '은상연', DOC_R5_SEQ.NEXTVAL, 'D05');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '안상건', DOC_R5_SEQ.NEXTVAL, 'D05');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김성룡', DOC_R5_SEQ.NEXTVAL, 'D05');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이종진', DOC_R5_SEQ.NEXTVAL, 'D05');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '송성묵', DOC_R6_SEQ.NEXTVAL, 'D06');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박영선', DOC_R6_SEQ.NEXTVAL, 'D06');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김진서', DOC_R6_SEQ.NEXTVAL, 'D06');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박민준', DOC_R6_SEQ.NEXTVAL, 'D06');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박정훈', DOC_R6_SEQ.NEXTVAL, 'D06');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '최윤선', DOC_R7_SEQ.NEXTVAL, 'D07');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '홍유정', DOC_R7_SEQ.NEXTVAL, 'D07');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이하은', DOC_R7_SEQ.NEXTVAL, 'D07');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박원우', DOC_R7_SEQ.NEXTVAL, 'D07');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이준서', DOC_R7_SEQ.NEXTVAL, 'D07');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '유선화', DOC_R8_SEQ.NEXTVAL, 'D08');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '정동수', DOC_R8_SEQ.NEXTVAL, 'D08');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '주원호', DOC_R8_SEQ.NEXTVAL, 'D08');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '이영숙', DOC_R8_SEQ.NEXTVAL, 'D08');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김혜진', DOC_R8_SEQ.NEXTVAL, 'D08');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김영우', DOC_R9_SEQ.NEXTVAL, 'D09');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '공지후', DOC_R9_SEQ.NEXTVAL, 'D09');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박정웅', DOC_R9_SEQ.NEXTVAL, 'D09');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김정필', DOC_R9_SEQ.NEXTVAL, 'D09');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박지예', DOC_R9_SEQ.NEXTVAL, 'D09');



INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박민기', DOC_R10_SEQ.NEXTVAL, 'D10');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '양성철', DOC_R10_SEQ.NEXTVAL, 'D10');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '박종후', DOC_R10_SEQ.NEXTVAL, 'D10');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '김종수', DOC_R10_SEQ.NEXTVAL, 'D10');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '심민기', DOC_R10_SEQ.NEXTVAL, 'D10');

--------------------------------------------------------------------------------

-- 환자 100
-- PAT_NO SUQUENCE
CREATE SEQUENCE PAT_SEQ 
START WITH 1
NOCYCLE
NOCACHE;

INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'jjh1421', 'jh121212', '조재형', '010-2316-1121', '720114-1724266', 'jj@naver.com', '서울특별시 강남구 역삼동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jh31', 'jjh1004', '정지현', '010-1425-1001', '821110-1647215', 'jh31@naver.com', '대구광역시 동구 신암동');    
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yesu1234', 'yesu1', '김예수', '010-1124-5511', '910114-2014121', 'jjh@gmail.com', '서울특별시 강서구 내발산동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'nasw', 'nsw1004', '나승원', '010-2384-2153', '730416-1724266', 'jjh@nate.com', '인천광역시 남구 숭의동');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'sekim', 'sooneeeee', '김순이', '010-9412-9381', '660812-2047413', 'soonee@gmail.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hail', 'hihihi', '박하일', '010-2419-8341', '420803-1040743', 'hipark@gmail.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shkwon', 'shshsh11', '권상후', '010-2253-1921', '831117-1104825', 'shkwon@nate.com', '서울특별시 강서구 등촌동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yalim', 'yayaya1234', '임영애', '010-9341-0078', '570414-2510121', 'young00@nate.com', '서울특별시 양천구 목동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jhyeom', 'jhjh1234', '염정하', '010-4112-9304', '891124-2011034', 'jhy111@naver.com', '대전광역시 서구 복수동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sool5', 'sososo55', '김술오', '010-2120-9101', '680114-1011824', 'sokim@daum.net', '서울특별시 용산구 후암동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'tsy1123', 'tststs1', '윤태서', '010-1410-0012', '010701-4011483', 'tsyoon11@naver.com', '서울특별시 여의도구 여의도동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'ynkim', 'ynk1000', '김연아', '010-8246-0912', '940812-2047413', 'yunakim@gmail.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hnna1234', 'hnna123', '나화남', '010-5289-7345', '360812-1728152', 'hnna1234@gmail.com', '경기도 성남시 수정구');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sylee123133', 'styee', '이선용', '010-1836-9745', '670119-1001415', 'sylee0@nate.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hkkim1', 'hkhk12313', '김화경', '010-8249-0760', '700125-2017523', 'hkk1111@gmail.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jmp123', 'jmjm111', '박지민', '010-1425-8522', '780812-2040124', 'jmp1234@gmail.com', '서울특별시 서초구 방배동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hkdong', 'hkd14', '홍길동', '010-4231-1020', '480130-1001214', 'hkd140@daum.net', '경기도 성남시 중원구');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hwkim', 'hwkim101', '김현월', '010-4120-9411', '690827-2042123', 'hwkim111@gmail.com', '경기도 성남시 수정구');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjh1400', 'jjheeee', '전지현', '010-8245-9877', '670810-2040133', 'jjh1004@naver.com', '경기도 남양주시 평내동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seongwan', 'swp1110', '박성완', '010-3112-5522', '030117-3047213', 'swpart1234@gmail.com', '경기도 고양시 일산동구');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'gschoi964', 'cgs9064', '최광석', '010-3001-5001', '900604-1923472', 'gschoi9064@gmail.com', '경기도 남양주시 호평동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jihojiho2', 'jhoo200', '김지호', '010-2292-1005', '960428-1522412', 'jihojiho2000@gmail.com', '경기도 남양주시 다산2동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjchoi46', 'jj46', '최재정', '010-4865-5991', '930406-1023043', 'jjchoi46@gmail.com', '경기도 남양주시 금곡동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'onami', 'onam66', '오남이', '010-9091-7801', '921206-2643327', 'onami@gmail.com', '경기도 남양주시 일패동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jinhee35', 'leejh135', '이진희', '010-8723-1642', '950305-2222472', 'jinheeya@gmail.com', '경기도 남양주시 양정동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jihunyu74', 'yuyuyu7402', '유지훈', '010-1023-1022', '740902-1123176', 'yuyuyu7402@gmail.com', '경기도 남양주시 와부읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seohyun312', 'shoh213', '오서현', '010-5943-3029', '010101-4232191', 'gschoi9064@gmail.com', '경기도 남양주시 진전읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jimins', 'jimins342', '박지민', '010-2019-2972', '981111-2114122', 'jimins9811@gmail.com', '경기도 남양주시 화도읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jiwoohime', 'jwl3223', '이지우', '010-1122-6722', '020924-4111247', 'jiwoohime402@gmail.com', '경기도 남양주시 퇴계원면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'syysong', 'yysong94', '송서윤', '010-2020-5638', '990229-2001192', 'songsong9292@gmail.com', '경기도 남양주시 별내동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hjun686', 'hjyu686', '유현준', '010-6809-6018', '880316-1994393', 'hjun819@gmail.com', '경기도 남양주시 도농동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'parksj67', 'sjarpk67', '박성준', '010-1123-0087', '791107-1036472', 'parksj@gmail.com', '경기도 남양주시 진건읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yunu54', 'yunujini54', '윤우진', '010-2031-1772', '741013-2190883', 'yunujuni74@gmail.com', '경기도 남양주시 지금동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hyundo15', 'hyunwoodo15', '도현우', '010-2881-2020', '960921-1569372', 'hyunwoo95@gmail.com', '경기도 남양주시 오남읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yuyejun', 'yyej25', '유예준', '010-2893-6721', '890520-1773433', 'yuyejun89@gmail.com', '경기도 남양주시 다산1동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'wjmin11', 'minjw43', '민지원', '010-1012-2030', '961212-2433611', 'mjwon1012@gmail.com', '경기도 구리시 갈매동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seokgi', 'seokgi63', '신석기', '010-1920-6723', '700502-1023442', 'shinseok94@gmail.com', '경기도 구리시 사노동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sujune123', 'sujune2s', '김수준', '010-7422-2032', '981205-1422272', 'sujune72@gmail.com', '경기도 구리시 인창동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'armani', 'shoot1212', '김효진', '010-1003-5001', '850124-2920702', 'armani1212@gmail.com', '경기도 구리시 교문동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yunamsang', 'sjew1223', '임준영', '010-9882-5067', '960628-1233472', 'yunamsang1223@gmail.com', '경기도 구리시 수택동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'kincidar', 'kinyu893', '성주안', '010-9000-1223', '961122-2832343', 'kincidar5773@gmail.com', '경기도 구리시 아천동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hololulu', 'alpaka3992', '차지원', '010-2012-1882', '940214-2998876', 'hololulu@gmail.com', '경기도 구리시 토평동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shootingstar', 'imstar76', '임준영', '010-2830-3021', '821225-1003421', 'shiningstar@gmail.com', '경기도 구리시 동구동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'gugucon', 'ghost8823', '김지호', '010-2342-7766', '890812-1300873', 'gugucon1231@gmail.com', '경기도 구리시 교문1동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'kyochon', 'nenechick123', '이진우', '010-6733-0101', '840507-1113411', 'kyochon3001@gmail.com', '경기도 구리시 수택2동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jupazip', 'btear882', '한원우', '010-2331-6723', '910224-1113327', 'baeyale123@gmail.com', '경기도 하남시 배알미동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sinagong', 'howe122', '송한결', '010-8837-0166', '041201-4113466', 'sunsinag123@gmail.com', '경기도 하남시 선동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'boramsangjo', 'greoso123', '박다함', '010-7272-7777', '780418-2441477', 'daham78@gmail.com', '경기도 하남시 초일동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'daewang', 'sdwfkw882', '이지원', '010-9292-1717', '910713-2271070', 'daewang@gmail.com', '경기도 하남시 당정동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'collaboration77', 'cjdewf234', '유선기', '010-2342-0200', '800921-1234979', 'collabo992@gmail.com', '경기도 하남시 미사동');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'chuchu', 'chuta523', '추자현', '010-3012-1121', '751018-2024444', 'chuchugg@naver.com', '경기도 파주시 금촌동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'homerun', 'combackhome32', '이대호', '010-2832-5831', '800122-1648877', 'homerun12@naver.com', '경기도 파주시 아동동');    
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'toratora', 'toos342', '서장훈', '010-3443-2925', '810710-1082121', 'toratora@gmail.com', '경기도 파주시 야동동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'prepera43', 'nasung82', '나문희', '010-2302-3292', '691204-2334263', 'nnapre234@nate.com', '경기도 파주시 검산동');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'honghong', 'shinna992', '홍진영', '010-8762-2032', '860820-2065613', 'lalala@gmail.com', '경기도 파주시 맥금동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bingrae', 'icecream452', '김샛별', '010-1133-4993', '761003-2022740', 'hipassion@gmail.com', '경기도 파주시 교하동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'iconic33', 'alal234', '박서준', '010-2003-4321', '871006-1007625', 'parkjjun@nate.com', '경기도 파주시 야당동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sareka', 'ajlksdfow141', '이사랑', '010-7661-7823', '800316-2501101', 'lovelove123@nate.com', '경기도 파주시 다율동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'narear132', 'jisie234', '박나래', '010-2019-9304', '941024-2881034', 'jhy332@naver.com', '경기도 파주시 오도동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'slel234', 'coske234', '박승희', '010-2802-9101', '890617-2012324', 'shpark1234@daum.net', '경기도 파주시 상지석동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'victory53', 'voos234', '이승기', '010-8821-0034', '030602-3023483', 'ssgkle@naver.com', '경기도 파주시 산남동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shongie', 'ajklasf123', '현송월', '010-9399-2002', '900212-2239993', 'songwhoe@gmail.com', '경기도 파주시 동패동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'backerow124', 'jsooe234', '백지영', '010-3002-2932', '601210-2334253', 'bakke1234@gmail.com', '경기도 파주시 당하동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'nanda144', 'sjoefsf234', '유난희', '010-9009-9749', '802319-2901416', 'nakkf2230@nate.com', '경기도 파주시 문발동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bangtan234', 'sooser234', '유정국', '010-8821-9922', '881205-1014524', 'ajjfe2523@gmail.com', '경기도 파주시 송촌동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'out12532', 'cokjjse253', '박병호', '010-9932-2284', '770812-1040121', 'osufj234@gmail.com', '경기도 파주시 목동동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jaosllwe234', 'sjjfsgg23', '정진철', '010-2832-2943', '960528-1002141', 'akajsfwe14@daum.net', '경기도 파주시 하지석동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'josjls42', 'joses32', '이채원', '010-1992-2095', '800712-2141112', 'sokkcle1414@gmail.com', '경기도 파주시 서패동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'leesiocje134', 'oosce24', '이숭윤', '010-9342-1888', '690408-1023103', 'syuet3234@naver.com', '경기도 파주시 신촌동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dayoum14', 'sijjel243', '김대엽', '010-3000-3000', '030820-3017013', 'swpart1234@gmail.com', '경기도 파주시 연다산동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sunengs25', 'jcjsle153', '주성욱', '010-7283-6672', '900604-1123979', 'aafgwe25@gmail.com', '경기도 파주시 와동동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'choigg234', 'hoence125', '최성일', '010-6731-0023', '900621-1521111', 'sunggood1123@gmail.com', '경기도 파주시 금릉동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'mysun1234', 'redsun9923', '전태양', '010-3992-8811', '950116-1029123', 'redsun123@gmail.com', '경기도 파주시 문산읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dollyu123', 'ohmygod145', '이동녕', '010-2341-8231', '921002-1233327', 'isyuyu123@gmail.com', '경기도 파주시 파주읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jinsooe67', 'hwang231', '황강호', '010-7727-1123', '890210-1722470', 'goat2523@gmail.com', '경기도 파주시 법원읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'songtoyou', 'lsong234', '송병구', '010-9923-6627', '720620-1177176', 'yanolja@gmail.com', '경기도 파주시 조리읍');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dominopizza', 'tasty1234', '김도우', '010-2019-9342', '010915-3112391', 'dowman124@gmail.com', '경기도 파주시 월롱면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hansole', 'sjosoef234', '박한솔', '010-3009-2992', '981111-1222222', 'solehan4234@gmail.com', '경기도 파주시 탄현면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'ghostman234', 'osi7234', '박령우', '010-1192-2302', '020324-3122147', 'jasmin123@gmail.com', '경기도 파주시 광탄면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jasminflower', 'flavor234', '어윤수', '010-8761-0231', '920124-1009888', 'yoman1234@gmail.com', '경기도 파주시 파평면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jogila', 'jose29923', '조성주', '010-0921-2318', '900221-1432393', 'yojo123@gmail.com', '경기도 파주시 적성면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bunglusse34', 'genuousr234', '이병렬', '010-8888-1111', '701106-1011721', 'joke1417@gmail.com', '경기도 파주시 군내면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'giyong76', 'uskjfl2353', '김기용', '010-9821-2341', '781213-1900083', 'giyoung124@gmail.com', '경기도 파주시 진동면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hansdelli', 'hanseman144', '한이석', '010-2020-9090', '910712-1666362', 'hanseman87@gmail.com', '경기도 파주시 진서면');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjakji', 'silk235', '조지현', '010-1090-1294', '800520-1773437', 'jjackji14@gmail.com', '경기도 파주시 금촌3동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'champion14', 'minho235', '이영호', '010-6614-3092', '880211-1334619', 'minwon235@gmail.com', '경기도 파주시 운정1동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'minwon24', 'gov24', '조연주', '010-1820-0102', '780502-2061442', 'shinsaegae@gmail.com', '경기도 광주시 경안동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'duolock', 'leejuhee22', '이주희', '010-7422-2032', '971104-2099272', 'duolock@gmail.com', '경기도 광주시 쌍렬동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'finally12', 'youcandoit123', '서현숙', '010-6113-6331', '830521-2923702', 'armani1212@gmail.com', '경기도 광주시 송정동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'samyang', 'ramen882', '안지현', '010-7362-9221', '900621-2200402', 'nuguri@gmail.com', '경기도 광주시 회덕동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'deette', 'espresso123', '신수인', '010-6000-5161', '970405-2802300', 'dalcomcoffee@gmail.com', '경기도 광주시 탄별동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'starbugs', 'expensive99', '김한나', '010-6664-9772', '920512-2998876', 'blackhoke@gmail.com', '경기도 광주시 목현동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'twosome', 'placeto234', '이하은', '010-1288-8230', '800812-2014218', 'orangejuice@gmail.com', '경기도 광주시 삼동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'goldbird', 'goldtime66', '김연정', '010-1982-3921', '900816-2000999', 'goldbird135@gmail.com', '경기도 광주시 중대동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'deepfog', 'grayfog124', '조아련', '010-5812-0007', '880807-2112311', 'deppfong123@gmail.com', '경기도 광주시 직동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'juilan', 'venusy982', '김은빈', '010-7761-9872', '800220-2133907', 'rallicate15@gmail.com', '경기도 광주시 태전동');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'railcat235', 'hospitail883', '김승현', '010-3002-1001', '900801-1660077', 'bigtent9090@gmail.com', '경기도 광주시 남한산성면');

COMMIT;
--------------------------------------------------------------------------------

-- 진료 120