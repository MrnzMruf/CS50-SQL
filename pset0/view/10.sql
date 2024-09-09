SELECT "japanese_title","average_color","entropy" AS "The List"
FROM "views"
WHERE "english_title" LIKE "%the%" ORDER BY "entropy" DESC;
