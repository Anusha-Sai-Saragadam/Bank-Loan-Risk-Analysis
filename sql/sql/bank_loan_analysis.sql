CREATE DATABASE bank_loan_project;
USE bank_loan_project;
CREATE TABLE bank_loan_data (
    Loan_ID VARCHAR(50),
    Gender VARCHAR(10),
    Married VARCHAR(10),
    Dependents VARCHAR(10),
    Education VARCHAR(20),
    Self_Employed VARCHAR(10),
    ApplicantIncome INT,
    CoapplicantIncome FLOAT,
    LoanAmount FLOAT,
    Loan_Amount_Term INT,
    Credit_History INT,
    Property_Area VARCHAR(20),
    Loan_Status VARCHAR(5),
    Risk_Level VARCHAR(20)
);
SELECT COUNT(*) FROM bank_loan_data;
SELECT * FROM bank_loan_final LIMIT 5;
SHOW tables;
SELECT COUNT(*) FROM bank_loan_final;
SHOW WARNINGS;
DROP TABLE bank_loan_data;
RENAME TABLE bank_loan_final TO bank_loan_data;
select * from bank_loan_data;
select risk_level,count(*) as total_applicants
from bank_loan_data
group by risk_level;

SELECT 
    Risk_Level,
    COUNT(*) AS total_applicants,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate_percent
FROM bank_loan_data
GROUP BY Risk_Level;

SELECT 
    Risk_Level,
    ROUND(AVG(ApplicantIncome), 2) AS avg_applicant_income
FROM bank_loan_data
GROUP BY Risk_Level;

SELECT 
    Property_Area,
    COUNT(*) AS total_applicants,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate_percent
FROM bank_loan_data
GROUP BY Property_Area;
