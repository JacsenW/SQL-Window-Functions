CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    hire_date DATE,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 100),
    salary NUMERIC(10, 2)
);
