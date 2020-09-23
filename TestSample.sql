-- USER_NO�� ������Ű�� ������
CREATE SEQUENCE SEQ_USER_NO;

-- BOARD_NO�� ������Ű�� ������
CREATE SEQUENCE SEQ_BOARD_NO;

-- BRE_NO�� ������Ű�� ������(REPLY���̺�)
CREATE SEQUENCE SEQ_BRE_NO;

-- BOARD���̺��� BOARD_COUNT�� DEFAULT 0�߰�
ALTER TABLE BOARD MODIFY (BOARD_COUNT DEFAULT 0);

-- BOARD���̺� �ۼ��� ������ �÷� CREATE_DATE �߰�
ALTER TABLE BOARD ADD CREATE_DATE DATE DEFAULT SYSDATE NOT NULL;

-- REPLY���̺��� USER_NO2�� USER_NO���� ����
ALTER TABLE REPLY RENAME COLUMN USER_NO2 TO USER_NO;

-- ��� �׽�Ʈ�� ���� ������
INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_01'
  , 'pass_01'
  , 'test_01'
  , 'test-01@gmial.com'
  );

INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_02'
  , 'pass_02'
  , 'test_02'
  , 'test-02@gmial.com'
  );
  
INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_03'
  , 'pass_03'
  , 'test_03'
  , 'test-03@gmial.com'
  );
  
COMMIT;

-- �Խ��� ����Ʈ ��ȸ ����Ʈ��
CREATE OR REPLACE VIEW BOARD_VIEW AS
SELECT *
  FROM BOARD
 WHERE STATUS = 'Y';
 
SELECT *
  FROM (
        SELECT ROWNUM RNO, B.*
          FROM (
                SELECT
                       B.BOARD_NO
                     , B.USER_NO
                     , M.MEM_NAME
                     , M.MEM_PIC
                     , B.BOARD_TITLE
                     , B.BOARD_CATEGORY
                     , B.BOARD_CONTENT
                     , TO_CHAR(B.CREATE_DATE, 'yyyy-MM-dd') CREATE_DATE
                  FROM BOARD_VIEW B
                  JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
                 ORDER
                    BY B.CREATE_DATE DESC
               ) B
       )
 WHERE RNO BETWEEN 1 AND 10;
 
-- �Խñ� �� ����
SELECT COUNT(*) MAX
  FROM BOARD_VIEW;


