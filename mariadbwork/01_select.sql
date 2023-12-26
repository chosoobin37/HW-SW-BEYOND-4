SELECT menu_code, menu_NAME, menu_price FROM tbl_menu;
SELECT
   	  menu_code
		, menu_name
		, menu_price
	FROM tbl_menu;
	
DESC tbl_category;	
	
SELECT 
		 menu_name
	 ,	 category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);

-- -------------------------------------------------------------

SELECT 7+3;
SELECT 10*2;
SELECT 7+3 AS '합', 10*2 AS '곱';
SELECT 7+3 AS '합입니다.', 10*2 AS '곱입니다.';
SELECT NOW() '현재시간';
SELECT NOW();
SELECT CONCAT('유', ' ', '관순'); -- select '유 관순';

-- -------------------------------------------------------------