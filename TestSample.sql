-- USER_NO�� ������Ű�� ������
CREATE SEQUENCE SEQ_USER_NO;

-- BOARD_NO�� ������Ű�� ������
CREATE SEQUENCE SEQ_BOARD_NO;

-- BOARD���̺��� BOARD_COUNT�� DEFAULT 0�߰�
ALTER TABLE BOARD MODIFY (BOARD_COUNT DEFAULT 0);

-- BOARD���̺� �ۼ��� ������ �÷� CREATE_DATE �߰�
ALTER TABLE BOARD ADD CREATE_DATE DATE DEFAULT SYSDATE NOT NULL;

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
                     , B.CREATE_DATE
                  FROM BOARD_VIEW B
                  JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
                 ORDER
                    BY B.CREATE_DATE DESC
               ) B
       )
 WHERE RNO BETWEEN 11 AND 20;
 
-- �Խñ� �� ����
SELECT COUNT(*) MAX
  FROM BOARD_VIEW;
  