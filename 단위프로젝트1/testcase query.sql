SELECT * FROM Billboard; -- 자유게시판 전체 조회

INSERT INTO Billboard VALUES -- 자유게시판 새 게시물 작성
(NULL,' 맙소사푸바옹넘커엽자나아',NOW(),50,5,'kimjaehyeon');

INSERT INTO Billboard VALUES 
(NULL,' 우리집에는 폴킴을 닮은 햄쥑이가 살아요',NOW(),55,8,'kimjaehyeon');

INSERT INTO Billboard VALUES 
(NULL,' 푸바오는돼지야',NOW(),23,5,'kimjaehyeon');

UPDATE Billboard -- 자유게시판 내용 수정 및 게시 시간 수정
   SET board_content = '맙소사푸바넘커엽자나'
     , board_date = NOW()
 WHERE freeboard = 8;
 
DELETE -- 자유게시판 게시글 삭제
  FROM Billboard
 WHERE freeboard = 8;
 
-- ---------------------------------------

SELECT * FROM WLOP_Type;
SELECT * FROM AnimalCategory;
SELECT * FROM Animal_type_category;

INSERT INTO Animal_type_category VALUES 
 (1,1)
,(1,2)
,(1,3)
,(2,1)
,(2,2)
,(2,3)
,(3,1)
,(3,2)
,(3,3)
,(4,1)
,(4,2)
,(4,3)
,(5,1)
,(5,2)
,(5,3);


 
 
 
 
 
 
 
 
 

 
 
 
 
 