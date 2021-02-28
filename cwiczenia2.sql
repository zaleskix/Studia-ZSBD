-- Usuwanie tabel
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE jobs CASCADE CONSTRAINTS;
DROP TABLE job_history CASCADE CONSTRAINTS;
DROP TABLE countries CASCADE CONSTRAINTS;
DROP TABLE regions CASCADE CONSTRAINTS;
DROP TABLE locations CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

-- Kopiowanie tabel
CREATE TABLE ZALESKI.departments AS (SELECT * FROM HR.departments);
CREATE TABLE ZALESKI.locations AS (SELECT * FROM HR.locations);
CREATE TABLE ZALESKI.countries AS (SELECT * FROM HR.countries);
CREATE TABLE ZALESKI.regions AS (SELECT * FROM HR.regions);
CREATE TABLE ZALESKI.job_history AS (SELECT * FROM HR.job_history);
CREATE TABLE ZALESKI.jobs AS (SELECT * FROM HR.jobs);
CREATE TABLE ZALESKI.employees AS (SELECT * FROM HR.employees);

-- Klucze glowne
ALTER TABLE departments ADD PRIMARY KEY (DEPARTMENT_ID);
ALTER TABLE locations ADD PRIMARY KEY (LOCATION_ID);
ALTER TABLE countries ADD PRIMARY KEY (COUNTRY_ID);
ALTER TABLE regions ADD PRIMARY KEY (REGION_ID);
ALTER TABLE job_history ADD PRIMARY KEY (EMPLOYEE_ID, START_DATE);
ALTER TABLE jobs ADD PRIMARY KEY (JOB_ID);
ALTER TABLE employees ADD PRIMARY KEY (EMPLOYEE_ID);

-- Klucze obce
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE countries ADD FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID);
