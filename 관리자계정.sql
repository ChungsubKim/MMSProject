CONN hr/hr;
-- 오라클 설치시 기본으로 제공되는 hr계정은 기본  잠겨져 있음(Lock)
-- 사용자 계정의 lock을 해제하려면 , 관리자계정에서 처리함
ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

-- 관리자 계정에서 새로운 사용자 계정 만들기
CREATE USER scott IDENTIFIED BY tiger;

CONNECT scott/tiger;  -- 접속 권한이 없으므로 에러남
-- 접속 시도에서 에러나면 관리자계정도 접속이 해제됨
-- 접속 권한을 부여해 줌
GRANT CONNECT TO scott;
CONN scott/tiger;
SHOW USER;