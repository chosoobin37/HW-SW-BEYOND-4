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

-- 2) 숫자 관련 함수

-- 3) 날짜 및 시간 관련 함수



































