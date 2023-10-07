

-- 1. Ver todos los registros
select * from users;

-- 2. Ver el registro cuyo id sea igual a 10
select * from users where "id" = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
select * from users where "name" like 'Jim %';

-- 4. Todos los registros cuyo segundo nombre es Alexander
select * from users where "name" like '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
update users set "name" = 'Daniel del Ser' where "id" = 1;

-- 6. Borrar el último registro de la tabla
DELETE FROM users  
WHERE  id = (SELECT id 
             FROM   users  
             ORDER  BY id DESC 
             LIMIT  1);
-- otra opción
DELETE FROM users  
WHERE  id = (SELECT max(id) from users);

-- Separar name en name y last name
select
	substring(name, 0, position(' ' in name)) as name,
	substring(name, position(' ' in name) + 1) as last_name,
    trim(substring(name, position(' ' in name))) as last_name2
	from users;

-- update de las columnas first_name y last_name
update users
	set
		first_name = substring(name, 0, position(' ' in name)),
		last_name = substring(name, position(' ' in name) + 1);