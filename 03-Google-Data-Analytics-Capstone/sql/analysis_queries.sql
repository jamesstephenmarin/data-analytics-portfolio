-- ================================================
-- IBM HR Attrition Analysis
-- Google Data Analytics Capstone Project
-- Tool: BigQuery
-- ================================================

-- Q1: Preview the data (confirm successful load)
SELECT *
FROM `hr-attrition-analysis-501106.hr_attrition.employee_attrition`
LIMIT 10;

-- Q2: Attrition rate by Department
-- Hypothesis: Some departments may have higher turnover pressure
SELECT
 Department,
 COUNT(*) AS total_employees,
 SUM(Attrition_Binary) AS employees_left,
 ROUND(SUM(Attrition_Binary) / COUNT(*) * 100, 2) AS attrition_rate_pct
FROM `hr-attrition-analysis-501106.hr_attrition.employee_attrition`
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- Q3: Attrition by Job Role
-- Hypothesis: Certain roles like Sales and Lab Technicians may face higher
-- burnout or lower growth opportunities, leading to higher attrition
SELECT
 JobRole,
 COUNT(*) AS total_employees,
 SUM(Attrition_Binary) AS employee_left,
 ROUND(SUM(Attrition_Binary) / COUNT(*) * 100, 2) AS attrition_rate_pct
FROM `hr-attrition-analysis-501106.hr_attrition.employee_attrition`
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Q4: Attrition by OverTime
-- Hypothesis: Employees required to work overtime may experience burnout,
-- leading to significantly higher attrition rates
SELECT
 OverTime,
 COUNT(*) AS total_employees,
 SUM(Attrition_Binary) AS employee_left,
 ROUND(SUM(Attrition_Binary) / COUNT(*) * 100, 2) AS attrition_rate_pct
FROM `hr-attrition-analysis-501106.hr_attrition.employee_attrition`
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;

-- Q5: Overall company attrition rate (baseline metric)
-- Returns the total attrition rate across all 1,470 employees
SELECT 
 SUM(Attrition_Binary) AS employee_left,
 COUNT(*) AS total_employees,
 ROUND(SUM(Attrition_Binary) / COUNT(*) * 100, 2) AS attrition_rate_pct
FROM `hr-attrition-analysis-501106.hr_attrition.employee_attrition`