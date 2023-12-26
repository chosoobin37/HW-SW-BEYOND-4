-- 1) 모든 사원 모든 컬럼 조회
SELECT 
		 *
	FROM employee;
	
-- 2) 사원들의 사번, 이름 조회

SELECT 
		 EMP_NAME
	 ,  EMP_ID
	FROM employee;

-- 3) 201번 사번의 사번 및 이름 조회 

SELECT
		 EMP_ID
	 ,  EMP_NAME
	FROM employee
	WHERE EMP_ID = 201;
	
-- 4) employee 테이블에서 부서 코드가 'D9'인 사원 조회

SELECT
		 EMP_NAME
	FROM employee
	WHERE DEPT_CODE = 'D9';
	
-- 5) employee 테이블에서 직급 코드가 'J1'인 사원 조회

SELECT 
		 EMP_NAME
	FROM employee
	WHERE JOB_CODE = 'J1';

-- 6) employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.

SELECT 
		 EMP_ID
	 ,  EMP_NAME
	 ,  DEPT_CODE
	 ,  SALARY
	FROM employee
	WHERE SALARY >= 3000000;
	
-- 7) 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회

SELECT 
	    EMP_NAME
	 ,  DEPT_CODE
	 ,  SALARY
	FROM employee
	WHERE SALARY >= 3000000 AND DEPT_CODE = 'D6';

-- 8) 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회

SELECT
		 EMP_ID
	 ,  EMP_NAME
	 ,  SALARY
	 ,  BONUS 
	FROM employee
	WHERE BONUS IS NULL;
	
-- 9) 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회

SELECT
		 EMP_ID
	 ,  EMP_NAME
	 ,  DEPT_CODE 
	FROM employee
	WHERE DEPT_CODE != 'D9';
	
-- 10) employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)

SELECT
		 EMP_ID AS '사번'
	 ,  EMP_NAME AS '이름'
	 ,  ENT_DATE AS '입사일' 
	FROM employee
	WHERE ENT_YN = 'N';

-- 11) employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기

SELECT 
		 EMP_ID AS '사번'
	 ,  EMP_NAME AS '이름'
	 ,  SALARY AS '급여'
	 ,  DEPT_CODE AS '부서코드'
	 ,  JOB_CODE AS '직급코드' 
	FROM employee
	WHERE SALARY BETWEEN 3500000 AND 5500000;

-- 12) employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회

SELECT
		 EMP_ID
	 ,  EMP_NAME
	 ,  ENT_DATE
	FROM employee
	WHERE EMP_NAME LIKE '%김%';

-- 13) employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회

SELECT
		 EMP_ID
	 ,  EMP_NAME
	 ,  ENT_DATE
	FROM employee
	WHERE EMP_NAME NOT LIKE '%김%';


-- 14) EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회

SELECT
		 EMP_NAME
	 ,  EMP_NO
	 ,  DEPT_CODE
	FROM employee
	WHERE EMP_NAME LIKE '%하%';

 
-- 15) 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회

SELECT 
		 EMP_NAME
	 ,  SALARY 
	 ,  JOB_CODE
	FROM employee
	WHERE (JOB_CODE ='J2' AND SALARY >= 2000000)
	OR (JOB_CODE = 'J7');

 
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회

SELECT
		 EMP_NAME
	 ,  SALARY
	 ,  JOB_CODE
	FROM employee
	WHERE JOB_CODE = 'J2' OR JOB_CODE = 'J7' AND SALARY >= 2000000;
	

-- 17. IN 연산자로 업그레이드

SELECT
		 EMP_NAME
	 ,  SALARY
	 ,  JOB_CODE
	FROM employee
	WHERE JOB_CODE IN ('J2','J7') AND SALARY >= 2000000;
	
-- ------------------------------------------
-- <JOIN 사용 연습문제>              

-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1명)

SELECT
		 EMP_ID
	 ,  EMP_NAME
	 ,  DEPT_TITLE
	FROM employee a
	JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
	WHERE emp_name LIKE '%형%';

-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9명)

SELECT
		 a.EMP_NAME
	 ,  b.JOB_NAME
	 ,  a.DEPT_CODE
	 ,  c.DEPT_TITLE
	FROM employee a
	JOIN JOB b ON (a.JOB_CODE = b.JOB_CODE)
	JOIN department c ON (a.dept_code = c.dept_id)
	WHERE DETP_CODE IN ('D5', 'D6', 'D7');

