/* 
Question: What are the most in-demand skills for Data Analysts?
-Join job postings to inner join table similar to query 2
-Identify the top 5 in-demad skills for a Data analyst
-Focus on all job postings.
-Why? Retrives the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
  */

SELECT 
   skills,
   COUNT(sjd.job_id) AS demanD_count
FROM job_postings_fact
INNER JOIN skills_job_dim sjd ON 
job_postings_fact.job_id = sjd.job_id
INNER JOIN skills_dim  ON 
skills_dim.skill_id=sjd.skill_id
WHERE job_title_short ='Data Analyst' 
GROUP BY
skills
ORDER BY
demand_count DESC
LIMIT 5;
