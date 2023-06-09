/*
	Script de creación de Procedimientos almacenados y funciones. Deben ser procedimientos a resolver tareas especificas del negocio que están 
    implementando de acuerdo a los perfiles/roles. Se les debe asignar permisos de acuerdo a los roles
*/

#set global log_bin_trust_function_creators = 1;

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Salud
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
		SELECT fecha, especialidad, doctor FROM vw_citamedica_agendada WHERE paciente = pacienteID;
    END $$
DELIMITER ;

# 3. -------------------------------------- Un usuario que necesita cancelar alguna cita ----------------------------------------------------
# Eliminar la cita medica (en otras palabras, poner como NULL el paciente de dicha cita), revertir el cambio en caso de que la cita sea dentro
# de menos de 24 horas
DROP PROCEDURE IF EXISTS pas_delete_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_delete_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		DECLARE msg VARCHAR(100);
        DECLARE fecha DATETIME;
		START TRANSACTION;
			SELECT citFecha INTO fecha FROM citamedica
				WHERE pacienteID = usuarioID AND fechaCita = citFecha AND especialidadCita = citEspecialidad;
			IF DATEDIFF(fecha, CURRENT_DATE()) < 1 THEN
				SET msg = CONCAT('La cita es dentro de las proximas 24 horas, no se puede cancelar');
				ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;
			ELSE
				UPDATE citamedica SET pacienteID = NULL 
					WHERE pacienteID = usuarioID AND fechaCita = citFecha AND especialidadCita = citEspecialidad;
				COMMIT;
			END IF;
    END $$
DELIMITER ;

# 4. -------------------------------------- Un usuario que necesita agendar alguna cita ----------------------------------------------------
# Verificar que el usuario no tenga otra cita medica durante dicho tiempo antes de agendar la cita
DROP PROCEDURE IF EXISTS pas_add_cita_medica;
DELIMITER $$
CREATE PROCEDURE pas_add_cita_medica(IN usuarioID INT, IN fechaCita DATETIME, IN especialidadCita VARCHAR(45))
	BEGIN
		DECLARE msg VARCHAR(100);
		DECLARE ocupado BOOL;
		START TRANSACTION;
			SELECT EXISTS (SELECT citID FROM citamedica 
				WHERE pacienteID = usuarioID AND citFecha = fechaCita ) INTO ocupado;
			IF ocupado THEN
				SET msg = CONCAT('Ya se tiene una cita durante dicha hora, no se puede agendar');
				ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;
			ELSE
				UPDATE citamedica SET pacienteID = usuarioID 
					WHERE fechaCita = citFecha AND especialidadCita = citEspecialidad;
				COMMIT;
			END IF;
    END $$
DELIMITER ;

# 5. ---------------------------------- Ver el resultado de cada cita medica de algun usuario -----------------------------------------------
DROP PROCEDURE IF EXISTS pas_check_resultados;
DELIMITER $$
CREATE PROCEDURE pas_check_resultados(IN usuarioID INT)
	BEGIN
		SELECT fecha, especialidad, diagnostico, peso, estatura, ritmo_cardiaco, vision, medicamento, cantidad, intervalos, examen 
			FROM vw_resultado_citamedica WHERE paciente = usuarioID;
    END $$
DELIMITER ;

# 6. -------------------------------------- Ver el estado de las incapacidades de un usuario ------------------------------------------------
DROP PROCEDURE IF EXISTS pas_view_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_view_incapacidad(IN usuarioID INT)
	BEGIN
		SELECT id, fecha, razon, dias, verificado, aprobado FROM vw_incapacidad WHERE persona = usuarioID;
    END $$
DELIMITER ;

# 7. --------------------------------------------- Añadir una incapacidad de un usuario -----------------------------------------------------
# Verificar que la incapacidad no ha sido insertada antes
DROP PROCEDURE IF EXISTS pas_add_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_add_incapacidad(
	IN usuarioID INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN dias TINYINT)
	BEGIN
		DECLARE duplicated BOOL;
        DECLARE msg VARCHAR(200);
		START TRANSACTION;
			SELECT EXISTS (SELECT incID FROM incapacidad 
				WHERE perID = usuarioID AND incEnfermedad = enfermedad AND incFecha = fecha AND incDias = dias) 
                INTO duplicated;
			IF duplicated THEN
				SET msg = CONCAT('La incapacidad ya existe');
                ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;
			ELSE
				INSERT INTO incapacidad (perID, incFecha, incEnfermedad, incDias, incVerificado, incAprobado) 
					VALUES (usuarioID, fecha, enfermedad, dias, 0, 0);
				COMMIT;
			END IF;
    END $$
DELIMITER ;

# 8. --------------------------------------------- Modificar una incapacidad de un usuario --------------------------------------------------
DROP PROCEDURE IF EXISTS pas_edit_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_edit_incapacidad(
	IN incapacidadID INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN dias TINYINT)
	BEGIN
		DECLARE verificated BOOL;
        DECLARE msg VARCHAR(200);
		START TRANSACTION;
			SELECT incVerificado INTO verificated FROM incapacidad 
				WHERE incID = incapacidadID;
			IF verificated THEN
				SET msg = CONCAT('La incapacidad ya ha sido verificada, no se puede modificar');
                ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;
			ELSE
				UPDATE incapacidad SET incFecha = fecha, incEnfermedad = enfermedad, incDias = dias
					WHERE incID = incapacidadID;
				COMMIT;
			END IF;
    END $$
DELIMITER ;

# 9. -------------------------------------- Ver el estado de las atenciones en salud de un usuario -----------------------------------------
DROP PROCEDURE IF EXISTS pas_view_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_view_atencionsalud(IN usuarioID INT)
	BEGIN
		SELECT id, fecha, tipo, verificado, aprobado FROM vw_atencionsalud WHERE persona = usuarioID;
    END $$
DELIMITER ;

# 10. --------------------------------------------- Añadir una atencion en salud de un usuario ---------------------------------------------
# Verificar que la atencion no existe antes de agregarla
DROP PROCEDURE IF EXISTS pas_add_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_add_atencionsalud(
	IN usuarioID INT, IN fecha DATETIME, IN tipo VARCHAR(45))
	BEGIN
		DECLARE duplicated BOOL;
        DECLARE msg VARCHAR(200);
        START TRANSACTION;
			SELECT EXISTS (SELECT antID FROM atencionensalud 
				WHERE perID = usuarioID AND ateFecha = fecha AND ateTipo = tipo) 
				INTO duplicated;
			IF duplicated THEN
				SET msg = CONCAT('La atencion en salud ya existe');
                ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;
			ELSE 
				INSERT INTO atencionensalud (perID, ateFecha, ateTipo, ateVerificado, ateAprobado) 
					VALUES (usuarioID, fecha, tipo, 0, 0);
				COMMIT;
			END IF;
    END $$
DELIMITER ;

# 11. --------------------------------------------- Modificar una atencion en salud de un usuario ------------------------------------------
DROP PROCEDURE IF EXISTS pas_edit_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_edit_atencionsalud(
	IN atencionsaludID INT, IN fecha DATETIME, IN tipo VARCHAR(45))
	BEGIN
		DECLARE verificated BOOL;
        DECLARE msg VARCHAR(200);
        START TRANSACTION;
			SELECT ateVerificado INTO verificated FROM atencionensalud
				WHERE antID = atencionsaludID;
			IF verificated THEN
				SET msg = CONCAT('La atencion en salud ya ha sido verificada, no se puede modificar');
                ROLLBACK;
				SIGNAL sqlstate '15000' SET message_text = msg;	
			ELSE
				UPDATE atencionensalud SET ateFecha = fecha, ateTipo = tipo
					WHERE antID = atencionsaludID;
                COMMIT;
			END IF;
    END $$
DELIMITER ;

# 12. --------------------------------------------- Ver perfil de riesgo integral de un usuario --------------------------------------------
DROP PROCEDURE IF EXISTS pas_view_perfilriesgo;
DELIMITER $$
CREATE PROCEDURE pas_view_perfilriesgo(IN usuarioID INT)
	BEGIN
		SELECT fecha, puntaje_fisico, puntaje_psicologico FROM vw_perfil_integral WHERE persona = usuarioID;
    END $$
