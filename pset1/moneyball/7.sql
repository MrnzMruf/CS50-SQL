SELECT "first_name" AS "First Name", "last_name" AS "Last Name"
FROM "players"
JOIN"salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."salary" =  (
    SELECT MAX("salary")
    FROM "salaries"
);


