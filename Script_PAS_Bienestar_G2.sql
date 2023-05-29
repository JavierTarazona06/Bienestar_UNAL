/*
	Script de creación de Procedimientos almacenados y funciones. Deben ser procedimientos a resolver tareas especificas del negocio que están 
    implementando de acuerdo a los perfiles/roles. Se les debe asignar permisos de acuerdo a los roles
*/

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Valeria
#--------------------------------------------------------------------------------------------------------------------------------------------


# 1. ------------------------------- Un usuario que necesita ver sus citas medicas proximas -------------------------------------------------
DROP PROCEDURE IF EXISTS pas_citas_agendadas;
DELIMITER $$
CREATE PROCEDURE pas_citas_agendadas(IN pacienteID INT)
	BEGIN 
		SELECT * FROM vw_citamedica_agendada WHERE paciente = pacienteID;
    END $$
DELIMITER ;


# 2. -------------------------------------- Un usuario que necesita cancelar alguna cita ----------------------------------------------------

# Verificar que la cita no sea dentro de menos de las proximas 24 horas, si es asi, enviar un error
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

# Eliminar la cita medica (en otras palabras, poner como NULL el paciente de dicha cita)
DROP PROCEDURE IF EXISTS pas_delete_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_delete_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		UPDATE citamedica SET pacienteID = NULL 
			WHERE pacienteID = usuarioID AND fechaCita = citFecha AND especialidadCita = citEspecialidad;
    END $$
DELIMITER ;


# 3. -------------------------------------- Un usuario que necesita agendar alguna cita ----------------------------------------------------
DROP PROCEDURE IF EXISTS pas_add_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_add_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		UPDATE citamedica SET pacienteID = usuarioID 
			WHERE fechaCita = citFecha AND especialidadCita = citEspecialidad;
    END $$
DELIMITER ;


# 4. ---------------------------------- Ver el resultado de cada cita medica de algun usuario -----------------------------------------------
DROP PROCEDURE IF EXISTS pas_check_resultados;
DELIMITER $$
CREATE PROCEDURE pas_check_resultados(IN usuarioID INT)
	BEGIN
		SELECT * FROM vw_resultado_citamedica WHERE paciente = usuarioID;
    END $$
DELIMITER ;


# 4. --------------------------------------------- Añadir una incapacidad de un usuario -----------------------------------------------------

# Verificar que la incapacidad no ha sido ya añadida
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

# Añadir una incapacidad
DROP PROCEDURE IF EXISTS pas_add_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_add_incapacidad(
	IN usuarioID INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN dias TINYINT)
	BEGIN
		INSERT INTO incapacidad (perID, incFecha, incEnfermedad, incDias, incVerificado, incAprobado) 
			VALUES (usuarioID, fecha, enfermedad, dias, 0, 0);
    END $$
DELIMITER ;

# 5. --------------------------------------------- Modificar una incapacidad de un usuario --------------------------------------------------

# Verificar que la incapacidad no haya sido ya verificada
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

# Añadir una incapacidad
DROP PROCEDURE IF EXISTS pas_edit_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_edit_incapacidad(
	IN incapacidadID INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN dias TINYINT)
	BEGIN
		UPDATE incapacidad SET incFecha = fecha, incEnfermedad = enfermedad, incDias = dias
			WHERE incID = incapacidadID;
    END $$
DELIMITER ;

# 6. -------------------------------------- Ver el estado de las atenciones en salud de un usuario -----------------------------------------
DROP PROCEDURE IF EXISTS pas_view_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_view_atencionsalud(IN usuarioID INT)
	BEGIN
		SELECT * FROM vw_atencionsalud WHERE persona = usuarioID;
    END $$
DELIMITER ;

# 7. --------------------------------------------- Añadir una atencion en salud de un usuario ---------------------------------------------

# Verificar que la atencion en salud no ha sido ya añadida
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

# Añadir una atencion en salud
DROP PROCEDURE IF EXISTS pas_add_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_add_atencionsalud(
	IN usuarioID INT, IN fecha DATETIME, IN tipo VARCHAR(45))
	BEGIN
		INSERT INTO atencionensalud (perID, ateFecha, ateTipo, ateVerificado, ateAprobado) 
			VALUES (usuarioID, fecha, tipo, 0, 0);
    END $$
DELIMITER ;

# 8. --------------------------------------------- Modificar una atencion en salud de un usuario ------------------------------------------