DELIMITER ;

# 13. ----------------------------------------------------- Crear una cita medica -----------------------------------------------------------
DROP PROCEDURE IF EXISTS pas_create_citamedica;
DELIMITER $$
CREATE PROCEDURE pas_create_citamedica(IN doctor INT, IN fecha DATETIME)
	BEGIN 
		DECLARE especialidad VARCHAR(52);
        SELECT salEspecializacion INTO especialidad FROM personalsalud WHERE doctor = perID;
		INSERT INTO citamedica (doctorID, citFecha, citEspecialidad) VALUES (doctor, fecha, especialidad);
    END $$
DELIMITER ;

# 14. ----------------------------------------------------- Eliminar una cita medica --------------------------------------------------------
DROP PROCEDURE IF EXISTS pas_remove_citamedica;
DELIMITER $$
CREATE PROCEDURE pas_remove_citamedica(IN cita INT)
	BEGIN 
		DELETE FROM citamedica WHERE citID = cita;
    END $$
DELIMITER ; 

# 15. ----------------------------------------------- Aprobar o rechazar una incapacidad ----------------------------------------------------
DROP PROCEDURE IF EXISTS pas_approve_incapacidad;
DELIMITER $$
CREATE PROCEDURE pas_approve_incapacidad(
	IN persona INT, IN fecha DATETIME, IN enfermedad VARCHAR(45), IN desicion BOOL)
	BEGIN 
		UPDATE incapacidad SET incAprobado = desicion, incVerificado = 1
        WHERE persona = perID AND incFecha = fecha AND incEnfermedad = enfermedad;
    END $$
DELIMITER ;

# 16. -------------------------------------------- Aprobar o rechazar una atencion en salud -------------------------------------------------
DROP PROCEDURE IF EXISTS pas_approve_atencionsalud;
DELIMITER $$
CREATE PROCEDURE pas_approve_atencionsalud(
	IN persona INT, IN fecha DATETIME, IN tipo VARCHAR(45), IN desicion BOOL)
	BEGIN 
		UPDATE atencionensalud SET ateAprobado = desicion, ateVerificado = 1
        WHERE persona = perID AND ateFecha = fecha AND ateTipo = tipo;
    END $$
DELIMITER ;

# 17. ------------------------------------------- Agregar los resultados de una cita medica -------------------------------------------------
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

# 18. -------------------------------------- Modificar el perfil de riesgo integral de un usuario -------------------------------------------
DROP PROCEDURE IF EXISTS pas_edit_perfilintegral;
DELIMITER $$
CREATE PROCEDURE pas_edit_perfilintegral(IN persona INT, IN fisico INT, IN psicologico INT)
	BEGIN 
		UPDATE perfilriesgointegral SET perSaludFisica = fisico, perSaludPsicologica = psicologico
        WHERE persona = perID;
    END $$
DELIMITER ;

#--------------------------------------------------------------------------------------------------------------------------------------------
#																	Actividad Fisica y Deporte
#--------------------------------------------------------------------------------------------------------------------------------------------


# 1. -------------------------------------- Verificar que un estudiante puede participar de una convocatoria -------------------------------------------

drop procedure if exists pas_estudiante_accede_conv;
DELIMITER $$
create procedure pas_estudiante_accede_conv(in estPapa double, in convPapa double )
begin
	declare msg varchar(100);
    if (estPapa < convPapa) then
		set msg = concat('El estudiante no puede participar de la convocatoria.');
	else 
		set msg = concat('El estudiante puede participar de la convocatoria.');
	end if;
    select msg;
end $$
DELIMITER ;


# 2. -------------------------------------- Verificar viabilidad de un proyecto de acuerdo a un presupuesto -------------------------------------------

drop procedure if exists pas_check_proyecto;
DELIMITER $$
create procedure pas_check_proyecto(in idProyecto int, in presupuestoDado int)
begin
	declare msg varchar (100);
    declare presProyecto int;
    select proyPresupuesto into presProyecto 
		from proyecto where proyidProyecto = idProyecto;
    if (presProyecto > presupuestoDado) then
		set msg = concat('Su proyecto no es viable, excede el presupuesto.');
	else
		set msg = concat('Su proyecto es viable, puede insertarse en la tabla de proyectos.');
	end if;
    select msg;
end $$
DELIMITER ;

# 3. -------------------------------------- Un área quiere consultar cuantos estudiantes se presentan por facultad a sus convocatorias------------------

drop procedure if exists pas_consultar_num_estudiantes;
DELIMITER $$
create procedure pas_consultar_num_estudiantes(in idArea int)
begin
	select count(distinct estID) 
		from (area join programa on (areID = Area_areID)) 
        join ((estudiante join estudiante_toma_convocatoria on (estID = idEst)) 
        join convocatoria using (conv_id)) on (progID = Programa_progID) 
        join persona on (estID=perID)
        where idArea = areID 
        group by perFacultad;
end $$
DELIMITER ;

# 4. --------------------------------------- Agregar una nueva convocatoria a cursos libres y selecciones  ------------------

drop procedure if exists pas_agregar_convocatoria_cur_libre;
DELIMITER $$
create procedure pas_agregar_convocatoria_cur_libre
	(in idConv int, in nombreConv varchar(70), in fechaA DATE, in fechaC DATE, in edo tinyint, in idPrograma int, in papaConv double, in tipo VARCHAR(45), in condicion VARCHAR(45))
begin
	insert into convocatoria (conv_id, convNombre, convFechaApertura, convFechaCierre, convEstado, convPeriodo, Programa_progID, convPAPA)
		values (idConv,nombreConv,fechaA,fechaC,edo,idPrograma,papaConv);    
    insert into convocatoriacursolibre (Convocatoria_conv_id, curNombre, curTipoCurso, curCondicion) 
		values (idConv, nombreConv, tipo, condicion);
end $$
DELIMITER ;
  
drop procedure if exists pas_agregar_convocatoria_seleccion;
DELIMITER $$
create procedure pas_agregar_convocatoria_seleccion
	(in idConv int, in nombreConv varchar(70), in fechaA DATE, in fechaC DATE, in edo tinyint, in idPrograma int, in papaConv double, in deporte VARCHAR(45), in lugar VARCHAR(45), hora TIME)
begin
	insert into convocatoria (conv_id, convNombre, convFechaApertura, convFechaCierre, convEstado, convPeriodo, Programa_progID, convPAPA)
		values (idConv,nombreConv,fechaA,fechaC,edo,idPrograma,papaConv);
    insert into convocatoriaseleccion (Convocatoria_conv_id, convDeporte, convLugar, convHora) 
		values (idConv, deporte, lugar, hora);
end $$
DELIMITER ;

# 5. --------------------------------------- Actualizar tiempo y lugar de distintas tablas ------------------------------------------

# Torneo Interno:
drop procedure if exists pas_actualizar_fecha_torneo;
DELIMITER $$
create procedure pas_actualizar_fecha_torneo (in idTorneo int, in nuevaFechaInicio date, in nuevaFechaFin date)
begin
	update torneointerno set torFechaInicio = nuevaFechaInicio where idTorneo = toridTorneoInterno;
    update torneointerno set torFechaFinalizacion = nuevaFechaFin where idTorneo = toridTorneoInterno;
end $$
DELIMITER ;


# ConvocatoriaSeleccion

drop procedure if exists pas_actualizar_hora_convSeleccion;
DELIMITER $$
create procedure pas_actualizar_hora_convSeleccion(in idConv int ,in nuevaHora time)
begin
	update convocatoriaseleccion set convLugar = nuevaHora where idConv = Convocatoria_convid;
end $$
DELIMITER ;

drop procedure if exists pas_actualizar_lugar_convSeleccion;
DELIMITER $$
create procedure pas_actualizar_lugar_convSeleccion(in idConv int ,in nuevoLugar varchar(50))
begin
	update convocatoriaseleccion set convLugar = nuevoLugar where idConv = Convocatoria_convid;
end $$
DELIMITER ;


# Evento Taller:

drop procedure if exists pas_actualizar_fecha_eventoTaller;
DELIMITER $$
create procedure pas_actualizar_fecha_eventoTaller (in idEveTa int, in nuevaFecha date)
begin
	update eventotaller set evetaFecha = nuevaFecha where evetaidEventoTaller = idEveTa;
