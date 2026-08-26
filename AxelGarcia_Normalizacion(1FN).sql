-- public.alumno_act2 definition
-- Drop table
-- DROP TABLE alumno_act2;

create table alumno_act2 (
	id int4 generated always as identity( increment by 1 minvalue 1 maxvalue 2147483647 start 1 cache 1 no cycle) not null,
	alumno varchar(25) not null,
	carrera varchar(25) not null,
	materias varchar(255) not null,
	constraint alumno_act2_pkey primary key (id)
);


insert into alumno_act2(alumno,carrera,materias)
values 
('Ana', 'software', 'Bases de Datos, Programación Web'),
('Carlos', 'software', 'Matemáticas, Bases de Datos'),
('María', 'Inteligencia Artificial', 'Programación Web, Matemáticas'),
('Pedro', 'software', 'Redes, Bases de Datos');

select * from alumno_act2 aa

--¿Qué alumnos cursan la materia Base de Datos?**

select * from alumno_act2
where materias Ilike '%Bases de Datos%';

/*1. ¿Por qué la columna `materias` tiene un problema?
Porque al permitir agregar materias en un solo registro dificulta el manejo de la información, lo vuelve tedioso,
complicado y genera datos basura.

2. ¿Por qué tuviste que utilizar `LIKE` o `ILIKE`?
Al haber mas de una materia por registro, una sentencia normal de solo WHERE materias = 'Bases de Datos'
no traería ningún registro pues ningún registro contiene ese texto únicamente, el LIKE/ILIKE trae todos los registros donde la palabra 'Bases de datos' aparezca en cualquier parte del registro


3. ¿Cómo guardarías las materias para que cada celda contenga solamente un valor?
Crearía otra tabla llamada Materias donde estén registradas las propias materias y una tabla intermedia donde se inserte el id del alumno y la materia que cursa,
y en la tabla alumno solo guardaría la cantidad de materias que lleve o incluso no guardaría ese dato en esa tabla.*/