drop schema if exists racing cascade;
create schema racing;
set search_path='racing';

create table racing.seasons(
    id serial primary key,
    url text not null,
    year integer not null
);

insert into seasons(url, year) select url, year::integer from csvs.seasons;

create table racing.circuits(
    id integer primary key,
    circuit_ref text,
    name text,
    location_name text,
    country text,
    lat float,
    long float,
    alt float,
    url text
);
insert into 
racing.circuits(id, circuit_ref, name, location_name, country, lat, long, alt, url)
select circuitId::integer, circuitRef, name, location, country, lat::float, lng::float, alt::float, url from csvs.circuits;

create table racing.races(
    id integer primary key,
    year integer,
    round integer,
    circuit_id int references racing.circuits(id),
    name text,
    race_date date,
    race_time time,
    url text
);

insert into 
racing.races(id, year, round, circuit_id, name, race_date, race_time, url)
select raceId::integer, year::integer, raceRound::integer, circuitId::integer, name, raceDate::date, raceTime::time, url from csvs.races;

create table racing.drivers(
    id integer primary key,
    driver_ref text,
    driver_number text,
    code text,
    first_name text,
    last_name text,
    dob date,
    nationality text,
    url text
);
insert into 
racing.drivers(id, driver_ref, driver_number, code, first_name, last_name, dob, nationality, url)
select driverId::integer, driverRef, driverNumber, code, forename, surname, dob::date, nationality, url from csvs.drivers;

create table racing.driver_standings(
    id integer primary key,
    race_id integer references racing.races(id),
    driver_id integer references racing.drivers(id),
    points float,
    position integer,
    position_text text,
    wins integer
);
insert into 
racing.driver_standings(id, race_id, driver_id, points, position, position_text, wins)
select driverStandingsId::integer, raceId::integer, driverId::integer, points::float, position::integer, positionText, wins::integer from csvs.driver_standings;