# Verificar que la incapacidad no haya sido ya verificada
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

# Añadir una incapacidad
DROP PROCEDURE IF EXISTS pas_edit_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_edit_atencionsalud(
	IN atencionsaludID INT, IN fecha DATETIME, IN tipo VARCHAR(45))
	BEGIN
		UPDATE atencionensalud SET ateFecha = fecha, ateTipo = tipo
			WHERE antID = atencionsaludID;
    END $$
DELIMITER ;



# 9. ----------------------------------------------------- Crear una cita medica -----------------------------------------------------------

# Verificar que el doctor seleccionado no tenga ya una cita a esa hora
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

# Añadir la cita medica 
DROP PROCEDURE IF EXISTS pas_create_citamedica;
DELIMITER $$
CREATE PROCEDURE pas_create_citamedica(IN doctor INT, IN fecha DATETIME)
	BEGIN 
		DECLARE especialidad VARCHAR(52);
        SELECT salEspecializacion INTO especialidad FROM personalsalud WHERE doctor = perID;
		INSERT INTO citamedica (doctorID, citFecha, citEspecialidad) VALUES (doctor, fecha, especialidad);
    END $$
DELIMITER ;

# 10. ----------------------------------------------------- Eliminar una cita medica --------------------------------------------------------

# Verificar que no haya algun paciente con dicha cita
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

# Eliminar la cita medica 
DROP PROCEDURE IF EXISTS pas_remove_citamedica;
DELIMITER $$
CREATE PROCEDURE pas_remove_citamedica(IN cita INT)
	BEGIN 
		DELETE FROM citamedica WHERE citID = cita;
    END $$
DELIMITER ; 

# 11. ----------------------------------------------- Aprobar o rechazar una incapacidad ----------------------------------------------------
DROP PROCEDURE IF EXISTS pas_approve_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_approve_incapacidad(
	IN persona INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN desicion BOOL)
	BEGIN 
		UPDATE incapacidad SET incAprobado = desicion, incVerificado = 1
        WHERE persona = perID AND incFecha = fecha AND incEnfermedad = enfermedad;
    END $$
DELIMITER ;

# 12. -------------------------------------------- Aprobar o rechazar una atencion en salud -------------------------------------------------
DROP PROCEDURE IF EXISTS pas_approve_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_approve_atencionsalud(
	IN persona INT, IN fecha DATETIME, IN tipo VARCHAR(45), IN desicion BOOL)
	BEGIN 
		UPDATE atencionensalud SET ateAprobado = desicion, ateVerificado = 1
        WHERE persona = perID AND ateFecha = fecha AND ateTipo = tipo;
    END $$
DELIMITER ;

# 13. ------------------------------------------- Agregar los resultados de una cita medica -------------------------------------------------
DROP PROCEDURE IF EXISTS pas_update_resultados;
DELIMITER $$
CREATE PROCEDURE pas_update_resultados(
	IN cita INT, IN diagnostico VARCHAR(80), IN medicamento VARCHAR(45), IN cantidad TINYINT, IN intervalos TINYINT, IN examen VARCHAR(45), 
    IN peso TINYINT, IN estatura TINYINT, IN corazon TINYINT, IN vision TINYINT)
	BEGIN 
		UPDATE citamedica SET citDiagnostico = diagnostico WHERE citID = cita;
        IF medicamento IS NOT NULL THEN
			INSERT INTO medicamentos (citID, medNombre, medCantidad, medIntervalos) VALUES (cita, medicamento, cantidad, intervalos);
		END IF;
		IF examen IS NOT NULL THEN
			INSERT INTO ordenmedica (citID, ordExamen) VALUES (cita, examen);
        END IF;
        INSERT INTO evaluacionfisica (citID, evaPeso, evaEstatura, evaRitmoCardiaco, evaVision) VALUES (cita, peso, estatura, corazon, vision);
    END $$
DELIMITER ;

# 14. -------------------------------------- Modificar el perfil de riesgo integral de un usuario -------------------------------------------
DROP PROCEDURE IF EXISTS pas_edit_perfilintegral;
DELIMITER $$
CREATE PROCEDURE pas_edit_perfilintegral(IN persona INT, IN fisico INT, IN psicologico INT)
	BEGIN 
		UPDATE perfilriesgointegral SET perSaludFisica = fisico, perSaludPsicologica = psicologico
        WHERE persona = perID;
    END $$
DELIMITER ;