end $$
DELIMITER ;

drop procedure if exists pas_actualizar_lugar_eventoTaller;
DELIMITER $$
create procedure pas_actualizar_lugar_eventoTaller (in idEveTa int, in nuevoLugar date)
begin
	update eventotaller set evetaLugar = nuevoLugar where evetaidEventoTaller = idEveTa;
end $$
DELIMITER ;

drop procedure if exists pas_actualizar_hora_eventoTaller;
DELIMITER $$
create procedure pas_actualizar_hora_eventoTaller (in idEveTa int, in nuevaHoraInicio datetime, in nuevaHoraFin datetime)
begin
	update eventotaller set evetaHoraInicio = nuevaHoraInicio where evetaidEventoTaller = idEveTa;
    update eventotaller set evetaHoraFin = nuevaHoraFin where evetaidEventoTaller = idEveTa;
end $$
DELIMITER ;


# Proyecto:

drop procedure if exists pas_actualizar_fechas_proyecto;
DELIMITER $$
create procedure pas_actualizar_fechas_proyecto(in idProyecto int, in nuevaFechaInicio date, in nuevaFechaFin date)
begin
	update proyecto set proyFechaInicio = nuevaFechaInicio where idProyecto = proyIdProyecto;
    update proyecto set proyFechaFinalizacion = nuevaFechaFin where idProyecto = proyIdProyecto;
end $$
DELIMITER ;

# 6. --------------------------------------- Actualizar ejecucion de un proyecto ------------------------------------------

drop procedure if exists pas_actualizar_ejecucion_proyecto;
DELIMITER $$
create procedure pas_actualizar_ejecucion_proyecto(in idProyecto int, in nuevaEjecucion decimal)
begin
	update proyecto set proyEjecucion = nuevaEjecucion where idProyecto = proyIdProyecto;
end $$
DELIMITER ;

# 7. --------------------------------------- Agregar un nuevo torneo interno  ---------------------------------------------

drop procedure if exists pas_agregar_nuevo_torneo;
DELIMITER $$
create procedure pas_agregar_nuevo_torneo(in idTorneo int, in periodo varchar(10), in sedeFacultad varchar(60), in deporte varchar(35), in nombreTorneo varchar (90),
	in estado TINYINT, in modalidad VARCHAR(45), in rama VARCHAR(45), in nivel VARCHAR(45), in FechaInicio DATE, in FechaFinalizacion DATE, in idPrograma INT)
begin
	insert into torneointerno (toridTorneoInterno, torPeriodo, torSedeFacultad, torDeporte, torNombreTorneo, torEstado, torModalidad, torRama, torNivel
		, torFechaInicio, torFechaFinalizacion, Programa_progID) 
        values (idTorneo, periodo, sedeFacultad, deporte, nombreTorneo, estado, modalidad, rama, nivel, FechaInicio, FechaFinalizacion, idPrograma);
end $$
DELIMITER ;

# 8. ---------------------------- Un programa quiere agregar nuevos proyectos, eventos, y talleres---------------------------------------

# Proyecto

drop procedure if exists pas_crear_nuevoProyecto;
DELIMITER $$
create procedure pas_crear_nuevoProyecto(in IdProyecto INT,in Nombre VARCHAR(60),in Ejecucion DECIMAL,in FechaInicio DATE, in FechaFinalizacion DATE,
	Presupuesto VARCHAR(1000), in idPrograma int)
begin
	insert into proyecto (proyIdProyecto, proyNombre, proyEjecucion, proyFechaInicio, proyFechaFinalizacion, proyPresupuesto) 
		values (IdProyecto, Nombre,  Ejecucion, FechaInicio, FechaFinalizacion, Presupuesto);
    insert into programa_tiene_proyecto (Proyecto_proyIdProyecto, progID) 
		values (proyIdProyecto, idPrograma);
    
end $$
DELIMITER ;


# EventoTaller

drop procedure if exists pas_agendar_nuevoEventoTaller;
DELIMITER $$
create procedure pas_agendar_nuevoEventoTaller(in idEventoTaller1 INT, in Nombre VARCHAR(60), in TipoEventoTaller VARCHAR(45), in Descripcion LONGTEXT,
	in HoraInicio DATETIME, in HoraFin DATETIME, in Fecha DATE, in Lugar VARCHAR(45), in idPrograma int)
begin
	insert into eventotaller (evetaidEventoTaller, evetaNombre, evetaTipoEventoTaller, eveDescripcion, evetaHoraInicio, evetaHoraFin,evetaFecha, evetaLugar) 
		values (idEventoTaller1, Nombre,  TipoEventoTaller, Descripcion, HoraInicio, HoraFin, Fecha, Lugar);
    insert into programa_tiene_eventotaller (idEventoTaller, progID) 
		values (idEventoTaller1, idPrograma);
end $$
DELIMITER ;


# 9. ---------------------------- Se quiere consultar información acerca de eventos, talleres y proyectos disponbibles ---------------------------------------

drop procedure if exists pas_consultar_info_eventoTaller;
DELIMITER $$
create procedure pas_consultar_info_eventoTaller(in idEveTa int)
begin
	select * from vw_info_eventoTaller where evetaidEventoTaller = idEveTa;
end $$
DELIMITER ;

drop procedure if exists pas_consultar_info_proyecto;
DELIMITER $$
create procedure pas_consultar_info_proyecto(in idProy int)
begin
	select * from vw_info_proyecto where proyIdProyecto = idProy;
end $$
DELIMITER ;


# 10. ---------------------------- Se quiere consultar información acerca de eventos, talleres y proyectos disponbibles por área ó programa-----------------------

# Por programa

drop procedure if exists pas_consultar_eventoTaller_programa;
DELIMITER $$
create procedure pas_consultar_eventoTaller_programa (in idPrograma int)
begin
	select * from vw_info_eventoTaller where progID = idPrograma;
end $$
DELIMITER ;

drop procedure if exists pas_consultar_proyectos_programa;
DELIMITER $$
create procedure pas_consultar_proyectos_programa (in idPrograma int)
begin
	select * from vw_info_proyecto where progID = idPrograma;
end $$
DELIMITER ;

# Por área

drop procedure if exists pas_consultar_proyectos_area;
DELIMITER $$
create procedure pas_consultar_proyectos_area (in idArea int)
begin
	select * from vw_info_proyecto where areID = idArea;
end $$
DELIMITER ;

drop procedure if exists pas_consultar_eventoTaller_area;
DELIMITER $$
create procedure pas_consultar_eventoTaller_area (in idArea int)
begin
	select * from vw_info_eventoTaller where areID = idArea;
end $$
DELIMITER ;


# 11. ---------------------------- Un estudiante quiere participar en una convocatoria -----------------------

drop procedure if exists pas_participar_convocatoria;
DELIMITER $$
create procedure pas_participar_convocatoria(in ccEstudiante int, in idConv int, in fechaInscripcion date)
begin
	insert into estudiante_toma_convocatoria (idEst, conv_id, fecha_est_tm_conv) 
		values (ccEstudiante, idConv, fechaInscripcion);
end $$
DELIMITER ;

# 12. ---------------------------- Un estudiante quiere consultar las convocatorias en las que participa -----------------------

drop procedure if exists sp_consultar_mis_convocatorias;
DELIMITER $$
create procedure sp_consultar_mis_convocatorias (in cedula int)
	begin
		select * from vw_info_convocatoria_estudiante where estID = cedula;
	end $$
DELIMITER ;

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  					Gestion y Fomento Socioeconomico
#--------------------------------------------------------------------------------------------------------------------------------------------

# 1. El estudiante puede consultar sus fallas de alimentación

drop procedure if exists sp_fallaalimentacion_est;
DELIMITER $$
CREATE PROCEDURE sp_fallaalimentacion_est(in id int)
	BEGIN
		SELECT fallAlID,fallAlcgaComida,fallAlLugar,fallAlFecha 
			from fallaalimentacion where estID=id;
	END $$
DELIMITER ;

call sp_fallaalimentacion_est(10101019);

# 2. El estudiante puede consultar sus actividades de corresponsabilidad realizadas

