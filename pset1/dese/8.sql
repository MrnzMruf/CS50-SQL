SELECT "name" AS "district_name", SUM("pupils") AS "total_pupils"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "name";
