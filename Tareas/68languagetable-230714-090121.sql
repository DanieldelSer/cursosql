

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
select distinct language from countrylanguage order by language asc;
insert into language (name) 
select distinct language from countrylanguage order by language asc;
-- Actualizar todos los registros
update countrylanguage cl set language = (select code from language l where l.name = cl.language);
-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countrylanguage alter column language type int4
USING language::integer;
-- Crear el forenign key y constraints de no nulo el language_code
alter table countrylanguage add constraint fk_language_code FOREIGN KEY (language) references language(code);
-- Revisar lo creado