drop procedure if exists sp_actividadcorresp_est;
DELIMITER $$
CREATE PROCEDURE sp_actividadcorresp_est(in id int)
	BEGIN
		SELECT actCorID,actCorActividad,actCorHoras 
			from actividadcorresp where estID=id;
	END $$
DELIMITER ;

call sp_actividadcorresp_est(101010118);

# 3. El estudiante puede consultar la cantidad de horas pendientes de corresponsabilidad

drop function if exists horas_corresponsabilidad_est;
DELIMITER $$
CREATE FUNCTION horas_corresponsabilidad_est(id_est int)
		RETURNS int
        BEGIN
			DECLARE horas INT default 0;
            select horPendCorresp into horas 
				from corresponsabilidad where idEst=id_est;
		RETURN horas;
	END $$
DELIMITER ;

set @horas =  horas_corresponsabilidad_est(10101014);
select @horas;

drop procedure if exists sp_horas_corresponsabilidad_est;
DELIMITER $$
CREATE PROCEDURE sp_horas_corresponsabilidad_est(in id_est int)
	BEGIN
		set @horas =  horas_corresponsabilidad_est(id_est);
		select @horas;
	END $$
DELIMITER ;

call sp_horas_corresponsabilidad_est(10101014);


#4. El estudiante desea conocer su PBM

drop function if exists pbm_est;
DELIMITER $$
CREATE FUNCTION pbm_est(id_est int)
		RETURNS int
        BEGIN
			DECLARE pbm INT default 0;
            select estPBM into pbm 
				from estudiante where estID=id_est;
		RETURN pbm;
	END $$
DELIMITER ;

set @pbm =  pbm_est(101010110);
select @pbm;

drop procedure if exists sp_pbm_est;
DELIMITER $$
CREATE PROCEDURE sp_pbm_est(in id_est int)
	BEGIN
		set @pbm =  pbm_est(id_est);
		select @pbm;
	END $$
DELIMITER ;

call sp_pbm_est(101010110);

# 5. El estudiante solo desea visualizar las convocatorias a las que podría acceder según su PBM:

#5.1 La convocatoria fomento emprendimiento la busca según tema y/o nombre


drop procedure if exists sp_convocatoriafomentoemprendimiento_filtro;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriafomentoemprendimiento_filtro(in nombre varchar(50), in tema varchar(50))
	BEGIN
		if nombre is null and tema is null then
			select * from convocatoriafomentoemprendimiento;
		else
			if nombre is not null and tema is not null then
				select * from convocatoriafomentoemprendimiento 
					where LOCATE(LOWER(nombre), LOWER(cgemNombreEmprend)) > 0
                    and LOCATE(LOWER(tema), LOWER(cgemTema)) > 0;
            else
				if nombre is null then
					select * from convocatoriafomentoemprendimiento 
						where LOCATE(LOWER(tema), LOWER(cgemTema)) > 0;
                else
					select * from convocatoriafomentoemprendimiento 
						where LOCATE(LOWER(nombre), LOWER(cgemNombreEmprend)) > 0;
                end if;
            end if;
        end if;
	END $$
DELIMITER ;

call sp_convocatoriafomentoemprendimiento_filtro('Empresa2','tema2');
call sp_convocatoriafomentoemprendimiento_filtro(null,'tema2');
call sp_convocatoriafomentoemprendimiento_filtro('Empresa2',null);
call sp_convocatoriafomentoemprendimiento_filtro(null,null);


drop procedure if exists sp_convocatoriafomentoemprendimiento;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriafomentoemprendimiento(in id_est int)
	BEGIN
		select * from convocatoriafomentoemprendimiento;
	END $$
DELIMITER ;

call sp_convocatoriafomentoemprendimiento(10101015);

drop procedure if exists sp_convocatoriafomentoemprendimiento_est;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriafomentoemprendimiento_est(in id_est int, in tema varchar(50))
	BEGIN
		select * from convocatoriafomentoemprendimiento 
			where LOCATE(LOWER(tema), LOWER(cgemTema)) > 0;
	END $$
DELIMITER ;

#call sp_convocatoriafomentoemprendimiento_est(10101015,'tema2');

drop procedure if exists sp_convocatoriafomentoemprendimiento_nombre;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriafomentoemprendimiento_nombre(in id_est int, in nombre varchar(50))
	BEGIN
		select * from convocatoriafomentoemprendimiento 
			where LOCATE(LOWER(nombre), LOWER(cgemNombreEmprend)) > 0;
	END $$
DELIMITER ;

call sp_convocatoriafomentoemprendimiento_nombre(10101015,'Empresa2');

#5.2 La convocatoria de gestión alimentaria solo se puede acceder con PBM < 25

drop procedure if exists sp_convocatoriagestionalimentaria;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalimentaria(in id_est int)
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalimentaria;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alimentaria';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalimentaria(101010110);


drop procedure if exists sp_convocatoriagestionalimentaria_com;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalimentaria_com(in id_est int, in comida enum('Desayuno','Almuerzo','Cena'))
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalimentaria where cgaComida=comida;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alimentaria';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalimentaria_com(101010110,'Desayuno');

drop procedure if exists sp_convocatoriagestionalimentaria_est;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalimentaria_est(in id_est int, in comida enum('Desayuno','Almuerzo','Cena'), in lugar enum('Comedor central','Hemeroteca','Odontología','Agronomía','Biología','Ciencias Humanas','Ciencias Económicas','Matemáticas','otro'))
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalimentaria where cgaComida=comida and cgaLugar=lugar;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alimentaria';
        end if;
	END $$
DELIMITER ;

/*
set @pbm =  pbm_est(101010110);
select @pbm;
call sp_convocatoriagestionalimentaria_est(101010110,'Desayuno','Comedor central');
set @pbm =  pbm_est(10101015);
select @pbm;
call sp_convocatoriagestionalimentaria_est(10101015,'Desayuno','Comedor central');
*/

drop procedure if exists sp_convocatoriagestionalimentaria_filtro;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalimentaria_filtro(in id_est int, in comida enum('Desayuno','Almuerzo','Cena'), in lugar enum('Comedor central','Hemeroteca','Odontología','Agronomía','Biología','Ciencias Humanas','Ciencias Económicas','Matemáticas','otro'))
	BEGIN
		if pbm_est(id_est)<26 then
			if comida is null and lugar is null then
				select * from convocatoriagestionalimentaria;
            else
				if comida is not null and lugar is not null then
					select * from convocatoriagestionalimentaria where cgaComida=comida and cgaLugar=lugar;
                else
					if comida is null then
						select * from convocatoriagestionalimentaria where cgaLugar=lugar;
                    else
						select * from convocatoriagestionalimentaria where cgaComida=comida;
                    end if;
                end if;
            end if;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alimentaria';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalimentaria_filtro(101010110,'Desayuno','Comedor central');
call sp_convocatoriagestionalimentaria_filtro(101010110, null,'Comedor central');
call sp_convocatoriagestionalimentaria_filtro(101010110,'Desayuno',null);
call sp_convocatoriagestionalimentaria_filtro(101010110,null,null);

#5.3 La convocatoria de gestión alojamiento solo se puede acceder con PBM < 25


drop procedure if exists sp_convocatoriagestionalojamiento;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalojamiento(in id_est int)
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalojamiento;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alojamiento';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalojamiento(101010110);


drop procedure if exists sp_convocatoriagestionalojamiento_loc;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalojamiento_loc(in id_est int, in localidad varchar(100))
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalojamiento where LOCATE(LOWER(localidad), LOWER(cgalLocalidadAlojamiento)) > 0;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alojamiento';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalojamiento_loc(101010110,'Usme');


drop procedure if exists sp_convocatoriagestionalojamiento_est;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalojamiento_est(in id_est int, in localidad varchar(100), in tipo enum('Hotel','Casa','Apartamento','Vivienda familiar','Residencia Universitaria','Apartaestudio','Habitación','otro'))
	BEGIN
		if pbm_est(id_est)<26 then
			select * from convocatoriagestionalojamiento where LOCATE(LOWER(localidad), LOWER(cgalLocalidadAlojamiento)) > 0 and tipo=cgalTipoVivienda;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alojamiento';
        end if;
	END $$
DELIMITER ;

