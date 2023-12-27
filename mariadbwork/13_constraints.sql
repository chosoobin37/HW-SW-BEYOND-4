
-- 1. NOT NULL 

DROP TABLE IF EXISTS user_notnull;

CREATE TABLE IF NOT EXISTS user_notnull (
    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
) ENGINE=INNODB;

INSERT 
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_notnull;

-- user_id NULL error
INSERT
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', NULL, '남', '010-222-2222', 'lee222@gmail.com'); 

-- 2. UNIQUE

DROP TABLE IF EXISTS user_unique;
	
CREATE TABLE IF NOT EXISTS user_unique (
    user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE (phone)
) ENGINE=INNODB;

INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_unique;

-- PHONE duplicate error
INSERT 
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');

-- 3. PRIMARY KEY

DROP TABLE IF EXISTS user_primarykey;

CREATE TABLE IF NOT EXISTS user_primarykey (
--     user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no)
) ENGINE=INNODB;

INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_primarykey;

-- PRIMARY KET NULL error
INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(null, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');

-- PRIMARY KEY duplicate error
INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(2, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');

-- -----------------------------------
-- 4. FORIEGN KEY 
-- * 1:多 관계 = 부모:자식 EX) 부서(부모):사원(자식)


-- 4-1. 부모 테이블(회원등급) 선 생성 
DROP TABLE IF EXISTS user_grade;

CREATE TABLE IF NOT EXISTS user_grade (
    grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;

INSERT 
  INTO user_grade
VALUES 
(10, '일반회원'), -- 여러 데이터들이 10, 20, 30 중에 포함될 것이기 때문에 부모테이블 (먼저 생성)
(20, '우수회원'),
(30, '특별회원');

SELECT * FROM user_grade;

-- 4-2. 자식 테이블(회원) 후 생성

DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code) -- 부모 코드를 참조할 것이다.
) ENGINE=INNODB;

INSERT 
  INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

SELECT * FROM user_foreignkey1;

-- child row update X -> parent row에 없는 데이터 (상속 불가)
INSERT 
  INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com', 50);

-- 자식 테이블에서 FOREIGN KEY 제약조건 컬럼 NULL값으로 INSERT 
-- 부모 테이블과 연결된 값에 NULL 넣을시 부모테이블과 연결 끊기며 ERROR X
INSERT 
  INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com', NULL);

-- -------------------------------------------------------------
-- 5. 적용한 FOREIGN KEY 계약 조건

DROP TABLE IF EXISTS user_foreignkey2;

CREATE TABLE IF NOT EXISTS user_foreignkey2 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
        ON UPDATE SET NULL
        ON DELETE SET NULL
) ENGINE=INNODB;

INSERT 
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

SELECT * FROM user_foreignkey2;

-- USER _FOREIGNKEY1 테이블은 삭제룰을 적용하지 않고 20 참조한 데이터 有 (삭제 불가능)
DELETE FROM USER_GRADE WHERE GRADE_CODE = 20; 
-- USER_FOREIGNKEY1 테이블을 참조하는 데이터 삭제
DELETE FROM USER_FOREIGNKEY1 WHERE 1=1;

SELECT * FROM USER_FOREIGNKEY2;
-- USER_FOREIGNKEY1 테이블 삭제
DELETE FROM USER_GRADE WHERE GRADE_CODE = 20;

-- 부모 테이블에 새로운 회원등급 추가
INSERT INTO USER_GRADE
VALUES(40, '에메랄드 회원');

-- NULL 값으로 변화된 자식 테이블의 행들을 새로 추가한 회원 등급으로 UPDATE
UPDATE USER_FOREIGNKEY2
	SET GRADE_CODE=40
	WHERE GRADE_CODE IS NULL;

-- 확인
SELECT * FROM USER_FOREIGNKEY2;

-- --------------------------------------------------
-- 6. CHECK 
-- (계약조건 - 조건식을 활용한 구체적인 제약조건)

DROP TABLE IF EXISTS user_check;

CREATE TABLE IF NOT EXISTS user_check (
    user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남','여')),
    age INT CHECK (age >= 19)
) ENGINE=INNODB;

INSERT 
  INTO user_check
VALUES 
(null, '홍길동', '남', 25),
(null, '이순신', '남', 33);

SELECT * FROM user_check;

-- 성별 2글자 ERROR
INSERT 
  INTO user_check
VALUES (null, '안중근', '남성', 27);

-- USER AGE ERROR
INSERT 
  INTO user_check
VALUES (null, '유관순', '여', 17);

-- ----------------------------------------------
-- 7. DEFAULT

DROP TABLE IF EXISTS tbl_country;

CREATE TABLE IF NOT EXISTS tbl_country (
    country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
) ENGINE=INNODB;

SELECT * FROM tbl_country;

-- DEFAULT로 INSERT 또는 UPDATE 하면 DEFAULT로 초 기 셋팅된 값 적용
INSERT 
  INTO tbl_country
VALUES (null, default, default, default, default);

SELECT * FROM tbl_country;

-- ISNSERT 시 DEFAULT로 설정된 컬럼을 무시하고 INSERT 하면 NULL이 아닌 DEFAULT로 초기 셋팅 값 적용
INSERT 
	INTO TBL_COUNTRY(COUNTRY_CODE)
VALUES
(NULL);












