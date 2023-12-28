-- INDEX
SELECT * FROM tbl_menu;

CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT 
  INTO phone (phone_code , phone_name , phone_price )
VALUES 
(1, 'galaxyS23', 1200000),
(2, 'iPhone14pro', 1433000),
(3, 'galaxyZfold3', 1730000);

SELECT * FROM phone;

-- 단순조회
SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- 조회의 실행계획 확인
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- WHERE절에 활용한 컬럼에 INDEX를 추가
CREATE INDEX IDX_NAME ON PHONE (PHONE_NAME);

SHOW INDEX FROM PHONE;

EXPLAIN SELECT * FROM PHONE WHERE PHONE_NAME = 'iPhone14pro';

-- INDEX는 주기적으로 다시 달아줘야 함 (주기적 갱신 필요)
OPTIMIZE TABLE PHONE;

-- INDEX 삭제 후 확인
DROP INDEX IDX_NAME ON PHONE;
SHOW INDEX FROM PHONE;











