-- distinct
-- distinct는 해당 컬럼의 종류를 보여준다

SELECT
		 DISTINCT category_code
	 ,  menu_name
	FROM tbl_menu;
	
-- distinct 사용 시에는 일반 컬럼 사용불가 (distinct 무의미)

SELECT
		 DISTINCT category_code
-- 	 ,  menu_name
	FROM tbl_menu;

-- null 값을 포함한 컬럼의 distinct

SELECT 
		 DISTINCT ref_category_code
	FROM tbl_category;

-- null을 나중으로 보내는 정렬

SELECT
		 DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY 1 DESC;
	
SELECT
		 DISTINCT ref_category_code AS 'rcc'
	FROM tbl_category
	ORDER BY -rcc DESC; 

-- 기본 정렬의 개념(순번이나 별칭 활용 필수)은 syntax error 발생

SELECT
		 DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY DISTINCT ref_category_code DESC; -- error
	
-- ----------------------------------------
-- column 2개 이상도 distinct로 묶을 수는 있지만 권장X
-- column 2개 이상 부터는 group by 토애 중복 제거

SELECT 
		 DISTINCT category_code, orderable_status
	FROM tbl_menu;
	
-- -----------------------------------------


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	