#--------------------------------------------------------------------------------------------------------------------------------------------
#																	Carlos
#--------------------------------------------------------------------------------------------------------------------------------------------







#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------







#--------------------------------------------------------------------------------------------------------------------------------------------
#																	PAS_interfaz
#--------------------------------------------------------------------------------------------------------------------------------------------

# Uso General:

# ------------------------------- Un usuario necesita ver todas las convocatorias por área ----------------------------------------------
drop procedure if exists sp_consultar_convocatorias_area;
DELIMITER $$
create procedure sp_consultar_programas_de_deportes(in idArea int)
	begin 
		select * from vw_info_convocatoria where areID = idArea;
	end $$
DELIMITER ;


# ------------------------------- Un estudiante necesita ver las convocatorias por programa de area de bienestar ----------------------------------------------
drop procedure if exists sp_consultar_convocatorias_programa;
DELIMITER $$
create procedure sp_consultar_convocatorias_deporte(in idPrograma int)
	begin 
		select * from Convocatoria where Programa_progID = id_Programa;
	end $$
DELIMITER ;

# ------------------------------- Un estudiante necesita ver las convocatorias en las que participa ----------------------------------------------
drop procedure if exists sp_consultar_mis_convocatorias;
DELIMITER $$
create procedure sp_consultar_mis_convocatorias (in cedula int)
	begin
		select * from vw_info_convocatoria_estudiante where estID = cedula;
	end $$
DELIMITER ;


# Salud

# --------------------------------------------- Ver perfil de riesgo integral de un usuario --------------------------------------------
DROP PROCEDURE IF EXISTS pas_view_perfilriesgo;
DELIMITER $$
CREATE PROCEDURE pas_view_perfilriesgo(IN usuarioID INT)
	BEGIN
		SELECT * FROM vw_perfil_integral WHERE persona = usuarioID;
    END $$
DELIMITER ;

# -------------------------------------- Ver el estado de las incapacidades de un usuario ------------------------------------------------
DROP PROCEDURE IF EXISTS pas_view_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_view_incapacidad(IN usuarioID INT)
	BEGIN
		SELECT * FROM vw_incapacidad WHERE persona = usuarioID;
    END $$
DELIMITER ;

# ------------------------------- Un usuario que necesita ver las citas medicas disponibles ----------------------------------------------
DROP PROCEDURE IF EXISTS pas_citas_disponibles;
DELIMITER $$
CREATE PROCEDURE pas_citas_disponibles()
	BEGIN 
		SELECT * FROM vw_citamedica_disponible;
    END $$
DELIMITER ;


# Actividad Física y Deporte

# ------------------------------- Un usuario necesita ver los torneos internos disponibles ----------------------------------------------
drop procedure if exists sp_consultar_torneos_internos;
DELIMITER $$
create procedure sp_consultar_torneos_internos()
	begin 
		select * from TorneoInterno;
	end $$
DELIMITER ;

# ------------------------------- Un usuario necesita ver los cursos libres de deportes disponibles ----------------------------------------------
drop procedure if exists sp_consultar_convocatoria_cursos_libres;
DELIMITER $$
create procedure sp_consultar_convocatoria_cursos_libres()
	begin 
		select * from ConvocatoriaCursoLibre;
	end $$
DELIMITER ;


# Gestión y Fomento Socioeconómico

# ------------------------------- Un usuario necesita ver información detallada de convocatorias de fomento, por tipo de apoyo.-----------------------
drop procedure if exists sp_consultar_gestion_alimentaria;
DELIMITER $$
create procedure sp_consultar_gestion_alimentaria ()
	begin
		select * from ConvocatoriaGestionAlimentaria join Convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_transporte;
DELIMITER $$
create procedure sp_consultar_gestion_transporte ()
	begin
		select * from ConvocatoriaGestionTransporte join Convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_alojamiento;
DELIMITER $$
create procedure sp_consultar_gestion_alojamiento()
	begin
		select * from ConvocatoriaGestionAlojamiento join Convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_economica;
DELIMITER $$
create procedure sp_consultar_gestion_economica ()
	begin
		select * from ConvocatoriaGestionEconomica join Convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_emprendimiento;
DELIMITER $$
create procedure sp_consultar_gestion_emprendimiento ()
	begin
		select * from ConvocatoriaFomentoEmprendimeinto join Convocatoria on (conv_id);
	end $$
DELIMITER ;

