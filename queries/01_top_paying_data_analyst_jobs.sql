/*
Question: What are the top-paying Data Analyst jobs?

- Identify the top 10 highest-paying remote Data Analyst roles.
- Focus on job postings with specified salaries (exclude NULL salaries).

Why?
This query highlights the highest-paying remote opportunities for Data Analysts,
providing insight into premium roles in the job market.
*/

SELECT 
    jpf.job_id,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date,
    cd.name AS company_name
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON cd.company_id=jpf.company_id
WHERE job_title_short='Data Analyst' AND
job_location='Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
