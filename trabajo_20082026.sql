--Cracion tabla de estudiantes y su llave foranea a la tabla carreras
create table estudiantes(
id_estudiante serial primary key,
matricula VARCHAR(20) unique not null,
nombre VARCHAR(100) not null,
apellido VARCHAR(100) not null,
email VARCHAR(100) UNIQUE,
telefono VARCHAR(20),
fecha_nacimiento date,
id_carrera int not null,
fecha_ingreso date default current_date,
estado VARCHAR(20) default 'ACTIVO',

constraint fk_estudiante_carrera
foreign key (id_carrera)
references carreras(id_carrera)
);

--Insert de valores a la tabla estudiantes
insert into estudiantes (matricula, nombre, apellido, email, telefono, fecha_nacimiento, id_carrera)
values
('2024126397', 'Juan', 'hernandez', 'Juan@alu.uabcs.mx', '6124837291', '2024-03-15',65),
('2021058274', 'Camila', 'Fuentes', 'Camila@alu.uabcs.mx', '6125179364', '2023-07-22',76),
('2026083145', 'Edgar', 'Mendoza', 'Edgar@alu.uabcs.mx', '6128642035','2025-01-09',87),
('2022097631', 'Yael', 'Villaelejo', 'Yael@alu.uabcs.mx', '6126904712', '2022-11-30',95),
('2025124806', 'Brian', 'Higuera', 'Brian@alu.uabcs.mx', '6123291857', '2026-05-18',67),
('2023041957', 'Donovan', 'Torres', 'Donovan@alu.uabcs.mx', '6127516048', '2024-09-27',90)|

--select a la tabla de estudiantes para mostrar los datos
select * from estudiantes e