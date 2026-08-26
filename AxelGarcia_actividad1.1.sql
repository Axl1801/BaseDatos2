-- public.facultades definition
-- Drop table
-- DROP TABLE facultades;

create table facultades (
	id_facultad serial4 not null,
	nombre varchar(150) not null,
	codigo varchar(10) not null,
	decano varchar(100) null,
	telefono varchar(20) null,
	constraint facultades_codigo_key unique (codigo),
	constraint facultades_pkey primary key (id_facultad)
);

select * from facultades f

create table carreras_en_clase(
id_carrera serial primary key,
id_facultad int not null,
nombre VARCHAR(100),
codigo VARCHAR(10) unique not null,
duracion_semestres int not null,
estado VARCHAR(20) default 'ACTIVA',

constraint fk_carrera_facultad
foreign key (id_facultad)
references facultades(id_facultad)
)