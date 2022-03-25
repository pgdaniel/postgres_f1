drop schema if exists csvs cascade;
create schema csvs;
create table csvs.drivers(
    driverId text,
    driverRef text,
    driverNumber text,
    code text,
    forename text,
    surname text,
    dob text,
    nationality text,
    url text
);
copy csvs.drivers from '/Users/Paul/data/drivers.csv' delimiter ',' header csv;

create table csvs.races(
    raceId text,
    year text,
    raceRound text,
    circuitId text,
    name text,
    raceDate text,
    raceTime text,
    url text
);
copy csvs.races from '/Users/Paul/data/new_races.csv' delimiter ',' header csv;

create table csvs.lap_times(
    raceId text,
    driverId text,
    lap text,
    position text,
    lapTime text,
    milliseconds text
);
copy csvs.lap_times from '/Users/Paul/data/lap_times.csv' delimiter ',' header csv;

create table csvs.seasons(
    year text,
    url text
);
copy csvs.seasons from '/Users/Paul/data/seasons.csv' delimiter ',' header csv;

create table csvs.driver_standings(
    driverStandingsId text,
    raceId text,
    driverId text,
    points text,
    position text,
    positionText text,
    wins text
);
copy csvs.driver_standings from '/Users/Paul/data/driver_standings.csv' delimiter ',' header csv;

create table csvs.results(
    resultId text,
    raceId text,
    driverId text,
    constructorId text,
    resultNumber text,
    raceGrid text,
    position text,
    positionText text,
    positionOrder text,
    points text,
    laps text,
    time text,
    milliseconds text,
    fastestLap text,
    drverRank text,
    fastestLapTime text,
    fastestLapSpeed text,
    statusId text
);
copy csvs.results from '/Users/Paul/data/results.csv' delimiter ',' header csv;

create table csvs.constructors(
    constructorId text,
    constructorRef text,
    name text,
    nationality text,
    url text
);
copy csvs.constructors from '/Users/Paul/data/constructors.csv' delimiter ',' header csv;


create table csvs.circuits(
    circuitId text,
    circuitRef text,
    name text,
    location text,
    country text,
    lat text,
    lng text,
    alt text,
    url text
);
copy csvs.circuits from '/Users/Paul/data/circuits.csv' delimiter ',' header csv;

update csvs.races set raceTime=NULL where raceTime = '\N';
update csvs.circuits set alt=NULL where alt = '\N';
