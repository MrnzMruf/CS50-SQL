-- DROP TABLE IF EXISTS "meteorites_temp";

-- CREATE THE TEMP TABLE FROM SCHEMA.SQL
CREATE TABLE meteorites_temp (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

-- CLEANING DATA
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '' OR "mass" = 0;
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '' OR "year" = 0;
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '' OR "lat" = 0;
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '' OR "long" = 0;

-- ROUND DIGITS:
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

-- DELETE nametype = Relict ROWS
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

-- CREATE THE FINAL TABLE:
CREATE TABLE "meteorites" (
    "name" TEXT,
    "id" INTEGER,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK ("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

-- ADD CLEAN DATA IN THE FINAL TABLE
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    CASE
        WHEN "mass" = '' OR "mass" = 0 THEN NULL
        ELSE ROUND("mass", 2) END,
    CASE
        WHEN "discovery" = '' THEN NULL
        ELSE "discovery" END,
    CASE
        WHEN "year" = '' OR "year" = 0 THEN NULL
        ELSE "year" END,
    CASE
        WHEN "lat" = '' OR "lat" = 0 THEN NULL
        ELSE ROUND("lat", 2) END,
    CASE
        WHEN "long" = '' OR "long" = 0 THEN NULL
        ELSE ROUND("long", 2) END
FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;

-- DELETE THE TEMP TABLE
DROP TABLE "meteorites_temp";
