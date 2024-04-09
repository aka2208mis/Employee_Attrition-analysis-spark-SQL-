-- Databricks notebook source
SELECT * FROM employee_info

-- COMMAND ----------

-- DBTITLE 1,TOTAL EMPLOYEE COUNT
SELECT SUM(EmployeeCount) from employee_info

-- COMMAND ----------

-- DBTITLE 1,FIND OUT ATTRITION DIVISION
SELECT SUM(EmployeeCount),attrition FROM employee_info
group by 2

-- COMMAND ----------

-- DBTITLE 1,Age Analysis-- lets find out which particular age attrition is high(18-24,25-31,32-38,39-45,46-52,52+)
SELECT 
    SUM(EmployeeCount),
    CASE 
        WHEN age BETWEEN 20 AND 25 THEN '20-25'
        WHEN age BETWEEN 26 AND 32 THEN '26-32'
        WHEN age BETWEEN 33 AND 40 THEN '33-40'
        ELSE '40+'
    END AS age_group
FROM 
    employee_info
WHERE 
    attrition = 'Yes'
GROUP BY 
    age_group;


-- COMMAND ----------

-- DBTITLE 1,Find out attrition by department
select sum(EmployeeCount),department from employee_info
where attrition='Yes'
group by Department

-- COMMAND ----------

-- DBTITLE 1,Attrition by education-(1-below college,2- college,3- bachelor,4- master,5- doctor)
SELECT 
    SUM(EmployeeCount),
    CASE 
        WHEN education = 1 THEN 'Below College'
        WHEN education = 2 THEN 'College'
        WHEN education = 3 THEN 'Bachelor Degree'
        WHEN education = 4 THEN 'Masters Degree'
        ELSE 'Doctor'
    END AS education_level
FROM 
    employee_info
WHERE 
    Attrition = 'Yes'
GROUP BY 
    education;


-- COMMAND ----------

-- DBTITLE 1,Attrition by environment satisfaction (1-low,2-medium,3-high,4-highly satisfied)
select sum(EmployeeCount),
EnvironmentSatisfaction
from employee_info
where attrition='Yes'
GROUP BY 2

-- COMMAND ----------

-- DBTITLE 1,Attrition by Business travel
select sum(EmployeeCount),
BusinessTravel
from employee_info
where Attrition='Yes'
group by 2

-- COMMAND ----------

#Insight as we got of now
1.) Employee age between 26-32 leaving organisation.
2.) Employees from research and development are leaving organisation.
3.) 41.8% employees have bachelors degree left org.
4.) 72 employees not satisfied with environment locations left organisation.
5.) 156 employee travelling rarely left org.


-- COMMAND ----------



-- COMMAND ----------


