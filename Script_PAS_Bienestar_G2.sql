/*
	Script de creación de Procedimientos almacenados y funciones. Deben ser procedimientos a resolver tareas especificas del negocio que están 
    implementando de acuerdo a los perfiles/roles. Se les debe asignar permisos de acuerdo a los roles
*/

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Valeria
#--------------------------------------------------------------------------------------------------------------------------------------------

# 1. ------------------------------- Un usuario que necesita ver las citas medicas disponibles ----------------------------------------------
DROP PROCEDURE IF EXISTS pas_citas_disponibles;
DELIMITER $$
CREATE PROCEDURE pas_citas_disponibles()
	BEGIN 
		SELECT * FROM vw_citamedica_disponible;
    END $$
DELIMITER ;


# 2. ------------------------------- Un usuario que necesita ver sus citas medicas proximas -------------------------------------------------
DROP PROCEDURE IF EXISTS pas_citas_agendadas;
DELIMITER $$
CREATE PROCEDURE pas_citas_agendadas(IN pacienteID INT)
	BEGIN 
		SELECT * FROM vw_citamedica_agendada WHERE paciente = pacienteID;
    END $$
DELIMITER ;


# 3. -------------------------------------- Un usuario que necesita cancelar alguna cita ----------------------------------------------------

# Verificar que la cita no sea dentro de menos de las proximas 24 horas, si es asi, enviar un error
DROP TRIGGER IF EXISTS tr_check_tiempo;
DELIMITER $$
CREATE TRIGGER tr_check_tiempo BEFORE UPDATE ON citamedica
	FOR EACH ROW
    BEGIN
		DECLARE msg VARCHAR(200);
		IF DATEDIFF(OLD.citFecha, CURRENT_DATE()) < 1 THEN
			SET msg = CONCAT('No enough time to delete the medical appointment');
            SIGNAL sqlstate '15000' SET message_text = msg;
        END IF;
    END $$
DELIMITER ;

# Eliminar la cita medica (en otras palabras, poner como NULL el paciente de dicha cita)
DROP PROCEDURE IF EXISTS pas_delete_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_delete_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		UPDATE citamedica SET pacienteID = NULL 
			WHERE pacienteID = usuarioID AND fechaCita = citFecha AND especialidadCita = citEspecialidad;
    END $$
DELIMITER ;


# 4. -------------------------------------- Un usuario que necesita agendar alguna cita ----------------------------------------------------
DROP PROCEDURE IF EXISTS pas_add_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_add_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		UPDATE citamedica SET pacienteID = usuarioID 
			WHERE fechaCita = citFecha AND especialidadCita = citEspecialidad;
    END $$
DELIMITER ;


# 5. ---------------------------------- Ver el resultado de cada cita medica de algun usuario -----------------------------------------------
DROP PROCEDURE IF EXISTS pas_check_tramites;
DELIMITER $$
CREATE PROCEDURE pas_check_tramites(IN usuarioID INT)
	BEGIN
		SELECT * FROM vw_resultado_citamedica WHERE paciente = usuarioID;
    END $$
DELIMITER ;


# 6. -------------------------------------- Ver el estado de los tramites de un usuario ------------------------------------------------------
DROP PROCEDURE IF EXISTS pas_tramites;
DELIMITER $$
CREATE PROCEDURE pas_tramites()
	BEGIN
		
    END $$
DELIMITER ;


#--------------------------------------------------------------------------------------------------------------------------------------------
#																	Carlos
#--------------------------------------------------------------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------





