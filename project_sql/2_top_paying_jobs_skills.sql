/*
Question : what are the main skills of the top-paying data analyst jobs ? 
*/


SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.job_posted_date,
    job_postings_fact.salary_year_avg,
    company_dim.name,
    
    STRING_AGG(skills_dim.skills, ', ') AS skills
FROM job_postings_fact 
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL


    GROUP BY
    job_postings_fact.job_location,
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_schedule_type,
    job_postings_fact.job_posted_date,
    job_postings_fact.salary_year_avg,
    company_dim.name
ORDER BY salary_year_avg DESC
LIMIT 10 ;


/*
SQL is the most consistent skill, appearing in all 10 of the highest-paying Data Analyst roles.
Python appears in 9 out of 10 roles, showing that programming and automation are highly valuable for high-paying analyst positions.
Tableau appears in 7 out of 10 roles, making it the most common BI/visualization tool in this dataset.
Excel appears in only 4 out of 10 roles, suggesting that advanced analyst positions rely less on Excel alone and more on technical tools.
Cloud and data-platform skills such as Azure, AWS, Snowflake, and Databricks appear in several roles.
Higher-paying roles tend to require a broader combination of skills rather than relying on a single tool.
The combination of SQL + Python + BI tools appears to be a strong skill foundation for high-paying Data Analyst positions. These results suggest that high-paying Data Analyst roles increasingly overlap with data engineering, cloud, and advanced analytics.

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18 16:03:12",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "python, sql, r, azure, databricks, aws, pandas, pyspark, jupyter, excel, tableau, power bi, powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05 20:00:40",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "tableau, hadoop, r, python, sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17 00:17:23",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "crystal, tableau, flow, oracle, sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09 11:00:01",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "python, tableau, excel, numpy, pandas, snowflake, go, sql, gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07 15:00:13",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "snowflake, oracle, aws, azure, python, sql, jira, confluence, jenkins, bitbucket, atlassian, power bi, sap, tableau"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05 00:00:25",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "git, python, sql, confluence, jira, atlassian, bitbucket, r"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11 16:00:05",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "go, excel, numpy, pandas, snowflake, gitlab, sql, python, tableau"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09 08:01:04",
    "salary_year_avg": "184000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "python, r, sql"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-01-23 22:28:01",
    "salary_year_avg": "170000.0",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "power bi, sql, databricks, azure, python"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09 14:02:45",
    "salary_year_avg": "170000.0",
    "name": "A-Line Staffing Solutions",
    "skills": "sql, python, azure"
  }
]
*/