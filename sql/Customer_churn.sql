CREATE DATABASE customer_churn;
USE customer_churn;
SHOW TABLES;
SELECT COUNT(*) AS total_customers
FROM customer_churn_cleaned;
SELECT COUNT(*) AS churned_customers
FROM customer_churn_cleaned
WHERE `Churn Label` = 'Yes';
SELECT
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN `Churn Label` = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN `Churn Label` = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn_cleaned;
SELECT COUNT(*) AS active_customers
FROM customer_churn_cleaned
WHERE `Churn Label` = 'No';
DESCRIBE customer_churn_cleaned;
SHOW COLUMNS FROM customer_churn_cleaned;
SELECT
    ROUND(AVG(`Tenure Months`), 2) AS avg_tenure
FROM customer_churn_cleaned;
SELECT ROUND(AVG(`Monthly Charges`), 2) AS avg_monthly_charges
FROM customer_churn_cleaned;
SELECT
    `Contract` AS contract_type,
    COUNT(*) AS customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY `Contract`
ORDER BY churn_rate DESC;
SELECT
    `Payment Method` AS payment_method,
    COUNT(*) AS customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY `Payment Method`
ORDER BY churn_rate DESC;
SELECT
    `Internet Service` AS internet_service,
    COUNT(*) AS customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY `Internet Service`
ORDER BY churn_rate DESC;
SELECT
    tenure_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY tenure_group
ORDER BY churn_rate DESC;
SELECT
    `Tech Support` AS tech_support,
    COUNT(*) AS customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY `Tech Support`
ORDER BY churn_rate DESC;
SELECT
    `Contract` AS contract_type,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_cleaned
GROUP BY `Contract`
HAVING COUNT(*) >= 100
ORDER BY churn_rate DESC;
WITH segment_analysis AS (
    SELECT
        `Contract` AS contract_type,
        tenure_group,
        COUNT(*) AS customers,
        SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
    FROM customer_churn_cleaned
    GROUP BY `Contract`, tenure_group
)
SELECT
    contract_type,
    tenure_group,
    customers,
    churned_customers,
    ROUND(100.0 * churned_customers / customers, 2) AS churn_rate
FROM segment_analysis
WHERE customers >= 50
ORDER BY churn_rate DESC;
SELECT
    customerID,
    `Contract` AS contract_type,
    `Tenure Months` AS tenure,
    `Monthly Charges` AS monthly_charges,
    `Tech Support` AS tech_support,
    `Online Security` AS online_security,
    `Churn Label` AS churn
FROM customer_churn_cleaned
WHERE
    `Contract` = 'Month-to-month'
    AND `Tenure Months` <= 12
    AND `Monthly Charges` >= 70
    AND `Tech Support` = 'No'
ORDER BY `Monthly Charges` DESC;
WITH segment_churn AS (
    SELECT
        `Contract` AS contract_type,
        `Payment Method` AS payment_method,
        COUNT(*) AS customers,
        SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
    FROM customer_churn_cleaned
    GROUP BY `Contract`, `Payment Method`
)
SELECT
    contract_type,
    payment_method,
    customers,
    churned_customers,
    ROUND(100.0 * churned_customers / customers, 2) AS churn_rate,
    RANK() OVER (
        ORDER BY 100.0 * churned_customers / customers DESC
    ) AS churn_rank
FROM segment_churn;
