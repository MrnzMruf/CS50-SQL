SELECT "year", "salary" FROM "salaries"
WHERE "player_id" = (
  SELECT "id"
  FROM "players"
  WHERE "last_name" LIKE "%Ripken%" AND "first_name" = "Cal"
  )
  ORDER BY "year" DESC;
