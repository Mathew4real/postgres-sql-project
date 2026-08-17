/*
Question : what are the top-paying data analyst jobs ? 
-Identify the top highest-paying Data Analyst jobs roles that are available remotly  
-focus on job postings with specified salary (remove nulls).
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_year_avg,
    company_dim.name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10 ;

