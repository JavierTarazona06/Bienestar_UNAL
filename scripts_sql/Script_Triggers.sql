#--------------------------------------------------------------------------------------------------------
#                                                    Salud
#--------------------------------------------------------------------------------------------------------
# 1. Verificar que el doctor a agendar no tenga citas medicas durante dicho turno
DROP TRIGGER IF EXISTS tr_check_doctor;
DELIMITER $$
CREATE TRIGGER tr_check_doctor BEFORE INSERT ON citamedica
	FOR EACH ROW
    BEGIN
		DECLARE has_appointment BOOl;
        DECLARE msg VARCHAR(200);
        
        SELECT EXISTS (SELECT citID FROM citamedica 
        WHERE doctorID = NEW.doctorID AND citFecha = NEW.citFecha) 
        INTO has_appointment;
        IF has_appointment THEN
			SET msg = CONCAT('El doctor ya tiene una cita a dicha hora');
				SIGNAL sqlstate '14000' SET message_text = msg;
		END IF;
    END $$
DELIMITER ;

# 2. Verficar que no haya algun paciente con una cita medica la cual se piensa eliminar
DROP TRIGGER IF EXISTS tr_check_paciente;
DELIMITER $$
CREATE TRIGGER tr_check_paciente BEFORE DELETE ON citamedica FOR EACH ROW
	BEGIN
		DECLARE paciente INT;
		DECLARE msg VARCHAR(200);
        
		SELECT OLD.pacienteID INTO paciente FROM citamedica WHERE citID = OLD.citID;
		IF paciente IS NOT NULL THEN
			SET msg = CONCAT('Hay un paciente ya con dicha cita');
			SIGNAL sqlstate '14000' SET message_text = msg;
		END IF;
	END $$
DELIMITER ;

#--------------------------------------------------------------------------------------------------------
#                                       Gestion y Fomento Socioeconomico
#--------------------------------------------------------------------------------------------------------


#1. Cuando se inserte una actividad de corresponsabilidad, restar las horas a la tabla de corresponsabilidad

drop trigger if exists tr_insertar_act_corresp;
DELIMITER $$
create trigger tr_insertar_act_corresp after insert on actividadcorresp
	for each row
	begin
	update corresponsabilidad set horPendCorresp=horPendCorresp-NEW.actCorHoras;
    end $$
DELIMITER ;

/*
start transaction;
select * from actividadcorresp where estID=101010127;
select * from corresponsabilidad where idEst=101010127;
insert into actividadcorresp values (101010127, 'deportiva', 6, '2023-03-15');
select * from actividadcorresp where estID=101010127;
select * from corresponsabilidad where idEst=101010127;
rollback;
*/


#2. Cuando se inserte una factura, se reduce la dispobnibilidad

drop trigger if exists tr_insertar_prod_fact;
DELIMITER $$
create trigger tr_insertar_prod_fact after insert on factura_producto
	for each row
	begin
    declare tienda int;
    select tieID into tienda from factura where factID=new.factID;
	update producto_tiendaun set prodDisponibilidad=prodDisponibilidad-1 
		where tieID=tienda and prodID=new.prodID;
    end $$
DELIMITER ;

/*
start transaction;
select * from factura_producto where factID=5;
select * from producto_tiendaun where prodID=9;
insert into factura_producto values (9,5);
select * from factura_producto where factID=5;
select * from producto_tiendaun where prodID=9;
rollback;
*/

# Al eliminar una factura, también se elimina las relaciones con prodID y factID

drop trigger if exists tr_eliminar_factura;
DELIMITER $$
create trigger tr_eliminar_factura before delete on factura
	for each row
	begin
		delete from factura_producto where factID=old.factID;
    end $$
DELIMITER ;

/*
start transaction;
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
delete from factura where clienteID=10101013;
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
rollback;
*/

#3. Al insertar en conv. economicas, se inserta también la convocatoria a la tabla de convocatoria
	#Al eliminar en conv. economicas, se elimina también la convocatoria a la tabla de convocatoria
	/* Pruede usar para insertar la conv. en convocatoria
	call insertar_conv_en_curso(23, 'Gestión Alojamiento', 1);*/
    
