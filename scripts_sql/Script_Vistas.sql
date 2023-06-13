#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------

#Vista de información completa de estudiantes:

/*
select estID,perNombre,perApellido,perEmail,estPBM,perFacultad,carreNombre,carreCreditos 
	from estudiante
    join persona on (estID=perID) 
    join carrera using (carreID);
*/

drop view if exists vw_info_estudiante;
create view vw_info_estudiante as 
	select estID,perNombre,perApellido,perEmail,perSede,perFacultad,carreID,carreNombre,carreCreditos,estEdad,estPBM,estPAPA,estTipoAdmision,estEsEgresado,perDireccion,perBarrio,perCiudad,
		perTipoVivienda,perLocalidad,perEntidadSalud,perProcedencia,horPendCorresp
    from estudiante
	join persona on (perID=estID)
    join carrera using (carreID)
    left join corresponsabilidad on (estID=idEst);

/*
select estID,perNombre,perApellido,perEmail,estPBM,perFacultad,carreNombre,carreCreditos from vw_info_estudiante;
select * from vw_info_estudiante;
*/

#Vista de estudiantes con sus convocatorias:

/*
select estID,perNombre,perApellido,perEmail,estPBM,perFacultad,carreNombre,carreCreditos,conv_id,convNombre 
	from estudiante join persona on (estID=perID) 
    join carrera using (carreID) 
    left join estudiante_toma_convocatoria on (estID=idEst) 
    left join convocatoria using (conv_id);
*/

drop view if exists vw_info_convocatoria_estudiante;
create view vw_info_convocatoria_estudiante as select * 
	from estudiante 
    join persona on (estID=perID) 
    join carrera using (carreID) 
    left join estudiante_toma_convocatoria on (estID=idEst) 
    left join convocatoria using (conv_id);

/*
select estID,perNombre,perApellido,perEmail,estPBM,perFacultad,carreNombre,
	carreCreditos,conv_id,convNombre from vw_info_convocatoria_estudiante;
*/

#Vista de facturas con sus productos y tienda:

#select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,tieID,tieDireccion,tieCiudad from factura join factura_producto using (factID) join producto using (prodID) join persona on (clienteID=perID) join tiendabienestar using (tieID);
drop view if exists vw_info_factura;
create view vw_info_factura as select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,
	tieID,tieDireccion,tieCiudad from factura 
    left join factura_producto using (factID) 
    left join producto using (prodID) 
    join persona on (clienteID=perID) 
    join tiendabienestar using (tieID) order by factID;
#select * from vw_info_factura;

#Vista de productos con la tienda a la que pertenecen

#select producto.prodID,producto.prodPrecio,producto.prodDetalle,tiendabienestar.tieID,tiendabienestar.tieDireccion,tiendabienestar.tieCiudad from producto_tiendaun 
	#JOIN producto ON producto_tiendaun.prodID = producto.prodID  join tiendabienestar on tiendabienestar.tieID=producto_tiendaun.tieID;
drop view if exists vw_productos_tienda;
create view vw_productos_tienda as select 
	producto.prodID,producto.prodPrecio,producto.prodDetalle,prodDisponibilidad,tiendabienestar.tieID,
    tiendabienestar.tieDireccion,tiendabienestar.tieCiudad 
    from producto_tiendaun JOIN producto ON producto_tiendaun.prodID = producto.prodID 
    join tiendabienestar on tiendabienestar.tieID=producto_tiendaun.tieID;
#select * from vw_productos_tienda; 

#Vista del estudiante y sus fallas de alimentación y corresponsabilidad

#select fallAlID,fallAlcgaComida,fallAlLugar,fallAlFecha,estID,perNombre,perApellido,perEmail,perFacultad,carreID,carreNombre,estPBM,estPAPA
	#from vw_info_estudiante
    #join fallaalimentacion using (estID);
drop view if exists vw_estudiante_falla_alimentacion;
create view vw_estudiante_falla_alimentacion as
	select fallAlID,fallAlcgaComida,fallAlLugar,fallAlFecha,estID,perNombre,perApellido,perEmail,perFacultad,carreID,carreNombre,estPBM,estPAPA
	from vw_info_estudiante
    join fallaalimentacion using (estID);
#select * from vw_estudiante_falla_alimentacion;

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Valeria
#--------------------------------------------------------------------------------------------------------------------------------------------

# Ver las citas medicas disponibles
DROP VIEW IF EXISTS vw_citamedica_disponible;
CREATE VIEW vw_citamedica_disponible AS
	SELECT citFecha AS fecha, citEspecialidad AS especialidad, perNombre AS doctor 
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
	citDiagnostico AS diagnostico, evaPeso AS peso, evaEstatura AS estatura, evaRitmoCardiaco AS ritmo_cardiaco, evaVision AS vision,
    medNombre AS medicamento, medCantidad AS cantidad, medIntervalos AS intervalos, ordExamen AS examen, pacienteID AS paciente
	FROM citamedica JOIN evaluacionfisica USING (citID) 
    LEFT JOIN medicamentos USING (citID) 
    LEFT JOIN ordenmedica USING (citID);    


# Ver las incapacidades y sus detalles
DROP VIEW IF EXISTS vw_incapacidad;
CREATE VIEW vw_incapacidad AS 
	SELECT incID AS id, perID AS persona, incFecha AS fecha, incEnfermedad AS razon, incDias AS dias, 
    incVerificado AS verificado, incAprobado AS aprobado FROM incapacidad ORDER BY fecha DESC;
    