-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8명)(INNER JOIN 결과)

SELECT
		 a.emp_name
	 ,  a.bonus
	 ,  b.dept_title
	 ,  c.local_name
	FROM employee a
	JOIN department b ON (a.dept_code = b.dept_id)
	JOIN location c ON (b.location_ID = c.local_code)
	WHERE bonus IS NOT NULL;

-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3명)

SELECT
		 a.emp_name
	 ,  b.job_name
	 ,  c.dept_title
	 ,  d.local_name
	FROM employee a
	JOIN job b ON (a.job_CODE=b.job_code)
	JOIN department c ON (a.DEPT_CODE=c.dept_id)
	JOIN location d ON (c.LOCATION_ID=d.local_code)
	WHERE dept_code = 'D2'; 

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20명)

SELECT 
       a.emp_name
      ,b.JOB_NAME
      ,a.salary
      ,case 
         when a.BONUS IS NULL then (a.salary*12)
         when a.BONUS IS NOT NULL then ((a.salary*12)+((a.salary*a.bonus)*12)) 
      END AS '연봉'
   FROM employee a
   JOIN job b ON (a.JOB_CODE = b.JOB_CODE)
   JOIN sal_grade c ON (a.SAL_LEVEL = c.SAL_LEVEL)
 WHERE a.SALARY > c.MIN_SAL;
 
-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15명)

SELECT 
		 a.EMP_name
	 ,  b.dept_title
	 ,  c.local_name
	 ,  d.national_name
	FROM employee a 
	JOIN department b ON (a.dept_code=b.DEPT_ID)
	JOIN location c ON (b.location_id = c.local_code)
	JOIN national d ON (c.NATIONAL_CODE=d.national_code)
	WHERE d.national_code IN ('KO', 'JP');


-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용(60명)

SELECT 
		 a.emp_id -- 동명이인 방지
    ,  a.emp_name
	 ,  a.dept_code
	 ,  b.emp_name
   FROM employee a
   JOIN employee b ON (a.dept_code = b.DEPT_CODE)
 WHERE a.emp_id != b.emp_id
 ORDER BY 1;

-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8명)

SELECT
		 a.emp_name
	 ,  b.job_name
	 ,  a.salary
	FROM employee a
	JOIN job b ON (a.JOB_CODE=b.job_code)
	WHERE a.job_code IN ('J4', 'J7');
	

-- 9. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)

SELECT
 		 a.emp_id
 	 ,  a.emp_name
 	 ,  b.job_name
 	 ,  c.dept_title
 	 ,  d.LOCAL_NAME
 	 ,  a.salary
 	FROM employee a
 	JOIN job b ON (a.job_code = b.job_code) -- LEFT JOIN: 직급이 없는 경우도 직원이기만 하면 조회 가능
 	JOIN department c ON (a.DEPT_CODE=c.dept_id)
 	JOIN location d ON (c.LOCATION_ID=d.LOCAL_CODE)
 	WHERE b.job_name = '대리' AND d.local_name IN ('ASIA1', 'ASIA2', 'ASIA3');
 	-- AND d.local_name LIKE '%ASIA%'
 	-- JOIN의 조건 순차고려
 	-- 다중 JOIN의 경우 한 번 LEFT나 RIGTH JOIN이 생기는 경우 이후에도 전부 LEFT나 RIGHT JOIN 필요

-- 추가 풀이

SELECT 
		 emp_name
	 ,  salary
	 ,  bonus
	 ,  nvl(bonus, 0) -- null 값을 0으로 대체
	 ,  salary*bonus -- 보너스 적용한 급여(보너스 안 받는 사람 계산 불가)
	 ,  salary*nvl(bonus, 0) -- 보너스 적용한 급여(보너스 안 받는 사람 계산 가능)
	 ,  salary*IFNULL(bonus,0)
	 ,  salary*12+salary*nvl(bonus,0)*12 AS '보너스 적용한 연봉'-- 보너스 적용한 연봉 
	 ,  salary*12*(1+nvl(bonus, 0))	 
	FROM employee;




