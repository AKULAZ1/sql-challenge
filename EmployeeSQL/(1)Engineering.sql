-- Titles 
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE Titles(
	title_id VARCHAR (5) PRIMARY KEY,
	title VARCHAR
);

-- Employees 
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE Employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (5),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR (1),
	hire_date VARCHAR (9),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- Departments
DROP TABLE IF EXISTS departments;
CREATE TABLE Departments(
	dept_no VARCHAR (4) PRIMARY KEY,
	dept_name VARCHAR
);

-- Department Manager
DROP TABLE IF EXISTS deptMgr CASCADE;
CREATE TABLE deptMgr(
	dept_no VARCHAR (4),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Department Employees
DROP TABLE IF EXISTS deptEmp CASCADE;
CREATE TABLE deptEmp(
	emp_no INT,
	dept_no VARCHAR (4),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Salaries
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);