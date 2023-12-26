-- 오름차순
SELECT
		 menu_code
	  , menu_name
	  , menu_price
 FROM tbl_menu
ORDER BY menu_price ASC; -- ascendign <-> descending

-- 내림차순
SELECT
		 menu_code
	  , menu_name
	  , menu_price
 FROM tbl_menu
ORDER BY menu_price DESC; 

-- 컬럼의 순번을 활용한 정렬
-- (실제 테이블의 순서가 아닌 조회할 때의 컬럼 순서 기준)
SELECT
		 menu_price  -- 첫번째
	 ,  menu_name	 -- 두번째
 FROM tbl_menu
 ORDER BY 1 ASC;

-- 별칭을 활용한 정렬
SELECT
		 menu_price AS 'pr'
	 , menu_name AS 'mn'
 FROM tbl_menu
 ORDER BY pr DESC; -- 별칭으로 정렬할 때는 별칭명에 single quatation(') 붙이면 X

-- 컬럼의 복수개로 정렬
SELECT
		 menu_price
	 ,  menu_name
 FROM tbl_menu
 ORDER BY 1 DESC, 2 ASC;
-- default로는 DESC 데이터가 같을 경우 ASC로 정렬
-- '가격'으로 내림차순 정렬, 같은 가격 있을 경우 '메뉴 이름'을 오름차순으로 조회

-- field

SELECT FIELD ('a', 'b', 'z', 'a');

SELECT
		 FIELD(orderable_status, 'N', 'Y')
	 ,  orderable_status
	 ,  menu_name
	 ,  menu_code
  FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;

--  ----------------------------------------

-- null 값 정렬

-- 1) 오름차순 시 NULL 값이 맨처음

SELECT 
		 *
  FROM tbl_category
 ORDER BY tbl_category ASC; -- null이 맨 앞으로 나머지는 내림차순

-- 2) 내림차순 시 NULL 값이 맨나중
SELECT 
		 *
  FROM tbl_category
 ORDER BY ref_category_code DESC;
 
 -- 3) 오름차순에서 NULL이 나중에 나오도록
SELECT 
		 *
  FROM tbl_category
 ORDER BY -ref_category_code DESC; 
-- DESC를 통해 NULL을 내중에 보냄 -> -로 NULL이 아닌 값을 ASC로 바꿈
 
 -- 4) 내림차순에서 NULL이 먼저 나오도록
SELECT 
		 *
  FROM tbl_category
 ORDER BY -ref_category_code ASC;
-- ASC를 통해 NULL을 내중에 보냄 -> -로 NULL이 아닌 값을 DESC로 바꿈
 





















 
 
 
 