/*
set @pbm =  pbm_est(101010110);
select @pbm;
call sp_convocatoriagestionalojamiento_est(101010110,'Usme','Residencia Universitaria');
set @pbm =  pbm_est(10101015);
select @pbm;
call sp_convocatoriagestionalojamiento_est(10101015,'Usme','Residencia Universitaria');
*/

drop procedure if exists sp_convocatoriagestionalojamiento_filtro;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestionalojamiento_filtro(in id_est int, in localidad varchar(100), in tipo enum('Hotel','Casa','Apartamento','Vivienda familiar','Residencia Universitaria','Apartaestudio','Habitación','otro'))
	BEGIN
		if pbm_est(id_est)<26 then
			if tipo is null and localidad is null then
				select * from convocatoriagestionalojamiento;
			else
				if tipo is not null and localidad is not null then 
					select * from convocatoriagestionalojamiento where LOCATE(LOWER(localidad), LOWER(cgalLocalidadAlojamiento)) > 0 and tipo=cgalTipoVivienda;
                else
					if tipo is null then
						select * from convocatoriagestionalojamiento where LOCATE(LOWER(localidad), LOWER(cgalLocalidadAlojamiento)) > 0;
                    else
						select * from convocatoriagestionalojamiento where tipo=cgalTipoVivienda;
                    end if;                
                end if;            
            end if;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 25: No tiene acceso de convocatorias de gestión alojamiento';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestionalojamiento_filtro(101010110,'Usme','Residencia Universitaria');
call sp_convocatoriagestionalojamiento_filtro(101010110,null,'Residencia Universitaria');
call sp_convocatoriagestionalojamiento_filtro(101010110,'Usme',null);
call sp_convocatoriagestionalojamiento_filtro(101010110,null,null);

#5.4 La convocatoria de gestión economica solo se puede acceder con PBM < 20

drop procedure if exists sp_convocatoriagestioneconomica_est;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestioneconomica_est(in id_est int)
	BEGIN
		if pbm_est(id_est)<21 then
			select * from convocatoriagestioneconomica order by cgeCobertura;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 20: No tiene acceso de convocatorias de gestión económica';
        end if;
	END $$
DELIMITER ;

/*
set @pbm =  pbm_est(101010110);
select @pbm;
call sp_convocatoriagestioneconomica_est(101010110);
set @pbm =  pbm_est(10101015);
select @pbm;
call sp_convocatoriagestioneconomica_est(10101015);
*/


drop procedure if exists sp_convocatoriagestioneconomica_mayor;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestioneconomica_mayor(in id_est int, in filt float)
	BEGIN
		if pbm_est(id_est)<21 then
			select * from convocatoriagestioneconomica where cgeCobertura>=filt order by cgeCobertura;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 20: No tiene acceso de convocatorias de gestión económica';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestioneconomica_mayor(101010110, 500000);


drop procedure if exists sp_convocatoriagestioneconomica_menor;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestioneconomica_menor(in id_est int, in filt float)
	BEGIN
		if pbm_est(id_est)<21 then
			select * from convocatoriagestioneconomica where cgeCobertura<filt order by cgeCobertura;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 20: No tiene acceso de convocatorias de gestión económica';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestioneconomica_menor(101010110, 600000);


drop procedure if exists sp_convocatoriagestioneconomica_filtro;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestioneconomica_filtro(in id_est int, in filt_min float, in filt_max float)
	BEGIN
		if pbm_est(id_est)<21 then
			if filt_min is null and filt_max is null then
				select * from convocatoriagestioneconomica order by cgeCobertura;
			else
				if filt_min is not null and filt_max is not null then
					select * from convocatoriagestioneconomica where 
						cgeCobertura>=filt_min and 
						cgeCobertura<=filt_max order by cgeCobertura;
				else 
					if filt_min is null then
						select * from convocatoriagestioneconomica where 
							cgeCobertura<=filt_max order by cgeCobertura;
					else
						select * from convocatoriagestioneconomica where 
							cgeCobertura>=filt_min order by cgeCobertura;
					end if;
				end if;
			end if;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 20: No tiene acceso de convocatorias de gestión económica';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestioneconomica_filtro(101010110,500000,1200000);
call sp_convocatoriagestioneconomica_filtro(101010110,700000,null);
call sp_convocatoriagestioneconomica_filtro(101010110,null,800000);
call sp_convocatoriagestioneconomica_filtro(101010110,null,null);


#5.5 La convocatoria de gestión transporte solo se puede acceder con PBM < 15

drop procedure if exists sp_convocatoriagestiontransporte_filtro;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestiontransporte_filtro(in id_est int, in tipo enum('Transporte público masivo','otro'))
	BEGIN
		if pbm_est(id_est)<16 then
			if tipo is null then
				select * from convocatoriagestiontransporte order by cgtCobertura;
			else
				select * from convocatoriagestiontransporte where cgtTipoTransporte=tipo order by cgtCobertura;
            end if;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 15: No tiene acceso de convocatorias de gestión transporte';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestiontransporte_filtro(101010110, 'Transporte público masivo');
call sp_convocatoriagestiontransporte_filtro(101010110, null);

drop procedure if exists sp_convocatoriagestiontransporte_est;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestiontransporte_est(in id_est int, in tipo enum('Transporte público masivo','otro'))
	BEGIN
		if pbm_est(id_est)<16 then
			select * from convocatoriagestiontransporte where cgtTipoTransporte=tipo order by cgtCobertura;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 15: No tiene acceso de convocatorias de gestión transporte';
        end if;
	END $$
DELIMITER ;

/*
set @pbm =  pbm_est(101010110);
select @pbm;
call sp_convocatoriagestiontransporte_est(101010110, 'Transporte público masivo');
set @pbm =  pbm_est(10101015);
select @pbm;
call sp_convocatoriagestiontransporte_est(10101015, 'Transporte público masivo');
*/

drop procedure if exists sp_convocatoriagestiontransporte;
DELIMITER $$
CREATE PROCEDURE sp_convocatoriagestiontransporte(in id_est int)
	BEGIN
		if pbm_est(id_est)<16 then
			select * from convocatoriagestiontransporte;
		else
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El PBM del estaudiante es mayor que 15: No tiene acceso de convocatorias de gestión transporte';
        end if;
	END $$
DELIMITER ;

call sp_convocatoriagestiontransporte(101010110);


#6. Una persona/estudiante/secretario/director quiere consultar sus facturas con los detalles en la Tienda de bienestar U.

drop procedure if exists sp_info_factura_per;
DELIMITER $$
CREATE PROCEDURE sp_info_factura_per(in id_per int, in id_tienda int, in id_factura int)
	BEGIN
		if id_tienda is null and id_factura is null then
			select factID, factFecha, factHora, factDetalle, prodID, prodPrecio, prodDetalle, clienteID, perApellido, perEmail, 
				tieDireccion from vw_info_factura where clienteID=id_per;
        else
			if id_tienda is not null and id_factura is not null then
				select factID, factFecha, factHora, factDetalle, prodID, prodPrecio, prodDetalle, clienteID, perApellido, 
					perEmail, tieDireccion from vw_info_factura 
					where clienteID=id_per and tieID=id_tienda and factID=id_factura;
			else
				if id_tienda is null then 
					select factID, factFecha, factHora, factDetalle, prodID, prodPrecio, prodDetalle, clienteID, perApellido, 
						perEmail, tieDireccion from vw_info_factura 
						where clienteID=id_per and factID=id_factura;
				else
					select factID, factFecha, factHora, factDetalle, prodID, prodPrecio, prodDetalle, clienteID, perApellido, 
						perEmail, tieDireccion from vw_info_factura 
						where clienteID=id_per and tieID=id_tienda;
				end if;
			end if;
		end if;
	END $$
DELIMITER ;

call sp_info_factura_per(10101017, 2, 16);
call sp_info_factura_per(10101017, null, 16);
call sp_info_factura_per(10101017, 1, null);
call sp_info_factura_per(10101017, null, null);

#7. Una persona quiere consultar los productos en una tienda de bienestar U.

