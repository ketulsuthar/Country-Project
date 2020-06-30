set hive.cli.print.current.db = true;

--create database
create database countrydb;
use contrydb;

--create table
create external table country (cnt_name string, landmass int, zone int,
area bigint,population int, language int, religion  int,
bars int, stripes  int, colours  int, red BINARY , green BINARY , blue BINARY ,gold BINARY ,white BINARY ,black BINARY , orange BINARY ,
mainhue char(6), circles int, crosses int, saltires int, quarters  int, sunstars  int, crescent  BINARY , triangle  BINARY ,
icon BINARY , animate BINARY , text BINARY , topleft char(6),botright  char(6))
row format delimited
fields terminated by ','
stored as textfile
location '/user/edureka_85838/country';

-- Count number of countries based on landmass.
select case
 when landmass=1 then 'N.America'
 when landmass=2 then 'S.America'
 when landmass=3 then 'Europe'
 when landmass=4 then 'Africa'
 when landmass=5 then 'Asia'
 when landmass=6 then 'Oceania'
 else 'others'
end , count(*) AS Count from country group by landmass;

--Find out top 5 country with Sum of bars and strips in a flag.
select cnt_name, sum(bars+stripes) as barstripes from country group by cnt_name order by barstripes desc limit 5;

-- Count of countries with icon.
select count(cnt_name) as CountryWithIcon from country where icon=binary('1');

-- Count of countries which have same top left and top right color in flag.
select count(cnt_name) as Country from country where topleft=botright;

-- Count number of countries based on zone
select case
 when zone=1 then 'NE'
 when zone=2 then 'SE'
 when zone=3 then 'SW'
 when zone=4 then 'NW'
 else 'others'
end, count(cnt_name) as Count from country group by zone;
