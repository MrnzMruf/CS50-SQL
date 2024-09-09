WITH least_expensive_per_hit AS (
    SELECT p."first_name", p."last_name", p."id"
    FROM "performances" perf
    JOIN "players" p ON p."id" = perf."player_id"
    JOIN "salaries" s ON s."player_id" = p."id" AND perf."year" = s."year"
    WHERE perf."year" = 2001 AND perf."H" > 0
    ORDER BY s."salary" / perf."H"
    LIMIT 10
),
least_expensive_per_rbi AS (
    SELECT p."first_name", p."last_name", p."id"
    FROM "performances" perf
    JOIN "players" p ON p."id" = perf."player_id"
    JOIN "salaries" s ON s."player_id" = p."id" AND perf."year" = s."year"
    WHERE perf."year" = 2001 AND perf."RBI" > 0
    ORDER BY s."salary" / perf."RBI"
    LIMIT 10
)

SELECT lph."first_name", lph."last_name"
FROM least_expensive_per_hit lph
JOIN least_expensive_per_rbi lpr ON lph."id" = lpr."id"
ORDER BY lph."id";
