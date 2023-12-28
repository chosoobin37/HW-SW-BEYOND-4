 -- VIEW
 
 SELECT
 		 MENU_NAME
 	 ,  MENU_PRICE
	FROM tbl_menu;
	
CREATE OR REPLACE VIEW V_MENU
AS
SELECT
		 MENU_NAME '메뉴이름'
	 ,  MENU_PRICE '메뉴가격'
	FROM tbl_menu;
	
SELECT * FROM V_MENU; 

-- VIEW는 원본 테이블을 참조해서 보여주는 용도
-- -> 실제 보여지는 데이터는 원본 테이블의 데이터

-- 원본(TBL_MENU)의 11번 메뉴 가격을 10원으로 수정

UPDATE tbl_menu
	SET MENU_PRICE=10
	WHERE MENU_CODE=11;
	
-- V_MENU(VIEW)로 확인 -> 원본 수정시 VIEW에도 반영 (VIEW는 별칭으로 조회)
SELECT 메뉴이름 FROM V_MENU;
	
-- --------------------------------------------------
-- VIEW를 통한 DML -> 가능은 하지만 절 대 금 지

SELECT * FROM tbl_menu;

-- VIEW 생성
CREATE VIEW hansik AS
SELECT 
       menu_code 
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu 
 WHERE category_code = 4;

-- 생성된 VIEW 조회
SELECT * FROM hansik;

-- INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');    -- 에러 발생
INSERT 
  INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');   
SELECT * FROM hansik;
SELECT * FROM tbl_menu; -- -> VIEW를 통해 수정해도 원본에 영향 O (그치만 금지)

-- UPDATE THROUGH VIEW 
UPDATE hansik
   SET menu_name = '버터맛국밥', menu_price = 5700 
 WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- DELETE THROUGH VIEW
DELETE FROM hansik WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

DROP VIEW HANSIK; -- VIEW TABLE 삭제

-- CREATE OR REPLACE: 이미 존재하는 VIEW TABLE일 경우 수정 가능
















 	