# Ver las atenciones en salud y sus detalles
DROP VIEW IF EXISTS vw_atencionsalud;
CREATE VIEW vw_atencionsalud AS
    SELECT antID AS id, perID AS persona, ateFecha AS fecha, ateTipo AS tipo, 
    ateVerificado AS verificado, ateAprobado AS aprobado FROM atencionensalud ORDER BY fecha DESC;


# Ver el resultado del perfil de riesgo integral
DROP VIEW IF EXISTS vw_perfil_integral;
CREATE VIEW vw_perfil_integral AS 
	SELECT perID AS persona, perFecha AS fecha, perSaludFisica AS puntaje_fisico, 
    perSaludPsicologica AS puntaje_psicologico FROM perfilriesgointegral;
    

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

#select gaiNombre, gaiDisciplina, convFechaApertura, convFechaApertura,convGaiEntrevista, convFechaCierre, convEstado, convPeriodo 
	#from grupoartisticoinstitucional join convocatoriagai on (GAI_id = GrupoArtisticoInstitucional_GAI_id) 
    #join convocatoria on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_gai_convocatoria;
create view vw_info_gai_convocatoria 
	as select gaiNombre, gaiDisciplina convFechaApertura, convFechaCierre, convGaiEntrevista, convEstado, convPeriodo 
    from grupoartisticoinstitucional 
    join convocatoriagai on (GAI_id = GrupoArtisticoInstitucional_GAI_id) 
    join convocatoria on (Convocatoria_conv_id = conv_id);
#select * from vw_info_gai_convocatoria;


#Vista de convocatorias a selecciones deportivas.

#select conv_id,progID,progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora 
	#from programa 
    #join convocatoria on (Programa_progID = progID) 
    #join convocatoriaseleccion on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_seleccion_convocatoria;
create view vw_info_seleccion_convocatoria 
	as select conv_id,progID,progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora 
    from programa 
    join convocatoria on (Programa_progID = progID) 
    join convocatoriaseleccion on (Convocatoria_conv_id = conv_id);
#select * from vw_info_seleccion_convocatoria;


#Vista de convocatorias a cursos libres de deportes.

#select Convocatoria_conv_id,progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo  
	#from programa 
    #join convocatoria on (Programa_progID = progID) 
    #join convocatoriacursolibre on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_curso_libre_convocatoria;
create view vw_info_curso_libre_convocatoria 
	as select Convocatoria_conv_id,progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo 
	from programa 
    join convocatoria on (Programa_progID = progID) 
    join convocatoriacursolibre on (Convocatoria_conv_id = conv_id);
#select * from vw_info_curso_libre_convocatoria;

#Vista de convocatorias, área, y programa al que pertenecen a la que pertenecen

#select conv_id, areID,progID, convNombre, progNombre, areNombre 
	#from (area join programa on (areID = Area_areID)) 
    #join convocatoria on (progID = Programa_progID);
drop view if exists vw_info_convocatoria;
create view vw_info_convocatoria 
	as select conv_id, progID, areID, convNombre, progNombre, areNombre  
    from (area join programa on (areID = Area_areID)) 
    join convocatoria on (progID = Programa_progID);
#select * from vw_info_convocatoria;

#Vista de estudiantes y sus convocatorias

#select conv_id, Programa_progID, convNombre, convFechaApertura, convFechaCierre, estID 
	#from (estudiante join estudiante_toma_convocatoria on (estID = idEst)) 
    #join convocatoria using (conv_id);
drop view if exists vw_info_convocatoria_estudiante;
create view vw_info_convocatoria_estudiante 
	as select conv_id, estID,Programa_progID, convNombre, convFechaApertura, convFechaCierre 
    from (estudiante join estudiante_toma_convocatoria on (estID = idEst)) 
    join convocatoria using (conv_id);
#select * from vw_info_convocatoria_estudiante;

#Vista de proyectos y sus detalles

#select proyIdProyecto, progID,proyNombre, proyEjecucion, proyPresupuesto, areID  
	#from ((proyecto join programa_tiene_proyecto on (proyIdProyecto = Proyecto_proyIdProyecto)) 
    #join programa using (progID)) 
    #join area on (areID = Area_areID);
drop view if exists vw_info_proyecto;
create view vw_info_proyecto 
	as select proyIdProyecto, progID,proyNombre, proyEjecucion, proyPresupuesto, areID  
    from ((proyecto join programa_tiene_proyecto on (proyIdProyecto = Proyecto_proyIdProyecto)) 
    join programa using (progID)) 
    join area on (areID = Area_areID);
#select * from vw_info_proyecto;

#Vista de eventos y sus detalles.
#select evetaidEventoTaller, progID,evetaNombre,	eveDescripcion,evetaTipoEventoTaller, evetaHoraInicio, evetaHoraFin, evetaFecha, evetaLugar, areID 
	#from ((eventotaller join programa_tiene_eventotaller on (evetaidEventoTaller = idEventoTaller)) 
    #join programa using (progID)) 
    #join area on (areID = Area_areID);
drop view if exists vw_info_eventoTaller;
create view vw_info_eventoTaller as select evetaidEventoTaller, progID,evetaNombre,	eveDescripcion,evetaTipoEventoTaller, evetaHoraInicio, evetaHoraFin, evetaFecha, evetaLugar, areID 
	from ((eventotaller join programa_tiene_eventotaller on (evetaidEventoTaller = idEventoTaller)) 
    join programa using (progID)) 
    join area on (areID = Area_areID);
#select * from vw_info_eventoTaller;


#------------------------------------------------------------------
#------------------------------------------------------------------