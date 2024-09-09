SELECT "name" AS "school_name", "per_pupil_expenditure", "graduated" AS "graduation_rate"
FROM "schools"
JOIN "expenditures" ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "per_pupil_expenditure" DESC, "school_name";
