-- 1. ROW_NUMBER(): Assign order of hire within each department
SELECT
    name,
    department,
    hire_date,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY hire_date) AS hire_order
FROM employees;

-- 2. RANK() and DENSE_RANK(): Rank employees by performance score with and without gaps
SELECT
    name,
    department,
    performance_score,
    RANK() OVER (PARTITION BY department ORDER BY performance_score DESC) AS rank_position,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY performance_score DESC) AS dense_rank_position
FROM employees;

-- 3. LAG() and LEAD(): Compare hire dates of previous and next employees in each department
SELECT
    name,
    department,
    hire_date,
    LAG(hire_date) OVER (PARTITION BY department ORDER BY hire_date) AS prev_hire_date,
    LEAD(hire_date) OVER (PARTITION BY department ORDER BY hire_date) AS next_hire_date
FROM employees
ORDER BY department, hire_date;

-- 4. SUM() OVER(): Calculate running total of performance scores by department over hire date order
SELECT
    name,
    department,
    hire_date,
    performance_score,
    SUM(performance_score) OVER (PARTITION BY department ORDER BY hire_date) AS running_total_performance
FROM employees
ORDER BY department, hire_date;
