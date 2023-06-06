use bienestar;

#--------------------------------------------------------------------------------------------------------------------
										              #General
#--------------------------------------------------------------------------------------------------------------------

select * from persona;

select * from vw_info_estudiante;
    
select * from convocatoria
	join Programa on (Programa_progID=progID);
    
select progID,progNombre,progExtension,progCorreoElectronico,progTelefono,progEdificio,progOficina,areID,areNombre,areTelefono,
	areCorreoElectronico,areExtension,areEdificio,areDescripcion 
    from programa
	join area on (Area_areID=areID);
    
select * from area;    
    
select * from vw_info_convocatoria_estudiante;

select * from carrera;    
    
#--------------------------------------------------------------------------------------------------------------------
													#Javier - Económico
#--------------------------------------------------------------------------------------------------------------------

select * from vw_estudiante_falla_alimentacion;

select actCorID,actCorActividad,actCorHoras,actCorFecha,estID,estPBM,carreID,estPAPA 
	from actividadcorresp
	join estudiante using (estID);
    
select * from convocatoriafomentoemprendimeinto;

select * from convocatoriagestionalimentaria;

select * from convocatoriagestionalojamiento;

select * from convocatoriagestioneconomica;

select * from convocatoriagestiontransporte;

select * from vw_info_factura;

select * from vw_productos_tienda;

#--------------------------------------------------------------------------------------------------------------------
													#Deporte
#--------------------------------------------------------------------------------------------------------------------


select * from vw_info_curso_libre_convocatoria;

select * from vw_info_eventotaller;

select * from vw_info_proyecto;

select * from vw_info_seleccion_convocatoria;

select * from torneointerno join programa on (progID=Programa_progID);