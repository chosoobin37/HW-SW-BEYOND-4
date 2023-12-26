 -- 조회의 6가지 절 모두 활용한 예시
 
-- SELECT: group by 절에서 group을 묶는 조건으로 활용한 컬럼만 조회
--			  또는 그룹 함수를 통해 조회

-- FROM: 테이블 또는 JOIN 활용한 result set 작성  

-- WHERE: FROM 절의 각 행마다 적용될 조건 작성

-- GROUP BY: WHERE 절까지 만족하는 행들에 대해 그룹이 될 컬럼 작성

-- HAVING: 그룹별로 적용할 조건을 group by에서 작성한 컬럼
-- 		  또는 그룹 함수 통해 조회

-- ORDER BY: 제일 마지막에 해석, SELECT의 결과(result set)의 순번, 별칭 컬럼명
--				 등으로 오름차순 또는 내림차순 정렬

 
 SELECT 
 		 category_code
 	 ,  COUNT(*) -- 모든 행 갯수 세기
 	 ,  COUNT(menu_price) -- category_code가 null이 아닌 행만 세기
 	 ,  SUM(menu_price)
 	 ,  AVG(menu_price) --  group by 사용시 그룹함수만 가능(그룹 묶은 column 제외)
 	FROM tbl_menu -- JOIN tbl_category
 	WHERE category_code IS NOT NULL -- 단일행마다의 조건
 	GROUP BY category_code
	HAVING SUM(menu_price) >= 24000 -- 그룹절의 조건
 	ORDER BY 2;

-- -----------------------------------------------
-- 메뉴가 없는 카테고리까지 셀 건지 구분해서 count

SELECT 
		 COUNT(*) -- 전부 count
	 ,  COUNT(menu_name) -- menu_name이 null이 아닌 데이터만 count
	FROM tbl_menu a
	RIGHT JOIN tbl_category b ON (a.category_code= b.category_code);
	
-- ------------------------------------------------
-- 함수의 종류

-- 단일행 함수: NVL 또는 IFNULL과 같이 단일 행마다 적용되어 행의 갯수만큼 결과가 나오는 경우
-- 그룹 함수: COUNT, SUM, AVG 등과 같이 그룹마다 적용되어 그룹의 갯수만큼 결과가 나오는 경우
--            단, GROUP BY절이 없는 조회는 그룹 함수의 결과가 단일행

-- -------------------------------------------------
-- ROLL UP
-- 중간 합체 및 최종 합계 도출
-- GROUP BY에서 두 개 이상의 컬럼으로 그룹 형성시
-- 앞의 컬럼을 기준으로 중간 합계 도출

SELECT 
		 menu_price
	 ,  category_code
	 ,  SUM(menu_price)
	FROM tbl_menu 
	GROUP BY menu_price, category_code
	WITH ROLLUP;
	
CREATE TABLE sales (
	 CODE INT AUTO_INCREMENT,
	 YEAR VARCHAR(4),
	 MONTH VARCHAR(2),
	 product VARCHAR(50),
	 amount DECIMAL(10,2);
	 PRIMARY KEY(CODE)
);

INSERT INTO sales
(
	CODE, YEAR, MONTH,
	product, amount
)
VALUES
(
	NULL, '2023', LPAD('1', 2, '0'), 
	'Product A', 1000.00
)
,
(
	NULL, '2023',  LPAD('1', 2, '0'),
	'Product B', 1500.00
)
,
(
	NULL, '2023',  LPAD('2', 2, '0'), 
	'Product A', 2000.00
)
,
(
	NULL, '2023',  LPAD('2', 2, '0'), 
	'Product B', 2500.00
)
,
(
	NULL, '2023',  LPAD('3', 2, '0'), 
	'Product A', 1200.00
)
,
(
	NULL, '2024',  LPAD('3', 2, '0'), 
	'Product B', 1700.00
);

SELECT * FROM sales;
	
-- LPAD 함수
-- ('3'이 2자리가 아니면 left에 0을 채워라)
	
-- 연, 월, 상품명을 모두 하나의 그룹으로 묶어 
-- 연, 월, 중간 합계 및 전체 합계를 ROLLUP	

SELECT 
		 YEAR 
	 ,  MONTH
	 , product
	 , SUM(amount) AS total_sales 
	FROM sales
	GROUP BY YEAR, MONTH, product
	WITH ROLLUP;

DELETE 
	FROM sales
	WHERE CODE >= 7;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	