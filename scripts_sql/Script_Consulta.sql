select * from persona;
select * from estudiante;
select * from carrera;
select * from area;
select * from programa;
select * from fallaalimentacion;
select * from actividadcorresp;
select * from convocatoria;
select * from convocatoriagestionalimentaria;
select * from convocatoriagestionalojamiento;
select * from convocatoriagestioneconomica;
select * from tiendabienestar;
select * from factura;
select * from producto;
select * from factura_producto;
select * from convocatoria;

#----------------------------------------------------------------------
#                                  Javier
#----------------------------------------------------------------------

#1. Calcular la suma y promedio por gestión económica para los estudiantes de la universidad y para cada facultad. Incluir cuántos estudiantes reciben el beneficio.
select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura) 
	from convocatoriagestioneconomica 
    join convocatoria using(conv_id)
    join estudiante_toma_convocatoria using (conv_id);

select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura),perFacultad
	from convocatoriagestioneconomica 
	join convocatoria using(conv_id) 
	join estudiante_toma_convocatoria using (conv_id) 
	join estudiante on (idEst = estID) 
    join persona on (estID=perID)
	group by perFacultad;

#2. Calcular los productos vendidos una vez entre el 15 de febrero y 15 de mayo de 2023. ¿Cuál generó más ganancias? ¿Cuál es la suma?

select count(prodID) as conteo,prodDetalle,sum(prodPrecio) as precio 
	from factura 
    join factura_producto using (factID) 
    join producto using (prodID) where factFecha>'2023-02-15' and factFecha<'2023-05-15' 
    group by prodDetalle 
    having conteo>=2 
    order by precio desc;

select sum(precio) from (select count(prodID) as conteo,prodDetalle,sum(prodPrecio) as precio 
	from factura 
	join factura_producto using (factID) 
	join producto using (prodID) where factFecha>'2023-02-15' and factFecha<'2023-05-15' 
	group by prodDetalle 
	having conteo>=2 
	order by precio desc) 
	as tbNew;

#3. Consultar el número de fallas por restaurante. Presentar al estudiante que tenga por lo menos 4.
#¿Cuáles son? ¿Qué restaurante tiene más fallas?

select count(estID),perNombre,perApellido 
	from fallaalimentacion 
	join estudiante using (estID) 
	join persona on (estID=perID) 
	group by estID 
	having count(estID)>=4;

select count(fallAlID) as conteo,fallAlLugar 
	from fallaalimentacion 
	group by fallAlLugar 
	order by count(fallAlID) desc;

#4. Consultar el número de inmuebles que se ofrecen en la convocatoria de gestión de alojamiento por localidad. 
#Consultar el promedio del valor cobertura y costo por localidades del sur (‘Ciudad Bolívar’,‘Bosa’,‘Kenedy’,‘Tunjuelito’,‘Antonio Nariño’,
#‘Rafael Uribe Uribe’,‘San Cristóbal’,‘Usme’,‘Puente Aranda’,‘Los Mártires’).


select count(conv_id),AVG(cgalCobertura),avg(cgalCosto),cgalLocalidadAlojamiento 
	from convocatoriagestionalojamiento 
	where cgalLocalidadAlojamiento in ('Ciudad Bolívar', 'Bosa', 'Kenedy', 'Tunjuelito', 'Antonio Nariño', 'Rafael Uribe Uribe', 'San Cristóbal', 'Usme', 'Puente Aranda', 'Los Mártires') 
	group by cgalLocalidadAlojamiento;


#----------------------------------------------------------------------
#Carlos
#----------------------------------------------------------------------

# 5. Consultar la cantidad de estudiantes que se presentan a convocatorias de selecciones deportivas agrupados por deporte.
select count(idEst) 
	from estudiante_toma_convocatoria 
	join (convocatoria 
	join convocatoriaseleccion on (conv_id = Convocatoria_conv_id)) 
	using (conv_id) group by convDeporte;

