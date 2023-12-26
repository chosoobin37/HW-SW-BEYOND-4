
-- INSERT 
DESC tbl_menu;
INSERT 
	INTO tbl_menu
(
	menu_code
,  menu_name
,  menu_price
,  category_code
,  orderable_status
)
	VALUES 
(
	NULL, '바나나해장국'
,  8500
,  4
,  'Y'
);

SELECT * FROM tbl_menu ORDER BY 1 DESC; -- 가장 최근에 추가한 내역 확인 가능

-- DELETE 

DELETE 
	FROM tbl_menu
	WHERE menu_code = 23;
	
-- UPDATE -- 컬럼의 값 수정 구문(전체 행 갯수 변화 X)

UPDATE tbl_menu
 	SET menu_name = '딸기해장국'
WHERE menu_code = 22; -- where절 통해 선택해서 수정

SELECT * FROM tbl_menu ORDER BY 1 DESC;

DELETE FROM tbl_menu
ORDER BY menu_price
LIMIT 2;

-- REPLACE 

REPLACE 
	INTO tbl_menu
(
	menu_code, menu_name, menu_price
,  category_code, orderable_status
)

VALUES 
(
	17, '아샷추매운탕', 9000
,  4, 'N'
);

SELECT * FROM tbl_menu ORDER BY 1 DESC;





