drop trigger if exists tr_insert_conv_alimento;
DELIMITER $$
create trigger tr_insert_conv_alimento before insert on convocatoriagestionalimentaria
	for each row
	begin
	call insertar_conv_en_curso(NEW.conv_id, 'Fomento Económico Estudiantes Alimentación', 1, 3.5);
    end $$
DELIMITER ;

drop trigger if exists tr_delete_conv_alimento;
DELIMITER $$
create trigger tr_delete_conv_alimento after delete on convocatoriagestionalimentaria
	for each row
	begin
		delete from convocatoria where conv_id=OLD.conv_id;
    end $$
DELIMITER ;

/*
start transaction;
insert into convocatoriagestionalimentaria values (23, 'Desayuno', 'Hemeroteca');
select * from convocatoria;
select * from convocatoriagestionalimentaria;
delete from convocatoriagestionalimentaria where conv_id=23;
select * from convocatoria;
select * from convocatoriagestionalimentaria;
rollback;
*/

#---------------------


drop trigger if exists tr_insert_conv_emprendimiento;
DELIMITER $$
create trigger tr_insert_conv_emprendimiento before insert on convocatoriafomentoemprendimiento
	for each row
	begin
	call insertar_conv_en_curso(NEW.conv_id, 'Fomento Emprendimiento Estudiantes', 1, 3.5);
    end $$
DELIMITER ;

drop trigger if exists tr_delete_conv_emprendimiento;
DELIMITER $$
create trigger tr_delete_conv_emprendimiento after delete on convocatoriafomentoemprendimiento
	for each row
	begin
		delete from convocatoria where conv_id=OLD.conv_id;
    end $$
DELIMITER ;

/*
start transaction;
insert into convocatoriafomentoemprendimiento values (23, 200000, 'El Nuevo', 'Tema Nuevo', 'Es un nuevo emp.');
select * from convocatoria;
select * from convocatoriafomentoemprendimiento;
delete from convocatoriafomentoemprendimiento where conv_id=23;
select * from convocatoria;
select * from convocatoriafomentoemprendimiento;
rollback;
*/

#---------------------

#Nota.El secretario/dirección pueden insertar una convocatoria de gestión de alojamiento, pero si la cobertura es mayor al costo, no insertarla
#Se realiza una función que devuelva un booleano en el caso de que la obra si se pueda insertar

drop trigger if exists tr_insert_conv_alojamiento;
DELIMITER $$
create trigger tr_insert_conv_alojamiento before insert on convocatoriagestionalojamiento
	for each row
	begin
    if NEW.cgalCobertura > NEW.cgalCosto then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cobertura de la gestión de alojamiento no puede ser mayor al costo del alojamiento';
    else
		call insertar_conv_en_curso(NEW.conv_id, 'Gestión Alojamiento', 1, 3.5);
	end if;
    end $$
DELIMITER ;

drop trigger if exists tr_delete_conv_alojamiento;
DELIMITER $$
create trigger tr_delete_conv_alojamiento after delete on convocatoriagestionalojamiento
	for each row
	begin
		delete from convocatoria where conv_id=OLD.conv_id;
    end $$
DELIMITER ;

/*
start transaction;
insert into convocatoriagestionalojamiento values (23, 'Cra 45 No 21-42', 'Teusaquillo', 500000, 'Habitación', 'Buena habitación', 600000);
#insert into convocatoriagestionalojamiento values (23, 'Cra 45 No 21-42', 'Teusaquillo', 800000, 'Habitación', 'Buena habitación', 600000);
select * from convocatoria;
select * from convocatoriagestionalojamiento;
delete from convocatoriagestionalojamiento where conv_id=23;
select * from convocatoria;
select * from convocatoriagestionalojamiento;
rollback;
*/

#---------------------

drop trigger if exists tr_insert_conv_economica;
DELIMITER $$
create trigger tr_insert_conv_economica before insert on convocatoriagestioneconomica
	for each row
	begin
	call insertar_conv_en_curso(NEW.conv_id, 'Fomento Económico Estudiantes', 1, 3.5);
    end $$
DELIMITER ;

