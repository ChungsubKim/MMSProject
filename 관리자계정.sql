CONN hr/hr;
-- ����Ŭ ��ġ�� �⺻���� �����Ǵ� hr������ �⺻  ����� ����(Lock)
-- ����� ������ lock�� �����Ϸ��� , �����ڰ������� ó����
ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

-- ������ �������� ���ο� ����� ���� �����
CREATE USER scott IDENTIFIED BY tiger;

CONNECT scott/tiger;  -- ���� ������ �����Ƿ� ������
-- ���� �õ����� �������� �����ڰ����� ������ ������
-- ���� ������ �ο��� ��
GRANT CONNECT TO scott;
CONN scott/tiger;
SHOW USER;