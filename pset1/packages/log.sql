
-- *** The Lost Letter ***
SELECT "addr_dest"."type" AS "lost_letter_address_type", "addr_dest"."address" AS "lost_letter_address"
FROM "packages" "pack"
JOIN "addresses" "addr_src" ON "pack"."from_address_id" = "addr_src"."id"
JOIN "addresses" "addr_dest" ON "pack"."to_address_id" = "addr_dest"."id"
WHERE "addr_src"."address" LIKE "%900%somer%"
  AND "addr_dest"."address" LIKE "%2%Fin%";
-- *** The Devious Delivery ***
SELECT "pack"."contents" AS "content", "addr"."type" AS "type"
FROM "scans"
JOIN "packages" "pack" ON "pack"."id" = "scans"."package_id"
JOIN "addresses" "addr" ON "addr"."id" = "scans"."address_id"
WHERE "pack"."from_address_id" IS NULL AND "scans"."action" = "Drop";
-- *** The Forgotten Gift ***
SELECT "pack"."contents" AS "content", "drv"."name" AS "Forgotten_person"
FROM "scans"
JOIN "packages" "pack" ON "pack"."id" = "scans"."package_id"
JOIN "drivers" "drv" ON "drv"."id" = "scans"."driver_id"
JOIN "addresses" "addr" ON "addr"."id" = "scans"."address_id"
WHERE "addr"."address" LIKE "%109%Tileston%" OR "%728%Map%"
ORDER BY "scans"."timestamp" DESC
LIMIT 1;


