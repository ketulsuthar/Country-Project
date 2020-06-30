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

