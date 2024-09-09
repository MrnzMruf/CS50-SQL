SELECT "name" AS "district_name"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "district_name"
ORDER BY SUM("pupils")
LIMIT 1;
