

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa
select count(*) as total, b."name" from country a
inner join continent b on a.continent = b.code
where b.name not like '%America%'
group by b."name"
union
select count(*) as total, 'America' from country a
inner join continent b on a.continent = b.code
where b.name like '%America%' order by total asc;

-- Tarea pais con más ciudades
-- Campos: total ciudades y el nombre del país
-- Usar Inner join
select count(*) as total , b.name from city a
inner join country b on a.countrycode = b.code
group by b."name" order by total desc limit 1;

-- ¿Quiero saber los idiomas oficiales que se hablan por continentes?
select distinct a."language", c.name from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent = c.code 
where isofficial is true;

-- Cuantos?
select count(*) as total, continent from (
select distinct a."language", c.name as continent from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent = c.code 
where isofficial is true
) as totales group by continent order by total;

select distinct a."language", l.name, a.languagecode,  c.name as continent from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent = c.code
inner join "language" l on l.code = a.languagecode
where isofficial is true;