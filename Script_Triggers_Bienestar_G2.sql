

#--------------------------------------------------------------------------------------------------------
#                                                     Valeria
#--------------------------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------------------------
#                                                     Javier
#--------------------------------------------------------------------------------------------------------


# 1.El secretario/dirección pueden insertar una convocatoria de gestión de alojamiento, pero si la cobertura es mayor al costo, no insertarla
#Se realiza una función que devuelva un booleano en el caso de que la obra si se pueda insertar


#--------------------------------------------------------------------------------------------------------
#                                                     Carlos
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
