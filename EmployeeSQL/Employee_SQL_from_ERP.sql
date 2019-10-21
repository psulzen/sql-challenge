-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" char(10)   NOT NULL,
    "dept_name" char(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" char(10)   NOT NULL,
    "dept_no" char(10)   NOT NULL,
    "from_date" char(10)   NOT NULL,
    "to_date" char(10)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" char(10)   NOT NULL,
    "emp_no" char(10)   NOT NULL,
    "from_date" char(10)   NOT NULL,
    "to_date" char(10)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" char(10)   NOT NULL,
    "birth_date" char(10)   NOT NULL,
    "first_name" char(50)   NOT NULL,
    "last_name" char(50)   NOT NULL,
    "gender" char(10)   NOT NULL,
    "hire_date" char(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" char(10)   NOT NULL,
    "salary" float   NOT NULL,
    "from_date" char(10)   NOT NULL,
    "to_date" char(10)   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" char(10)   NOT NULL,
    "title" char(10)   NOT NULL,
    "from_date" char(10)   NOT NULL,
    "to_date" char(10)   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

