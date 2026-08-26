-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

-- DROP SEQUENCE alumnos_id_seq;

CREATE SEQUENCE alumnos_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.carreras definition

-- Drop table

-- DROP TABLE carreras;

CREATE TABLE carreras (
	creditos int4 NOT NULL,
	descripcion varchar(50) NOT NULL,
	duracion int4 NOT NULL,
	nombre varchar(50) NOT NULL,
	CONSTRAINT carreras_pkey PRIMARY KEY (nombre)
);


-- public.materias definition

-- Drop table

-- DROP TABLE materias;

CREATE TABLE materias (
	nombre varchar(50) NOT NULL,
	creditos int4 NOT NULL,
	semestre int4 NOT NULL,
	estatus varchar(15) NOT NULL,
	CONSTRAINT materias_pkey PRIMARY KEY (nombre)
);


-- public.alumnos definition

-- Drop table

-- DROP TABLE alumnos;

CREATE TABLE alumnos (
	id serial4 NOT NULL,
	nombre varchar(60) NOT NULL,
	edad int4 NOT NULL,
	email varchar(60) NOT NULL,
	carrera varchar(20) NOT NULL,
	CONSTRAINT alumnos_email_key UNIQUE (email),
	CONSTRAINT alumnos_pkey PRIMARY KEY (id),
	CONSTRAINT carrera UNIQUE (carrera),
	CONSTRAINT fk_carrera FOREIGN KEY (carrera) REFERENCES carreras(nombre)
);


-- public.materias_carreras definition

-- Drop table

-- DROP TABLE materias_carreras;

CREATE TABLE materias_carreras (
	nombre_carrera varchar(50) NOT NULL,
	nombre_materia varchar(50) NOT NULL,
	CONSTRAINT materias_carreras_pkey PRIMARY KEY (nombre_carrera, nombre_materia),
	CONSTRAINT materias_carreras_nombre_carrera_fkey FOREIGN KEY (nombre_carrera) REFERENCES carreras(nombre) ON DELETE CASCADE,
	CONSTRAINT materias_carreras_nombre_materia_fkey FOREIGN KEY (nombre_materia) REFERENCES materias(nombre) ON DELETE CASCADE
);