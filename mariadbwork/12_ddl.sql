CREATE TABLE If NOT EXISTS tbl (
	pk INT PRIMARY KEY,
	fk INT,
	coll VARCHAR(255),
	CHECK(coll IN ('Y', 'N'))
)	ENGINE=INNODB;

DESC tbl;

INSERT 
	INTO tbl
VALUES 
(
	1, 2, 'Y'
);

-- ----------------------------------------------
-- auto_increment

-- DROP TABLE tb2; -> 테이블 전체 삭제

CREATE TABLE If NOT EXISTS tb2 (
	pk INT PRIMARY KEY AUTO_INCREMENT,
	fk INT,
	coll VARCHAR(255),
	CHECK(coll IN ('Y', 'N'))
)	ENGINE=INNODB;

DESC tb2;

INSERT 
	INTO tb2
VALUES 
(
	NULL, 2, 'Y'
);

-- ------------------------------------------
-- ALTER: 컬럼 추가

ALTER TABLE tb2 ADD col2 INT NOT NULL;

DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;

DESC tb2;

-- column 이름 및 정의 변경

ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESC tb2;

-- auto_increment 제거

ALTER TABLE tb2 MODIFY pk INT;

-- 다시 primary_key 제거

ALTER TABLE tb2 DROP PRIMARY KEY;

-- -----------------------------------
-- TRUNCATE -> 초기화 (DELETE보다 빠르게/데이터 확인 과정X)


CREATE TABLE IF NOT EXISTS tb6 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
	fk INT,
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y', 'N'))
)	ENGINE=INNODB;

INSERT INTO tb6 VALUES
(NULL, 10, 'Y'),
(NULL, 20, 'Y'),
(NULL, 30, 'Y'),
(NULL, 40, 'Y');

SELECT * FROM tb6;

TRUNCATE tb6;











