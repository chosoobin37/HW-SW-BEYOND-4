
SELECT dept_code FROM employee WHERE emp_name = '유재식'; -- subquery (한 개만 추출해서 도와주는 역할)
SELECT * FROM employee WHERE dept_code='D6'; -- D6 위치에 서브쿼리 코드가 위치

-- main query에서 subquery를 포함해서 코드 작성
SELECT
		 *
	FROM employee
	WHERE dept_code = (SELECT dept_code 
								FROM employee -- subquery coding convetion
								WHERE emp_name = '유재식');
					
-- 이와 같은 방법으로 유재식 씨 사원번호 추출해서 해당 사원 제거

SELECT
		 *
	FROM employee -- subquery절 가능
	WHERE dept_code = (SELECT dept_code
								FROM employee 
								WHERE emp_name = '유재식')
	AND emp_id <> (SELECT emp_id
								FROM employee
								WHERE emp_name = '유재식');
								
-- -------------------------------------------------
-- employee db ver.
-- -------------------------------------------------

--  상관 서브쿼리
-- 메뉴 조회 시 메뉴의 카테고리에 있는 메뉴들의 평균 가격보다 높은 메뉴만 조회
-- (상관 subquery 단일행 subquery)

SELECT 
		 a.menu_code
	 ,  a.menu_name
	 ,  a.menu_price
	 ,  a.category_code
	 , orderable_status
	FROM tbl_menu a
	WHERE a.menu_price > (SELECT AVG(b.menu_price) -- 단일행 subquery
									FROM tbl_menu b
									WHERE b.category_code = a.category_code); 

-- 메뉴 카테고리의 평균과 같은 가격의 메뉴 조회(상관 subquery 사용X 다중형 subquery)

SELECT 
		 *
	FROM tbl_menu a 
	WHERE a.menu_price IN (SELECT AVG(b.menu_price) -- 다중행 subquery
									FROM tbl_menu b
									GROUP BY category_code);

-- 메뉴가 있는 카테고리 조회
							
SELECT
       category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 1
                FROM tbl_menu b
                WHERE b.category_code = a.category_code)
 ORDER BY 1;			
 
-- 4번 카테고리를 메인 쿼리에서 where조건 판별 중 동작하는 서브쿼리
 
SELECT 1
	FROM tbl_menu b
	WHERE b.category_code =5;
  
-- JOIN을 활용한 메뉴가 있는 카테고리 조회

SELECT 
		 --  a.category_name,
		 a.category_code
	FROM tbl_category a
	JOIN tbl_menu b ON (a.category_code=b.category_code)
	GROUP BY a.category_code, a.category_name
	ORDER BY 1;
  
-- 1. 가장 높은 급여를 받는 사원 조회 (MAX(컬럼명))

SELECT
       MAX(salary)
  FROM employee;

SELECT
       *
  FROM employee
 WHERE salary = (SELECT MAX(salary)
                   FROM employee);
                                   

-- 2. 평균 급여가 가장 높은 부서 조회하기
--   (AVG(컬럼명), >= ALL)

-- i) 이중 서브 쿼리를 활용한 방법
SELECT AVG(salary)
  FROM employee
 GROUP BY dept_code;
 
SELECT MAX(a.sal_avg) AS max_avg
  FROM (SELECT AVG(salary) sal_avg -- 별칭 필수 !! (AVG(salary)) -> 연산식이기 때문
          FROM employee
         GROUP BY dept_code) a;
         
SELECT
       dept_code
  FROM employee
 GROUP BY dept_code
HAVING AVG(salary) = (SELECT max(a.sal_avg)
                        FROM (SELECT AVG(salary) sal_avg
                                FROM employee
                               GROUP BY dept_code) a);
                               
-- ii) >= ALL을 활용한 방법
-- 서브쿼리 중에 다중행 서브쿼리인 경우에는 비교 연산자가 일반 비교연산자와 달라짐
-- >ALL, <ALL, >ANY, <ANY, IN

-- 1. >ALL 모든 서브쿼리 결과보다 크다. (서브쿼리 최대값보다 크다)
-- 2. <ALL 모든 서브쿼리 결과보다 작다. (서브쿼리 최소값보다 작다)
-- 3. >ANY 서브쿼리 결과보다 최소 하나는 크다. (서브쿼리의 최소값보다 크다)
-- 4. <ANY 서브쿼리 결과보다 최소 하나는 작다. (서브쿼리의 최대값보다 크다)
-- 5. IN: 서브쿼리 결과 중에 하나라도 일치한다. 

SELECT
       dept_code
  FROM employee
 GROUP BY dept_code
HAVING AVG(salary) >= ALL (SELECT AVG(salary)
                             FROM employee
                            GROUP BY dept_code);
                            
DESC employee;
DESC department;

 


                     
                     
                     

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  