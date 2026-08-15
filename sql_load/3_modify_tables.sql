
COPY company_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\company_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY skills_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\skills_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY job_postings_fact
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\job_postings_fact.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY skills_job_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\skills_job_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
SELECT *
from job_postings_fact
limit 50








/*
\copy company_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\company_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
\copy  skills_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\skills_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
\copy  job_postings_fact
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\job_postings_fact.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
\copy  skills_job_dim
FROM 'C:\Users\manuw\Desktop\postgres sql projects\csv_files\skills_job_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );

*/