drop procedure if exists sp_productos_tienda;
DELIMITER $$
CREATE PROCEDURE sp_productos_tienda(in id_tienda int)
	BEGIN
		if id_tienda is null then
			select * from  vw_productos_tienda;
		else
			select * from  vw_productos_tienda where tieID=id_tienda;
        end if;
	END $$
DELIMITER ;

call sp_productos_tienda(null);
call sp_productos_tienda(1);

# 8. Una persona queire conocer las tiendas donde se encuentra un producto

drop procedure if exists sp_tiendas_ofrece_producto;
DELIMITER $$
CREATE PROCEDURE sp_tiendas_ofrece_producto(in id_prod int)
	BEGIN
		select tieID,tieDireccion,tieCiudad from vw_productos_tienda where prodID=id_prod;
	END $$
DELIMITER ;


select * from vw_productos_tienda;
call sp_tiendas_ofrece_producto(9); #1 resultado
call sp_tiendas_ofrece_producto(11); #2 resultados


# 9. Si el estudiante inserta una conv. en est_toma_conv, verificar que no ingrese
#dos veces la misma en el mismo semestre

drop procedure if exists sp_insertar_est_tm_conv_est;
DELIMITER $$
CREATE PROCEDURE sp_insertar_est_tm_conv_est(in id_est int, in id_conv int, in fecha DATE)
	BEGIN
		declare existe_conv int;
        declare msg char(250);
		start transaction;
		#Primer semstre
		if CAST(Month(fecha) as unsigned)>0 and CAST(Month(fecha) as unsigned)<7 then
			drop table if exists temp_table;
			CREATE TEMPORARY TABLE temp_table as select conv_id from estudiante_toma_convocatoria 
				where idEst=id_est and YEAR(fecha_est_tm_conv)=YEAR(fecha) and CAST(MONTH(fecha_est_tm_conv) AS UNSIGNED)>0 
                and CAST(MONTH(fecha_est_tm_conv) AS UNSIGNED)<7;
			select conv_id into existe_conv from temp_table where conv_id=id_conv;
            if existe_conv is null then
				insert into estudiante_toma_convocatoria values (id_est,id_conv,fecha);
			else
                SET msg = CONCAT('El estudiante con id ',id_est, ' ya se encuentra inscrito a la convocatoria ', id_conv, 
                ' para el periodo ', YEAR(fecha), '-1');
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			end if;
		else
			drop table if exists temp_table;
			CREATE TEMPORARY TABLE temp_table as select conv_id from estudiante_toma_convocatoria 
				where idEst=id_est and YEAR(fecha_est_tm_conv)=YEAR(fecha) and CAST(MONTH(fecha_est_tm_conv) AS UNSIGNED)>6 
                and CAST(MONTH(fecha_est_tm_conv) AS UNSIGNED)<13;
			select conv_id into existe_conv from temp_table where conv_id=id_conv;
            if existe_conv is null then
				insert into estudiante_toma_convocatoria values (id_est,id_conv,fecha);
			else
                SET msg = CONCAT('El estudiante con id ',id_est, ' ya se encuentra inscrito a la convocatoria ', id_conv, 
                ' para el periodo ', YEAR(fecha), '-2');
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			end if;
		end if;
        commit;
	END $$
DELIMITER ;


call sp_insertar_est_tm_conv_est(10101019, 210 ,'2023-03-15');
call sp_insertar_est_tm_conv_est(10101019, 211 ,'2023-03-15');

call sp_insertar_est_tm_conv_est(101010113, 1 ,'2023-07-13');
call sp_insertar_est_tm_conv_est(101010113, 2 ,'2023-07-13');
select * from estudiante_toma_convocatoria;
#delete from estudiante_toma_convocatoria where conv_id=210 and MONTH(fecha_est_tm_conv)>6;

# 10. El secretario/dirección quieren actualizar el nombre las convoctarias

DROP PROCEDURE IF EXISTS nombre_convocatorias_up;
DELIMITER $$
CREATE PROCEDURE nombre_convocatorias_up(in id_conv int, in nom_conv varchar(70))
	BEGIN
		UPDATE convocatoria SET convNombre=nom_conv where conv_id=id_conv;
    END $$
DELIMITER ;

/*
call nombre_convocatorias_up(5, 'Gest Aloj');
call nombre_convocatorias_up(5, 'Gestión Alojamiento');
select * from convocatoria;
*/

# 11. El estudiante/secretario quiere conocer el programa y área de una convocatoria

drop procedure if exists programa_area_convocatoria;
DELIMITER $$
CREATE procedure programa_area_convocatoria(in id_conv int)
	BEGIN
		declare verify_content int;
        declare msg varchar(250);
        Start transaction;
        drop table if exists temp_table;
		CREATE TEMPORARY TABLE temp_table as 
			select conv_id,convNombre,progID,progNombre,areID,areNombre from convocatoria
			join programa on Programa_progID=progID 
            join area on area.areID=Area_areID 
            where conv_id=id_conv;
		select conv_id into verify_content from temp_table;
        if verify_content is null then
			SET msg = CONCAT('La convocatoria con id ', id_conv , ' no existe.');
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		else 
			select conv_id,convNombre,progID,progNombre,areID,areNombre from convocatoria
			join programa on Programa_progID=progID 
            join area on area.areID=Area_areID 
            where conv_id=id_conv;
		end if;
        commit;
    END $$
DELIMITER ;

/*
call programa_area_convocatoria(200);
call programa_area_convocatoria(300);
select * from convocatoria;
*/

# 12. El secretario/dirección quieren insertar una convocatoria en el semestre en curso

select * from convocatoria;

drop procedure if exists insertar_conv_en_curso;
DELIMITER $$
CREATE procedure insertar_conv_en_curso(in id_conv int, in nom_conv varchar(70), in id_programa int, in papa double)
	BEGIN
		declare cur_date date;
        declare cur_month int;
        SELECT CURRENT_DATE() into cur_date;
        SELECT CAST(MONTH(CURRENT_DATE()) as unsigned) into cur_month;
        if cur_month<7 then
			insert into convocatoria values (id_conv, nom_conv, CONCAT(YEAR(cur_date),'-02-01'), CONCAT(YEAR(cur_date),'-03-01'), 1, CONCAT(YEAR(cur_date),'-01'), id_programa, papa);
		else
			insert into convocatoria values (id_conv, nom_conv, CONCAT(YEAR(cur_date),'-07-15'), CONCAT(YEAR(cur_date),'-08-30'), 1, CONCAT(YEAR(cur_date),'-02'), id_programa, papa);
		end if;
    END $$
DELIMITER ;

start transaction;
CALL insertar_conv_en_curso(23, 'Gestión Alojamiento', 1,3.5);
select * from convocatoria;
delete from convocatoria where conv_id=23;
rollback;

# 13 La secretaría/dirección inserta empleados en la tabla empleado_tiendaun

drop procedure if exists insertar_empl_tienda_un;
DELIMITER $$
CREATE procedure insertar_empl_tienda_un(in id_emp int, in id_tienda int)
	BEGIN
		insert into empleado_tiendaun values (id_tienda, id_emp);
    END $$
DELIMITER ;

/*
call insertar_empl_tienda_un(10101015,1);
select * from empleado_tiendaun;
*/

#La dirección puede borrarlos

drop procedure if exists borrar_empl_tienda_un;
DELIMITER $$
CREATE procedure borrar_empl_tienda_un(in id_emp int)
	BEGIN
		delete from empleado_tiendaun where empleadoID=id_emp;
    END $$
DELIMITER ;

/*
call borrar_empl_tienda_un(10101015);
select * from empleado_tiendaun;
*/

# 14 La secretaría/dirección inserta productos en la tabla producto_tiendaun

drop procedure if exists insertar_prod_tienda_un;
DELIMITER $$
CREATE procedure insertar_prod_tienda_un(in id_prod int, in id_tienda int)
	BEGIN
		insert into producto_tiendaun values (id_tienda, id_prod);
    END $$
DELIMITER ;

/*
call insertar_prod_tienda_un(15,2);
select * from producto_tiendaun;
*/

#La dirección puede borrarlos

drop procedure if exists borrar_prod_tienda_un;
DELIMITER $$
CREATE procedure borrar_prod_tienda_un(in id_prod int)
	BEGIN
		delete from producto_tiendaun where prodID=id_prod;
    END $$
