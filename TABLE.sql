PROMPT MMS PROJECT DATA initializing....
SET FEEDBACK OFF --��� ��� ��ȸ OFF
SET DEFINE OFF --Ư������ �Է� ����

-- ���̺� �ʱ�ȭ
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE DOCTOR CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT CASCADE CONSTRAINTS;

--������ �ʱ�ȭ
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

COMMENT ON COLUMN DEPARTMENT.DEPT_NO IS '�� ��ȣ';
COMMENT ON COLUMN DEPARTMENT.DEPT_NAME IS '�� �̸�';



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

COMMENT ON COLUMN DOCTOR.DOC_NO IS '�ǻ� ��ȣ';
COMMENT ON COLUMN DOCTOR.DOC_NAME IS '�ǻ� �̸�';
COMMENT ON COLUMN DOCTOR.DOC_ROOM IS '����� ��ȣ';
COMMENT ON COLUMN DOCTOR.DEPT_NO IS '�� ��ȣ';



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

COMMENT ON COLUMN PATIENT.PAT_NO IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN PATIENT.PAT_ID IS '���̵�';
COMMENT ON COLUMN PATIENT.PAT_PW IS '��й�ȣ';
COMMENT ON COLUMN PATIENT.PAT_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN PATIENT.PAT_PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN PATIENT.PAT_SSN IS '�ֹε�Ϲ�ȣ';
COMMENT ON COLUMN PATIENT.PAT_EMAIL IS '�̸���';
COMMENT ON COLUMN PATIENT.PAT_ADDRESS IS '�ּ�';


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
ADD CONSTRAINT APP_PAT_FK FOREIGN KEY (PAT_NO) REFERENCES PATIENT(PAT_NO);
ALTER TABLE APPOINTMENT
ADD CONSTRAINT APP_DOC_FK FOREIGN KEY (DOC_NO) REFERENCES DOCTOR(DOC_NO);
ALTER TABLE APPOINTMENT
ADD CONSTRAINT APP_DEPT_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);

COMMENT ON COLUMN APPOINTMENT.APP_NO IS '���� ��ȣ';
COMMENT ON COLUMN APPOINTMENT.APP_DATE IS '���� ��¥';
COMMENT ON COLUMN APPOINTMENT.APP_MEMO IS '����';
COMMENT ON COLUMN APPOINTMENT.PAT_NO IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN APPOINTMENT.APP_FIRST IS '���� ����';
COMMENT ON COLUMN APPOINTMENT.DOC_NO IS '����� ��ȣ';
COMMENT ON COLUMN APPOINTMENT.DEPT_NO IS '�� ��ȣ';





PROMPT LOADING DEPARTMENT ...
--------------------------------------------------------------------------------
INSERT INTO DEPARTMENT VALUES('D01','����');
INSERT INTO DEPARTMENT VALUES('D02','�ܰ�');
INSERT INTO DEPARTMENT VALUES('D03','����ΰ�');
INSERT INTO DEPARTMENT VALUES('D04','�����ܰ�');
INSERT INTO DEPARTMENT VALUES('D05','�Ȱ�');
INSERT INTO DEPARTMENT VALUES('D06','�����ܰ�');
INSERT INTO DEPARTMENT VALUES('D07','�Ǻΰ�');
INSERT INTO DEPARTMENT VALUES('D08','��οܰ�');
INSERT INTO DEPARTMENT VALUES('D09','�̺����İ�');
INSERT INTO DEPARTMENT VALUES('D10','���Űǰ����а�');


PROMPT LOADING DOCTOR ....
--------------------------------------------------------------------------------
-- �ǻ� 50��
CREATE SEQUENCE DOC_SEQ -- DOC_NO SUQUENCE
START WITH 1
NOCYCLE
NOCACHE;


