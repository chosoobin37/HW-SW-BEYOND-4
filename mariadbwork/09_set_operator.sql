-- UNION (합집합) 중복레코드 제거 후 출력	
 
SELECT 
		 menu_code
	 ,  menu_name
	 , menu_price
	 , category_code
	 , orderable_status
	FROM tbl_menu 
	where category_code = 10
	UNION
	SELECT 
		 menu_code
	 ,  menu_name
	 ,  menu_price
	 ,  category_code
	 ,  orderable_status
	FROM tbl_menu
	WHERE menu_price <9000;

-- UNION ALL(덧셈)

SELECT 
		 menu_code
	 ,  menu_name
	 , menu_price
	 , category_code
	 , orderable_status
	FROM tbl_menu 
	where category_code = 10
	UNION ALL 
	SELECT 
		 menu_code
	 ,  menu_name
	 ,  menu_price
	 ,  category_code
	 ,  orderable_status
	FROM tbl_menu
	WHERE menu_price <9000;

-- intersect (교집합) 공식적으로는 지원X 연산 
-- inner join 활용 시

SELECT 
		 menu_code
	 ,  menu_name
	 , menu_price
	 , category_code
	 , orderable_status
	FROM tbl_menu 
	WHERE category_code = 10
	intersect
	SELECT 
		 menu_code
	 ,  menu_name
	 ,  menu_price
	 ,  category_code
	 ,  orderable_status
	FROM tbl_menu
	WHERE menu_price <9000;

-- minus (차집합)

SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
     ,  b.*
  FROM tbl_menu a
  LEFT JOIN (SELECT menu_code
                  , menu_name
                  , menu_price
                  , category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10
   AND b.menu_code IS NULL;





























