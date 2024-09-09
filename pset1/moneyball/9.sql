SELECT "teams"."name" , ROUND(AVG("salary"), 2) AS "Average Salary"
FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "Average Salary"
LIMIT 5;