CREATE SEQUENCE DOC_R1_SEQ -- DOC_ROOM ���� SEQUENCE
START WITH 101 MAXVALUE 199 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R2_SEQ -- DOC_ROOM �ܰ� SEQUENCE
START WITH 201 MAXVALUE 299 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R3_SEQ -- DOC_ROOM ����ΰ� SEQUENCE
START WITH 301 MAXVALUE 399 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R4_SEQ -- DOC_ROOM �����ܰ� SEQUENCE
START WITH 401 MAXVALUE 499 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R5_SEQ -- DOC_ROOM �Ȱ� SEQUENCE
START WITH 501 MAXVALUE 599 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R6_SEQ -- DOC_ROOM �����ܰ� SEQUENCE
START WITH 601 MAXVALUE 699 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R7_SEQ -- DOC_ROOM �Ǻΰ� SEQUENCE
START WITH 701 MAXVALUE 799 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R8_SEQ -- DOC_ROOM ��οܰ� SEQUENCE
START WITH 801 MAXVALUE 899 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R9_SEQ -- DOC_ROOM �̺����İ� SEQUENCE
START WITH 901 MAXVALUE 999 NOCYCLE NOCACHE;
CREATE SEQUENCE DOC_R10_SEQ -- DOC_ROOM ���Űǰ����а� SEQUENCE
START WITH 1001 MAXVALUE 1099 NOCYCLE NOCACHE;


INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�Ѽ���', DOC_R1_SEQ.NEXTVAL, 'D01');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R1_SEQ.NEXTVAL, 'D01');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ָ���', DOC_R1_SEQ.NEXTVAL, 'D01');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R1_SEQ.NEXTVAL, 'D01');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ȼ���', DOC_R1_SEQ.NEXTVAL, 'D01');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���ر�', DOC_R2_SEQ.NEXTVAL, 'D02');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���켺', DOC_R2_SEQ.NEXTVAL, 'D02');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R2_SEQ.NEXTVAL, 'D02');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���ϱ�', DOC_R2_SEQ.NEXTVAL, 'D02');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '��¿�', DOC_R2_SEQ.NEXTVAL, 'D02');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���߱�', DOC_R3_SEQ.NEXTVAL, 'D03');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���켷', DOC_R3_SEQ.NEXTVAL, 'D03');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R3_SEQ.NEXTVAL, 'D03');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ȼ���', DOC_R3_SEQ.NEXTVAL, 'D03');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�����', DOC_R3_SEQ.NEXTVAL, 'D03');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���缮', DOC_R4_SEQ.NEXTVAL, 'D04');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R4_SEQ.NEXTVAL, 'D04');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R4_SEQ.NEXTVAL, 'D04');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R4_SEQ.NEXTVAL, 'D04');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '����ȭ', DOC_R4_SEQ.NEXTVAL, 'D04');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�̼���', DOC_R5_SEQ.NEXTVAL, 'D05');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '����', DOC_R5_SEQ.NEXTVAL, 'D05');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�Ȼ��', DOC_R5_SEQ.NEXTVAL, 'D05');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�輺��', DOC_R5_SEQ.NEXTVAL, 'D05');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R5_SEQ.NEXTVAL, 'D05');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ۼ���', DOC_R6_SEQ.NEXTVAL, 'D06');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ڿ���', DOC_R6_SEQ.NEXTVAL, 'D06');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R6_SEQ.NEXTVAL, 'D06');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ڹ���', DOC_R6_SEQ.NEXTVAL, 'D06');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R6_SEQ.NEXTVAL, 'D06');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R7_SEQ.NEXTVAL, 'D07');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, 'ȫ����', DOC_R7_SEQ.NEXTVAL, 'D07');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R7_SEQ.NEXTVAL, 'D07');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ڿ���', DOC_R7_SEQ.NEXTVAL, 'D07');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '���ؼ�', DOC_R7_SEQ.NEXTVAL, 'D07');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '����ȭ', DOC_R8_SEQ.NEXTVAL, 'D08');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R8_SEQ.NEXTVAL, 'D08');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ֿ�ȣ', DOC_R8_SEQ.NEXTVAL, 'D08');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�̿���', DOC_R8_SEQ.NEXTVAL, 'D08');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R8_SEQ.NEXTVAL, 'D08');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�迵��', DOC_R9_SEQ.NEXTVAL, 'D09');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R9_SEQ.NEXTVAL, 'D09');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R9_SEQ.NEXTVAL, 'D09');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R9_SEQ.NEXTVAL, 'D09');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R9_SEQ.NEXTVAL, 'D09');

INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ڹα�', DOC_R10_SEQ.NEXTVAL, 'D10');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�缺ö', DOC_R10_SEQ.NEXTVAL, 'D10');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R10_SEQ.NEXTVAL, 'D10');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '������', DOC_R10_SEQ.NEXTVAL, 'D10');
INSERT INTO DOCTOR VALUES('D'||DOC_SEQ.NEXTVAL, '�ɹα�', DOC_R10_SEQ.NEXTVAL, 'D10');


PROMPT LOADING PATIENT...
--------------------------------------------------------------------------------
-- ȯ�� 100
-- PAT_NO SUQUENCE
CREATE SEQUENCE PAT_SEQ 
START WITH 1
NOCYCLE
NOCACHE;

INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'jjh1421', 'jh121212', '������', '010-2316-1121', '720114-1724266', 'jj@naver.com', '����Ư���� ������ ���ﵿ');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jh31', 'jjh1004', '������', '010-1425-1001', '821110-1647215', 'jh31@naver.com', '�뱸������ ���� �žϵ�');    
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yesu1234', 'yesu1', '�迹��', '010-1124-5511', '910114-2014121', 'jjh@gmail.com', '����Ư���� ������ ���߻굿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'nasw', 'nsw1004', '���¿�', '010-2384-2153', '730416-1724266', 'jjh@nate.com', '��õ������ ���� ���ǵ�');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'sekim', 'sooneeeee', '�����', '010-9412-9381', '660812-2047413', 'soonee@gmail.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hail', 'hihihi', '������', '010-2419-8341', '420803-1040743', 'hipark@gmail.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shkwon', 'shshsh11', '�ǻ���', '010-2253-1921', '831117-1104825', 'shkwon@nate.com', '����Ư���� ������ ���̵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yalim', 'yayaya1234', '�ӿ���', '010-9341-0078', '570414-2510121', 'young00@nate.com', '����Ư���� ��õ�� ��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jhyeom', 'jhjh1234', '������', '010-4112-9304', '891124-2011034', 'jhy111@naver.com', '���������� ���� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sool5', 'sososo55', '�����', '010-2120-9101', '680114-1011824', 'sokim@daum.net', '����Ư���� ��걸 �ľϵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'tsy1123', 'tststs1', '���¼�', '010-1410-0012', '010701-4011483', 'tsyoon11@naver.com', '����Ư���� ���ǵ��� ���ǵ���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'ynkim', 'ynk1000', '�迬��', '010-8246-0912', '940812-2047413', 'yunakim@gmail.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hnna1234', 'hnna123', '��ȭ��', '010-5289-7345', '360812-1728152', 'hnna1234@gmail.com', '��⵵ ������ ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sylee123133', 'styee', '�̼���', '010-1836-9745', '670119-1001415', 'sylee0@nate.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hkkim1', 'hkhk12313', '��ȭ��', '010-8249-0760', '700125-2017523', 'hkk1111@gmail.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jmp123', 'jmjm111', '������', '010-1425-8522', '780812-2040124', 'jmp1234@gmail.com', '����Ư���� ���ʱ� ��赿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hkdong', 'hkd14', 'ȫ�浿', '010-4231-1020', '480130-1001214', 'hkd140@daum.net', '��⵵ ������ �߿���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hwkim', 'hwkim101', '������', '010-4120-9411', '690827-2042123', 'hwkim111@gmail.com', '��⵵ ������ ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjh1400', 'jjheeee', '������', '010-8245-9877', '670810-2040133', 'jjh1004@naver.com', '��⵵ �����ֽ� �򳻵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seongwan', 'swp1110', '�ڼ���', '010-3112-5522', '030117-3047213', 'swpart1234@gmail.com', '��⵵ ���� �ϻ굿��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'gschoi964', 'cgs9064', '�ֱ���', '010-3001-5001', '900604-1923472', 'gschoi9064@gmail.com', '��⵵ �����ֽ� ȣ��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jihojiho2', 'jhoo200', '����ȣ', '010-2292-1005', '960428-1522412', 'jihojiho2000@gmail.com', '��⵵ �����ֽ� �ٻ�2��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjchoi46', 'jj46', '������', '010-4865-5991', '930406-1023043', 'jjchoi46@gmail.com', '��⵵ �����ֽ� �ݰ');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'onami', 'onam66', '������', '010-9091-7801', '921206-2643327', 'onami@gmail.com', '��⵵ �����ֽ� ���е�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jinhee35', 'leejh135', '������', '010-8723-1642', '950305-2222472', 'jinheeya@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jihunyu74', 'yuyuyu7402', '������', '010-1023-1022', '740902-1123176', 'yuyuyu7402@gmail.com', '��⵵ �����ֽ� �ͺ���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seohyun312', 'shoh213', '������', '010-5943-3029', '010101-4232191', 'gschoi9064@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jimins', 'jimins342', '������', '010-2019-2972', '981111-2114122', 'jimins9811@gmail.com', '��⵵ �����ֽ� ȭ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jiwoohime', 'jwl3223', '������', '010-1122-6722', '020924-4111247', 'jiwoohime402@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'syysong', 'yysong94', '�ۼ���', '010-2020-5638', '990229-2001192', 'songsong9292@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hjun686', 'hjyu686', '������', '010-6809-6018', '880316-1994393', 'hjun819@gmail.com', '��⵵ �����ֽ� ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'parksj67', 'sjarpk67', '�ڼ���', '010-1123-0087', '791107-1036472', 'parksj@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yunu54', 'yunujini54', '������', '010-2031-1772', '741013-2190883', 'yunujuni74@gmail.com', '��⵵ �����ֽ� ���ݵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hyundo15', 'hyunwoodo15', '������', '010-2881-2020', '960921-1569372', 'hyunwoo95@gmail.com', '��⵵ �����ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yuyejun', 'yyej25', '������', '010-2893-6721', '890520-1773433', 'yuyejun89@gmail.com', '��⵵ �����ֽ� �ٻ�1��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'wjmin11', 'minjw43', '������', '010-1012-2030', '961212-2433611', 'mjwon1012@gmail.com', '��⵵ ������ ���ŵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'seokgi', 'seokgi63', '�ż���', '010-1920-6723', '700502-1023442', 'shinseok94@gmail.com', '��⵵ ������ ��뵿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sujune123', 'sujune2s', '�����', '010-7422-2032', '981205-1422272', 'sujune72@gmail.com', '��⵵ ������ ��â��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'armani', 'shoot1212', '��ȿ��', '010-1003-5001', '850124-2920702', 'armani1212@gmail.com', '��⵵ ������ ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'yunamsang', 'sjew1223', '���ؿ�', '010-9882-5067', '960628-1233472', 'yunamsang1223@gmail.com', '��⵵ ������ ���õ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'kincidar', 'kinyu893', '���־�', '010-9000-1223', '961122-2832343', 'kincidar5773@gmail.com', '��⵵ ������ ��õ��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hololulu', 'alpaka3992', '������', '010-2012-1882', '940214-2998876', 'hololulu@gmail.com', '��⵵ ������ ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shootingstar', 'imstar76', '���ؿ�', '010-2830-3021', '821225-1003421', 'shiningstar@gmail.com', '��⵵ ������ ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'gugucon', 'ghost8823', '����ȣ', '010-2342-7766', '890812-1300873', 'gugucon1231@gmail.com', '��⵵ ������ ����1��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'kyochon', 'nenechick123', '������', '010-6733-0101', '840507-1113411', 'kyochon3001@gmail.com', '��⵵ ������ ����2��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jupazip', 'btear882', '�ѿ���', '010-2331-6723', '910224-1113327', 'baeyale123@gmail.com', '��⵵ �ϳ��� ��˹̵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sinagong', 'howe122', '���Ѱ�', '010-8837-0166', '041201-4113466', 'sunsinag123@gmail.com', '��⵵ �ϳ��� ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'boramsangjo', 'greoso123', '�ڴ���', '010-7272-7777', '780418-2441477', 'daham78@gmail.com', '��⵵ �ϳ��� ���ϵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'daewang', 'sdwfkw882', '������', '010-9292-1717', '910713-2271070', 'daewang@gmail.com', '��⵵ �ϳ��� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'collaboration77', 'cjdewf234', '������', '010-2342-0200', '800921-1234979', 'collabo992@gmail.com', '��⵵ �ϳ��� �̻絿');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'chuchu', 'chuta523', '������', '010-3012-1121', '751018-2024444', 'chuchugg@naver.com', '��⵵ ���ֽ� ���̵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'homerun', 'combackhome32', '�̴�ȣ', '010-2832-5831', '800122-1648877', 'homerun12@naver.com', '��⵵ ���ֽ� �Ƶ���');    
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'toratora', 'toos342', '������', '010-3443-2925', '810710-1082121', 'toratora@gmail.com', '��⵵ ���ֽ� �ߵ���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'prepera43', 'nasung82', '������', '010-2302-3292', '691204-2334263', 'nnapre234@nate.com', '��⵵ ���ֽ� �˻굿');
INSERT INTO PATIENT
VALUES 
('P'||PAT_SEQ.NEXTVAL, 'honghong', 'shinna992', 'ȫ����', '010-8762-2032', '860820-2065613', 'lalala@gmail.com', '��⵵ ���ֽ� �Ʊݵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bingrae', 'icecream452', '�����', '010-1133-4993', '761003-2022740', 'hipassion@gmail.com', '��⵵ ���ֽ� ���ϵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'iconic33', 'alal234', '�ڼ���', '010-2003-4321', '871006-1007625', 'parkjjun@nate.com', '��⵵ ���ֽ� �ߴ絿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sareka', 'ajlksdfow141', '�̻��', '010-7661-7823', '800316-2501101', 'lovelove123@nate.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'narear132', 'jisie234', '�ڳ���', '010-2019-9304', '941024-2881034', 'jhy332@naver.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'slel234', 'coske234', '�ڽ���', '010-2802-9101', '890617-2012324', 'shpark1234@daum.net', '��⵵ ���ֽ� ��������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'victory53', 'voos234', '�̽±�', '010-8821-0034', '030602-3023483', 'ssgkle@naver.com', '��⵵ ���ֽ� �곲��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'shongie', 'ajklasf123', '���ۿ�', '010-9399-2002', '900212-2239993', 'songwhoe@gmail.com', '��⵵ ���ֽ� ���е�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'backerow124', 'jsooe234', '������', '010-3002-2932', '601210-2334253', 'bakke1234@gmail.com', '��⵵ ���ֽ� ���ϵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'nanda144', 'sjoefsf234', '������', '010-9009-9749', '802319-2901416', 'nakkf2230@nate.com', '��⵵ ���ֽ� ���ߵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bangtan234', 'sooser234', '������', '010-8821-9922', '881205-1014524', 'ajjfe2523@gmail.com', '��⵵ ���ֽ� ���̵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'out12532', 'cokjjse253', '�ں�ȣ', '010-9932-2284', '770812-1040121', 'osufj234@gmail.com', '��⵵ ���ֽ� �񵿵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jaosllwe234', 'sjjfsgg23', '����ö', '010-2832-2943', '960528-1002141', 'akajsfwe14@daum.net', '��⵵ ���ֽ� ��������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'josjls42', 'joses32', '��ä��', '010-1992-2095', '800712-2141112', 'sokkcle1414@gmail.com', '��⵵ ���ֽ� ���е�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'leesiocje134', 'oosce24', '�̼���', '010-9342-1888', '690408-1023103', 'syuet3234@naver.com', '��⵵ ���ֽ� ���̵�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dayoum14', 'sijjel243', '��뿱', '010-3000-3000', '030820-3017013', 'swpart1234@gmail.com', '��⵵ ���ֽ� ���ٻ굿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'sunengs25', 'jcjsle153', '�ּ���', '010-7283-6672', '900604-1123979', 'aafgwe25@gmail.com', '��⵵ ���ֽ� �͵���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'choigg234', 'hoence125', '�ּ���', '010-6731-0023', '900621-1521111', 'sunggood1123@gmail.com', '��⵵ ���ֽ� �ݸ���');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'mysun1234', 'redsun9923', '���¾�', '010-3992-8811', '950116-1029123', 'redsun123@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dollyu123', 'ohmygod145', '�̵���', '010-2341-8231', '921002-1233327', 'isyuyu123@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jinsooe67', 'hwang231', 'Ȳ��ȣ', '010-7727-1123', '890210-1722470', 'goat2523@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'songtoyou', 'lsong234', '�ۺ���', '010-9923-6627', '720620-1177176', 'yanolja@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'dominopizza', 'tasty1234', '�赵��', '010-2019-9342', '010915-3112391', 'dowman124@gmail.com', '��⵵ ���ֽ� ���ո�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hansole', 'sjosoef234', '���Ѽ�', '010-3009-2992', '981111-1222222', 'solehan4234@gmail.com', '��⵵ ���ֽ� ź����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'ghostman234', 'osi7234', '�ڷɿ�', '010-1192-2302', '020324-3122147', 'jasmin123@gmail.com', '��⵵ ���ֽ� ��ź��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jasminflower', 'flavor234', '������', '010-8761-0231', '920124-1009888', 'yoman1234@gmail.com', '��⵵ ���ֽ� �����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jogila', 'jose29923', '������', '010-0921-2318', '900221-1432393', 'yojo123@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'bunglusse34', 'genuousr234', '�̺���', '010-8888-1111', '701106-1011721', 'joke1417@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'giyong76', 'uskjfl2353', '����', '010-9821-2341', '781213-1900083', 'giyoung124@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'hansdelli', 'hanseman144', '���̼�', '010-2020-9090', '910712-1666362', 'hanseman87@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'jjakji', 'silk235', '������', '010-1090-1294', '800520-1773437', 'jjackji14@gmail.com', '��⵵ ���ֽ� ����3��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'champion14', 'minho235', '�̿�ȣ', '010-6614-3092', '880211-1334619', 'minwon235@gmail.com', '��⵵ ���ֽ� ����1��');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'minwon24', 'gov24', '������', '010-1820-0102', '780502-2061442', 'shinsaegae@gmail.com', '��⵵ ���ֽ� ��ȵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'duolock', 'leejuhee22', '������', '010-4422-2032', '971104-2099272', 'duolock@gmail.com', '��⵵ ���ֽ� �ַĵ�');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'finally12', 'youcandoit123', '������', '010-6113-6331', '830521-2923702', 'armani1212@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'samyang', 'ramen882', '������', '010-7362-9221', '900621-2200402', 'nuguri@gmail.com', '��⵵ ���ֽ� ȸ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'deette', 'espresso123', '�ż���', '010-6000-5161', '970405-2802300', 'dalcomcoffee@gmail.com', '��⵵ ���ֽ� ź����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'starbugs', 'expensive99', '���ѳ�', '010-6664-9772', '920512-2998876', 'blackhoke@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'twosome', 'placeto234', '������', '010-1288-8230', '800812-2014218', 'orangejuice@gmail.com', '��⵵ ���ֽ� �ﵿ');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'goldbird', 'goldtime66', '�迬��', '010-1982-3921', '900816-2000999', 'goldbird135@gmail.com', '��⵵ ���ֽ� �ߴ뵿');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'deepfog', 'grayfog124', '���Ʒ�', '010-5812-0007', '880807-2112311', 'deppfong123@gmail.com', '��⵵ ���ֽ� ����');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'juilan', 'venusy982', '������', '010-7761-9872', '800220-2133907', 'rallicate15@gmail.com', '��⵵ ���ֽ� ������');
INSERT INTO PATIENT
VALUES
('P'||PAT_SEQ.NEXTVAL, 'railcat235', 'hospitail883', '�����', '010-3002-1001', '900801-1660077', 'bigtent9090@gmail.com', '��⵵ ���ֽ� ���ѻ꼺��');




--------------------------------------------------------------------------------
-- ���� 120
CREATE SEQUENCE APP_SEQ
START WITH 10000
NOCYCLE NOCACHE;

--�Է���......
--INSERT INTO APPOINTMENT VALUES ('A' || APP_SEQ.NEXTVAL, );




COMMIT;
PROMPT Complete...
