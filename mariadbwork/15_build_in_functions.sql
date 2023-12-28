-- 1) 문자열 관련 함수

-- ascii code, char(숫자)

SELECT ASCII('a'), CHAR(97);

-- bit_length(문자열), char_length(문자열), length(문자열)
-- 영어, 숫자, 특수기호 제외 한 문자당 3바이트 할당
SELECT 
		 BIT_LENGTH('한글')
	 ,  CHAR_LENGTH('한글')
	 ,  LENGTH('한글');
	 
-- CONCAT(문자열1, 문자열2, ...), CONCAT_WS(구분자, 문자열1, 문자열2)
SELECT CONCAT('nice', 'to', 'meet', 'you!');
SELECT CONCAT(' ', 'nice', 'to', 'meet', 'you!');
SELECT CONCAT(CAST(menu_price AS CHAR), '원') FROM tbl_menu;

-- ELT(위치, 문자열1, 문자열2, ...employeedb) FIELD(찾을 문자열, 문자열1, 문자열2, ...),
-- FIND_IN_SET(찾을 문자열, 문자열 리스트), INSTR(기준 문자열, 부분 문자열),
-- LOCATE(부분문자열, 기준문자열)

SELECT
		 ELT(2, '축구', '야구', '농구')
	 ,  FIELD('축구', '야구', '농구', '축구')
	 ,  FIND_IN_SET('축구', '야구,농구,축구')
	 ,  INSTR('축구농구야구', '농구')
	 ,  LOCATE('야구', '축구농구야구'); -- INSTR과 LOCATE는 서로 위치만 반대

-- INSERT(기준문자열, 위치, 해당위치에서지울길이, 삽입할 문자열);
SELECT INSERT('나와라 피카츄!', 5, 3, '꼬부기'); -- 5번째 위치부터 3개 변경 

-- LEFT(문자열, 길이), RIGHT(문자열, 길이);
SELECT LEFT('HELLO WORLD!', 5),  RIGHT('NICE SHOT!', 5); 

-- UPPER(문자열), LOWER(문자열)
SELECT LOWER('Hello World!'), UPPER('Hello World!');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
SELECT LPAD('왼쪽', 10, '#'), RPAD('오른쪽', 10, '#');

-- LTRIM(문자열), RTRIM(문자열)
-- TRIM(문자열), TRIM(방향 자를 문자열 FROM 문자열)
SELECT LTRIM('      왼쪽'), RTRIM('오른쪽       ');
SELECT 
		 TRIM('    양쪽    ')
	 ,  TRIM(BOTH '@' FROM '@@@@양쪽@@@')
	 ,  TRIM(LEADING '!' FROM '!!!!!양쪽!!!!') -- LTRIM
	 ,  TRIM(TRAILING '%' FROM '%%%양쪽%%%'); -- RTRIM
	 
SELECT CONCAT(menu_name, '의 가격은', 

-- FORMAT (숫자, 소숫점 자릿수)

SELECT FORMAT(12312314566,3);

-- BIN(숫자), OCT(숫자), HEX(숫자)
SELECT BIN(65), OCT(65), HEX(65);

-- REPEAT(문자열, 횟수)
SELECT REPEAT('재미져',5);
SELECT REPEAT('재미져',5);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE ('마리아DB', '마리아', 'MARIA');

-- REVERSE(문자열)
SELECT REVERSE ('MARIADB');

-- SPACE(길이)
SELECT CONCAT ('제 포켓몬은', SPACE(3), '이고, 속성은', SPACE(6), '입니다.');

-- SUBSTRING(문자열,  시작위치, 길이)
SELECT SUBSTRING('열심히 DB공부를 같이 해봅시다!', 5, 4);

SELECT 
		 SUBSTRING('열심히 DB공부를 해봅시다!', 5, 4)
	 ,  SUBSTRING('열심히 DB공부를 해봅시다!', 11); -- 11번째 문자부터 끝까지
	 
-- SUBSTRING_INDEX(문자열, 구분자, 횟수)
SELECT
		 SUBSTRING_INDEX('010-123-1234', '-', 2) -- '-'기준으로 왼쪽으로부터 두 묶음
	 ,  SUBSTRING_INDEX('010-123-1234', '-', -1); -- '-'기준으로 오른쪽으로부터 한 묶음

-- 2) 숫자 관련 함수

-- ABS(숫자)
SELECT ABS(-123);

-- CEILING(숫자): 올림, FLOOR(숫자): 버림, ROUND(숫자): 반올림
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV('A', 16, 2);

-- MOD(숫자1, 숫자2): 나머지 함수
SELECT MOD(10, 3);

-- POW(숫자1, 숫자2):제곱, SQRT(숫자): 제곱근
SELECT POW(3, 2), SQRT(81);

-- 3) 날짜 및 시간 관련 함수





































