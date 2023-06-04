# ------------------------------------------ AREA DE GESTION & FOMENTO ---------------------------------------------------
select * from convocatoriagestionalimentaria;
update convocatoriagestionalimentaria set cgaComida = 'Cena' where cgaLugar = 'Comedor Central';

select * from vw_info_estudiante;
update vw_info_estudiante set perDireccion='Dirección Modificada' where estID=4;


select * from convocatoriagestionalojamiento;
delete from convocatoriagestionalojamiento where conv_id=8;


select * from convocatoriagestioneconomica;
update convocatoriagestioneconomica set cgeCobertura=cgeCobertura/2 where conv_ID=1;

update convocatoriagestioneconomica set cgeCobertura=2000000 where conv_id=16;
select * from convocatoriagestioneconomica;

select * from tiendabienestar;
update tiendabienestar set tieHorFinal='20:00:00' where tieID=2;

SET foreign_key_checks = 0;
select * from producto;
delete from producto where prodPrecio<100000;
SET foreign_key_checks = 1;

# --------------------------------------------- AREA DE SALUD ---------------------------------------------------
SELECT * FROM citamedica;
UPDATE citamedica SET citDiagnostico = 'reservado' WHERE citDiagnostico = 'muerte';
SELECT * FROM citamedica;

SELECT * FROM medicamentos;
DELETE FROM medicamentos WHERE medNombre = 'Noxpirin';
SELECT * FROM medicamentos;

SELECT * FROM personalsalud;
UPDATE personalsalud SET salEspecializacion = 'Jefe' WHERE perID = 10;
SELECT * FROM personalsalud;

SELECT * FROM discapacidad;
UPDATE discapacidad SET disVerificado = 1 WHERE perID = 101010112;
DELETE FROM discapacidad WHERE perID = 1010101200;
SELECT * FROM discapacidad;

# --------------------------------------------- AREA DE DEPORTES ---------------------------------------------------
select * from Convocatoria;

insert into Convocatoria (conv_id, convNombre, convFechaApertura, convFechaCierre, convEstado, convPeriodo, Programa_progID) 
values (222, 'Convocatoria Deporte 2021-1', '2021-01-01', '2021-01-31', 1, '2021-1', 1703);
delete from Convocatoria where conv_id = 222;

select * from ConvocatoriaSeleccion;
update ConvocatoriaSeleccion set convDeporte = 'Tiro con arco' where Convocatoria_conv_id = 211;
delete from ConvocatoriaSeleccion where convDeporte = 'Tiro con arco';

select * from ConvocatoriaSeleccion;
update ConvocatoriaSeleccion set convDeporte = 'Ping pong' where Convocatoria_conv_id = 212;
delete from ConvocatoriaSeleccion where convDeporte = 'Ping pong';

select * from ConvocatoriaSeleccion;
update ConvocatoriaSeleccion set convDeporte = 'Atletismo' where Convocatoria_conv_id = 213;
delete from ConvocatoriaSeleccion where Convocatoria_conv_id = 213;

select * from ConvocatoriaSeleccion;
update ConvocatoriaSeleccion set convDeporte = 'Taekwondo' where Convocatoria_conv_id = 214;
delete from ConvocatoriaSeleccion where convDeporte = 'Atletismo';