DELIMITER ;

/*
call borrar_prod_tienda_un(15);
select * from producto_tiendaun;
*/

# 15 El estudiante/secretaria inserta facturas usando la fecha y hora actual

drop procedure if exists insertar_factura;
DELIMITER $$
CREATE procedure insertar_factura(in detalle varchar(100), in tieID int, in clienteID int, out fact_id int)
	BEGIN
		declare cur_date date;
        declare cur_time time;
        start transaction;
        SELECT CURRENT_DATE() into cur_date;
        SELECT CURTIME() into cur_time;
		insert into factura (factFecha,factHora,factDetalle,tieID,clienteID) values (cur_date, cur_time, detalle, tieID, clienteID);
        select MAX(factID) into fact_id from factura;
        commit;
    END $$
DELIMITER ;

/*
call insertar_factura('N.A', 1, 101010119, @fact_id);
select * from factura;
delete from factura where factID=@fact_id;
*/

#15.1 Persona/Estudiante/Secretario/Direccion Insertar productos en factura


select tieID from factura where factID=2;

drop procedure if exists sp_insertar_prod_factura;
DELIMITER $$
CREATE procedure sp_insertar_prod_factura(in id_factura int, in id_prod int)
	BEGIN
		declare tienda int;
        start transaction;
		select tieID into tienda from factura where factID=id_factura;
        insert into factura_producto values (id_prod,id_factura);
        update producto_tiendaun set prodDisponibilidad=prodDisponibilidad-1 
			where tieID=tienda and prodID=id_prod;
        commit;
    END $$
DELIMITER ;
select * from factura;
/*
select * from producto_tiendaun where prodID=9;
call sp_insertar_prod_factura(2,9);
select * from producto_tiendaun  where prodID=9;
select * from factura_producto where factID=2;
*/

#16. La dirección puede borrar facturas de cierto mes y año

select * from factura;
select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023;
select * from factura_producto where factID in (select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023);

drop procedure if exists eliminar_factura_tiempo;
DELIMITER $$
CREATE procedure eliminar_factura_tiempo(in mes int, in ano int)
	BEGIN
		start transaction;
		delete from factura_producto where factID in (select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023);
		delete from factura where CAST(MONTH(factFecha) as unsigned)=mes and CAST(YEAR(factFecha) as unsigned)=ano;
        commit;
    END $$
DELIMITER ;

/*
start transaction;
call eliminar_factura_tiempo(4,2023);
	select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023;
	select * from factura_producto where factID in (select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023);
rollback;
select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023;
select * from factura_producto where factID in (select factID from factura where CAST(MONTH(factFecha) as unsigned)=4 and CAST(YEAR(factFecha) as unsigned)=2023);
*/

#16.1 Persona/Estudiante puede borrar sus facturas

drop procedure if exists eliminar_factura_usuario;
DELIMITER $$
CREATE procedure eliminar_factura_usuario(in cliente_id int)
	BEGIN
		start transaction;
		delete from factura_producto where factID in (select factID from factura where clienteID=cliente_id);
		delete from factura where clienteID=cliente_id;
        commit;
    END $$
DELIMITER ;

start transaction;
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
CALL eliminar_factura_usuario(10101013);
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
rollback;

drop procedure if exists eliminar_factura_usuario_tiempo;
DELIMITER $$
CREATE procedure eliminar_factura_usuario_tiempo(in cliente_id int, in mes int, in ano int)
	BEGIN
		start transaction;
		delete from factura_producto 
			where factID in 
				(select factID from factura 
					where CAST(MONTH(factFecha) as unsigned)=mes
						and CAST(YEAR(factFecha) as unsigned)=ano 
                        and clienteID=cliente_id);
		delete from factura 
			where CAST(MONTH(factFecha) as unsigned)=mes 
            and CAST(YEAR(factFecha) as unsigned)=ano
            and clienteID=cliente_id;
		commit;
    END $$
DELIMITER ;

start transaction;
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
CALL eliminar_factura_usuario_tiempo(10101013,4,2023);
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
rollback;


drop procedure if exists sp_eliminar_factura_usuario_tiempo;
DELIMITER $$
CREATE procedure sp_eliminar_factura_usuario_tiempo(in cliente_id int, in mes int, in ano int)
	BEGIN
		#start transaction;
        if mes is null and ano is null then
			delete from factura_producto where factID in (select factID from factura where clienteID=cliente_id);
			delete from factura where clienteID=cliente_id;
        else
			if mes is not null and ano is not null then
				delete from factura_producto 
					where factID in (select factID from factura 
						where CAST(MONTH(factFecha) as unsigned)=mes 
						and CAST(YEAR(factFecha) as unsigned)=ano 
						and clienteID=cliente_id);
				delete from factura 
					where CAST(MONTH(factFecha) as unsigned)=mes 
					and CAST(YEAR(factFecha) as unsigned)=ano
					and clienteID=cliente_id;
            else
				if mes is null then
					delete from factura_producto 
						where factID in 
						(select factID from factura 
							where CAST(YEAR(factFecha) as unsigned)=ano
							and clienteID=cliente_id);
					delete from factura 
						where CAST(YEAR(factFecha) as unsigned)=ano
						and clienteID=cliente_id;
                else
					delete from factura_producto 
						where factID in (select factID from factura 
							where CAST(MONTH(factFecha) as unsigned)=mes 
							and clienteID=cliente_id);
					delete from factura 
						where CAST(MONTH(factFecha) as unsigned)=mes 
						and clienteID=cliente_id;
				end if;
			end if;
        end if;
		#commit;
    END $$
DELIMITER ;

start transaction;
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
CALL sp_eliminar_factura_usuario_tiempo(10101013,4,2023);
select * from factura where clienteID=10101013;
select * from factura_producto where factID in (select factID from factura where clienteID=10101013);
rollback;


#17. Secretaría inserta fallas de alimentación con la fecha actual

drop procedure if exists insertar_falla_alimentacion_sec;
DELIMITER $$
CREATE procedure insertar_falla_alimentacion_sec(in est int,in falla enum('Desayuno','Almuerzo','Cena'), in lugar enum('Comedor central','Hemeroteca','Odontología','Agronomía','Biología','Ciencias Humanas','Ciencias Económicas','Matemáticas','otro'))
	BEGIN
		insert into fallaalimentacion (estID,fallAlcgaComida,fallAlLugar,fallAlFecha) values (est, falla, lugar, CURRENT_DATE());
    END $$
DELIMITER ;

/*
call insertar_falla_alimentacion_sec(101010126, 'Almuerzo', 'Comedor central');
select * from fallaalimentacion;
*/

# 18. Estudiante/Secretariaa/dirección insertan actividades de corresponsabilidad con la fecha actual

drop procedure if exists sp_insertar_act_corresponsabilidad;
DELIMITER $$
CREATE procedure sp_insertar_act_corresponsabilidad(in id_est int, in act enum('académica','deportiva','cultural','comunitaria','acompañamiento','desarrollo institucional','otra'), in horas tinyint)
	BEGIN
		insert into actividadcorresp (estID,actCorActividad,actCorHoras,actCorFecha) values (id_est, act, horas, CURRENT_DATE());
    END $$
DELIMITER ;

/*
call sp_insertar_act_corresponsabilidad(101010127, 'deportiva', 3);
SELECT * from actividadcorresp;
*/

# 19. Secretaria/dirección pueden insertar convocatorias económicas, pero también se insertan en convocatoria
# Y
#20. Dirección puede eliminar una convocatoria economica, pero esta también se elimina de convocatorias

drop procedure if exists insertar_conv_alimento;
DELIMITER $$
CREATE procedure insertar_conv_alimento(in id_conv int, in comida enum('Desayuno','Almuerzo','Cena'), in lugar enum('Comedor central','Hemeroteca','Odontología','Agronomía','Biología','Ciencias Humanas','Ciencias Económicas','Matemáticas','otro'))
	BEGIN
		start transaction;
		call insertar_conv_en_curso(id_conv, 'Fomento Económico Estudiantes Alimentación', 1, 3.5);
		insert into convocatoriagestionalimentaria values (id_conv, comida, lugar);
        commit;
    END $$
DELIMITER ;

