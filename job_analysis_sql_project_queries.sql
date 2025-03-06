--Query to return 5 top companies that offer the lowest average year salary.
SELECT company_dim.company_id, company_dim.name, job_postings_fact.salary_year_avg
FROM job_postings_fact
INNER JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
ORDER BY job_postings_fact.salary_year_avg ASC
LIMIT 5;

--Query to return remote jobs offering lowest salary.
SELECT job_id,job_title_short,salary_year_avg,job_work_from_home
FROM job_postings_fact
WHERE job_work_from_home IS TRUE
ORDER BY salary_year_avg ASC
LIMIT 10;

--Query  to count the number of job postings per company in different countries
SELECT DISTINCT(job_country), name, COUNT(link)
FROM company_dim
INNER JOIN job_postings_fact ON company_dim.company_id=job_postings_fact.company_id
GROUP BY job_country, name
ORDER BY COUNT(link) DESC
LIMIT 20;

--Query to return companie that post the most jobs in Canada.
SELECT company_dim.company_id, company_dim.name, COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN company_dim  ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_country = 'Canada' 
GROUP BY company_dim.company_id, company_dim.name
ORDER BY job_count DESC
LIMIT 10;

--Query to show top-paying jobs that do not require a degree.
SELECT job_id, job_title, salary_year_avg,job_no_degree_mention
FROM job_postings_fact
WHERE job_no_degree_mention IS True
      AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 15;

--Query to return how salary rates differ by job schedule.
SELECT job_schedule_type,
       COUNT(*) AS job_count,
	   AVG(salary_year_avg) AS avg_yearly_salary,
	   AVG(salary_hour_avg) AS avg_hourly_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
      OR salary_hour_avg IS NOT NULL
GROUP BY job_schedule_type, salary_year_avg
ORDER BY salary_year_avg DESC;



