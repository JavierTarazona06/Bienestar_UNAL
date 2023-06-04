#--------------------------------------------------------------------------------------------------------
#                                                     Salud
#--------------------------------------------------------------------------------------------------------
# 1. Verificar que la cita que el usuario va a eliminar no sea dentro de menos de las proximas 24 horas, si es asi, 
# enviar un error
DROP TRIGGER IF EXISTS tr_check_tiempo;
DELIMITER $$
CREATE TRIGGER tr_check_tiempo BEFORE UPDATE ON citamedica
	FOR EACH ROW
    BEGIN
		DECLARE msg VARCHAR(200);
		IF DATEDIFF(OLD.citFecha, CURRENT_DATE()) < 1 THEN
			SET msg = CONCAT('La cita es dentro de las proximas 24 horas, no se puede');
            SIGNAL sqlstate '15000' SET message_text = msg;
        END IF;
    END $$
DELIMITER ;

# 2. Verificar que la incapacidad a insertar por el usuario no ha sido ya añadida
DROP TRIGGER IF EXISTS tr_check_duplicates;
DELIMITER $$
CREATE TRIGGER tr_check_duplicates BEFORE INSERT ON incapacidad
	FOR EACH ROW
	BEGIN
		DECLARE duplicated INT;
        DECLARE msg VARCHAR(200);
		SELECT EXISTS (SELECT incID FROM incapacidad 
            WHERE perID = NEW.perID AND incEnfermedad = NEW.incEnfermedad
            AND incFecha = NEW.incFecha AND incDias = NEW.incDias) INTO duplicated;
        
        IF duplicated THEN
			SET msg = CONCAT('La incapacidad ya existe');
            SIGNAL sqlstate '15000' SET message_text = msg;
		END IF;
    END $$
DELIMITER ;

# 3. Verificar que la incapacidad a modificar por el usuario no haya sido ya verificada
DROP TRIGGER IF EXISTS tr_check_verification;
DELIMITER $$
CREATE TRIGGER tr_check_verification BEFORE UPDATE ON incapacidad
	FOR EACH ROW
	BEGIN
		DECLARE verificated BOOL;
        DECLARE msg VARCHAR(200);
		SELECT incVerificado INTO verificated FROM incapacidad 
            WHERE perID = OLD.perID AND incEnfermedad = OLD.incEnfermedad
            AND incFecha = OLD.incFecha AND incDias = OLD.incDias;
        
        IF verificated THEN
			SET msg = CONCAT('La incapacidad ya ha sido verificada, no se puede modificar');
            SIGNAL sqlstate '15000' SET message_text = msg;
		END IF;
    END $$
DELIMITER ;

# 4. Verificar que la atencion en salud a insertar por el usuario no ha sido ya añadida
DROP TRIGGER IF EXISTS tr_check_duplicates_atsalud;
DELIMITER $$
CREATE TRIGGER tr_check_duplicates_atsalud BEFORE INSERT ON atencionensalud
	FOR EACH ROW
	BEGIN
		DECLARE duplicated INT;
        DECLARE msg VARCHAR(200);
		SELECT EXISTS (SELECT antID FROM atencionensalud
            WHERE perID = NEW.perID AND ateTipo = NEW.ateTipo
            AND ateFecha = NEW.ateFecha) INTO duplicated;
        
        IF duplicated THEN
			SET msg = CONCAT('La atencion en salud ya existe');
            SIGNAL sqlstate '15000' SET message_text = msg;
		END IF;
    END $$
DELIMITER ;

# 5. Verificar que la atencion en salud a modificar no haya sido ya verificada
DROP TRIGGER IF EXISTS tr_check_verification_atsalud;
DELIMITER $$
CREATE TRIGGER tr_check_verification_atsalud BEFORE UPDATE ON atencionensalud
	FOR EACH ROW
	BEGIN
		DECLARE verificated BOOL;
        DECLARE msg VARCHAR(200);
		SELECT ateVerificado INTO verificated FROM atencionensalud
            WHERE perID = OLD.perID AND ateTipo = OLD.ateTipo
            AND ateFecha = OLD.ateFecha;
        
        IF verificated THEN
			SET msg = CONCAT('La atencion en salud ya ha sido verificada, no se puede modificar');
            SIGNAL sqlstate '15000' SET message_text = msg;
		END IF;
    END $$
DELIMITER ;

# 6. Verificar que el doctor a agendar no tenga citas medicas durante dicho turno
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

# 7. Verficar que no haya algun paciente con una cita medica la cual se piensa eliminar
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


# 1.El secretario/dirección pueden insertar una convocatoria de gestión de alojamiento, pero si la cobertura es mayor al costo, no insertarla
#Se realiza una función que devuelva un booleano en el caso de que la obra si se pueda insertar


#2 La dirección económica quiere eliminar convocatorias económicas, pero para hacerlo 
#debe eliminar primero el registro de la  tabla de convocarorias


#3 Dirección: Al eliminar una factura, también se elimina las relaciones con prodID y factID


#4. Cuando se inserte una actividad de corresponsabilidad, restar las horas a la tabla de corresponsabilidad


#5. Al insertar en conv. economicas, se inserta también la convocatoria a la tabla de convocatoria
	/* Pruede usar para insertar la conv. en convocatoria
	call insertar_conv_en_curso(23, 'Gestión Alojamiento', 1);*/


#--------------------------------------------------------------------------------------------------------
#                                                     Actividad Fisica y Deporte
#--------------------------------------------------------------------------------------------------------

# Triggers:
# Si una convocatoria tiene estado cerrada no se puede insertar.
drop trigger if exists tr_check_convocatoria;
DELIMITER $$
create trigger tr_check_convocatoria before insert on Convocatoria 
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
create trigger tr_check_torneo before insert on TorneoInterno for each row
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
create trigger tr_check_hora_conv_seleccion before insert on ConvocatoriaSeleccion
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
create trigger tr_check_PAPA before insert on Estudiante_Toma_Convocatoria for each row
begin #por terminar

end $$
DELIMITER ;