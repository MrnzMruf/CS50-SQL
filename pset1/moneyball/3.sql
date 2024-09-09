SELECT "year", "HR" AS "Home Runs" FROM "performances"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "last_name" LIKE "%Griffey%" AND "birth_year" = "1969"
)
ORDER BY "year" DESC;
