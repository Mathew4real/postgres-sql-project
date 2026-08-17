# Introduction
This project focuses on analyzing job market data to identify the most relevant trends and skills associated with Data Analyst positions.
Through this analysis, I aim to better understand what skills employers are looking for and how different skills relate to salary levels, providing useful insights for anyone interested in pursuing a career in data analytics.

CHECK the project out here ➡️ [project_sql folder](/project_sql/)


# Backround  
The goal of this project is to analyze the Data Analyst job market using SQL and PostgreSQL.

I wanted to understand which Data Analyst positions offer the highest salaries, which skills are most frequently requested by employers, and which skills are associated with higher-paying roles.

The analysis focuses particularly on remote Data Analyst opportunities, allowing me to explore the relationship between job requirements, technical skills, and salary.

This project was created as a practical application of SQL, using real-world job posting data to answer business and career-related questions.   
# Tools I used 
- **PostgreSQL:** Database management and SQL analysis
- **SQL:** Data querying and analysis
- **VS Code:** Writing and organizing SQL queries
- **Git & GitHub:**: Version control and project documentation
# The Analysis
I divided the analysis into four main questions that I tried to answer through my SQL queries:

### 1. What are the top-paying Data Analyst jobs?

``` sql
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
```
***Here's the breakdown of the top 10 highest-paying Data Analyst jobs in 2023:***
- I identified the highest-paying remote Data Analyst positions while removing jobs without a specified salary.
- Wide Salary Range: The salaries range from $184,000 to $650,000/year, showing a significant earning potential across Data Analyst roles.
- Remote Opportunities: All 10 positions in this result were listed as "Anywhere", highlighting the presence of highly paid remote opportunities in the Data Analyst market.

![Top Paying Roles](assets\top_paying_jobs.png.png)
**Note:** *Bar Graph visualizing the salary for the the top 10 salaries for data analyts where developed with the assistance of ChatGPT, based on SQL queries and analysis created by me.*

### 2. Most Common Skills in High-Paying Data Analyst Jobs?
``` sql
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
```

- **SQL** is Essential: SQL appears in all 10 positions, making it the most consistent technical skill across the highest-paying roles.
- **Python** is Highly Relevant: Python appears in 9 out of 10 positions, showing that programming skills are strongly represented in high-paying Data Analyst jobs.
- **Data Visualization**: Tableau appears in 6 out of 10 positions, while Power BI appears in 3 positions, showing that visualization and BI tools are important for communicating data insights.

![img](assets\most_comun_skills.png)
**Note:** *Bar Graph visualizing the salary for the the top 10 salaries for data analyts where developed with the assistance of ChatGPT, based on SQL queries and analysis created by me.*

### 3. What are the Most In-Demand Data Analyst Skills?
```sql
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
```
- SQL Leads by a Large Margin: SQL was the most demanded skill, appearing 7,291 times across the analyzed job postings.

- Excel Remains Highly Relevant: Excel ranked second with 4,611 occurrences, showing that traditional spreadsheet skills remain important in the Data Analyst job market.

- Python is a Strong Third: Python appeared 4,330 times, making it one of the most important technical skills for Data Analysts.

| skill_id | skills   | skill_count |
|----------|----------|-------------|
| 0        | sql      | 7291        |
| 181      | excel    | 4611        |
| 1        | python   | 4330        |
| 182      | tableau  | 3745        |
| 183      | power bi | 2609        |

*table of the demmand of 5 skills in data anakyst jobs*

```sql
SELECT 
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) as avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL and 
    job_postings_fact.job_work_from_home = TRUE
GROUP BY 
    skills_dim.skills
ORDER BY avg_salary DESC 
LIMIT 25


```
- PySpark Leads the Ranking: PySpark had the highest average salary at approximately $208,172, followed by Bitbucket at $189,155.

- Strong Salary Potential: All 25 skills in the analysis are associated with average salaries above $121,000, indicating that these skills appear in relatively high-paying Data Analyst opportunities.

![img](assets\high_paying_skills.png)
**Note:** *Bar Graph visualizing the salary for the the top 10 salaries for data analyts where developed with the assistance of ChatGPT, based on SQL queries and analysis created by me.*

# What I learned 
Through this project, I strengthened my SQL and data analysis skills by working with a real-world job postings dataset.

- **SQL querying:** Improved my ability to write complex SQL queries to extract and analyze data.
JOINs: Learned how to combine data from multiple tables using INNER JOIN and LEFT JOIN.
- **Aggregations:** Used COUNT(), AVG(), MAX(), and GROUP BY to calculate statistics and identify trends.
- **String aggregation:** Used STRING_AGG() to combine multiple skills into a single row for each job.
# Conclusions 
This project gave me practical experience applying SQL to a real-world dataset instead of only practicing individual SQL concepts.

The analysis showed that SQL, Excel, Python, Tableau, and Power BI are among the most frequently requested skills for Data Analyst positions. At the same time, some less common technical skills, such as PySpark, Bitbucket, Databricks, Airflow, and Kubernetes, were associated with higher average salaries in this dataset.