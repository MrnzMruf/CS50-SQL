SELECT "name" AS "district_name", "state"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "name" LIKE "%Camb%";
