/*
Question: What skills are required for the top paying data analyst jobs?
- Use the top 10 highest paying Data Analyst jobs from first query
-Add the specific skills required for these roles 
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries
*/

WITH jobs AS (
SELECT 
    jpf.job_id,
    jpf.job_title,
    jpf.salary_year_avg,
    cd.name AS company_name
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON cd.company_id=jpf.company_id
WHERE job_title_short='Data Analyst' AND
job_location='Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10)
SELECT 
  sjd.job_id,
  company_name,
  job_title,
  salary_year_avg,
  sjd.skill_id,
  skills_dim.skills AS skill_name
FROM jobs 
INNER JOIN skills_job_dim sjd ON 
jobs.job_id = sjd.job_id
INNER JOIN skills_dim  ON 
skills_dim.skill_id=sjd.skill_id
ORDER BY salary_year_avg DESC;
