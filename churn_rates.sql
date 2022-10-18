-- displaying first 100 rows of data
SELECT * FROM subscriptions limit 100;

-- Displaying number of different segments 
SELECT COUNT(DISTINCT segment) FROM subscriptions;

-- Months able to calculate churn rates for are (??) :
SELECT MIN(subscription_start), MAX(subscription_start) FROM subscriptions;

-- Calculating churn rates for each segment 

WITH months AS(
  SELECT
  '2017-01-01' as first_day,
  '2017-01-31' as last_day
  UNION 
  SELECT
  '2017-02-01' as first_day,
  '2017-02-28' as last_day
  UNION 
  SELECT
  '2017-03-01' as first_day,
  '2017-03-31' as last_day
FROM subscriptions),
cross_join AS(
  SELECT * FROM subscriptions
  CROSS JOIN months
),
--SELECT * FROM cross_join limit 3; 
status AS(
  SELECT
   id,
   first_day AS month,
   CASE 
      WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment=87) THEN 1 ELSE 0
   END AS is_active_87,
   CASE 
      WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment=87) THEN 1 ELSE 0
   END AS is_active_30)
   SELECT * FROM status LIMIT 10;


