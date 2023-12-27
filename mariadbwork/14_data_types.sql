-- 1) 명시적 형변환
SELECT AVG(MENU_PRICE) FROM tbl_menu;

-- 소수점에서 반올림해서 정수까지 변환
SELECT CAST(AVG(MENU_PRICE) AS UNSIGNED INTEGER) AS '가격평균' FROM tbl_menu;

-- 소수점 이하 한자리까지 변환
SELECT CAST(AVG(MENU_PRICE) AS FLOAT) AS '가격평균' FROM tbl_menu; 

-- 소수점 이하 12자리까지 변환
SELECT CAST(AVG(MENU_PRICE) AS DOUBLE) AS '가격평균' FROM tbl_menu;

-- 2) 문자 -> 날짜
-- 2023년 12월 27일을 DATE형으로 변환
SELECT CAST('2023$12$27' AS DATE);
SELECT CONVERT('2023/12/27', DATE);
SELECT CONVERT('2023#12#27', DATE);
 
-- 3) 숫자 -> 문자
SELECT CONCAT(CAST(1000 AS CHAR), '원');
 
-- 암시적 형변환
-- 연산자 사용 시 자동 형변환 주의

SELECT 1+'2'; -- 문자열 2를 정수형 2로 자동 형변환, 3 출력
SELECT CONCAT('1'+'2'); -- CONCAT 이용해 문자열끼리의 덧셈으로 처리

SELECT 'HELLO' + 'WORLD'; -- 문자열은 0으로 자동 형변환 돼 0+0으로 처리
SELECT 5 > 'HELLO'; -- HELLO는 0으로 자동 형변환 -> 5>0이라 1(TRUE) 출력
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 