drop trigger if exists tr_delete_conv_economica;
DELIMITER $$
create trigger tr_delete_conv_economica after delete on convocatoriagestioneconomica
	for each row
	begin
		delete from convocatoria where conv_id=OLD.conv_id;
    end $$
DELIMITER ;

/*
start transaction;
insert into convocatoriagestioneconomica values (23, 400000);
select * from convocatoria;
select * from convocatoriagestioneconomica;
delete from convocatoriagestioneconomica where conv_id=23;
select * from convocatoria;
select * from convocatoriagestioneconomica;
rollback;
*/

#---------------------


drop trigger if exists tr_insert_conv_transporte;
DELIMITER $$
create trigger tr_insert_conv_transporte before insert on convocatoriagestiontransporte
	for each row
	begin
	call insertar_conv_en_curso(NEW.conv_id, 'Gestión Transporte', 1, 3.5);
    end $$
DELIMITER ;

drop trigger if exists tr_delete_conv_transporte;
DELIMITER $$
create trigger tr_delete_conv_transporte after delete on convocatoriagestiontransporte
	for each row
	begin
		delete from convocatoria where conv_id=OLD.conv_id;
    end $$
DELIMITER ;

/*
start transaction;
insert into convocatoriagestiontransporte values (23, 400000, 'Transporte público masivo');
select * from convocatoria;
select * from convocatoriagestiontransporte;
delete from convocatoriagestiontransporte where conv_id=23;
select * from convocatoria;
select * from convocatoriagestiontransporte;
rollback;
*/

#---------------------

#--------------------------------------------------------------------------------------------------------
#                                                     Actividad Fisica y Deporte
#--------------------------------------------------------------------------------------------------------

# Triggers:
# Si una convocatoria tiene estado cerrada no se puede insertar.
drop trigger if exists tr_check_convocatoria;
DELIMITER $$
create trigger tr_check_convocatoria before insert on convocatoria 
for each row
	begin
		declare msg varchar(225);
        if (new.convEstado = 0) then
			set msg = concat('No se puede insertar una convocatoria cerrada: ', new.convEstado);
            SIGNAL sqlstate '45000' set message_text = msg;
		end if;
	end $$
DELIMITER ;

# Verificar si el programa que inserta nuevos torneos es el programa de deporte de competenecia, Ningún otro puede crear torneos deportivos
drop trigger if exists tr_check_torneo;
DELIMITER $$
create trigger tr_check_torneo before insert on torneointerno for each row
begin
	declare msg varchar(225);
        if (new.Programa_progID != 1) then -- ids de programas a convenir
			set msg = concat('El programa no tiene permitido crear nuevos torneos');
            SIGNAL sqlstate '45000' set message_text = msg;
		end if;
end $$
DELIMITER ;

# No se pueden crear convocatorias a selecciones fuera del horario laboral.
drop trigger if exists tr_check_hora_conv_seleccion;
DELIMITER $$
create trigger tr_check_hora_conv_seleccion before insert on convocatoriaseleccion
for each row
begin
	declare msg varchar(225);
        if (new.convHora < '06:00:00' and new.convHora > '20:00:00') then
			set msg = concat('No se pueden citar convocatorias fuera del horario laboral.');
            SIGNAL sqlstate '45000' set message_text = msg;
		end if;
end $$
DELIMITER ;

# No se puede participar en una convocatoria si el PAPA no cumple con el mínimo requerido.
drop trigger if exists tr_check_PAPA;
DELIMITER $$
create trigger tr_check_PAPA before insert on estudiante_toma_convocatoria for each row
begin
	declare papa_est int;
    declare papa_conv int;
    declare msg varchar(225);
    select estPAPA into papa_est from estudiante where estID=NEW.idEst;
    select convPAPA into papa_conv from convocatoria where conv_id=NEW.conv_id;
    if papa_est<papa_conv then
		set msg = concat('El estudiante tiene un PAPA de ',papa_est,' menor al de la convocatoria ',papa_conv);
		SIGNAL sqlstate '45000' set message_text = msg;
    end if;
end $$
DELIMITER ;

/*
start transaction;
insert into estudiante_toma_convocatoria values (101010118,219,'2023-05-24');
select * from estudiante_toma_convocatoria;
select * from convocatoria;
select * from estudiante;
rollback;
*/