/*
call insertar_conv_alimento(23, 'Desayuno', 'Hemeroteca');
select * from convocatoria;
select * from convocatoriagestionalimentaria;
*/

drop procedure if exists eliminar_conv_alimento;
DELIMITER $$
CREATE procedure eliminar_conv_alimento(in id_conv int)
	BEGIN
		start transaction;
		delete from convocatoriagestionalimentaria where conv_id=id_conv;
		delete from convocatoria where conv_id=id_conv;
        commit;
    END $$
DELIMITER ;

/*
call eliminar_conv_alimento(23);
select * from convocatoria;
select * from convocatoriagestionalimentaria;
*/


drop procedure if exists insertar_conv_emprendimiento;
DELIMITER $$
CREATE procedure insertar_conv_emprendimiento(in id_conv int, in cobertura float, in nombre varchar(60), in tema varchar(50), in descr varchar(200))
	BEGIN
		start transaction;
		call insertar_conv_en_curso(id_conv, 'Fomento Emprendimiento Estudiantes', 1, 3.5);
		insert into convocatoriafomentoemprendimeinto values (id_conv, cobertura, nombre, tema, descr);
        commit;
    END $$
DELIMITER ;

/*
call insertar_conv_emprendimiento(23, 200000, 'El Nuevo', 'Tema Nuevo', 'Es un nuevo emp.');
select * from convocatoria;
select * from convocatoriafomentoemprendimeinto;
*/

drop procedure if exists eliminar_conv_emprendimiento;
DELIMITER $$
CREATE procedure eliminar_conv_emprendimiento(in id_conv int)
	BEGIN
		start transaction;
		delete from convocatoriafomentoemprendimeinto where conv_id=id_conv;
		delete from convocatoria where conv_id=id_conv;
        commit;
    END $$
DELIMITER ;

/*
call eliminar_conv_emprendimiento(23);
select * from convocatoria;
select * from convocatoriafomentoemprendimeinto;
*/


drop procedure if exists insertar_conv_alojamiento;
DELIMITER $$
CREATE procedure insertar_conv_alojamiento(in id_conv int, in direccion varchar(100), in localidad varchar(100), in cobertura float, in tipo enum('Hotel','Casa','Apartamento','Vivienda familiar','Residencia Universitaria','Apartaestudio','Habitación','otro'), in descr varchar(200), in costo float)
	BEGIN
		start transaction;
		call insertar_conv_en_curso(id_conv, 'Gestión Alojamiento', 1, 3.5);
		insert into convocatoriagestionalojamiento values (id_conv, direccion, localidad, cobertura, tipo, descr, costo);
        commit;
    END $$
DELIMITER ;

/*
call insertar_conv_alojamiento(23, 'Cra 45 No 21-42', 'Teusaquillo', 500000, 'Habitación', 'Buena habitación', 600000);
select * from convocatoria;
select * from convocatoriagestionalojamiento;
*/

drop procedure if exists eliminar_conv_alojamiento;
DELIMITER $$
CREATE procedure eliminar_conv_alojamiento(in id_conv int)
	BEGIN
		start transaction;
		delete from convocatoriagestionalojamiento where conv_id=id_conv;
		delete from convocatoria where conv_id=id_conv;
        commit;
    END $$
DELIMITER ;

/*
call eliminar_conv_alojamiento(23);
select * from convocatoria;
select * from convocatoriagestionalojamiento;
*/


drop procedure if exists insertar_conv_economica;
DELIMITER $$
CREATE procedure insertar_conv_economica(in id_conv int, in cobertura float)
	BEGIN
		start transaction;
		call insertar_conv_en_curso(id_conv, 'Fomento Económico Estudiantes', 1, 3.5);
		insert into convocatoriagestioneconomica values (id_conv, cobertura);
        commit;
    END $$
DELIMITER ;

/*
call insertar_conv_economica(23, 400000);
select * from convocatoria;
select * from convocatoriagestioneconomica;
*/

drop procedure if exists eliminar_conv_economica;
DELIMITER $$
CREATE procedure eliminar_conv_economica(in id_conv int)
	BEGIN
		start transaction;
		delete from convocatoriagestioneconomica where conv_id=id_conv;
		delete from convocatoria where conv_id=id_conv;
        commit;
    END $$
DELIMITER ;

/*
call eliminar_conv_economica(23);
select * from convocatoria;
select * from convocatoriagestioneconomica;
*/


drop procedure if exists insertar_conv_transporte;
DELIMITER $$
CREATE procedure insertar_conv_transporte(in id_conv int, in cobertura float, in tipo enum('Transporte público masivo','otro'))
	BEGIN
		start transaction;
		call insertar_conv_en_curso(id_conv, 'Gestión Transporte', 1, 3.5);
		insert into convocatoriagestiontransporte values (id_conv, cobertura, tipo);
        commit;
    END $$
DELIMITER ;

/*
call insertar_conv_transporte(23, 400000, 'Transporte público masivo');
select * from convocatoria;
select * from convocatoriagestiontransporte;
*/

drop procedure if exists eliminar_conv_transporte;
DELIMITER $$
CREATE procedure eliminar_conv_transporte(in id_conv int)
	BEGIN
		start transaction;
		delete from convocatoriagestiontransporte where conv_id=id_conv;
		delete from convocatoria where conv_id=id_conv;
        commit;
    END $$
DELIMITER ;

/*
call eliminar_conv_transporte(23);
select * from convocatoria;
select * from convocatoriagestiontransporte;
*/


#--------------------------------------------------------------------------------------------------------------------------------------------
#																	PAS_interfaz
#--------------------------------------------------------------------------------------------------------------------------------------------

# Uso General:

# ------------------------------- Un usuario necesita ver todas las convocatorias por área ----------------------------------------------
drop procedure if exists sp_consultar_programas_de_area;
DELIMITER $$
create procedure sp_consultar_programas_de_area(in idArea int)
	begin 
		select * from vw_info_convocatoria where areID = idArea;
	end $$
DELIMITER ;


# ------------------------------- Un estudiante necesita ver las convocatorias por programa de area de bienestar ----------------------------------------------
drop procedure if exists sp_consultar_convocatorias_programa;
DELIMITER $$
create procedure sp_consultar_convocatorias_programa(in idPrograma int)
	begin 
		select * from convocatoria where Programa_progID = id_Programa;
	end $$
DELIMITER ;

# Actividad Física y Deporte

# ------------------------------- Un usuario necesita ver los torneos internos disponibles ----------------------------------------------
drop procedure if exists sp_consultar_torneos_internos;
DELIMITER $$
create procedure sp_consultar_torneos_internos()
	begin 
		select toridTorneoInterno, torDeporte, torNombreTorneo, torRama from torneointerno;
	end $$
DELIMITER ;

# ------------------------------- Un usuario necesita ver los cursos libres de deportes disponibles ----------------------------------------------
drop procedure if exists sp_consultar_convocatoria_cursos_libres;
DELIMITER $$
create procedure sp_consultar_convocatoria_cursos_libres()
	begin 
		select * from convocatoriacursolibre;
	end $$
DELIMITER ;


# Gestión y Fomento Socioeconómico

# ------------------------------- Un usuario necesita ver información detallada de convocatorias de fomento, por tipo de apoyo.-----------------------
drop procedure if exists sp_consultar_gestion_alimentaria;
DELIMITER $$
create procedure sp_consultar_gestion_alimentaria ()
	begin
		select * from convocatoriagestionalimentaria join convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_transporte;
DELIMITER $$
create procedure sp_consultar_gestion_transporte ()
	begin
		select * from convocatoriagestiontransporte join convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_alojamiento;
DELIMITER $$
create procedure sp_consultar_gestion_alojamiento()
	begin
		select * from convocatoriagestionalojamiento join convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_economica;
DELIMITER $$
create procedure sp_consultar_gestion_economica ()
	begin
		select * from convocatoriagestioneconomica join convocatoria on (conv_id);
	end $$
DELIMITER ;

drop procedure if exists sp_consultar_gestion_emprendimiento;
DELIMITER $$
create procedure sp_consultar_gestion_emprendimiento ()
	begin
		select * from convocatoriafomentoemprendimeinto join convocatoria on (conv_id);
	end $$
DELIMITER ;
