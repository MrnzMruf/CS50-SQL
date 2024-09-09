SELECT "first_name" AS "first Name", "last_name" AS "Last Name", "salary"
FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001
ORDER BY "salary", "first_name", "last_name", "player_id" LIMIT 50;

