/* QUEstion ? what are the mos in demand skills for data analyst

*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(*) as skill_count
FROM 
    job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
WHERE job_postings_fact.job_title_short = 'Data Analyst' and 
job_postings_fact.job_work_from_home = TRUE
GROUP BY 
  skills_dim.skill_id,
  skills_dim.skills
ORDER BY  skill_count DESC 
 LIMIT 5
 
