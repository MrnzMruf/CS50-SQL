CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "airline_id" TEXT NOT NULL,
    "departure_name" TEXT NOT NULL,
    "arrival_name" TEXT NOT NULL,
    "departure_time" TEXT CHECK (
        "departure_time" GLOB 'on [A-Za-z]* [0-9][0-9]?th, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "departure_time" GLOB 'on [A-Za-z]* 1st, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "departure_time" GLOB 'on [A-Za-z]* 2nd, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "departure_time" GLOB 'on [A-Za-z]* 3rd, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M'
    ),
    "arrival_time" TEXT CHECK (
        "arrival_time" GLOB 'on [A-Za-z]* [0-9][0-9]?th, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "arrival_time" GLOB 'on [A-Za-z]* 1st, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "arrival_time" GLOB 'on [A-Za-z]* 2nd, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M' OR
        "arrival_time" GLOB 'on [A-Za-z]* 3rd, [0-9][0-9][0-9][0-9] at [0-1][0-9]:[0-5][0-9] [AP]M'
    ),
    PRIMARY KEY("id")
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
); 
