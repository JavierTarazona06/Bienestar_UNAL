#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------

#Vista de información completa de estudiantes:

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos from estudiante join persona on (estID=perID) join carrera using (carreID);

drop view if exists vw_info_estudiante;
create view vw_info_estudiante as select * from estudiante join persona on (estID=perID) join carrera using (carreID);

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos from vw_info_estudiante;


#Vista de estudiantes con sus convocatorias:

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos,conv_id,convNombre from estudiante join persona on (estID=perID) join carrera using (carreID) left join estudiante_toma_convocatoria on (estID=idEst) left join convocatoria using (conv_id);

drop view if exists vw_info_convocatoria_estudiante;
create view vw_info_convocatoria_estudiante as select * from estudiante join persona on (estID=perID) join carrera using (carreID) left join estudiante_toma_convocatoria on (estID=idEst) left join convocatoria using (conv_id);

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos,conv_id,convNombre from vw_info_convocatoria_estudiante;


#Vista de facturas con sus productos y tienda:

select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,tieID,tieDireccion,tieCiudad from factura join factura_producto using (factID) join producto using (prodID) join persona on (clienteID=perID) join tiendabienestar using (tieID);
drop view if exists vw_info_factura;
create view vw_info_factura as select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,tieID,tieDireccion,tieCiudad from factura join factura_producto using (factID) join producto using (prodID) join persona on (clienteID=perID) join tiendabienestar using (tieID);
select * from vw_info_factura;


#------------------------------------------------------------------
#------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Valeria
#--------------------------------------------------------------------------------------------------------------------------------------------

# Ver las citas medicas disponibles
DROP VIEW IF EXISTS vw_citamedica_disponible;
CREATE VIEW vw_citamedica_disponible AS
	SELECT citFecha AS fecha, citEspecialidad AS especialidad, perNombre AS doctor, pacienteID AS paciente 
	FROM citamedica JOIN personalsalud ON (perID=doctorID) NATURAL JOIN persona
	WHERE pacienteID IS NULL AND citFecha > CURRENT_DATE();
    
    
# Ver las citas medicas agendadas y que son proximas a pasar
DROP VIEW IF EXISTS vw_citamedica_agendada;
CREATE VIEW vw_citamedica_agendada AS
	SELECT citFecha AS fecha, citEspecialidad AS especialidad, perNombre AS doctor, pacienteID AS paciente 
	FROM citamedica JOIN personalsalud ON (perID=doctorID) NATURAL JOIN persona
    WHERE pacienteID IS NOT NULL AND citFecha > CURRENT_DATE();
    
    
# Ver los medicamentos, ordenes medicas y examen medico por cada cita medica
DROP VIEW IF EXISTS vw_resultado_citamedica;
CREATE VIEW vw_resultado_citamedica AS
	SELECT citFecha AS fecha, citEspecialidad AS especialidad, 
	citDiagnostico AS Diagnostico, evaPeso AS peso, evaEstatura AS estatura, evaRitmoCardiaco AS ritmo_cardiaco, evaVision AS vision,
    medNombre AS medicamento, medCantidad AS cantidad, medIntervalos AS intervalos, ordExamen AS examen, pacienteID AS paciente
	FROM citamedica JOIN evaluacionfisica USING (citID) 
    LEFT JOIN medicamentos USING (citID) 
    LEFT JOIN ordenmedica USING (citID);    


# Ver las incapacidades y sus detalles
DROP VIEW IF EXISTS vw_incapacidad;
CREATE VIEW vw_incapacidad AS 
	SELECT incID AS id, perID AS persona, incFecha AS fecha, incEnfermedad AS razon, incDias AS dias, incVerificado AS verificado 
    FROM incapacidad;


# Ver la cantidad de medicamentos diferentes que ha dado cada medico y la cantidad total de ellos
DROP VIEW IF EXISTS vw_medicamentos_solicitados;
CREATE VIEW vw_medicamentos_solicitados AS
	SELECT perNombre AS doctor, perID AS id, COUNT(medNombre) AS cantidad, SUM(medCantidad) AS cantidad_pastillas
	FROM citamedica JOIN personalsalud ON (perID=doctorID)
    JOIN medicamentos USING (citID)
    NATURAL JOIN persona
    GROUP BY (perID);
    

# Ver la especializacion de los medicos que le han recetado cada procedimiento a un usuario
DROP VIEW IF EXISTS vw_doctor_procedimiento;
CREATE VIEW vw_doctor_procedimiento AS
	SELECT citID AS cita, pacienteID AS paciente, salEspecializacion AS especializacion, ordExamen AS procedimiento
	FROM citamedica JOIN personalsalud ON (doctorID = perID) JOIN ordenmedica USING (citID);

#--------------------------------------------------------------------------------------------------------------------------------------------
#																	Carlos
#--------------------------------------------------------------------------------------------------------------------------------------------


#Vista de grupos artisticos institucionales y sus convocatorias.

select gaiNombre, gaiDisciplina, convFechaApertura, convFechaApertura,convGaiEntrevista, convFechaCierre, convEstado, convPeriodo from GrupoArtisticoInstitucional join ConvocatoriaGAI on (GAI_id = GrupoArtisticoInstitucional_GAI_id) join Convocatoria on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_gai_convocatoria;
create view vw_info_gai_convocatoria as select gaiNombre, gaiDisciplina convFechaApertura, convFechaCierre, convGaiEntrevista, convEstado, convPeriodo from GrupoArtisticoInstitucional join ConvocatoriaGAI on (GAI_id = GrupoArtisticoInstitucional_GAI_id) join Convocatoria on (Convocatoria_conv_id = conv_id);
select * from vw_info_gai_convocatoria;


#Vista de convocatorias a selecciones deportivas.

select progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaSeleccion on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_seleccion_convocatoria;
create view vw_info_seleccion_convocatoria as select progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaSeleccion on (Convocatoria_conv_id = conv_id);
select * from vw_info_seleccion_convocatoria;


#Vista de convocatorias a cursos libres de deportes.

select progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo  from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaCursoLibre on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_curso_libre_convocatoria;
create view vw_info_curso_libre_convocatoria as select progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaCursoLibre on (Convocatoria_conv_id = conv_id);
select * from vw_info_curso_libre_convocatoria;



#------------------------------------------------------------------
#------------------------------------------------------------------