# 6. Consultar el promedio de horas de corresponsabilidad cumplidas por estudiantes que participaron en convocatorias de gestión alimentaria.
select avg(horPendCorresp) 
	from (corresponsabilidad 
	join (estudiante_toma_convocatoria 
	join (convocatoria 
	join convocatoriagestionalimentaria  using (conv_id)) 
	using (conv_id))
	 using(idEst));

# 7. Consultar la cantidad de estudiantes con fallas alimentarias que participaron en convocatorias a selecciones deportivas de fútbol o fútbol sala.

select distinct estID,convLugar,convDeporte 
	from fallaalimentacion 
	join estudiante_toma_convocatoria on (estID=idEst) 
	join convocatoria using (conv_id) 
	join convocatoriaseleccion on (conv_id=Convocatoria_conv_id) 
	where lower(convDeporte)='futbol sala' or lower(convDeporte)='futbol';

select count(estID),convDeporte
	from 
	(select distinct estID,convLugar,convDeporte 
		from fallaalimentacion 
		join estudiante_toma_convocatoria on (estID=idEst) 
		join convocatoria using (conv_id) 
		join convocatoriaseleccion on (conv_id=Convocatoria_conv_id) 
		where lower(convDeporte)='futbol sala' or lower(convDeporte)='futbol') as tb_nw 
	group by convDeporte;
    
select count(estID),convDeporte
	from 
	(select distinct estID,convLugar,convDeporte 
		from fallaalimentacion 
		join estudiante_toma_convocatoria on (estID=idEst) 
		join convocatoria using (conv_id) 
		join convocatoriaseleccion on (conv_id=Convocatoria_conv_id) 
		where lower(convDeporte)='futbol sala' or lower(convDeporte)='futbol') as tb_nw 
	group by convDeporte 
    having count(estID)>2;
    
select count(estID)
	from 
	(select distinct estID,convLugar,convDeporte 
		from fallaalimentacion 
		join estudiante_toma_convocatoria on (estID=idEst) 
		join convocatoria using (conv_id) 
		join convocatoriaseleccion on (conv_id=Convocatoria_conv_id) 
		where lower(convDeporte)='futbol sala' or lower(convDeporte)='futbol') as tb_nw;

#----------------------------------------------------------------------
#                                  Valeria
#----------------------------------------------------------------------

# 8. Consultar cuales fueron los incapacidades dadas durante la pandemia, cuantas ser dieron por cada una y la duración promedio de cada una.
SELECT incEnfermedad AS tipo_incapacidad, COUNT(incEnfermedad) AS cantidad, ROUND(SUM(incDias) / COUNT(incEnfermedad)) AS promedio_dias 
	FROM incapacidad WHERE '2019-12-30' < incFecha AND incFecha > '2021-12-30' GROUP BY incEnfermedad ORDER BY promedio_dias DESC;

# 9. Consultar cual es la enfermedad más común y para dicha enfermedad ver cuales son las citas médicas más solicitadas.
SELECT enfNombre AS enfermedad, COUNT(enfNombre) AS cantidad FROM enfermedad GROUP BY enfNombre ORDER BY cantidad DESC LIMIT 1;

SELECT citEspecialidad AS tipo_cita, COUNT(citEspecialidad) AS cantidad_citas
	FROM citamedica JOIN 
    (SELECT perID FROM enfermedad JOIN (
	SELECT COUNT(enfNombre) AS cantidad, enfNombre FROM enfermedad GROUP BY enfNombre ORDER BY cantidad DESC LIMIT 1) 
	AS max_enfermedad ON max_enfermedad.enfNombre = enfermedad.enfNombre) 
	AS enfermos ON pacienteID=perID
	GROUP BY (citEspecialidad);

# 10. Para las personas con alguna discapacidad ver cuantos días de incapacidad han tenido y la cantidad de citas que han requerido, eso agrupado por el tipo de incapacidad.
SELECT disNombre AS discapacidad, SUM(incDias) AS numero_dias_incapacitado, COUNT(citID) AS cantidad_citas_medicas
	FROM discapacidad NATURAL JOIN incapacidad JOIN citamedica ON pacienteID=perID GROUP BY (disNombre);




