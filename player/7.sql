SELECT COUNT("id") AS "Count of players"
FROM "players"
WHERE ("bats" = "R" AND "throws" = "L" ) OR ("bats" = "L" AND "throws" = "R" );