-- �Խñ� ���
INSERT
  INTO BOARD
  (
    BOARD_NO
  , USER_NO
  , BOARD_TITLE
  , BOARD_CATEGORY
  , BOARD_CONTENT
  )
  VALUES
  (
    SEQ_BOARD_NO.NEXTVAL
  , 1
  , 'writeTest'
  , '�ϻ�'
  , '�ִ� �Ͽ��� ����� ������ ���л��̴�. ���� �ε��ϰڴٴ� ���̸�, ���� ��´�. ����� ������ ũ�� �ʹ� ���Ÿ� ���´�. �𷡻��� �ΰ��� ������ ���̸� ưư�ϸ�, �׵鿡�� �̻��� ���� �� ���ִ�. ���� ������ ��ȭ������ �츮�� ��ī�ο쳪 �� ����� ���� ����� ���̴�. �ִ� ������ ��Ⱑ ��´�. �׸��ڴ� û�ῡ���� �Ͽ��� �ӿ� ǳ���ϰ� û���� ���Ͽ���. �װ��� ���ҳ⿡�Լ� �츮 ���� õ�� �ϴ� ��� Ȳ�ݽô��� ���ִ�. ���꿡�� ���ڴ� ������ Į�̴�. Ȳ�ݽô븦 ���� ������ Ȳ�ݽô��� ���� ���Ͽ�, ���� ���� �Ƹ��ٿ��? ���� �ǰ� �׵鿡�� ���� �츮�� �̴� �縷�̴�.

���Ͽ� �� Ʈ��, ��Ȳ�Ͽ���, �ϴ� �����ϰ�, �̻��� ���� Ȳ�ݽô��. ���� ���� �ִ� ����� �̰��̴�. �����ϸ�, ��� �׵鿡�� ���ٶ��̴�. ���� ���ٳ���, ������ ���縦 ���� ������ �̻��� ����� öȯ�Ͽ��°�? û���� ������ ǰ�� ������ �ҷ� �׵��� �̻��� �װ��� �Ƹ��ٿ��? ������ ���� ��⸸ ������ ���Ͽ� �ִ°�? �ڽŰ� ��Ȳ�Ͽ�����, ���� ���̴� ���ҳ⿡�Լ� ���� �׵��� ����� �ƴϴ�. �μ��� ���߿��� ǳ���ϰ� Ǯ�� �ƴϴ�. �̴� �̻��� �ΰ��� ������ �� ������ �׿� ������ �Ǵ�. ���� �������ν� ������ �Ǿ�� ���̴�.

���Ͽ�, ���� ���� ��ġ�� ��õ���� ����� ��⿡�Լ� ������̴�. �Ƿ� ��⿡�Լ� ���� �Ҿ� ������ ������ ��ȭ������ ���ٶ��̴�. �ε��ϰڴٴ� �׵��� ���� �̻��� ���Ͽ� ���ٶ��� ���̸� �ƴϴ�. �̻�, �ƴϴ���, �츮�� ������ ������ �ҷ� ���� ������ Į�̴�. ǰ����, ���̴� ���̸�, �׷��Ƿ� ��ڸ�, �̰��̴�. �� ������� ������, õ�ڸ�ȫ�� ������ �����ϸ�, �̰��̴�. ����� ����ϴ� �ǰ� ���� �λ��� �� ��ȭ������ �̰��̴�. ���� �� ������ ������̴�. ������ �� �� �׵鿡�� ����� ���̴�.'
  );
  
-- �Խñ� ����
UPDATE
       BOARD_VIEW
   SET BOARD_TITLE = 'UPDATETEST5'
     , BOARD_CATEGORY = '�ϻ�'
     , BOARD_CONTENT = 'UPDATETEST5'
 WHERE BOARD_NO = 389;

-- �ϹݰԽ��� ��� ��
CREATE OR REPLACE VIEW BOARD_REPLY_VIEW AS
SELECT *
  FROM REPLY
 WHERE STATUS = 'Y'
 ORDER
    BY BRE_DATE DESC;
  
-- �ش� �Խñ��� ��� ������ ������
SELECT COUNT(*)
  FROM BOARD_REPLY_VIEW
 WHERE BOARD_NO = 396
   AND BOARD_TYPE = '����';

-- �ش� �Խñ� �ֻ�� ��� ��ȣ
SELECT BRE_NO
  FROM (
        SELECT ROWNUM RNO, BRE_NO
          FROM BOARD_REPLY_VIEW
         WHERE BOARD_NO = 396
           AND BOARD_TYPE = '����'
       )
 WHERE RNO = 1;

-- ��� ����Ʈ ��ȸ
SELECT *
  FROM (
        SELECT
               ROWNUM RNO
             , B.BRE_NO
             , B.USER_NO
             , B.MEM_NAME
             , M.MEM_PIC
             , B.BOARD_NO
             , B.BRE_CONTENT
             , TO_CHAR(B.BRE_DATE, 'yyyyMMdd HH:mm') BRE_DATE
          FROM BOARD_REPLY_VIEW B
          JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
         WHERE BOARD_NO = 396
           AND BOARD_TYPE = '����'
        )
 WHERE RNO BETWEEN 1 AND 10;
 
-- ��� ����
UPDATE
       BOARD_REPLY_VIEW
   SET BRE_CONTENT = '������'
 WHERE BRE_NO = 131;
 
ROLLBACK;
