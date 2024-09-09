SELECT "title", "season", "episode_in_season", "air_date" FROM "episodes"
WHERE ("topic" LIKE "%date%" AND "air_date" <= "2010-01-01") OR ("air_date" > "2022-01-01") ;
