# Job Market Analysis Using SQL

## Introduction
This project explores job market trends using SQL queries on a dataset containing job postings and company information. The goal is to analyze salary trends, job distributions, and hiring patterns across different companies and countries.

## Background
The dataset consists of two primary tables:
- **Company Table (`company_dim`)**: Contains company-related details, including `company_id`, `name`, `link`, `link_google`, and `thumbnail`.
- **Job Postings Fact Table (`job_postings_fact`)**: Stores job-related data, including `job_id`, `company_id`, `job_title_short`, `job_title`, `job_location`, `job_via`, `job_schedule`, `job_work_from_home`, `search_location`, `job_posted_date`, `job_no_degree_mention`, `job_health_insurance`, `job_country`, `salary_rate`, `salary_year_avg`, and `salary_hour_avg`.

## Tools Used
The following tools were utilized in this project:
- **SQL**: To query and analyze job market data.
- **PostgreSQL**: As the database management system.
- **Git**: For version control.
- **GitHub**: For project collaboration and code management.

## Analysis
Several queries were executed to extract meaningful insights from the data:

### 1. **Top 5 Companies Offering the Lowest Average Yearly Salary**
```sql
SELECT company_dim.company_id, company_dim.name, job_postings_fact.salary_year_avg
FROM job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
ORDER BY job_postings_fact.salary_year_avg ASC
LIMIT 5;
```
#### What I Learned:
- Some companies offer significantly lower salaries than others, which may be due to industry standards, company size, or location.
- Filtering and sorting salary data can help identify trends in low-paying employers.

**Find the results of this query in the repository.**

### 2. **Lowest-Paying Remote Jobs**
```sql
SELECT job_id, job_title_short, salary_year_avg, job_work_from_home
FROM job_postings_fact
WHERE job_work_from_home IS TRUE
ORDER BY salary_year_avg ASC
LIMIT 10;
```
#### What I Learned:
- Remote jobs vary widely in salary, with some paying significantly lower wages.
- Companies may offer remote roles at lower pay due to reduced overhead costs.

**Find the results of this query in the repository.**

### 3. **Companies Posting the Most Jobs in Different Countries**
```sql
SELECT job_country, name, COUNT(link) AS job_count
FROM company_dim
INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
GROUP BY job_country, name
ORDER BY job_count DESC
LIMIT 20;
```
#### What I Learned:
- Certain companies dominate job postings in specific regions.
- The job market is highly concentrated among a few large employers in some countries.

**Find the results of this query in the repository.**

### 4. **Top Companies Posting the Most Jobs in Canada**
```sql
SELECT company_dim.company_id, company_dim.name, COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_postings_fact.job_country = 'Canada'
GROUP BY company_dim.company_id, company_dim.name
ORDER BY job_count DESC
LIMIT 10;
```
#### What I Learned:
- Canada’s job market is shaped by a few key employers with a high volume of job postings.
- The demand for jobs varies based on location and company presence.

**Find the results of this query in the repository.**

### 5. **Companies Offering the Highest Average Salary**
```sql
SELECT company_dim.company_id, company_dim.name, AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY company_dim.company_id, company_dim.name
ORDER BY avg_salary DESC
LIMIT 10;
```
#### What I Learned:
- Some companies consistently offer high salaries, likely due to their industry, company policies, or location.
- Identifying high-paying employers can help job seekers target lucrative job opportunities.

**Find the results of this query in the repository.**

### 6. **Most In-Demand Job Titles Based on Postings**
```sql
SELECT job_title_short, COUNT(job_id) AS job_count
FROM job_postings_fact
GROUP BY job_title_short
ORDER BY job_count DESC
LIMIT 10;
```
#### What I Learned:
- Certain job titles are in higher demand than others.
- The job market trends shift based on industry needs and economic conditions.

**Find the results of this query in the repository.**

## Learnings
Through this project, I have gained valuable insights into:
- Writing efficient SQL queries for job market analysis.
- Understanding salary distribution across companies and locations.
- Identifying job demand trends and hiring patterns.
- Using Git and GitHub for version control and collaboration.

## Conclusion
This project provided a comprehensive analysis of the job market using SQL. By leveraging PostgreSQL, we uncovered trends in salaries, remote job opportunities, and company hiring behaviors. Future improvements could include integrating additional datasets, such as job descriptions and skill requirements, to enhance the analysis further.

The results for all queries can be found in the project repository.

