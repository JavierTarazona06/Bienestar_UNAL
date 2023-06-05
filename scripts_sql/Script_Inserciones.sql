use Bienestar;
SET FOREIGN_KEY_CHECKS=0;


#Javier
#------------------------------------------------------------------
DELETE FROM persona;
insert into persona (perID,perNombre,perApellido,perDireccion,perBarrio,perCiudad,perTipoVivienda,perLocalidad,perEmail,perEntidadSalud,perFacultad) values 
(10101011,'Ana José','Ramírez Mendoza','CL 120 s No. 81-31','Guayabal','Barranquilla','Apartaestudio','Otra','ARamírezM@unal.edu.co','Sura EPS','Ciencias Humanas'),
(10101012,'Gabriela Andrés','Pérez Núñez','KR 125 j No. 43-65','Las Acacias','Barranquilla','Apartaestudio','Engativá','GPérezN@unal.edu.co','Colmedica','Ingeniería'),
(10101013,'Ricardo Felipe','Sánchez Gómez','TV 72 h No. 43-30','San Antonio','Cartagena','Finca','Usaquén','RSánchezG@unal.edu.co','Colmedica','Ingeniería'),
(10101014,'Miguel Juan','García Romero','AK 117 a No. 48-12','Campo Valdés','Ibagué','Finca','Chapinero','MGarcíaR@unal.edu.co','Nueva EPS','Ciencias Humanas'),
(10101015,'Laura Ricardo','Torres Gómez','CL 20 e No. 82-16','El Rodeo','Ibagué','Casa','Puente Aranda','LTorresG@unal.edu.co','Famisanar','Ciencias'),
(10101016,'Santiago Ernesto','Ramírez Fernández','AC 104 i No. 58-59','Loma de Los Bernal','Cali','Casa','Teusaquillo','SRamírezF@unal.edu.co','Nueva EPS','Ciencias Económicas'),
(10101017,'Jorge Diego','Álvarez Ruiz','TV 48 o No. 75-48','Santa Cruz','Cali','Apartaestudio','Suba','JÁlvarezR@unal.edu.co','Sanitas','Ciencias Económicas'),
(10101018,'Natalia Manuel','Ruiz Jiménez','KR 127 b No. 3-38','El Centro','Cúcuta','Apartaestudio','Teusaquillo','NRuizJ@unal.edu.co','Nueva EPS','Derecho, Ciencias Políticas y Sociales'),
(10101019,'Ricardo Andrés','Suárez Pérez','CL 123 f No. 2-85','Manila','Barranquilla','Apartaestudio','Rafael Uribe Uribe','RSuárezP@unal.edu.co','Cafesalud','Medicina'),
(101010110,'Andrés Ernesto','Rojas Martínez','KR 20 t No. 46-45','Las Acacias','Villavicencio','Apartaestudio','Teusaquillo','ARojasM@unal.edu.co','Famisanar','Ciencias'),
(101010111,'Luis Carla','López Díaz','TV 112 b No. 3-81','Envigado','Bucaramanga','Apartaestudio','Bosa','LLópezD@unal.edu.co','Cafesalud','Ingeniería'),
(101010112,'Isabel Pedro','López Morales','AK 172 o No. 41-63','El Lido','Cúcuta','Apartamento','La Candelaria','ILópezM@unal.edu.co','Sura EPS','Medicina'),
(101010113,'Diego Fernando','Romero Díaz','TV 132 q No. 88-99','El Rodeo','Soacha','Finca','Engativá','DRomeroD@unal.edu.co','Aliansalud','Ciencias'),
(101010114,'Manuel Andrea','Silva López','TV 146 t No. 29-4','Barrio Colombia','Cartagena','Casa','Rafael Uribe Uribe','MSilvaL@unal.edu.co','Sanitas','Ingeniería'),        
(101010115,'Mónica María','Fernández Martínez','CL 141 p No. 48-86','La Floresta','Villavicencio','Casa','Bosa','MFernándezM@unal.edu.co','SaludTotal','Medicina'),
(101010116,'Raúl Santiago','Martínez Suárez','KR 36 g No. 5-66','Bello','Medellín','Apartaestudio','Puente Aranda','RMartínezS@unal.edu.co','Colmedica','Psicología'),
(101010117,'Miguel Ricardo','Reyes Martínez','AC 23 i No. 19-80','Itagüí','Cartagena','Apartaestudio','Barrios Unidos','MReyesM@unal.edu.co','Sanitas','Ciencias'),
(101010118,'Raúl Andrea','Romero Torres','AC 63 r No. 57-23','Bello','Villavicencio','Casa','San Cristóbal','RRomeroT@unal.edu.co','Famisanar','Medicina'),
(101010119,'Ana Alejandro','Romero Ruiz','AK 160 b No. 42-32','Bello','Villavicencio','Apartaestudio','Ciudad Bolívar','ARomeroR@unal.edu.co','Aliansalud','Ingeniería'),
(101010120,'Carlos Pedro','Martínez Flores','TV 167 c No. 10-46','Barrio Colombia','Bogotá','Finca','Engativá','CMartínezF@unal.edu.co','Cafesalud','Psicología'),
(101010121,'Gabriela Andrés','Gómez López','AC 133 s No. 52-4','El Pinal','Barranquilla','Casa','Rafael Uribe Uribe','GGómezL@unal.edu.co','Coomeva EPS','Artes'),
(101010122,'Mónica Andrés','Romero Rodríguez','KR 50 d No. 19-6','Laureano Gómez','Villavicencio','Finca','Rafael Uribe Uribe','MRomeroR@unal.edu.co','Aliansalud','Ciencias Agrarias'),
(101010123,'Jorge Ana','Fernández Núñez','TV 174 s No. 22-36','El Popular','Cali','Apartaestudio','Antonio Nariño','JFernándezN@unal.edu.co','Sura EPS','Derecho, Ciencias Políticas y Sociales'),
(101010124,'José Alejandro','Suárez Ramírez','CL 51 j No. 98-1','El Raizal','Medellín','Apartaestudio','Antonio Nariño','JSuárezR@unal.edu.co','EPS Familiar','Ciencias Agrarias'),
(101010125,'Carlos Mario','Rodríguez Hernández','CL 66 r No. 85-76','La Floresta','Soacha','Apartamento','Usme','CRodríguezH@unal.edu.co','Coomeva EPS','Ingeniería'),
(101010126,'Roberto Mario','Ramírez Reyes','KR 71 g No. 13-60','San Diego','Medellín','Finca','La Candelaria','RRamírezR@unal.edu.co','Sura EPS','Ingeniería'),
(101010127,'Isabel Isabel','García Cruz','KR 106 c No. 6-99','Belén','Cali','Casa','Usaquén','IGarcíaC@unal.edu.co','Compensar','Ciencias'),
(101010128,'María Roberto','Romero Gómez','AC 54 f No. 84-9','Envigado','Soacha','Apartaestudio','Rafael Uribe Uribe','MRomeroG@unal.edu.co','EPS Familiar','Artes'),
(101010129,'Carlos Luis','Martínez Cruz','KR 79 l No. 58-2','El Lido','Cúcuta','Apartaestudio','Suba','CMartínezC@unal.edu.co','Cafesalud','Ciencias Humanas'),
(101010130,'Laura Miguel','Fernández Ramírez','AK 90 g No. 1-65','Bello','Ibagué','Finca','Bosa','LFernándezR@unal.edu.co','Cafesalud','Ingeniería'),
(101010131,'Lucía Laura','Castro Romero','TV 105 d No. 47-65','Belén','Bucaramanga','Apartaestudio','Antonio Nariño','LCastroR@unal.edu.co','SaludTotal','Odontología'),
(101010132,'Andrés Gabriela','Álvarez González','KR 119 l No. 62-77','San Lucas','Soacha','Apartaestudio','Suba','AÁlvarezG@unal.edu.co','Coomeva EPS','Psicología'),
(101010133,'María Isabel','Ruiz Álvarez','CL 82 s No. 63-2','La Avanzada','Cali','Finca','Bosa','MRuizÁ@unal.edu.co','SaludTotal','Ciencias Agrarias'),
(101010134,'Isabel Luis','Ortiz Jiménez','AK 76 e No. 36-44','El Lido','Bucaramanga','Finca','Tunjuelito','IOrtizJ@unal.edu.co','Aliansalud','Enfermería'),
(101010135,'Ricardo Santiago','López Hernández','TV 35 s No. 49-43','El Raizal','Medellín','Casa','Chapinero','RLópezH@unal.edu.co','Colmedica','Medicina'),
(101010136,'Pedro Gabriela','Gómez Flores','KR 16 h No. 47-16','El Popular','Ibagué','Apartamento','Santa Fe','PGómezF@unal.edu.co','SaludTotal','Psicología'),
(101010137,'Roberto Lucía','Suárez Hernández','TV 171 a No. 78-2','El Rodeo','Bucaramanga','Apartaestudio','Usme','RSuárezH@unal.edu.co','Cafesalud','Psicología'),
(101010138,'Alejandro Felipe','Núñez González','KR 63 f No. 21-9','La Pradera','Soacha','Apartamento','Ciudad Bolívar','ANúñezG@unal.edu.co','Famisanar','Derecho, Ciencias Políticas y Sociales'),      
(101010139,'José Luis','Flores Chávez','AC 180 s No. 17-60','El Tesoro','Medellín','Apartamento','Chapinero','JFloresC@unal.edu.co','Famisanar','Odontología'),
(101010140,'Juan Diego','Pérez Mendoza','AK 90 h No. 53-39','La Candelaria','Ibagué','Apartaestudio','La Candelaria','JPérezM@unal.edu.co','Famisanar','Medicina'),
(101010141,'José Manuel','Ortiz Hernández','AK 111 t No. 82-99','Santa Cruz','Ibagué','Apartamento','Barrios Unidos','JOrtizH@unal.edu.co','Sura EPS','Ciencias Agrarias'),
(101010142,'Roberto Alejandro','Vargas Ramírez','KR 160 h No. 98-76','El Poblado','Villavicencio','Apartaestudio','Rafael Uribe Uribe','RVargasR@unal.edu.co','Nueva EPS','Enfermería'),
(101010143,'Raúl Carla','Mendoza Fernández','AC 154 e No. 31-83','San Diego','Cali','Finca','Ciudad Bolívar','RMendozaF@unal.edu.co','Coomeva EPS','Ciencias Veterinarias y de Zootecnia'),
(101010144,'Diego José','Flores Hernández','KR 37 o No. 42-70','San Lucas','Cúcuta','Casa','Chapinero','DFloresH@unal.edu.co','Sura EPS','Ciencias Agrarias'),
(101010145,'Carla Pedro','Castro Suárez','TV 44 r No. 4-43','San Joaquín','Cartagena','Apartamento','Santa Fe','CCastroS@unal.edu.co','Colmedica','Ingeniería'),
(101010146,'Ana Lucía','Vargas García','CL 144 a No. 91-74','La América','Bucaramanga','Finca','Kennedy','AVargasG@unal.edu.co','Sura EPS','Ciencias Humanas'),
(101010147,'Jorge Manuel','Gómez García','TV 180 g No. 81-41','Moravia','Cartagena','Casa','Santa Fe','JGómezG@unal.edu.co','Sura EPS','Ciencias Humanas'),
(101010148,'Andrés Alejandro','Ramírez Silva','CL 4 m No. 98-45','La Castellana','Medellín','Apartamento','Barrios Unidos','ARamírezS@unal.edu.co','Famisanar','Ciencias Veterinarias y de Zootecnia'),  
(101010149,'Jorge Luis','Chávez Flores','CL 23 k No. 45-91','Castilla','Cúcuta','Apartaestudio','Engativá','JChávezF@unal.edu.co','Aliansalud','Artes'),
(101010150,'Mónica Mónica','Pérez Morales','AK 171 b No. 40-47','La Mota','Cúcuta','Apartamento','Kennedy','MPérezM@unal.edu.co','Cafesalud','Enfermería'),
(101010151,'Andrea Ricardo','Silva Sánchez','AK 134 q No. 41-49','Aranjuez','Barranquilla','Casa','Fontibón','ASilvaS@unal.edu.co','EPS Familiar','Derecho, Ciencias Políticas y Sociales'),
(101010152,'Diego Gabriela','Sánchez Mendoza','KR 68 l No. 21-70','Belén','Soacha','Apartamento','Teusaquillo','DSánchezM@unal.edu.co','Coomeva EPS','Ciencias Humanas'),
(101010153,'Mario Manuel','González Vargas','CL 132 k No. 45-94','El Rodeo','Soacha','Finca','Usaquén','MGonzálezV@unal.edu.co','Sura EPS','Ciencias Agrarias'),
(101010154,'Luis Raúl','Pérez Silva','TV 130 o No. 59-89','Las Acacias','Ibagué','Finca','Kennedy','LPérezS@unal.edu.co','Sura EPS','Ciencias Humanas'),
(101010155,'Isabel Felipe','García González','KR 118 o No. 23-32','Laureano Gómez','Bogotá','Apartaestudio','Otra','IGarcíaG@unal.edu.co','Colmedica','Ciencias Humanas'),
(101010156,'Mónica Mónica','Jiménez Castro','AK 54 i No. 3-36','Envigado','Cali','Apartamento','Kennedy','MJiménezC@unal.edu.co','Coomeva EPS','Artes'),
(101010157,'Ana Gabriela','Silva Mendoza','AC 145 k No. 77-33','La Castellana','Soacha','Apartamento','Usaquén','ASilvaM@unal.edu.co','Cafesalud','Ciencias Humanas'),
(101010158,'Natalia Mario','Díaz Pérez','AK 15 n No. 76-16','Aranjuez','Ibagué','Finca','Santa Fe','NDíazP@unal.edu.co','Famisanar','Ciencias Económicas'),
(101010159,'Raúl Felipe','Pérez Cruz','AC 67 p No. 89-5','Envigado','Medellín','Finca','Usaquén','RPérezC@unal.edu.co','Famisanar','Medicina'),
(101010160,'Ana Gabriela','Flores López','AC 134 l No. 84-17','El Centro','Cúcuta','Apartaestudio','Rafael Uribe Uribe','AFloresL@unal.edu.co','EPS Familiar','Ciencias Humanas'),
(101010161,'Felipe Mario','González Chávez','KR 178 l No. 6-51','La Castellana','Cartagena','Finca','Usaquén','FGonzálezC@unal.edu.co','Colmedica','Ingeniería'),
(101010162,'Natalia Diego','Rojas Ortiz','AC 118 q No. 41-22','Laureano Gómez','Villavicencio','Finca','San Cristóbal','NRojasO@unal.edu.co','Sura EPS','Ciencias Veterinarias y de Zootecnia'),
(101010163,'Pedro Santiago','Pérez Mendoza','KR 134 k No. 7-2','San Lucas','Medellín','Finca','San Cristóbal','PPérezM@unal.edu.co','Cafesalud','Ciencias Económicas'),
(101010164,'Jorge Ricardo','García Morales','AK 26 q No. 4-32','La América','Villavicencio','Casa','Ciudad Bolívar','JGarcíaM@unal.edu.co','Sura EPS','Ciencias Económicas'),
(101010165,'Roberto Andrés','Suárez Ramírez','AC 111 r No. 18-98','Guayabal','Bucaramanga','Apartaestudio','Chapinero','RSuárezR@unal.edu.co','Nueva EPS','Psicología'),
(101010166,'María Jorge','Ruiz Díaz','CL 25 k No. 52-2','Los Colores','Cali','Apartaestudio','San Cristóbal','MRuizD@unal.edu.co','Sura EPS','Enfermería'),
(101010167,'Jorge Natalia','Rojas Mendoza','AK 130 k No. 49-31','Moravia','Cartagena','Apartaestudio','Suba','JRojasM@unal.edu.co','Sura EPS','Ingeniería'),
(101010168,'Gustavo Manuel','Silva García','AC 86 j No. 2-55','El Pinal','Bogotá','Apartaestudio','Otra','GSilvaG@unal.edu.co','Nueva EPS','Psicología'),
(101010169,'Laura Juan','Vargas Jiménez','AC 143 l No. 25-11','Laureles','Ibagué','Finca','Tunjuelito','LVargasJ@unal.edu.co','Colmedica','Ingeniería'),
(101010170,'Raúl Mónica','Rodríguez Ruiz','AC 128 c No. 8-14','Guayabal','Barranquilla','Casa','La Candelaria','RRodríguezR@unal.edu.co','Coomeva EPS','Ciencias Veterinarias y de Zootecnia'),
(101010171,'Laura Jorge','Díaz Rodríguez','TV 127 l No. 73-83','La Candelaria','Cali','Apartamento','Ciudad Bolívar','LDíazR@unal.edu.co','SaludTotal','Ciencias Económicas'),
(101010172,'Roberto Santiago','Ruiz García','AK 51 i No. 96-57','San Antonio','Cúcuta','Casa','San Cristóbal','RRuizG@unal.edu.co','Colmedica','Medicina'),
(101010173,'Gustavo Felipe','Hernández Vargas','KR 27 l No. 8-60','Cristo Rey','Villavicencio','Apartaestudio','Engativá','GHernándezV@unal.edu.co','SaludTotal','Psicología'),
(101010174,'Luis Carla','López Álvarez','KR 69 d No. 76-32','La Aguacatala','Villavicencio','Casa','Ciudad Bolívar','LLópezÁ@unal.edu.co','Compensar','Medicina'),
(101010175,'Andrea José','García Suárez','CL 126 q No. 7-62','Estadio','Bucaramanga','Apartamento','Los Mártires','AGarcíaS@unal.edu.co','SaludTotal','Psicología'),
(101010176,'Jorge Andrea','Flores Castro','CL 43 s No. 1-67','Aranjuez','Cartagena','Finca','Antonio Nariño','JFloresC@unal.edu.co','EPS Familiar','Ciencias Económicas'),
(101010177,'Jorge Andrea','Morales Fernández','KR 141 b No. 50-77','El Tesoro','Soacha','Finca','Puente Aranda','JMoralesF@unal.edu.co','Sanitas','Ciencias'),
(101010178,'Alejandro Luis','Díaz Morales','AC 22 g No. 47-2','Barrio Colombia','Cúcuta','Apartamento','Suba','ADíazM@unal.edu.co','SaludTotal','Ciencias Agrarias'),
(101010179,'Andrea Natalia','Pérez Jiménez','CL 107 b No. 3-8','El Poblado','Villavicencio','Apartamento','Teusaquillo','APérezJ@unal.edu.co','Compensar','Psicología'),
(101010180,'María María','Rojas Fernández','AK 105 c No. 69-86','La Castellana','Barranquilla','Casa','Suba','MRojasF@unal.edu.co','Famisanar','Ciencias'),
(101010181,'Felipe Gabriela','Sánchez Martínez','TV 180 f No. 92-21','Estadio','Barranquilla','Apartamento','Engativá','FSánchezM@unal.edu.co','SaludTotal','Odontología'),
(101010182,'Alejandro Alejandro','Gómez Jiménez','AC 164 a No. 44-30','La América','Medellín','Casa','Engativá','AGómezJ@unal.edu.co','Nueva EPS','Ciencias Humanas'),
(101010183,'Alejandro Roberto','Hernández Álvarez','KR 174 l No. 91-90','Bello','Medellín','Finca','Usme','AHernándezÁ@unal.edu.co','EPS Familiar','Derecho, Ciencias Políticas y Sociales'),
(101010184,'Laura Carlos','Suárez Ruiz','TV 153 s No. 12-13','La Floresta','Bucaramanga','Apartaestudio','Chapinero','LSuárezR@unal.edu.co','Aliansalud','Ciencias Veterinarias y de Zootecnia'),        
(101010185,'Andrés Ana','Núñez Morales','TV 173 k No. 43-69','Campo Valdés','Cartagena','Apartamento','Suba','ANúñezM@unal.edu.co','Aliansalud','Enfermería'),
(101010186,'Mónica Fernando','Hernández Silva','AK 91 o No. 1-86','El Poblado','Bucaramanga','Apartaestudio','Tunjuelito','MHernándezS@unal.edu.co','Coomeva EPS','Ciencias Veterinarias y de Zootecnia'),
(101010187,'Fernando Natalia','Núñez Díaz','TV 67 i No. 38-9','Manrique','Cali','Apartaestudio','Kennedy','FNúñezD@unal.edu.co','Compensar','Derecho, Ciencias Políticas y Sociales'),
(101010188,'Natalia Ricardo','Sánchez Ramírez','AC 1 g No. 97-19','El Chagualo','Soacha','Apartamento','Kennedy','NSánchezR@unal.edu.co','Cafesalud','Ciencias Humanas'),
(101010189,'Miguel Luis','Torres Pérez','TV 121 a No. 56-33','Laureles','Medellín','Apartamento','Usaquén','MTorresP@unal.edu.co','Nueva EPS','Ciencias Agrarias'),
(101010190,'Jorge Manuel','Ruiz Morales','AK 4 i No. 27-19','El Rodeo','Soacha','Apartamento','Otra','JRuizM@unal.edu.co','SaludTotal','Ciencias Agrarias'),
(101010191,'Miguel Roberto','Díaz García','CL 74 i No. 5-78','Laureano Gómez','Ibagué','Casa','Teusaquillo','MDíazG@unal.edu.co','Aliansalud','Enfermería'),
(101010192,'Luis Mario','Fernández Castro','CL 30 l No. 34-5','Itagüí','Bogotá','Apartaestudio','La Candelaria','LFernándezC@unal.edu.co','Compensar','Psicología'),
(101010193,'Miguel Ernesto','Martínez Romero','KR 110 k No. 20-35','La Flora','Barranquilla','Casa','Suba','MMartínezR@unal.edu.co','Cafesalud','Artes'),
(101010194,'Isabel Lucía','Ramírez Castro','AC 104 p No. 92-76','La Pradera','Cúcuta','Apartaestudio','San Cristóbal','IRamírezC@unal.edu.co','Coomeva EPS','Derecho, Ciencias Políticas y Sociales'),   
(101010195,'José Ricardo','Álvarez Pérez','KR 81 c No. 33-22','Itagüí','Soacha','Apartamento','Antonio Nariño','JÁlvarezP@unal.edu.co','Sanitas','Ciencias'),
(101010196,'Ana Ernesto','Torres Hernández','CL 176 c No. 44-38','Itagüí','Cúcuta','Casa','Kennedy','ATorresH@unal.edu.co','Nueva EPS','Medicina'),
(101010197,'Laura Alejandro','Álvarez Pérez','KR 114 k No. 30-70','San Lucas','Bogotá','Apartaestudio','Barrios Unidos','LÁlvarezP@unal.edu.co','Sanitas','Ciencias Veterinarias y de Zootecnia'),       
(101010198,'Santiago Manuel','Ramírez Sánchez','CL 64 r No. 89-42','San Lucas','Barranquilla','Apartamento','Tunjuelito','SRamírezS@unal.edu.co','Famisanar','Odontología'),
(101010199,'Gustavo Luis','Rojas Suárez','TV 88 r No. 73-81','Estadio','Villavicencio','Finca','Santa Fe','GRojasS@unal.edu.co','Colmedica','Ciencias Veterinarias y de Zootecnia'),
(1010101100,'Fernando Laura','Suárez Suárez','AC 110 k No. 60-90','El Pinal','Soacha','Finca','Bosa','FSuárezS@unal.edu.co','Sura EPS','Enfermería'),
(1010101101,'Roberto Luis','Sánchez Álvarez','CL 105 t No. 60-70','La Candelaria','Cartagena','Apartamento','Ciudad Bolívar','RSánchezÁ@unal.edu.co','Compensar','Ciencias Agrarias'),
(1010101102,'Gabriela Ricardo','Morales Ortiz','CL 160 p No. 21-27','El Popular','Soacha','Apartamento','Rafael Uribe Uribe','GMoralesO@unal.edu.co','Cafesalud','Artes'),
(1010101103,'Isabel Juan','Vargas Silva','TV 73 m No. 81-81','Robledo','Bogotá','Apartamento','Fontibón','IVargasS@unal.edu.co','Cafesalud','Odontología'),
(1010101104,'María Jorge','Ramírez Rodríguez','TV 41 n No. 50-14','Castilla','Cartagena','Casa','La Candelaria','MRamírezR@unal.edu.co','Coomeva EPS','Ciencias Agrarias'),
(1010101105,'Jorge Miguel','Fernández Hernández','AK 161 a No. 65-78','La Avanzada','Barranquilla','Apartamento','Bosa','JFernándezH@unal.edu.co','SaludTotal','Enfermería'),
(1010101106,'Manuel María','Álvarez Jiménez','AC 12 j No. 11-32','Manila','Bucaramanga','Casa','Puente Aranda','MÁlvarezJ@unal.edu.co','Aliansalud','Ciencias Humanas'),
(1010101107,'Alejandro María','Castro Díaz','CL 61 t No. 68-73','Belén','Bogotá','Apartaestudio','La Candelaria','ACastroD@unal.edu.co','SaludTotal','Ciencias Humanas'),
(1010101108,'Gustavo Lucía','Pérez Reyes','CL 49 d No. 3-35','El Raizal','Barranquilla','Casa','Antonio Nariño','GPérezR@unal.edu.co','Colmedica','Ingeniería'),
(1010101109,'Alejandro Raúl','García González','AC 87 j No. 89-94','La Flora','Bogotá','Casa','Los Mártires','AGarcíaG@unal.edu.co','Nueva EPS','Ingeniería'),
(1010101110,'Raúl Ana','Torres Ramírez','AC 16 c No. 23-48','Doce de Octubre','Ibagué','Apartaestudio','Puente Aranda','RTorresR@unal.edu.co','SaludTotal','Odontología'),
(1010101111,'Alejandro Carla','Suárez Núñez','KR 131 a No. 82-19','El Pinal','Cali','Casa','Ciudad Bolívar','ASuárezN@unal.edu.co','SaludTotal','Artes'),
(1010101112,'Raúl Luis','Vargas Ramírez','AC 36 n No. 21-80','Manila','Cali','Apartaestudio','Usaquén','RVargasR@unal.edu.co','Compensar','Artes'),
(1010101113,'Mario Roberto','Díaz Jiménez','AK 58 j No. 67-73','San Diego','Cúcuta','Apartamento','Ciudad Bolívar','MDíazJ@unal.edu.co','Colmedica','Enfermería'),
(1010101114,'Fernando Ernesto','Rojas Silva','KR 148 e No. 2-48','El Chagualo','Bucaramanga','Casa','Usaquén','FRojasS@unal.edu.co','Colmedica','Ciencias Humanas'),
(1010101115,'Gustavo Mónica','Martínez Suárez','KR 80 g No. 32-73','El Salado','Bucaramanga','Casa','Antonio Nariño','GMartínezS@unal.edu.co','EPS Familiar','Psicología'),
(1010101116,'Ricardo Mario','García Álvarez','AK 123 d No. 27-81','La América','Barranquilla','Apartaestudio','Teusaquillo','RGarcíaÁ@unal.edu.co','Famisanar','Ciencias Humanas'),
(1010101117,'Raúl Isabel','Hernández López','KR 61 p No. 10-79','La Castellana','Ibagué','Casa','Los Mártires','RHernándezL@unal.edu.co','SaludTotal','Ciencias Veterinarias y de Zootecnia'),
(1010101118,'Carlos Raúl','Gómez Cruz','TV 59 e No. 98-19','Los Colores','Medellín','Apartaestudio','Tunjuelito','CGómezC@unal.edu.co','Colmedica','Ingeniería'),
(1010101119,'Alejandro Natalia','Silva Silva','CL 61 s No. 6-4','La Candelaria','Villavicencio','Apartamento','Ciudad Bolívar','ASilvaS@unal.edu.co','Cafesalud','Ciencias'),
(1010101120,'Andrea Lucía','Rojas Romero','AC 55 l No. 86-25','Doce de Octubre','Barranquilla','Apartaestudio','Tunjuelito','ARojasR@unal.edu.co','SaludTotal','Ciencias Agrarias'),
(1010101121,'Ernesto Ernesto','García Hernández','AC 112 b No. 41-24','Itagüí','Ibagué','Finca','Tunjuelito','EGarcíaH@unal.edu.co','Cafesalud','Ciencias Económicas'),
(1010101122,'Alejandro Ricardo','García Ramírez','AK 159 i No. 15-54','La Estrella','Cartagena','Apartamento','Rafael Uribe Uribe','AGarcíaR@unal.edu.co','Nueva EPS','Ciencias'),
(1010101123,'Natalia María','Rodríguez Ramírez','TV 132 a No. 73-39','El Tesoro','Villavicencio','Apartaestudio','Ciudad Bolívar','NRodríguezR@unal.edu.co','Famisanar','Derecho, Ciencias Políticas y Sociales'),
(1010101124,'Carla Andrea','Flores Chávez','AK 44 e No. 76-81','San Lucas','Bogotá','Casa','Suba','CFloresC@unal.edu.co','Sura EPS','Medicina'),
(1010101125,'María Manuel','Pérez Díaz','AC 150 r No. 8-92','San Diego','Ibagué','Casa','Rafael Uribe Uribe','MPérezD@unal.edu.co','Cafesalud','Derecho, Ciencias Políticas y Sociales'),
(1010101126,'José Fernando','Cruz Cruz','CL 29 h No. 54-99','Manila','Medellín','Apartamento','Usme','JCruzC@unal.edu.co','Colmedica','Enfermería'),
(1010101127,'Ernesto Laura','Silva Romero','CL 61 o No. 66-70','Manila','Villavicencio','Casa','Usme','ESilvaR@unal.edu.co','Sura EPS','Medicina'),
(1010101128,'Mónica Ana','Gómez Romero','AK 131 n No. 58-50','Manrique','Ibagué','Casa','Usaquén','MGómezR@unal.edu.co','Cafesalud','Ciencias Agrarias'),
(1010101129,'Alejandro Manuel','García Reyes','AK 173 k No. 2-59','Envigado','Medellín','Apartaestudio','Teusaquillo','AGarcíaR@unal.edu.co','Aliansalud','Ciencias Económicas'),
(1010101130,'Roberto Miguel','Ortiz Díaz','AK 75 f No. 13-51','San Javier','Ibagué','Finca','Fontibón','ROrtizD@unal.edu.co','EPS Familiar','Odontología'),
(1010101131,'Mario Manuel','González Cruz','KR 49 n No. 7-39','San Joaquín','Ibagué','Casa','Los Mártires','MGonzálezC@unal.edu.co','EPS Familiar','Ciencias Económicas'),
(1010101132,'Felipe Carla','Flores Ramírez','TV 107 a No. 45-24','La Avanzada','Bucaramanga','Finca','Bosa','FFloresR@unal.edu.co','Sura EPS','Odontología'),
(1010101133,'Mónica Ricardo','Ramírez Silva','AK 19 m No. 50-84','Robledo','Barranquilla','Apartamento','Suba','MRamírezS@unal.edu.co','Sanitas','Ciencias Humanas'),
(1010101134,'Laura Lucía','Ortiz Cruz','TV 101 b No. 43-54','El Salado','Soacha','Apartaestudio','Santa Fe','LOrtizC@unal.edu.co','Coomeva EPS','Ciencias Humanas'),
(1010101135,'Isabel Santiago','Romero Flores','KR 58 e No. 29-49','Doce de Octubre','Cartagena','Apartaestudio','San Cristóbal','IRomeroF@unal.edu.co','Coomeva EPS','Ciencias'),
(1010101136,'Fernando Mario','Morales Ortiz','TV 106 f No. 98-85','Envigado','Medellín','Finca','Rafael Uribe Uribe','FMoralesO@unal.edu.co','Aliansalud','Psicología'),
(1010101137,'Juan María','Reyes Cruz','CL 163 o No. 85-85','Robledo','Bogotá','Casa','Los Mártires','JReyesC@unal.edu.co','Colmedica','Artes'),
(1010101138,'Juan Manuel','Fernández Ramírez','TV 53 h No. 86-50','El Centro','Ibagué','Finca','Rafael Uribe Uribe','JFernándezR@unal.edu.co','Sanitas','Medicina'),
(1010101139,'María Raúl','Pérez Flores','AC 106 d No. 1-84','La Aguacatala','Villavicencio','Finca','Usaquén','MPérezF@unal.edu.co','Colmedica','Enfermería'),
(1010101140,'Gabriela Miguel','García Rojas','AC 165 q No. 44-5','Santa Cruz','Cali','Apartaestudio','Ciudad Bolívar','GGarcíaR@unal.edu.co','Colmedica','Psicología'),
(1010101141,'Andrés Luis','Gómez Mendoza','TV 37 p No. 19-51','El Tesoro','Cali','Finca','San Cristóbal','AGómezM@unal.edu.co','Cafesalud','Ciencias Económicas'),
(1010101142,'Diego Alejandro','Castro Martínez','CL 125 m No. 10-3','La Castellana','Cúcuta','Casa','Teusaquillo','DCastroM@unal.edu.co','Nueva EPS','Ciencias Agrarias'),
(1010101143,'Juan Pedro','Mendoza Romero','TV 129 s No. 57-3','Laureano Gómez','Cali','Apartaestudio','Antonio Nariño','JMendozaR@unal.edu.co','Coomeva EPS','Odontología'),
(1010101144,'Andrés Alejandro','González Sánchez','KR 62 b No. 38-97','El Tesoro','Cartagena','Finca','San Cristóbal','AGonzálezS@unal.edu.co','Nueva EPS','Ciencias Económicas'),
(1010101145,'Ana Gabriela','López González','CL 149 s No. 14-93','Guayabal','Villavicencio','Apartaestudio','Santa Fe','ALópezG@unal.edu.co','Nueva EPS','Derecho, Ciencias Políticas y Sociales'),      
(1010101146,'Andrea Andrea','Martínez Fernández','AC 129 o No. 84-6','Santa Cruz','Cali','Casa','Rafael Uribe Uribe','AMartínezF@unal.edu.co','Nueva EPS','Enfermería'),
(1010101147,'Gustavo Natalia','Suárez Núñez','AC 168 a No. 85-4','Itagüí','Barranquilla','Apartaestudio','Rafael Uribe Uribe','GSuárezN@unal.edu.co','Coomeva EPS','Psicología'),
(1010101148,'Ricardo Luis','Sánchez Torres','TV 149 r No. 42-56','Castilla','Ibagué','Apartaestudio','Kennedy','RSánchezT@unal.edu.co','SaludTotal','Ciencias Veterinarias y de Zootecnia'),
(1010101149,'Andrés Pedro','Mendoza Fernández','KR 137 o No. 87-32','Manila','Medellín','Apartamento','Bosa','AMendozaF@unal.edu.co','Nueva EPS','Enfermería'),
(1010101150,'María María','Ramírez Morales','AK 47 l No. 4-7','La Flora','Cúcuta','Casa','Bosa','MRamírezM@unal.edu.co','Coomeva EPS','Medicina'),
(1010101151,'José Andrea','Mendoza Díaz','CL 40 e No. 46-58','El Diamante','Cartagena','Apartamento','Usme','JMendozaD@unal.edu.co','Nueva EPS','Ciencias Agrarias'),
(1010101152,'Ernesto Alejandro','González Núñez','CL 133 r No. 80-58','Castilla','Bucaramanga','Apartamento','Chapinero','EGonzálezN@unal.edu.co','Sura EPS','Ciencias'),
(1010101153,'Alejandro Mónica','García Morales','CL 34 k No. 42-29','San Javier','Soacha','Finca','Puente Aranda','AGarcíaM@unal.edu.co','Cafesalud','Odontología'),
(1010101154,'Gustavo Carla','Hernández Rojas','KR 79 l No. 79-58','Laureles','Medellín','Apartamento','Fontibón','GHernándezR@unal.edu.co','Coomeva EPS','Ingeniería'),
(1010101155,'Jorge Fernando','Álvarez Morales','AC 161 m No. 54-13','La Candelaria','Medellín','Finca','Tunjuelito','JÁlvarezM@unal.edu.co','Compensar','Psicología'),
(1010101156,'Isabel Carlos','Suárez Castro','KR 149 k No. 28-25','Santa Cruz','Medellín','Apartamento','La Candelaria','ISuárezC@unal.edu.co','Famisanar','Derecho, Ciencias Políticas y Sociales'),     
(1010101157,'Manuel Andrés','Gómez Díaz','AK 157 l No. 49-25','El Pinal','Bucaramanga','Apartamento','Rafael Uribe Uribe','MGómezD@unal.edu.co','Sanitas','Ciencias'),
(1010101158,'Ricardo Ernesto','Hernández Ruiz','TV 107 h No. 90-66','El Rodeo','Ibagué','Apartamento','Bosa','RHernándezR@unal.edu.co','EPS Familiar','Ciencias Humanas'),
(1010101159,'Mónica Gabriela','Sánchez González','AK 173 r No. 73-15','Manrique','Ibagué','Apartaestudio','Antonio Nariño','MSánchezG@unal.edu.co','Colmedica','Medicina'),
(1010101160,'José Gabriela','Gómez Ortiz','TV 88 a No. 12-20','La América','Cali','Apartaestudio','Tunjuelito','JGómezO@unal.edu.co','Colmedica','Ciencias'),
(1010101161,'Diego Natalia','González Núñez','KR 72 r No. 7-84','Belén','Villavicencio','Apartaestudio','Puente Aranda','DGonzálezN@unal.edu.co','Sura EPS','Derecho, Ciencias Políticas y Sociales'),   
(1010101162,'Carla Juan','Rojas Sánchez','AC 37 r No. 92-36','Moravia','Cúcuta','Apartaestudio','Fontibón','CRojasS@unal.edu.co','Coomeva EPS','Psicología'),
(1010101163,'Miguel Lucía','Fernández Flores','TV 132 s No. 7-19','Doce de Octubre','Cali','Finca','Otra','MFernándezF@unal.edu.co','Aliansalud','Psicología'),
(1010101164,'Alejandro Santiago','Rojas Pérez','AK 164 r No. 56-12','La Mota','Medellín','Finca','Teusaquillo','ARojasP@unal.edu.co','Aliansalud','Ciencias Humanas'),
(1010101165,'Gabriela Ernesto','Gómez Rojas','TV 42 t No. 93-1','San Javier','Cúcuta','Casa','Otra','GGómezR@unal.edu.co','Aliansalud','Odontología'),
(1010101166,'Alejandro Diego','Vargas Mendoza','AK 116 g No. 73-82','Las Acacias','Bogotá','Apartaestudio','Suba','AVargasM@unal.edu.co','Sanitas','Ingeniería'),
(1010101167,'Laura Laura','Romero Ramírez','AK 153 k No. 89-63','Laureano Gómez','Barranquilla','Casa','San Cristóbal','LRomeroR@unal.edu.co','SaludTotal','Psicología'),
(1010101168,'Andrea Andrea','Álvarez Pérez','AK 174 e No. 57-42','Laureles','Ibagué','Apartaestudio','Fontibón','AÁlvarezP@unal.edu.co','Nueva EPS','Artes'),
(1010101169,'Andrea Raúl','López Rodríguez','AK 166 t No. 15-45','La Avanzada','Soacha','Apartamento','Suba','ALópezR@unal.edu.co','Sanitas','Odontología'),
(1010101170,'Gustavo Fernando','López Álvarez','KR 36 q No. 96-65','Las Acacias','Villavicencio','Finca','Barrios Unidos','GLópezÁ@unal.edu.co','Sura EPS','Medicina'),
(1010101171,'Isabel Mónica','Romero Sánchez','TV 173 o No. 46-71','La Francia','Soacha','Apartamento','La Candelaria','IRomeroS@unal.edu.co','Nueva EPS','Ciencias Agrarias'),
(1010101172,'José Carla','Fernández Romero','TV 178 b No. 95-19','Robledo','Bucaramanga','Casa','Usme','JFernándezR@unal.edu.co','Sura EPS','Ciencias'),
(1010101173,'Andrés Miguel','Torres Cruz','AK 49 b No. 25-84','El Raizal','Cartagena','Finca','Chapinero','ATorresC@unal.edu.co','SaludTotal','Enfermería'),
(1010101174,'José Natalia','Ruiz Torres','CL 178 n No. 41-49','Santa Cruz','Bucaramanga','Apartaestudio','Teusaquillo','JRuizT@unal.edu.co','SaludTotal','Ingeniería'),
(1010101175,'Andrés Miguel','Flores Núñez','CL 5 l No. 33-23','Cristo Rey','Cartagena','Apartaestudio','Chapinero','AFloresN@unal.edu.co','EPS Familiar','Odontología'),
(1010101176,'Lucía Manuel','Mendoza Romero','AC 14 e No. 78-52','San Diego','Villavicencio','Finca','Antonio Nariño','LMendozaR@unal.edu.co','Nueva EPS','Ciencias Humanas'),
(1010101177,'Ernesto Alejandro','Gómez Rojas','KR 136 b No. 80-94','El Tesoro','Cali','Casa','Antonio Nariño','EGómezR@unal.edu.co','Nueva EPS','Ciencias'),
(1010101178,'Ana Fernando','Hernández Ortiz','KR 126 h No. 9-1','San Joaquín','Barranquilla','Casa','Teusaquillo','AHernándezO@unal.edu.co','Sura EPS','Ciencias'),
(1010101179,'Ricardo Carlos','Núñez Díaz','CL 68 c No. 67-26','El Centro','Cúcuta','Apartaestudio','Puente Aranda','RNúñezD@unal.edu.co','EPS Familiar','Ciencias'),
(1010101180,'Isabel Luis','Pérez Martínez','AC 20 i No. 91-28','Santa Cruz','Cúcuta','Casa','Suba','IPérezM@unal.edu.co','Aliansalud','Ciencias Humanas'),
(1010101181,'Andrés Andrea','Vargas García','TV 48 o No. 21-11','Barrio Colombia','Barranquilla','Apartaestudio','Kennedy','AVargasG@unal.edu.co','Sura EPS','Ciencias Veterinarias y de Zootecnia'),    
(1010101182,'Carla Pedro','Fernández Ortiz','KR 171 m No. 41-97','Doce de Octubre','Bucaramanga','Apartamento','Usme','CFernándezO@unal.edu.co','Compensar','Medicina'),
(1010101183,'Santiago Juan','Fernández González','AK 38 o No. 23-58','El Popular','Bucaramanga','Casa','Los Mártires','SFernándezG@unal.edu.co','EPS Familiar','Ciencias'),
(1010101184,'Juan Mónica','Ramírez Álvarez','TV 32 e No. 42-75','El Diamante','Bucaramanga','Apartaestudio','Antonio Nariño','JRamírezÁ@unal.edu.co','Coomeva EPS','Ciencias Veterinarias y de Zootecnia'),
(1010101185,'José Diego','Torres Hernández','KR 43 q No. 55-2','Moravia','Villavicencio','Finca','Bosa','JTorresH@unal.edu.co','SaludTotal','Odontología'),
(1010101186,'Juan Carlos','García Sánchez','AC 85 a No. 47-58','Envigado','Bogotá','Casa','Kennedy','JGarcíaS@unal.edu.co','Famisanar','Artes'),
(1010101187,'Andrea Carlos','Cruz Pérez','AK 131 p No. 35-89','El Poblado','Cartagena','Finca','Antonio Nariño','ACruzP@unal.edu.co','Nueva EPS','Ciencias Agrarias'),
(1010101188,'Isabel Isabel','Suárez Álvarez','TV 105 i No. 11-97','El Popular','Cartagena','Apartamento','Chapinero','ISuárezÁ@unal.edu.co','Famisanar','Medicina'),
(1010101189,'Luis Andrés','Rodríguez Jiménez','AC 108 e No. 47-13','Loma de Los Bernal','Cúcuta','Apartaestudio','Antonio Nariño','LRodríguezJ@unal.edu.co','Sanitas','Ciencias Veterinarias y de Zootecnia'),
(1010101190,'Carlos Miguel','Reyes Rodríguez','KR 5 g No. 98-10','El Popular','Cali','Apartaestudio','Usaquén','CReyesR@unal.edu.co','Cafesalud','Artes'),
(1010101191,'Santiago Mario','Chávez Vargas','KR 104 c No. 87-13','El Salado','Villavicencio','Apartamento','Usaquén','SChávezV@unal.edu.co','Famisanar','Ciencias Humanas'),
(1010101192,'Luis Ricardo','Hernández Martínez','AK 6 l No. 54-37','Aranjuez','Villavicencio','Finca','Bosa','LHernándezM@unal.edu.co','SaludTotal','Derecho, Ciencias Políticas y Sociales'),
(1010101193,'Juan Luis','Suárez Núñez','CL 48 m No. 83-19','Itagüí','Cúcuta','Apartamento','Tunjuelito','JSuárezN@unal.edu.co','Nueva EPS','Ciencias'),
(1010101194,'Alejandro Fernando','Fernández Núñez','AK 36 p No. 86-93','La Estrella','Cali','Casa','Usme','AFernándezN@unal.edu.co','Compensar','Medicina'),
(1010101195,'Gabriela Alejandro','Mendoza Romero','AK 44 k No. 14-1','Laureles','Barranquilla','Apartamento','Usme','GMendozaR@unal.edu.co','Sura EPS','Ciencias Veterinarias y de Zootecnia'),
(1010101196,'Alejandro Ernesto','Fernández Reyes','AC 107 n No. 57-25','La Estrella','Cúcuta','Casa','Los Mártires','AFernándezR@unal.edu.co','Compensar','Medicina'),
(1010101197,'Ernesto Roberto','Gómez Chávez','AC 136 m No. 45-52','El Salado','Medellín','Casa','Tunjuelito','EGómezC@unal.edu.co','Colmedica','Ciencias Económicas'),
(1010101198,'Andrea Carlos','Álvarez González','CL 161 b No. 52-92','Manila','Villavicencio','Apartaestudio','Chapinero','AÁlvarezG@unal.edu.co','Coomeva EPS','Medicina'),
(1010101199,'Ernesto Mario','Romero Gómez','TV 98 g No. 80-70','La Mota','Cartagena','Casa','La Candelaria','ERomeroG@unal.edu.co','SaludTotal','Derecho, Ciencias Políticas y Sociales'),
(1010101200,'Raúl Luis','Ortiz Ruiz','CL 126 j No. 80-25','Doce de Octubre','Villavicencio','Casa','Los Mártires','ROrtizR@unal.edu.co','Sanitas','Artes');

DELETE FROM carrera;
insert into carrera values(1,'Administración de Empresas (SNIES 19 )','149');
insert into carrera values(2,'Antropología (SNIES 13 )','152');
insert into carrera values(3,'Arquitectura (SNIES 30 )','172');
insert into carrera values(4,'Artes Plásticas  (SNIES 2497 )*','188');
insert into carrera values(5,'Biología (SNIES 31 )','156');
insert into carrera values(6,'Ciencia Política (SNIES 3140 )','144');
insert into carrera values(7,'Ciencias de la Computación (SNIES 106341)','172');
insert into carrera values(8,'Cine y Televisión (SNIES 6 )*','172');
insert into carrera values(9,'Contaduría Pública (SNIES 16895 )','141');
insert into carrera values(10,'Derecho (SNIES 17 )','168');
insert into carrera values(11,'Diseño Gráfico (SNIES 4 )','171');
insert into carrera values(12,'Diseño Industrial (SNIES 5 )','147');
insert into carrera values(13,'Economía (SNIES 18 )','167');
insert into carrera values(14,'Enfermería (SNIES 7 )','154');
insert into carrera values(15,'Español y Filología Clásica (SNIES 54036 )','180');
insert into carrera values(16,'Estadística (SNIES 32 )','175');
insert into carrera values(17,'Farmacia (SNIES 37 )','190');
insert into carrera values(18,'Filología e Idiomas: Alemán (SNIES 23 )','153');
insert into carrera values(19,'Filología e Idiomas: Francés (SNIES 23 )','146');
insert into carrera values(20,'Filología e Idiomas: Inglés (SNIES 23 )','169');
insert into carrera values(21,'Filosofía (SNIES 20 )','152');
insert into carrera values(22,'Física (SNIES 33 )','165');
insert into carrera values(23,'Fisioterapia (SNIES 8 )','148');
insert into carrera values(24,'Geografía (SNIES 3103 )','178');
insert into carrera values(25,'Geología (SNIES 34 )','160');
insert into carrera values(26,'Ingeniería Agrícola (SNIES 24 )','188');
insert into carrera values(27,'Ingeniería Agronómica (SNIES 1 )','162');
insert into carrera values(28,'Ingeniería Civil (SNIES 25 )','137');
insert into carrera values(29,'Ingeniería Sistemas (SNIES 16 )','168');
insert into carrera values(30,'Ingeniería Eléctrica (SNIES 27 )','148');
insert into carrera values(31,'Ingeniería Electrónica (SNIES 16941 )','159');
insert into carrera values(32,'Ingeniería Industrial (SNIES 16940 )','145');
insert into carrera values(33,'Ingeniería Mecánica (SNIES 28 )','158');
insert into carrera values(34,'Ingeniería Mecatrónica (SNIES 16939 )','146');
insert into carrera values(35,'Ingeniería Química (SNIES 29 )','143');
insert into carrera values(36,'Lingüística (SNIES 16938 )','141');
insert into carrera values(37,'Matemáticas (SNIES 35 )','181');
insert into carrera values(38,'Medicina (SNIES 9 )','172');
insert into carrera values(39,'Medicina Veterinaria (SNIES 2 )','176');
insert into carrera values(40,'Música (SNIES 06 )','132');
insert into carrera values(41,'Música Instrumental','149');
insert into carrera values(42,'Nutrición y Dietética (SNIES 10 )','183');
insert into carrera values(43,'Odontología (SNIES 11 )','180');
insert into carrera values(44,'Psicología (SNIES 14 )','167');
insert into carrera values(45,'Química (SNIES 36 )','179');
insert into carrera values(46,'Sociología (SNIES 16 )','162');
insert into carrera values(47,'Trabajo Social (SNIES 15 )','171');
insert into carrera values(48,'Zootecnia (SNIES 3 )','174');

DELETE FROM estudiante;
insert into estudiante (estID,carreID,estEdad,estPBM,estTipoAdmision,estEsEgresado, estAnoGraduacion, estPAPA) values
(10101011,'36','17','73','Regular','0', 2015, 4.1),
(10101012,'27','27','50','Regular','0' , 2015, 4.5),
(10101013,'26','21','76','PEAMA','0' , 2017, 4.4),
(10101014,'47','18','19','Regular','0' , 2018, 4.5),
(10101015,'22','19','73','PEAMA','0', 2018, 4.5),
(10101016,'13','28','30','PEAMA','0', 2002, 4.5),
(10101017,'13','24','37','PEAMA','0', 2023, 4.5),
(10101018,'10','25','88','Regular','0', 2001, 4.5),
(10101019,'38','19','64','PEAMA','0', 2001, 4.5),
(101010110,'16','23','2','Regular','0', 2001, 4.5),
(101010111,'34','25','24','Regular','0', 2001, 4.5),
(101010112,'38','21','79','PEAMA','0', 1996, 3.9),
(101010113,'37','24','43','PEAMA','0', 1996, 3.9),
(101010114,'32','26','39','Regular','0', 1989, 3.9),
(101010115,'23','17','64','PEAMA','0', 1989, 3.9),
(101010116,'44','26','0','Regular','0', 2010, 4.9),
(101010117,'25','19','48','Regular','0', 2010, 4.9),
(101010118,'14','24','84','Regular','0', 2010, 4.9),
(101010119,'34','25','72','Regular','0', 2010, 4.3),
(101010120,'44','26','77','Regular','0', 2009, 4.3),
(101010121,'4','23','19','PEAMA','0', 2009, 4.3),
(101010122,'27','26','25','Regular','0', 2009, 3.5),
(101010123,'6','22','72','Regular','0', 2009, 3.5),
(101010124,'27','22','18','PEAMA','0', 2014, 3.5),
(101010125,'32','24','22','PEAMA','0', 2014, 3.5),
(101010126,'33','22','92','Regular','0', 2014, 3.5),
(101010127,'24','20','74','PEAMA','0', 2014, 2.9),
(101010128,'40','17','30','Regular','0', 1999, 2.9),
(101010129,'20','28','90','PEAMA','0', 1999, 2.9),
(101010130,'29','30','96','PEAMA','0', 1999, 2.9);

DELETE FROM area;
insert into Bienestar.area values
(1, "Salud", 5713165000, "areasalud_bog@unal.edu.co", 21072, "CAN Bloque 3, Edificio 933",
"El Área de Salud promueve el mejoramiento permanente de las condiciones físicas, psíquicas, mentales, sociales y ambientales en las que se desarrolla la vida universitaria, mediante programas formativos, preventivos y correctivos que incidan en la calidad de vida y hábitos de vida saludable.
Protegemos y promocionamos la salud integral de la comunidad universitaria a partir de la caracterización del riesgo individual y grupal, la prevención de la enfermedad, la gestión en salud y la atención de emergencias."),
(2,"Cultura", 5713165194, "culturabien_bog@unal.edu.co", 17248, "Edificio No. 103
Polideportivo Primer Piso / antiguas oficinas División de archivo", 
"El Área de Cultura promueve en la comunidad universitaria el desarrollo de aptitudes estéticas y artísticas en su formación, expresión y divulgación, atendiendo la diversidad cultural de la misma.
Estimulamos la formación y la proyección artística de la comunidad universitaria, en diversas expresiones modernas, contemporáneas, urbanas y representativas del folclor nacional, cultivando el respeto por el patrimonio
 cultural material e inmaterial, el reconocimiento de la diversidad y la creación e investigación de nuevas prácticas del saber."),
 (3,"Actividad física y Deporte",3165000, "divrecd_bog@unal.edu.co", 17207, "Edificio No. 103 Polideportivo",
 "El Área de Actividad Física y Deporte estimula la práctica de actividades de tipo recreativo, formativo y competitivo, en el marco del sano esparcimiento, la promoción de la salud, la utilización racional y formativa del tiempo libre y la implementación del deporte universitario.
Fomentamos la actividad física, el acondicionamiento físico dirigido y el rendimiento deportivo mediante la articulación de las actividades deportivas con la vida académica para apoyar la formación integral y afirmar el sentido de pertenencia hacia la Universidad."),
(4, "Acompañamiento integral", 3165000, "aaintegral@unal.edu.co", 17171, "Ciudad Universitaria - Edificio 103 - Polideportivo Segundo piso",
"El Área de Acompañamiento Integral desarrolla acciones orientadas a los miembros de la comunidad para apoyar su paso por la Universidad, facilitar el conocimiento de sí mismo y de los demás; desarrollar el sentido de pertenencia,
 el compromiso individual, la construcción de un tejido social incluyente y el fortalecimiento de las relaciones humanas.
Un equipo humano interdisciplinario que orienta el fortalecimiento del potencial de los miembros de la comunidad universitaria en los cambios y retos que le impone su tránsito por la institución."),
(5,"Gestión y fomento socieconómico", 3165000, "economicaagfse_bog@unal.edu.co", 10652, "Unidad Camilo Torres Bloque B 7, Oficina: 201", 
"El Área de Gestión y Fomento Socioeconómico promueve el mejoramiento de las condiciones socioeconómicas y el desarrollo personal y profesional de la comunidad estudiantil."),
(6, "Unidades especiales", 3165000, "obsdiscap_nal@unal.edu.co", 10574, "Unidad Camilo Torres (Calle 44 No. 45 - 67), Bloque B, Módulo 8, Oficina 703",
"Los programas de Admisión Especial son creados por la Universidad Nacional de Colombia atendiendo a uno de sus fines misionales, el cual es proyectarse al territorio nacional y contribuir con la unidad nacional, la igualdad de oportunidades de acceso a la educación superior y la promoción del desarrollo de la comunidad académica nacional.");

DELETE FROM programa;
insert into programa (progID,progNombre,Area_areID) values 
(1,'Fomento Económico Estudiantes',5),
(2, "Cita medica", 1), 
(3, "CursoCultural", 2),
(4, "Grupo artistico institucional", 2),
(5, "Urgencia",  1);

DELETE FROM convocatoria;
insert into convocatoria values 
(1,'Fomento Económico Estudiantes','2023-01-15','2023-02-1',1,'2023-1',1,35),
(2,'Fomento Económico Estudiantes Alimentación','2023-01-15','2023-02-1',1,'2023-1',1,35),
(3,'Fomento Económico Estudiantes Alimentación','2023-01-15','2023-02-1',1,'2023-1',1,35),
(4,'Fomento Económico Estudiantes Alimentación','2023-01-15','2023-02-1',1,'2023-1',1,35),
(5,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(6,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(7,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(8,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(9,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(10,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(11,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(12,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(13,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(14,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(15,'Gestión Alojamiento','2023-01-15','2023-02-1',1,'2023-1',1,35),
(16,'Fomento Económico Estudiantes','2023-01-15','2023-02-1',1,'2023-1',1,35),
(17,'Fomento Emprendimiento Estudiantes','2023-01-15','2023-02-1',1,'2023-1',1,35),
(18,'Fomento Emprendimiento Estudiantes','2023-01-15','2023-02-1',1,'2023-1',1,35),
(19,'Fomento Emprendimiento Estudiantes','2023-01-15','2023-02-1',1,'2023-1',1,35),
(20,'Gestión Transporte','2023-01-15','2023-02-1',1,'2023-1',1,35),
(21,'Gestión Transporte','2023-01-15','2023-02-1',1,'2023-1',1,35),
(22,'Gestión Transporte','2023-01-15','2023-02-1',1,'2023-1',1,35);

DELETE FROM convocatoriagestioneconomica;
insert into convocatoriagestioneconomica values (1,500000);
insert into convocatoriagestioneconomica values (16,1000000);

DELETE FROM convocatoriagestionalimentaria;
insert into convocatoriagestionalimentaria values (2,'Desayuno','Comedor central');
insert into convocatoriagestionalimentaria values (3,'Almuerzo','Matemáticas');
insert into convocatoriagestionalimentaria values (4,'Cena','Biología');

DELETE FROM convocatoriagestionalojamiento;
insert into convocatoriagestionalojamiento values (5,'AK 119 t No. 71-39','Usme',1213485.3333333333,'Residencia Universitaria','N.A',3640456);
insert into convocatoriagestionalojamiento values (6,'KR 71 h No. 87-43','Barrios Unidos',2052035.0,'Habitación','N.A',4104070);
insert into convocatoriagestionalojamiento values (7,'AK 16 i No. 41-39','Usme',292882.0,'Apartamento','N.A',585764);
insert into convocatoriagestionalojamiento values (8,'KR 121 g No. 6-85','Antonio Nariño',526832.6666666666,'Hotel','N.A',1580498);
insert into convocatoriagestionalojamiento values (9,'AK 11 j No. 30-36','Teusaquillo',880453.5,'otro','N.A',3521814);
insert into convocatoriagestionalojamiento values (10,'AK 4 d No. 42-60','Bosa',1954658.5,'Hotel','N.A',3909317);
insert into convocatoriagestionalojamiento values (11,'TV 103 s No. 81-41','Engativá',1621723.0,'Apartaestudio','N.A',3243446);
insert into convocatoriagestionalojamiento values (12,'AC 29 c No. 72-52','Bosa',610463.3333333334,'Habitación','N.A',1831390);
insert into convocatoriagestionalojamiento values (13,'KR 172 m No. 98-27','Chapinero',1016121.0,'Residencia Universitaria','N.A',3048363);
insert into convocatoriagestionalojamiento values (14,'TV 156 k No. 30-17','Fontibón',1948563.0,'Residencia Universitaria','N.A',3897126);
insert into convocatoriagestionalojamiento values (15,'TV 20 q No. 42-58','Ciudad Bolívar',2479522.0,'Vivienda familiar','N.A',4959044);

DELETE FROM convocatoriafomentoemprendimeinto;
INSERT INTO convocatoriafomentoemprendimeinto VALUES 
(17, 961842, 'Empresa1', 'Tema1', 'Descripción del emprendimiento'),
(18, 2248621, 'Empresa2', 'Tema2', 'Descripción del emprendimiento'),
(19, 1036757, 'Empresa3', 'Tema3', 'Descripción del emprendimiento');

DELETE FROM convocatoriagestiontransporte;
INSERT INTO convocatoriagestiontransporte VALUES(20,530147,'Transporte público masivo'),
(21,600147,'Transporte público masivo'),
(22,430147,'Otro');

DELETE FROM estudiante_toma_convocatoria;
insert into estudiante_toma_convocatoria values 
(101010130,9,'2023-02-13'),
(101010116,1,'2023-03-13'),
(101010122,2,'2023-04-13'),
(101010126,14,'2023-05-13'),
(101010124,3,'2023-08-13'),
(101010127,8,'2023-09-13'),
(10101012,8,'2023-10-13'),
(101010114,3,'2023-11-13'),
(10101019,1,'2023-12-13'),
(101010113,1,'2023-07-13'),
(101010127,5,'2023-08-13'),
(10101016,5,'2023-03-13'),
(101010127,15,'2023-04-13'),
(101010124,1,'2023-05-13'),
(10101017,11,'2023-06-13'),
(101010124,12,'2023-08-13'),
(101010129,7,'2023-09-13'),
(101010121,14,'2023-10-13'),
(10101014,7,'2023-11-13'),
(10101012,15,'2023-12-13'),
(101010112, 16,'2023-02-13'),
(101010128, 17,'2023-03-13'),
(10101015, 18,'2023-04-13'),
(101010119, 19,'2023-05-13'),
(101010125, 20,'2023-07-13'),
(10101013, 21,'2023-08-13'),
(101010110, 22,'2023-09-13');

DELETE FROM fallaalimentacion;
insert into fallaalimentacion (estID,fallAlcgaComida,fallAlLugar,fallAlFecha) values
(101010123,'Almuerzo','Comedor central','2023-05-19'),
(10101019,'Desayuno','Ciencias Económicas','2023-02-12'),
(10101019,'Desayuno','Ciencias Económicas','2023-05-12'),
(10101012,'Almuerzo','Matemáticas','2023-02-25'),
(101010112,'Almuerzo','Comedor central','2023-02-26'),
(101010119,'Cena','Ciencias Económicas','2023-05-17'),
(10101017,'Almuerzo','Biología','2023-03-16'),
(10101013,'Desayuno','Ciencias Humanas','2023-03-15'),
(10101013,'Desayuno','Ciencias Humanas','2023-04-15'),
(10101013,'Desayuno','Ciencias Humanas','2023-03-21'),
(101010129,'Almuerzo','otro','2023-06-18'),
(101010123,'Almuerzo','otro','2023-04-9'),
(101010124,'Desayuno','Comedor central','2023-06-26'),
(101010128,'Cena','Biología','2023-03-29'),
(101010128,'Cena','Biología','2023-02-18'),
(101010128,'Cena','Biología','2023-01-29'),
(101010128,'Cena','Biología','2023-04-29'),
(101010128,'Cena','Biología','2023-05-29'),
(10101013,'Desayuno','Matemáticas','2023-06-2'),
(101010120,'Cena','Ciencias Humanas','2023-02-14'),
(101010114,'Almuerzo','Agronomía','2023-06-20'),
(101010111,'Cena','Odontología','2023-02-27'),
(101010114,'Almuerzo','Ciencias Económicas','2023-02-28'),
(101010123,'Desayuno','Hemeroteca','2023-03-19'),
(10101011,'Desayuno','otro','2023-04-23'),
(101010113,'Almuerzo','Odontología','2023-03-18'),
(101010123,'Almuerzo','Ciencias Humanas','2023-06-17');

DELETE FROM actividadcorresp;
insert into actividadcorresp values 
(0,101010118,'comunitaria',3,'2023-02-01'),
(1,101010127,'cultural',8,'2023-03-01'),
(2,10101019,'acompañamiento',6,'2023-04-01'),
(3,101010124,'académica',6,'2023-05-01'),
(4,101010123,'académica',5,'2023-06-01'),
(5,101010123,'cultural',3,'2023-07-01'),
(6,10101015,'académica',2,'2023-08-01'),
(7,10101017,'acompañamiento',5,'2023-09-01'),
(8,101010126,'otra',7,'2023-10-01'),
(9,10101015,'otra',3,'2023-11-01'),
(10,10101015,'comunitaria',2,'2023-02-01'),
(11,101010130,'desarrollo institucional',8,'2023-03-01'),
(12,101010117,'otra',3,'2023-04-01'),
(13,10101012,'desarrollo institucional',3,'2023-05-01'),
(14,101010130,'académica',6,'2023-06-01'),
(15,101010113,'comunitaria',3,'2023-07-01'),
(16,101010126,'deportiva',2,'2023-08-01'),
(17,101010125,'comunitaria',4,'2023-09-01'),
(18,10101011,'acompañamiento',3,'2023-10-01'),
(19,101010124,'acompañamiento',7,'2023-11-01');

delete from corresponsabilidad;
INSERT INTO corresponsabilidad VALUES
(10101012, 10),
(10101014, 12),
(10101015, 15),
(10101016, 18),
(10101018, 20),
(10101019, 23),
(101010112, 26),
(101010114, 28),
(101010116, 30),
(101010117, 33),
(101010121, 36),
(101010122, 38),
(101010125, 11),
(101010127, 14),
(101010129, 17);

DELETE FROM tiendabienestar;
insert into tiendabienestar values (1,'Bogotá','Ciudad Universitaria','08:00:00','17:00:00',1,2);
insert into tiendabienestar values (2,'Bogotá','Feria del libro','10:00:00','19:00:00',3,4);

DELETE FROM factura;
insert into factura values
(1,'2023-05-18','13:00:00','N.A',1,101010129),
(2,'2023-04-15','13:00:00','N.A',1,10101013),
(3,'2023-05-11','15:00:00','N.A',2,101010111),
(4,'2023-05-3','16:00:00','N.A',1,101010129),
(5,'2023-03-21','18:00:00','N.A',1,10101019),
(6,'2023-01-6','18:00:00','N.A',1,10101012),
(7,'2023-06-1','10:00:00','N.A',1,10101015),
(8,'2023-02-27','11:00:00','N.A',1,10101013),
(9,'2023-04-10','10:00:00','N.A',2,10101016),
(10,'2023-02-2','18:00:00','N.A',2,101010110),
(11,'2023-02-21','10:00:00','N.A',2,101010114),
(12,'2023-03-23','11:00:00','N.A',2,101010115),
(13,'2023-02-13','17:00:00','N.A',2,101010127),
(14,'2023-04-29','13:00:00','N.A',2,101010110),
(15,'2023-05-21','17:00:00','N.A',1,10101017);

DELETE FROM producto;
insert into producto values (1,83000.0,'Producto1');
insert into producto values (2,88000.0,'Producto2');
insert into producto values (3,93000.0,'Producto3');
insert into producto values (4,98000.0,'Producto4');
insert into producto values (5,103000.0,'Producto5');
insert into producto values (6,108000.0,'Producto6');
insert into producto values (7,113000.0,'Producto7');
insert into producto values (8,118000.0,'Producto8');
insert into producto values (9,123000.0,'Producto9');
insert into producto values (10,128000.0,'Producto10');
insert into producto values (11,133000.0,'Producto11');
insert into producto values (12,138000.0,'Producto12');
insert into producto values (13,143000.0,'Producto13');
insert into producto values (14,148000.0,'Producto14');
insert into producto values (15,153000.0,'Producto15');

DELETE FROM factura_producto;
insert into factura_producto values (4,13);
insert into factura_producto values (8,1);
insert into factura_producto values (3,12);
insert into factura_producto values (9,7);
insert into factura_producto values (7,11);
insert into factura_producto values (15,9);
insert into factura_producto values (7,6);
insert into factura_producto values (10,8);
insert into factura_producto values (4,5);
insert into factura_producto values (3,5);
insert into factura_producto values (6,2);
insert into factura_producto values (13,7);
insert into factura_producto values (4,14);
insert into factura_producto values (3,10);
insert into factura_producto values (6,11);
insert into factura_producto values (6,7);
insert into factura_producto values (13,10);
insert into factura_producto values (15,10);
insert into factura_producto values (2,8);
insert into factura_producto values (1,7);

delete from producto_tiendaun;
INSERT INTO producto_tiendaun VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(1, 15);
INSERT INTO producto_tiendaun VALUES (1, 11);

#------------------------------------------------------------------
# Salud
#------------------------------------------------------------------
DELETE FROM incapacidad;
INSERT INTO incapacidad (perID, incFecha, incEnfermedad, incDias, incVerificado, incAprobado) VALUES
(101010165, '2022-03-23', 'psicologica', 10, 1, 1),
(101010140, '2022-08-07', 'psicologica', 29, 1, 1),
(1010101138, '2020-06-19', 'covid', 17, 1, 1),
(101010120, '2022-01-12', 'lesion', 14, 1, 1),
(101010196, '2021-10-31', 'covid', 21, 1, 1),
(1010101194, '2021-08-10', 'gastrointestinal', 20, 1, 1),
(101010133, '2021-05-25', 'cirugia', 30, 1, 1),
(1010101159, '2022-02-07', 'covid', 9, 1, 1),
(1010101153, '2020-08-08', 'lesion', 26, 1, 1),
(101010175, '2020-12-06', 'psicologica', 4, 0, 1),
(101010165, '2022-06-25', 'psicologica', 1, 1, 1),
(1010101171, '2020-02-04', 'covid', 14, 1, 1),
(1010101188, '2020-10-10', 'psicologica', 2, 1, 1),
(1010101119, '2020-04-12', 'psicologica', 16, 1, 1),
(1010101163, '2021-03-04', 'psicologica', 23, 1, 1),
(101010137, '2021-01-07', 'lesion', 26, 1, 1),
(101010198, '2020-06-30', 'psicologica', 2, 1, 1),
(101010119, '2020-03-10', 'lesion', 6, 1, 1),
(1010101164, '2021-01-23', 'lesion', 17, 1, 1),
(1010101132, '2021-09-13', 'gastrointestinal', 21, 0, 1),
(101010160, '2021-10-19', 'covid', 16, 1, 1),
(1010101130, '2020-04-28', 'psicologica', 25, 0, 1),
(101010170, '2021-05-05', 'psicologica', 26, 1, 1),
(1010101146, '2022-04-16', 'cirugia', 28, 1, 1),
(1010101191, '2021-12-15', 'covid', 19, 1, 1),
(1010101156, '2021-05-06', 'psicologica', 25, 0, 1),
(101010140, '2022-08-17', 'covid', 24, 1, 1),
(101010180, '2022-01-02', 'covid', 28, 1, 1),
(101010172, '2021-02-20', 'lesion', 16, 1, 1),
(1010101105, '2020-05-23', 'covid', 22, 1, 1),
(1010101148, '2020-05-25', 'covid', 9, 1, 1),
(1010101128, '2021-07-02', 'psicologica', 5, 1, 1),
(1010101199, '2020-07-14', 'lesion', 2, 1, 1),
(101010135, '2022-02-09', 'covid', 9, 1, 1),
(1010101123, '2020-12-26', 'psicologica', 30, 1, 1),
(1010101133, '2023-01-03', 'gastrointestinal', 10, 1, 1),
(1010101166, '2021-05-30', 'lesion', 23, 1, 1),
(1010101145, '2020-02-28', 'covid', 28, 1, 1),
(1010101150, '2022-09-25', 'lesion', 4, 1, 1),
(101010163, '2022-03-19', 'covid', 17, 1, 1),
(1010101186, '2022-06-09', 'covid', 9, 1, 1),
(101010140, '2021-11-19', 'cirugia', 9, 1, 1),
(1010101186, '2021-11-04', 'lesion', 20, 1, 1),
(101010159, '2022-06-16', 'covid', 3, 1, 1),
(101010147, '2020-03-20', 'cirugia', 5, 1, 1),
(1010101117, '2020-11-03', 'covid', 12, 1, 1),
(101010143, '2022-02-28', 'lesion', 12, 1, 1),
(1010101158, '2022-04-01', 'covid', 19, 1, 1),
(1010101172, '2021-06-20', 'cirugia', 12, 1, 1),
(1010101180, '2020-04-05', 'lesion', 19, 1, 1),
(101010135, '2020-03-22', 'lesion', 9, 1, 1),
(1010101185, '2022-12-15', 'covid', 21, 1, 1),
(101010139, '2023-01-19', 'covid', 23, 1, 1),
(1010101144, '2021-03-13', 'covid', 3, 1, 1),
(1010101192, '2022-11-21', 'covid', 13, 1, 1),
(1010101128, '2021-10-21', 'cirugia', 1, 1, 1),
(101010172, '2021-09-15', 'psicologica', 26, 1, 1),
(101010140, '2021-11-28', 'covid', 24, 1, 1),
(1010101147, '2021-04-23', 'lesion', 24, 1, 1),
(101010134, '2023-01-15', 'covid', 30, 1, 1),
(101010163, '2020-10-01', 'psicologica', 22, 1, 1),
(101010116, '2021-03-18', 'lesion', 17, 1, 1),
(101010180, '2022-03-05', 'cirugia', 28, 1, 1),
(10101015, '2021-01-21', 'covid', 26, 1, 1),
(101010132, '2020-08-02', 'covid', 27, 1, 1),
(10101016, '2021-05-17', 'covid', 15, 1, 1),
(101010111, '2022-10-19', 'covid', 6, 1, 1),
(1010101174, '2022-07-07', 'covid', 29, 1, 1),
(1010101147, '2021-11-09', 'lesion', 11, 1, 1),
(1010101180, '2020-02-17', 'lesion', 15, 1, 1),
(101010143, '2020-09-10', 'lesion', 20, 1, 1),
(101010181, '2022-04-25', 'lesion', 11, 1, 1),
(101010141, '2022-12-14', 'psicologica', 6, 1, 1),
(101010151, '2021-06-04', 'covid', 23, 1, 1),
(101010118, '2020-07-06', 'covid', 30, 1, 1),
(1010101114, '2022-06-15', 'covid', 25, 1, 1),
(1010101158, '2020-09-13', 'psicologica', 27, 1, 1),
(101010152, '2021-02-05', 'covid', 11, 1, 1),
(1010101155, '2020-02-04', 'covid', 5, 1, 1),
(101010115, '2022-01-14', 'psicologica', 5, 1, 1),
(101010118, '2021-10-10', 'psicologica', 12, 1, 1),
(1010101107, '2022-09-28', 'cirugia', 24, 1, 1),
(101010137, '2021-01-12', 'cirugia', 21, 1, 1),
(1010101186, '2022-09-23', 'psicologica', 3, 1, 1),
(101010139, '2020-12-21', 'covid', 29, 1, 1),
(1010101160, '2022-04-11', 'psicologica', 1, 1, 1),
(1010101139, '2022-12-24', 'covid', 7, 1, 1),
(1010101131, '2020-04-05', 'gastrointestinal', 29, 1, 1),
(101010125, '2021-05-07', 'lesion', 13, 1, 1),
(101010183, '2020-12-31', 'lesion', 15, 1, 1),
(1010101192, '2021-11-06', 'psicologica', 30, 1, 1),
(1010101147, '2022-03-22', 'covid', 18, 1, 1),
(1010101116, '2022-07-03', 'covid', 29, 1, 1),
(1010101128, '2022-08-27', 'psicologica', 22, 1, 1),
(101010174, '2022-05-28', 'gastrointestinal', 6, 1, 1),
(1010101183, '2022-08-20', 'gastrointestinal', 27, 1, 1),
(101010143, '2021-01-05', 'covid', 22, 1, 1),
(101010199, '2020-11-13', 'psicologica', 1, 1, 1),
(101010197, '2022-11-03', 'psicologica', 8, 1, 1),
(101010111, '2021-09-30', 'covid', 17, 1, 1);

DELETE FROM ambulancia;
INSERT INTO ambulancia VALUES 
	('ABC123'), ('DEF456'), ('HIJ789');

DELETE FROM personalsalud;
INSERT INTO personalsalud (perID, salProfesion, salEspecializacion, ambulanciaID) VALUES
(101010110, 'Enfermeria', 'Ninguna', 'ABC123'),
(101010120, 'Enfermeria', 'Jefe', 'HIJ789'),
(101010130, 'Medico', 'General', 'ABC123'),
(101010140, 'Medico', 'Odontologia', 'HIJ789'),
(101010150, 'Medico', 'Psicologia', 'HIJ789'),
(101010160, 'Medico', 'Optometra', 'ABC123'),
(101010170, 'Medico', 'Cardiologo', 'DEF456');

DELETE FROM enfermedad;
INSERT INTO enfermedad (perID, enfNombre, enfFechaInicio) VALUES
(10101017, 'obesidad', '2005-05-17'),
(10101018, 'obesidad', '2015-08-04'),
(10101019, 'tunel_carpo', '2011-09-01'),
(101010113, 'tunel_carpo', '2004-06-16'),
(101010117, 'obesidad', '2003-10-03'),
(101010118, 'asma', '1999-10-13'),
(101010120, 'dolor_lumbar', '2005-08-26'),
(101010122, 'obesidad', '2003-07-27'),
(101010124, 'cancer', '2010-09-06'),
(101010125, 'ansiedad', '2004-03-01'),
(101010126, 'obesidad', '2013-02-07'),
(101010127, 'hipertension', '2003-04-25'),
(101010131, 'ansiedad', '1999-05-02'),
(101010132, 'depresion', '2013-06-13'),
(101010133, 'tunel_carpo', '2014-03-16'),
(101010135, 'ansiedad', '2010-04-02'),
(101010142, 'dolor_lumbar', '2014-09-06'),
(101010143, 'asma', '2002-02-16'),
(101010146, 'hipertension', '2004-07-02'),
(101010149, 'asma', '1999-12-03'),
(101010150, 'diabetes', '2005-04-27'),
(101010153, 'cancer', '2013-12-18'),
(101010157, 'depresion', '2012-05-15'),
(101010158, 'depresion', '2003-09-10'),
(101010168, 'ansiedad', '2004-04-23'),
(101010170, 'diabetes', '2000-05-18'),
(101010173, 'dolor_lumbar', '2014-09-05'),
(101010174, 'depresion', '2010-09-27'),
(101010175, 'asma', '2002-08-09'),
(101010176, 'asma', '2013-08-22'),
(101010177, 'asma', '2009-06-17'),
(101010178, 'tunel_carpo', '2008-06-19'),
(101010179, 'dolor_lumbar', '2000-02-03'),
(101010180, 'cancer', '2009-12-19'),
(101010183, 'depresion', '2001-02-27'),
(101010185, 'migraña', '2009-04-24'),
(101010188, 'depresion', '2012-12-27'),
(101010191, 'depresion', '2002-12-20'),
(101010192, 'ansiedad', '2008-04-29'),
(101010194, 'dolor_lumbar', '2007-01-23'),
(101010199, 'migraña', '2000-12-13'),
(1010101100, 'depresion', '2005-12-17'),
(1010101101, 'asma', '2013-08-29'),
(1010101102, 'cancer', '2004-10-03'),
(1010101103, 'obesidad', '2003-06-26'),
(1010101104, 'ansiedad', '2007-07-02'),
(1010101105, 'hipertension', '2007-10-19'),
(1010101110, 'cancer', '2005-09-09'),
(1010101111, 'ansiedad', '2005-04-24'),
(1010101112, 'ansiedad', '2010-08-04'),
(1010101113, 'hipertension', '2009-01-08'),
(1010101114, 'cancer', '2005-09-20'),
(1010101115, 'depresion', '2008-09-11'),
(1010101120, 'obesidad', '2007-04-16'),
(1010101121, 'migraña', '2001-04-07'),
(1010101124, 'diabetes', '2003-07-03'),
(1010101125, 'obesidad', '2000-03-28'),
(1010101127, 'obesidad', '2011-08-11'),
(1010101128, 'hipertension', '2012-01-12'),
(1010101129, 'tunel_carpo', '2000-11-05'),
(1010101130, 'dolor_lumbar', '2002-11-12'),
(1010101131, 'depresion', '2009-12-20'),
(1010101133, 'diabetes', '2010-11-20'),
(1010101135, 'tunel_carpo', '2008-06-19'),
(1010101136, 'obesidad', '2009-11-29'),
(1010101138, 'asma', '2007-12-02'),
(1010101139, 'hipertension', '2002-06-06'),
(1010101140, 'dolor_lumbar', '2008-10-18'),
(1010101143, 'cancer', '2001-05-03'),
(1010101144, 'cancer', '2013-12-16'),
(1010101150, 'ansiedad', '2000-02-29'),
(1010101152, 'cancer', '2014-07-16'),
(1010101155, 'tunel_carpo', '2015-02-13'),
(1010101156, 'depresion', '2009-06-15'),
(1010101158, 'asma', '2002-11-25'),
(1010101159, 'cancer', '2015-05-31'),
(1010101160, 'migraña', '2006-07-18'),
(1010101161, 'dolor_lumbar', '2005-09-03'),
(1010101163, 'depresion', '2010-01-10'),
(1010101164, 'diabetes', '2001-07-03'),
(1010101165, 'asma', '2012-08-18'),
(1010101171, 'diabetes', '2005-02-13'),
(1010101172, 'tunel_carpo', '2004-03-21'),
(1010101177, 'ansiedad', '2015-02-22'),
(1010101178, 'diabetes', '2002-08-04'),
(1010101179, 'depresion', '2015-05-22'),
(1010101181, 'migraña', '2008-09-02'),
(1010101182, 'asma', '2008-11-11'),
(1010101184, 'hipertension', '1999-04-18'),
(1010101186, 'hipertension', '2002-08-09'),
(1010101188, 'hipertension', '2013-01-09'),
(1010101190, 'hipertension', '2013-02-08'),
(1010101194, 'depresion', '2007-11-04'),
(1010101198, 'asma', '2008-10-14');

DELETE FROM discapacidad;
INSERT INTO discapacidad (perID, disNombre, disVerificado, disAprobado) VALUES
	(101010110, 'cegera', 1, 1),
	(101010112, 'autismo', 0, 1),
	(101010114, 'autismo', 1, 1),
	(101010123, 'cegera', 1, 1),
	(101010125, 'autismo', 0, 1),
	(101010125, 'sordera', 1, 1),
	(101010133, 'sordera', 1, 1),
	(101010135, 'cegera', 1, 1),
	(101010136, 'lesion medular', 1, 1),
	(101010140, 'sordera', 0, 1),
	(101010145, 'autismo', 1, 1),
	(101010151, 'autismo', 1, 1),
	(101010156, 'sordera', 1, 1),
	(101010169, 'sordera', 1, 1),
	(101010191, 'sordera', 0, 1),
	(101010199, 'autismo', 1, 1),
	(1010101101, 'sordera', 1, 1),
	(1010101107, 'cegera', 0, 1),
	(1010101110, 'sordera', 1, 1),
	(1010101113, 'cegera', 0, 1),
	(1010101120, 'autismo', 1, 1),
	(1010101121, 'lesion medular', 1, 1),
	(1010101122, 'sordera', 1, 1),
	(1010101123, 'cegera', 1, 1),
	(1010101130, 'cegera', 0, 1),
	(1010101135, 'sordera', 0, 1),
	(1010101138, 'sordera', 0, 1),
	(1010101145, 'sordera', 1, 1),
	(1010101146, 'autismo', 0, 1),
	(1010101148, 'autismo', 0, 1),
	(1010101154, 'autismo', 1, 1),
	(1010101164, 'autismo', 1, 1),
	(1010101168, 'autismo', 1, 1),
	(1010101169, 'cegera', 0, 1),
	(1010101176, 'autismo', 1, 1),
	(1010101178, 'sordera', 1, 1),
	(1010101192, 'autismo', 0, 1),
	(1010101200, 'cegera', 0, 1);

DELETE FROM citamedica;
INSERT INTO citamedica (citID, doctorID, pacienteID, citFecha, citEspecialidad, citDiagnostico) VALUES
(1, 101010170, 1010101159, '2000-08-15', 'Cardiologo', 'muerte'),
(2, 101010150, 1010101169, '2006-05-29', 'Psicologia', 'sano'),
(3, 101010150, 101010158, '2006-06-01', 'Psicologia', 'sano'),
(4, 101010130, 101010130, '2006-02-21', 'General', 'salvacion'),
(5, 101010140, 1010101172, '2011-03-26', 'Odontologia', 'salvacion'),
(6, 101010150, 1010101139, '2008-08-21', 'Psicologia', 'sano'),
(7, 101010170, 101010115, '1999-06-03', 'Cardiologo', 'muerte'),
(8, 101010150, 101010137, '2014-03-16', 'Psicologia', 'mejorando'),
(9, 101010160, 101010156, '2014-05-05', 'Optometra', 'mejorando'),
(10, 101010170, 101010123, '1999-07-06', 'Cardiologo', 'mejorando'),
(11, 101010130, 1010101173, '2006-02-27', 'General', 'muerte'),
(12, 101010150, 101010139, '2014-06-24', 'Psicologia', 'empeorando'),
(13, 101010160, 1010101162, '2000-02-26', 'Optometra', 'muerte'),
(14, 101010140, 1010101126, '2002-01-01', 'Odontologia', 'sano'),
(15, 101010150, 1010101174, '2005-02-06', 'Psicologia', 'empeorando'),
(16, 101010140, 1010101171, '2013-09-05', 'Odontologia', 'enfermo'),
(17, 101010130, 101010130, '2013-10-07', 'General', 'mejorando'),
(18, 101010160, 1010101155, '2002-01-19', 'Optometra', 'muerte'),
(19, 101010160, 1010101118, '2003-06-09', 'Optometra', 'muerte'),
(20, 101010160, 101010119, '2009-01-30', 'Optometra', 'salvacion'),
(21, 101010170, 101010143, '2011-12-23', 'Cardiologo', 'sano'),
(22, 101010140, 101010173, '2000-04-24', 'Odontologia', 'mejorando'),
(23, 101010130, 10101017, '2010-11-01', 'General', 'mejorando'),
(24, 101010150, 1010101157, '2005-09-22', 'Psicologia', 'muerte'),
(25, 101010130, 101010142, '2000-08-30', 'General', 'sano'),
(26, 101010150, 1010101178, '2013-12-01', 'Psicologia', 'mejorando'),
(27, 101010170, 1010101123, '2011-02-06', 'Cardiologo', 'mejorando'),
(28, 101010170, 1010101133, '2015-02-14', 'Cardiologo', 'enfermo'),
(29, 101010130, 101010155, '2007-02-04', 'General', 'mejorando'),
(30, 101010140, 101010169, '2004-03-16', 'Odontologia', 'muerte'),
(31, 101010140, 1010101134, '2006-08-30', 'Odontologia', 'sano'),
(32, 101010160, 101010142, '2014-01-08', 'Optometra', 'sano'),
(33, 101010160, 101010159, '2006-01-18', 'Optometra', 'salvacion'),
(34, 101010130, 1010101129, '2007-02-12', 'General', 'mejorando'),
(35, 101010130, 101010131, '2009-02-15', 'General', 'enfermo'),
(36, 101010160, 1010101146, '2010-07-31', 'Optometra', 'mejorando'),
(37, 101010150, 101010124, '2014-03-25', 'Psicologia', 'empeorando'),
(38, 101010160, 101010167, '2002-09-27', 'Optometra', 'muerte'),
(39, 101010160, 1010101137, '2015-12-04', 'Optometra', 'empeorando'),
(40, 101010140, 1010101173, '2002-07-01', 'Odontologia', 'empeorando'),
(41, 101010170, 1010101140, '2008-09-01', 'Cardiologo', 'mejorando'),
(42, 101010150, 101010169, '2015-07-08', 'Psicologia', 'sano'),
(43, 101010160, 10101019, '2007-02-23', 'Optometra', 'empeorando'),
(44, 101010170, 101010149, '2003-08-22', 'Cardiologo', 'muerte'),
(45, 101010140, 10101019, '2009-10-17', 'Odontologia', 'sano'),
(46, 101010130, 1010101117, '2008-06-14', 'General', 'enfermo'),
(47, 101010150, 1010101108, '2015-05-28', 'Psicologia', 'muerte'),
(48, 101010170, 101010187, '2011-08-06', 'Cardiologo', 'empeorando'),
(49, 101010130, 101010141, '2013-12-15', 'General', 'muerte'),
(50, 101010170, 101010133, '2013-06-25', 'Cardiologo', 'enfermo'),
(51, 101010170, 1010101170, '2013-05-02', 'Cardiologo', 'muerte'),
(52, 101010170, 101010126, '2006-07-02', 'Cardiologo', 'sano'),
(53, 101010130, 1010101154, '2001-02-13', 'General', 'enfermo'),
(54, 101010170, 1010101120, '2015-01-19', 'Cardiologo', 'sano'),
(55, 101010130, 101010123, '2001-04-02', 'General', 'enfermo'),
(56, 101010130, 101010130, '2004-07-12', 'General', 'empeorando'),
(57, 101010150, 101010140, '2000-11-14', 'Psicologia', 'enfermo'),
(58, 101010130, 10101018, '2002-07-26', 'General', 'mejorando'),
(59, 101010150, 1010101176, '2004-01-31', 'Psicologia', 'salvacion'),
(60, 101010140, 1010101124, '2007-11-27', 'Odontologia', 'salvacion'),
(61, 101010160, 1010101133, '2012-05-14', 'Optometra', 'muerte'),
(62, 101010130, 101010193, '2009-02-27', 'General', 'mejorando'),
(63, 101010170, 1010101149, '2003-08-01', 'Cardiologo', 'muerte'),
(64, 101010140, 101010190, '2005-12-02', 'Odontologia', 'empeorando'),
(65, 101010170, 101010170, '2015-06-10', 'Cardiologo', 'sano'),
(66, 101010130, 101010161, '2006-06-19', 'General', 'salvacion'),
(67, 101010160, 1010101179, '2000-02-13', 'Optometra', 'sano'),
(68, 101010140, 101010155, '2010-11-01', 'Odontologia', 'mejorando'),
(69, 101010150, 1010101172, '2007-11-29', 'Psicologia', 'sano'),
(70, 101010170, 10101013, '1999-08-26', 'Cardiologo', 'muerte'),
(71, 101010170, 101010154, '2014-12-07', 'Cardiologo', 'sano'),
(72, 101010170, 1010101192, '2002-05-18', 'Cardiologo', 'muerte'),
(73, 101010170, 10101015, '2003-04-06', 'Cardiologo', 'sano'),
(74, 101010130, 1010101141, '2007-07-09', 'General', 'sano'),
(75, 101010150, 101010137, '2006-11-18', 'Psicologia', 'mejorando'),
(76, 101010130, 101010155, '2006-01-27', 'General', 'sano'),
(77, 101010170, 101010149, '2010-02-22', 'Cardiologo', 'mejorando'),
(78, 101010140, 1010101144, '2006-06-28', 'Odontologia', 'sano'),
(79, 101010160, 101010120, '2006-07-28', 'Optometra', 'enfermo'),
(80, 101010130, 1010101120, '2004-03-04', 'General', 'sano'),
(81, 101010160, 101010121, '2012-10-15', 'Optometra', 'enfermo'),
(82, 101010150, 1010101111, '1999-12-30', 'Psicologia', 'enfermo'),
(83, 101010130, 101010131, '2015-03-03', 'General', 'mejorando'),
(84, 101010150, 101010172, '2011-12-08', 'Psicologia', 'salvacion'),
(85, 101010150, 1010101181, '2008-06-23', 'Psicologia', 'muerte'),
(86, 101010130, 1010101170, '2006-07-11', 'General', 'empeorando'),
(87, 101010130, 1010101126, '2000-01-07', 'General', 'empeorando'),
(88, 101010170, 1010101121, '2001-08-10', 'Cardiologo', 'mejorando'),
(89, 101010140, 101010192, '2008-08-25', 'Odontologia', 'mejorando'),
(90, 101010170, 1010101160, '2008-03-02', 'Cardiologo', 'salvacion'),
(91, 101010170, 1010101108, '2013-04-10', 'Cardiologo', 'empeorando'),
(92, 101010150, 101010119, '2000-01-08', 'Psicologia', 'muerte'),
(93, 101010160, 1010101197, '2004-10-02', 'Optometra', 'sano'),
(94, 101010130, 1010101168, '2015-01-08', 'General', 'enfermo'),
(95, 101010130, 101010140, '2009-08-05', 'General', 'sano'),
(96, 101010160, 101010139, '2001-01-16', 'Optometra', 'sano'),
(97, 101010140, 1010101102, '1999-11-04', 'Odontologia', 'mejorando'),
(98, 101010130, 1010101114, '2012-12-26', 'General', 'enfermo'),
(99, 101010130, 1010101134, '2014-02-08', 'General', 'empeorando'),
(100, 101010140, 101010194, '2007-07-16', 'Odontologia', 'salvacion'),
(101, 101010150, 101010144, '2011-08-27', 'Psicologia', 'muerte'),
(102, 101010130, 101010177, '2007-03-09', 'General', 'salvacion'),
(103, 101010150, 1010101170, '2008-01-14', 'Psicologia', 'enfermo'),
(104, 101010140, 1010101173, '1999-10-08', 'Odontologia', 'mejorando'),
(105, 101010160, 101010181, '2001-02-04', 'Optometra', 'muerte'),
(106, 101010170, 101010156, '1999-01-30', 'Cardiologo', 'empeorando'),
(107, 101010170, 101010165, '2014-01-18', 'Cardiologo', 'empeorando'),
(108, 101010160, 1010101142, '2005-01-07', 'Optometra', 'salvacion'),
(109, 101010170, 1010101145, '2000-09-11', 'Cardiologo', 'sano'),
(110, 101010150, 1010101183, '2010-07-09', 'Psicologia', 'mejorando'),
(111, 101010130, 101010157, '2009-06-12', 'General', 'mejorando'),
(112, 101010160, 1010101113, '2010-06-18', 'Optometra', 'muerte'),
(113, 101010140, 1010101124, '2005-04-18', 'Odontologia', 'salvacion'),
(114, 101010160, 101010168, '2009-05-21', 'Optometra', 'enfermo'),
(115, 101010140, 1010101138, '1999-02-22', 'Odontologia', 'empeorando'),
(116, 101010150, 101010190, '2004-09-12', 'Psicologia', 'mejorando'),
(117, 101010170, 1010101166, '2015-03-18', 'Cardiologo', 'sano'),
(118, 101010170, 101010144, '2005-04-11', 'Cardiologo', 'salvacion'),
(119, 101010140, 1010101131, '2007-05-30', 'Odontologia', 'salvacion'),
(120, 101010130, 101010148, '2012-08-19', 'General', 'enfermo'),
(121, 101010130, 101010123, '2001-02-06', 'General', 'sano'),
(122, 101010160, 1010101127, '2008-03-15', 'Optometra', 'salvacion'),
(123, 101010150, 10101012, '2006-09-21', 'Psicologia', 'salvacion'),
(124, 101010150, 101010110, '2005-05-27', 'Psicologia', 'salvacion'),
(125, 101010160, 1010101174, '2006-07-08', 'Optometra', 'salvacion'),
(126, 101010160, 1010101112, '2010-01-08', 'Optometra', 'muerte'),
(127, 101010170, 1010101181, '2000-05-19', 'Cardiologo', 'muerte'),
(128, 101010130, 1010101131, '2003-05-05', 'General', 'sano'),
(129, 101010140, 1010101132, '2015-05-18', 'Odontologia', 'enfermo'),
(130, 101010160, 101010117, '2008-11-17', 'Optometra', 'empeorando'),
(131, 101010170, 1010101107, '2009-10-11', 'Cardiologo', 'mejorando'),
(132, 101010150, 1010101103, '2010-11-21', 'Psicologia', 'empeorando'),
(133, 101010150, 1010101183, '2001-10-13', 'Psicologia', 'mejorando'),
(134, 101010140, 101010176, '2010-03-13', 'Odontologia', 'mejorando'),
(135, 101010160, 1010101150, '2007-08-18', 'Optometra', 'sano'),
(136, 101010150, 1010101178, '2003-08-14', 'Psicologia', 'sano'),
(137, 101010140, 1010101155, '2015-09-06', 'Odontologia', 'empeorando'),
(138, 101010170, 101010115, '2004-03-10', 'Cardiologo', 'sano'),
(139, 101010150, 1010101192, '2011-10-02', 'Psicologia', 'muerte'),
(140, 101010170, 101010159, '2003-01-16', 'Cardiologo', 'enfermo'),
(141, 101010170, 101010114, '2014-10-28', 'Cardiologo', 'mejorando'),
(142, 101010170, 101010135, '2006-10-10', 'Cardiologo', 'enfermo'),
(143, 101010140, 101010145, '2011-12-15', 'Odontologia', 'empeorando'),
(144, 101010150, 1010101115, '2011-12-15', 'Psicologia', 'sano'),
(145, 101010150, 1010101138, '2013-05-31', 'Psicologia', 'mejorando'),
(146, 101010170, 101010195, '2001-02-05', 'Cardiologo', 'salvacion'),
(147, 101010160, 1010101139, '2011-11-02', 'Optometra', 'muerte'),
(148, 101010130, 101010160, '2008-01-17', 'General', 'enfermo'),
(149, 101010170, 101010145, '2015-01-25', 'Cardiologo', 'mejorando'),
(150, 101010150, 1010101191, '2005-06-19', 'Psicologia', 'sano'),
(151, 101010160, 1010101167, '2008-09-04', 'Optometra', 'muerte'),
(152, 101010130, 101010178, '2009-02-15', 'General', 'muerte'),
(153, 101010170, 1010101141, '2010-10-13', 'Cardiologo', 'salvacion'),
(154, 101010150, 101010151, '2006-09-27', 'Psicologia', 'sano'),
(155, 101010150, 1010101135, '2001-11-22', 'Psicologia', 'mejorando'),
(156, 101010150, 101010194, '2005-06-06', 'Psicologia', 'muerte'),
(157, 101010150, 101010189, '2002-02-23', 'Psicologia', 'salvacion'),
(158, 101010140, 1010101112, '2014-09-20', 'Odontologia', 'sano'),
(159, 101010160, 1010101110, '2009-08-29', 'Optometra', 'mejorando'),
(160, 101010130, 1010101179, '2010-07-15', 'General', 'sano'),
(161, 101010150, 1010101200, '2004-03-06', 'Psicologia', 'salvacion'),
(162, 101010150, 101010151, '2001-08-24', 'Psicologia', 'salvacion'),
(163, 101010160, 1010101142, '2004-09-10', 'Optometra', 'salvacion'),
(164, 101010170, 101010112, '2009-10-16', 'Cardiologo', 'salvacion'),
(165, 101010150, 1010101111, '2005-12-02', 'Psicologia', 'mejorando'),
(166, 101010130, 101010174, '2007-08-06', 'General', 'enfermo'),
(167, 101010140, 1010101191, '2014-01-12', 'Odontologia', 'empeorando'),
(168, 101010140, 101010147, '2012-12-18', 'Odontologia', 'muerte'),
(169, 101010170, 101010166, '2007-12-12', 'Cardiologo', 'sano'),
(170, 101010160, 101010135, '2004-09-04', 'Optometra', 'sano'),
(171, 101010150, 10101015, '2012-02-11', 'Psicologia', 'empeorando'),
(172, 101010130, 1010101131, '1999-12-06', 'General', 'enfermo'),
(173, 101010130, 101010180, '2013-04-13', 'General', 'mejorando'),
(174, 101010160, 101010135, '2007-12-27', 'Optometra', 'sano'),
(175, 101010170, 1010101118, '2012-06-11', 'Cardiologo', 'empeorando'),
(176, 101010160, 101010125, '2000-05-29', 'Optometra', 'muerte'),
(177, 101010170, 1010101194, '2012-07-20', 'Cardiologo', 'sano'),
(178, 101010160, 101010134, '2001-08-24', 'Optometra', 'muerte'),
(179, 101010160, 1010101102, '2007-04-13', 'Optometra', 'enfermo'),
(180, 101010140, 101010153, '2015-07-09', 'Odontologia', 'enfermo'),
(181, 101010150, 1010101145, '2011-01-01', 'Psicologia', 'sano'),
(182, 101010140, 101010117, '2013-05-24', 'Odontologia', 'empeorando'),
(183, 101010130, 101010137, '2004-04-01', 'General', 'empeorando'),
(184, 101010170, 101010127, '2000-09-27', 'Cardiologo', 'sano'),
(185, 101010170, 1010101166, '2014-07-03', 'Cardiologo', 'sano'),
(186, 101010160, 1010101141, '2003-11-17', 'Optometra', 'muerte'),
(187, 101010140, 101010117, '2009-06-09', 'Odontologia', 'sano'),
(188, 101010130, 101010117, '2004-12-05', 'General', 'salvacion'),
(189, 101010140, 1010101131, '2003-08-16', 'Odontologia', 'muerte'),
(190, 101010130, 101010118, '2008-08-25', 'General', 'sano'),
(191, 101010140, 1010101174, '2008-05-11', 'Odontologia', 'sano'),
(192, 101010170, 1010101162, '2010-12-04', 'Cardiologo', 'sano'),
(193, 101010150, 1010101138, '2013-04-17', 'Psicologia', 'enfermo'),
(194, 101010140, 101010131, '2000-06-18', 'Odontologia', 'enfermo'),
(195, 101010130, 1010101132, '2002-11-29', 'General', 'muerte'),
(196, 101010160, 1010101122, '2011-04-26', 'Optometra', 'sano'),
(197, 101010150, 101010183, '2005-03-21', 'Psicologia', 'muerte'),
(198, 101010130, 1010101106, '1999-06-17', 'General', 'empeorando'),
(199, 101010150, 101010176, '2000-02-29', 'Psicologia', 'enfermo'),
(200, 101010160, 101010112, '2012-11-10', 'Optometra', 'salvacion');

INSERT INTO citamedica (pacienteID, doctorID, citFecha, citEspecialidad) VALUES
	(1010101100, 101010130, '2023-05-28 11:10:10', 'General'),
    (101010158, 101010130, '2024-10-29 11:10:30', 'General'),
    (101010132, 101010130, '2024-09-29 00:11:00', 'General');

INSERT INTO citamedica (doctorID, citFecha, citEspecialidad) VALUES
	(101010160, '2024-11-10 00:10:00' , 'Optometra'),
    (101010150, '2024-02-29 00:10:00', 'Psicologia'),
    (101010130, '2024-06-17 00:10:00', 'General'),
    (101010130, '2022-11-29 00:10:00', 'General');

DELETE FROM atencionensalud;
INSERT INTO atencionensalud (perID, ateFecha, ateTipo, ateVerificado, ateAprobado) VALUES
	(10101019, '2022-10-20 12:10:00', 'General', 1, 1),
    (10101019, '2021-09-19 08:30:00', 'Odotologia', 0, 0),
	(101010113, '2020-06-18 09:45:00','Cargiologia', 0, 0),
	(101010116, '2022-06-17 10:10:00', 'Fisiatria', 1, 0),
	(101010117, '2023-07-16 12:10:00', 'Fisioterapia', 0, 0),
	(101010118, '2023-08-15 07:30:00', 'Optometria', 0, 0);

DELETE FROM medicamentos;
INSERT INTO medicamentos (citID, medNombre, medCantidad, medIntervalos) VALUES 
	(9, 'Noxpirin', 30, '8'),
    (9, 'acetaminofen', 15, '10'),
	(13, 'omeprazol', 23, '2'),
	(16, 'omeprazol', 13, '2'),
	(17, 'acetaminofen', 45, '6'),
	(18, 'Vick Vaporub', 26, '6'),
	(40, 'ibuprofeno', 42, '8'),
	(47, 'ibuprofeno', 27, '5'),
	(59, 'Noxpirin', 46, '7'),
	(65, 'acetaminofen', 9, '5'),
	(66, 'omeprazol', 39, '2'),
	(70, 'Noxpirin', 2, '1'),
	(78, 'Noxpirin', 2, '3'),
	(94, 'Vick Vaporub', 18, '1'),
	(106, 'acetaminofen', 48, '1'),
	(126, 'acetaminofen', 18, '4'),
	(130, 'Noxpirin', 6, '3'),
	(138, 'omeprazol', 19, '3'),
	(139, 'Vick Vaporub', 18, '4'),
	(148, 'ibuprofeno', 39, '7'),
	(150, 'omeprazol', 10, '8'),
	(151, 'acetaminofen', 9, '4'),
	(164, 'acetaminofen', 35, '7'),
	(193, 'Mieltertos', 44, '4'),
	(199, 'Vick Vaporub', 47, '3');

DELETE FROM ordenmedica;
INSERT INTO ordenmedica (citID, ordExamen) VALUES 
	(1, 'endoscopia'),
	(7, 'laboratorio'),
	(11, 'tomografia'),
	(16, 'biopsia'),
	(17, 'endoscopia'),
	(18, 'laboratorio'),
	(20, 'biopsia'),
	(31, 'biopsia'),
	(33, 'biopsia'),
	(38, 'tomografia'),
	(40, 'biopsia'),
	(43, 'laboratorio'),
	(46, 'endoscopia'),
	(47, 'biopsia'),
	(49, 'ecografia'),
	(56, 'rayos_x'),
	(65, 'ecografia'),
	(67, 'tomografia'),
	(71, 'tomografia'),
	(75, 'laboratorio'),
	(79, 'ecografia'),
	(87, 'tomografia'),
	(92, 'tomografia'),
	(101, 'endoscopia'),
	(102, 'rayos_x'),
	(109, 'tomografia'),
	(111, 'ecografia'),
	(136, 'tomografia'),
	(146, 'tomografia'),
	(148, 'rayos_x'),
	(149, 'laboratorio'),
	(150, 'biopsia'),
	(157, 'ecografia'),
	(159, 'laboratorio'),
	(166, 'laboratorio'),
	(171, 'biopsia'),
	(172, 'ecografia'),
	(177, 'rayos_x'),
	(193, 'ecografia'),
	(197, 'endoscopia'),
	(198, 'endoscopia'),
	(199, 'biopsia');
    
DELETE FROM evaluacionfisica;
INSERT INTO evaluacionfisica (citID, evaPeso, evaEstatura, evaRitmoCardiaco, evaVision) VALUES 
	(0, 37, 123, 45, 0.46),
	(1, 59, 1.7, 91, 1.41),
	(2, 66, 1.5, 52, 0.17),
	(3, 65, 1.7, 84, 0.56),
	(4, 119, 1.9, 126, 0.96),
	(5, 85, 2.0, 96, 1.03),
	(6, 47, 1.5, 40, 0.43),
	(7, 79, 1.6, 117, 1.10),
	(8, 20, 1.8, 100, 0.33),
	(9, 60, 1.8, 64, 0.78),
	(10, 50, 2.2, 51, 1.47),
	(11, 90, 1.8, 74, 1.22),
	(12, 116, 1.6, 85, 0.44),
	(13, 97, 1.8, 125, 0.21),
	(14, 22, 1.9, 60, 0.45),
	(15, 41, 1.8, 102, 1.15),
	(16, 104, 2.0, 56, 1.14),
	(17, 96, 1.8, 51, 0.68),
	(18, 23, 1.8, 116, 0.37),
	(19, 30, 2.0, 106, 0.76),
	(20, 59, 1.8, 103, 1.43),
	(21, 101, 1.7, 43, 0.31),
	(22, 36, 1.5, 124, 0.37),
	(23, 60, 2.1, 118, 1.30),
	(24, 111, 1.5, 117, 0.26),
	(25, 64, 1.6, 103, 0.64),
	(26, 75, 2.0, 74, 1.45),
	(27, 64, 2.1, 45, 1.20),
	(28, 99, 1.7, 106, 0.43),
	(29, 101, 2.1, 110, 0.51),
	(30, 32, 1.6, 93, 0.68),
	(31, 50, 1.6, 91, 0.70),
	(32, 63, 1.6, 55, 0.60),
	(33, 106, 1.6, 103, 1.20),
	(34, 97, 1.6, 73, 1.22),
	(35, 60, 1.5, 111, 0.23),
	(36, 64, 1.7, 75, 1.08),
	(37, 112, 2.0, 111, 1.25),
	(38, 46, 1.8, 90, 1.30),
	(39, 78, 1.5, 122, 1.18),
	(40, 74, 2.1, 66, 0.66),
	(41, 24, 1.9, 45, 0.15),
	(42, 114, 1.7, 68, 0.64),
	(43, 93, 2.0, 126, 0.15),
	(44, 71, 1.8, 68, 0.31),
	(45, 94, 1.8, 84, 0.35),
	(46, 74, 2.0, 79, 1.46),
	(47, 77, 1.8, 107, 0.27),
	(48, 21, 1.7, 75, 1.16),
	(49, 89, 2.2, 103, 0.64),
	(50, 38, 1.9, 83, 0.16),
	(51, 97, 2.0, 45, 0.73),
	(52, 27, 1.9, 84, 0.91),
	(53, 70, 1.6, 91, 1.23),
	(54, 71, 1.9, 106, 1.23),
	(55, 70, 2.0, 71, 1.35),
	(56, 53, 1.9, 43, 1.27),
	(57, 50, 2.0, 44, 0.56),
	(58, 96, 2.0, 103, 0.38),
	(59, 108, 2.0, 54, 0.18),
	(60, 55, 1.9, 121, 0.70),
	(61, 42, 1.9, 49, 0.53),
	(62, 115, 2.1, 104, 0.23),
	(63, 45, 1.5, 116, 0.31),
	(64, 63, 1.7, 106, 0.64),
	(65, 110, 1.7, 96, 0.78),
	(66, 49, 1.8, 102, 0.17),
	(67, 55, 1.6, 122, 0.34),
	(68, 97, 2.0, 91, 0.16),
	(69, 65, 1.7, 127, 0.98),
	(70, 53, 1.8, 57, 0.57),
	(71, 76, 1.5, 122, 1.33),
	(72, 119, 2.0, 108, 0.83),
	(73, 98, 2.0, 125, 0.98),
	(74, 82, 1.6, 79, 0.21),
	(75, 61, 1.5, 92, 0.38),
	(76, 31, 1.7, 56, 0.27),
	(77, 34, 1.8, 109, 0.48),
	(78, 116, 2.1, 100, 1.26),
	(79, 97, 2.0, 119, 0.73),
	(80, 116, 2.0, 90, 0.61),
	(81, 95, 1.8, 55, 0.33),
	(82, 58, 2.0, 42, 1.06),
	(83, 33, 1.9, 118, 1.24),
	(84, 32, 1.6, 65, 0.52),
	(85, 60, 1.7, 116, 1.35),
	(86, 75, 1.7, 111, 1.11),
	(87, 30, 1.7, 74, 0.46),
	(88, 89, 2.2, 57, 1.08),
	(89, 104, 2.0, 91, 0.78),
	(90, 88, 2.0, 124, 0.69),
	(91, 81, 1.8, 115, 0.71),
	(92, 27, 1.8, 47, 0.20),
	(93, 67, 1.9, 52, 1.36),
	(94, 87, 1.9, 84, 0.22),
	(95, 31, 1.8, 40, 1.41),
	(96, 88, 1.5, 77, 0.40),
	(97, 44, 1.5, 63, 0.76),
	(98, 90, 2.2, 114, 0.68),
	(99, 33, 1.9, 121, 0.59),
	(100, 41, 1.9, 46, 1.16),
	(101, 116, 1.8, 105, 0.20),
	(102, 117, 2.1, 52, 1.41),
	(103, 40, 1.6, 105, 0.43),
	(104, 112, 1.8, 122, 0.60),
	(105, 20, 2.0, 79, 0.34),
	(106, 63, 1.8, 116, 0.73),
	(107, 36, 2.2, 101, 0.24),
	(108, 111, 2.0, 71, 0.40),
	(109, 84, 1.7, 110, 1.27),
	(110, 28, 1.6, 56, 0.89),
	(111, 21, 2.1, 60, 0.60),
	(112, 113, 1.5, 46, 1.32),
	(113, 105, 1.8, 44, 0.86),
	(114, 111, 1.7, 87, 1.33),
	(115, 32, 2.1, 78, 0.76),
	(116, 82, 2.1, 51, 0.86),
	(117, 92, 1.8, 119, 1.28),
	(118, 52, 1.5, 119, 1.17),
	(119, 28, 2.0, 69, 0.33),
	(120, 77, 1.6, 80, 1.22),
	(121, 87, 2.1, 110, 0.72),
	(122, 116, 1.9, 123, 0.45),
	(123, 25, 1.7, 49, 0.79),
	(124, 47, 1.6, 127, 0.30),
	(125, 49, 2.1, 49, 1.06),
	(126, 96, 2.1, 84, 1.06),
	(127, 38, 1.7, 112, 0.55),
	(128, 85, 1.8, 61, 0.21),
	(129, 29, 1.7, 55, 0.34),
	(130, 111, 1.6, 64, 1.29),
	(131, 118, 2.1, 76, 0.40),
	(132, 48, 1.9, 71, 0.97),
	(133, 120, 1.5, 117, 1.12),
	(134, 20, 1.6, 81, 1.31),
	(135, 31, 1.8, 85, 0.43),
	(136, 105, 1.6, 114, 1.46),
	(137, 83, 2.1, 121, 1.21),
	(138, 68, 1.6, 127, 0.60),
	(139, 37, 1.6, 122, 0.91),
	(140, 84, 1.6, 113, 1.00),
	(141, 54, 1.9, 101, 1.17),
	(142, 76, 1.6, 92, 1.33),
	(143, 72, 2.1, 67, 1.49),
	(144, 88, 1.6, 103, 1.10),
	(145, 56, 2.0, 83, 1.23),
	(146, 54, 2.1, 117, 0.89),
	(147, 84, 2.0, 95, 0.83),
	(148, 20, 2.1, 91, 0.92),
	(149, 66, 2.1, 76, 0.35),
	(150, 106, 1.9, 89, 0.70),
	(151, 55, 1.9, 120, 1.43),
	(152, 114, 1.9, 49, 0.25),
	(153, 75, 2.0, 44, 1.14),
	(154, 114, 2.1, 50, 1.46),
	(155, 58, 1.5, 41, 0.80),
	(156, 46, 2.0, 59, 0.97),
	(157, 113, 1.8, 50, 0.40),
	(158, 50, 2.0, 65, 0.95),
	(159, 46, 2.1, 85, 1.09),
	(160, 53, 2.0, 86, 1.10),
	(161, 20, 2.0, 49, 1.15),
	(162, 110, 2.0, 71, 0.68),
	(163, 60, 1.8, 78, 0.52),
	(164, 116, 1.9, 91, 0.75),
	(165, 51, 1.9, 115, 1.40),
	(166, 106, 1.7, 48, 1.07),
	(167, 120, 2.1, 73, 0.30),
	(168, 106, 2.1, 97, 0.87),
	(169, 34, 2.0, 47, 0.35),
	(170, 21, 2.0, 91, 0.61),
	(171, 78, 1.7, 53, 0.36),
	(172, 58, 1.8, 111, 0.66),
	(173, 22, 1.9, 43, 0.40),
	(174, 57, 1.7, 48, 0.23),
	(175, 107, 2.1, 98, 1.18),
	(176, 74, 2.0, 97, 0.78),
	(177, 118, 1.7, 59, 1.38),
	(178, 63, 1.7, 102, 0.78),
	(179, 65, 2.0, 61, 0.75),
	(180, 83, 2.1, 53, 0.71),
	(181, 44, 1.9, 105, 1.23),
	(182, 20, 1.8, 54, 0.16),
	(183, 44, 1.6, 57, 1.33),
	(184, 83, 2.1, 66, 0.95),
	(185, 76, 2.0, 99, 0.78),
	(186, 82, 1.9, 55, 0.50),
	(187, 108, 1.6, 103, 0.32),
	(188, 78, 1.6, 62, 0.33),
	(189, 43, 1.9, 49, 1.27),
	(190, 32, 2.1, 84, 1.14),
	(191, 89, 1.5, 121, 1.47),
	(192, 92, 2.0, 61, 1.01),
	(193, 42, 1.9, 84, 0.73),
	(194, 75, 1.6, 62, 1.24),
	(195, 23, 1.9, 118, 0.87),
	(196, 38, 1.8, 78, 0.94),
	(197, 79, 1.9, 102, 0.45),
	(198, 74, 2.1, 118, 0.91),
	(199, 65, 1.9, 98, 1.06),
	(200, 117, 2.2, 67, 0.60);

DELETE FROM perfilriesgointegral;
INSERT INTO perfilriesgointegral VALUES 
	(101010110, '2020-10-06', 8, 5),
    (101010112, '2021-11-04', 2, 2),
    (101010115, '2022-12-08', 10, 9);

#------------------------------------------------------------------
# Cultura
#------------------------------------------------------------------

DELETE FROM cursocultural;
insert into Bienestar.cursocultural values
(1, "Salsa y merengue", "Propiciar un acercamiento a la danza - salsa a través del aprendizaje de una amplia variedad de estilos,
ritmos y pasos de los subgéneros de la salsa y el merengue. Identificar y diferenciar los pasos para cada uno de los
ritmos salseros como pachanga, mambo, boogaloo, son y chachachá, entre otros; y brindar herramientas de
expresión corporal y de intercambio social.", "Lunes y miércoles de 2:00 a 4:00 p.m", "Estadio Alfonso López. Salón de Danzas", 25,30, "Expresión corporal y dancística", 1, 2),
(2, "Salsa y merengue", "Propiciar un acercamiento a la danza - salsa a través del aprendizaje de una amplia variedad de estilos,
ritmos y pasos de los subgéneros de la salsa y el merengue. Identificar y diferenciar los pasos para cada uno de los
ritmos salseros como pachanga, mambo, boogaloo, son y chachachá, entre otros; y brindar herramientas de
expresión corporal y de intercambio social.", "Martes y jueves de 4:00 a 6:00 p.m", "Estadio Alfonso López. Salón de Danzas", 25,30, "Expresión corporal y dancística", 2, 2),
(3, "Danza contemporánea", "Permitir un acercamiento al lenguaje de la danza contemporánea a través de herramientas técnicas y de
improvisación provenientes de diversas aproximaciones a la danza contemporánea y a técnicas somáticas. Se
desarrollará mediante una actividad física rigurosa que permita experimentar la fluidez y entender la conexión
entre las diferentes artes del cuerpo, la conexión con el espacio y la relación con el tiempo.", "Lunes y Miércoles de 4:00 a 6:00 p.m", 
"Estadio Alfonso López. Salón de los Espejos (lunes) y Auditorio Colegio IPARM (Miércoles)",25,30,"Expresión corporal y dancística",null, 2),
(4,"Danza Árabe", "Explorar y experimentar con los movimientos y técnicas de la danza árabe y conocer un poco del
contexto en el cual ésta surge y se desarrolla. El taller mejora la relación con el cuerpo a nivel físico y emocional,
ayuda a tomar conciencia sobre la postura e incrementa el estado físico.", "Lunes y Miércoles de 12:00 m. a 2:00 p.m", "Estadio Alfonso López. Salón de los Espejos",25,30, "Expresión corporal y dancística", 1, 2),
(5, "Danza Africana", "Se propone como un espacio para conocer las danzas tradicionales africanas y su relación con las
múltiples y diversas diásporas del continente africano. En el taller es fundamental estudiar la relación danzamúsica, (clave para una buena interpretación) conectar con el ritmo y tener un acercamiento a la tradición que
cobija esta expresión. Por las características del taller la danza aquí se constituye como una herramienta de
trabajo personal.", "Martes y Jueves de 5:00 a 7:00 p.m.","Jardín Infantil Salón Caminadores",25,30,"Expresión corparal y dancística", null, 2),
(6, "Tango", "El tango-danza permite explorar e indagar en una escucha profunda, en una conciencia rítmica y musical
y en el conocimiento detallado del propio cuerpo y del cuerpo del compañero/a. Dado que el tango se afinca en un
contexto específico, resulta necesario adentrarse en su cultura y tradición. El abrazo, la conexión de los cuerpos, la
búsqueda de la alineación, la postura corporal, la escucha musical y la fuerza expresiva del tango son algunos de
los aspectos que se trabajarán durante el taller.", "Lunes y Martes de 5:00 a 7:00 p.m", "Edificio Archivo histórico (500 B) - Sala capacitaciones",25,30, "Expresión corporal y dancística",1,2),
(7, "Música de gaitas y tambores", "El taller busca un acercamiento a los ritmos tradicionales de la Costa Caribe y de las Sabanas de Bolívar a
través de la interpretación musical de instrumentos tradicionales como son las gaitas, maracas, guache y percusión
(Tambora, alegre y llamador), y el estudio de algunos ritmos como son: cumbia, gaita corrida, puya, bullerengue,
fandango, mapalé y chandé, entre otros", "Lunes y Miércoles de 4:00 a 6:00 p.m","Estadio Alfonso López - Exterior Salón 4",10,15, "Música", null, 2),
(8, "Guitarra popular", "Desarrollar habilidades básicas para la interpretación y el acompañamiento de melodías populares, por
medio de la guitarra y la voz, con técnicas de ejecución, apreciación musical, ensamble y proyección.",
 "Martes y Jueves de 12:00 m. a 2:00 p.m","Edificio Cine y Televisión, salón 108",12,15, "Música", null, 2),
(9, "Técnica vocal", "Propiciar un primer encuentro de los estudiantes con su voz y ayudarles en el reconocimiento de las
características de su voz cantada a través de técnicas de postura corporal, respiración, vocalización, entonación y
afinación para el canto individual y grupal.", "Martes y Jueves de 4:30 a 6: 30 p.m","Colegio IPARM Salón 30", 25,30, "Música",1,2),
(10, "Técnica vocal", "Profundizar en el reconocimiento del aparato fonador y en la conciencia técnica de la voz cantada.
También se explora las relaciones del canto grupal y la escucha colectiva. En este nivel se realiza un trabajo técnico
más detallado de la postura corporal, la respiración, vocalización y entonación.", "Martes y Jueves de 6:30 a 8:30 p.m","Colegio IPARM Salón 30", 25,30, "Música",2,2),
(11, "Formación actoral", "Introducir al conocimiento del trabajo del actor, sus herramientas, sus medios expresivos y los
rudimentos técnicos de la actuación, mediante la auto observación, el acondicionamiento psico-físico y algunos
juegos de improvisación.", "lunes de 4 a 6 p.m. y jueves de 4:30 a 6:30 p.m","Auditorio Colegio IPARM (lunes) y salón 18 del Colegio IPARM (jueves)",20,25,"Artes escénicas", 1,2);

/*
insert into Bienestar.cursocultural values
(1, "Curso Cultural", "Salsa y merengue", "Propiciar un acercamiento a la danza - salsa a través del aprendizaje de una amplia variedad de estilos,
ritmos y pasos de los subgéneros de la salsa y el merengue. Identificar y diferenciar los pasos para cada uno de los
ritmos salseros como pachanga, mambo, boogaloo, son y chachachá, entre otros; y brindar herramientas de
expresión corporal y de intercambio social.", "Lunes y miércoles de 2:00 a 4:00 p.m", "Estadio Alfonso López. Salón de Danzas", 25,30, "Expresión corporal y dancística", 1, 2),
(2, "Curso Cultural", "Salsa y merengue", "Propiciar un acercamiento a la danza - salsa a través del aprendizaje de una amplia variedad de estilos,
ritmos y pasos de los subgéneros de la salsa y el merengue. Identificar y diferenciar los pasos para cada uno de los
ritmos salseros como pachanga, mambo, boogaloo, son y chachachá, entre otros; y brindar herramientas de
expresión corporal y de intercambio social.", "Martes y jueves de 4:00 a 6:00 p.m", "Estadio Alfonso López. Salón de Danzas", 25,30, "Expresión corporal y dancística", 2, 2),
(3, "Curso Cultural", "Danza contemporánea", "Permitir un acercamiento al lenguaje de la danza contemporánea a través de herramientas técnicas y de
improvisación provenientes de diversas aproximaciones a la danza contemporánea y a técnicas somáticas. Se
desarrollará mediante una actividad física rigurosa que permita experimentar la fluidez y entender la conexión
entre las diferentes artes del cuerpo, la conexión con el espacio y la relación con el tiempo.", "Lunes y Miércoles de 4:00 a 6:00 p.m", 
"Estadio Alfonso López. Salón de los Espejos (lunes) y Auditorio Colegio IPARM (Miércoles)",25,30,"Expresión corporal y dancística",null, 2),
(4,"Curso Cultural","Danza Árabe", "Explorar y experimentar con los movimientos y técnicas de la danza árabe y conocer un poco del
contexto en el cual ésta surge y se desarrolla. El taller mejora la relación con el cuerpo a nivel físico y emocional,
ayuda a tomar conciencia sobre la postura e incrementa el estado físico.", "Lunes y Miércoles de 12:00 m. a 2:00 p.m", "Estadio Alfonso López. Salón de los Espejos",25,30, "Expresión corporal y dancística", 1, 2),
(5, "Curso Cultural","Danza Africana", "Se propone como un espacio para conocer las danzas tradicionales africanas y su relación con las
múltiples y diversas diásporas del continente africano. En el taller es fundamental estudiar la relación danzamúsica, (clave para una buena interpretación) conectar con el ritmo y tener un acercamiento a la tradición que
cobija esta expresión. Por las características del taller la danza aquí se constituye como una herramienta de
trabajo personal.", "Martes y Jueves de 5:00 a 7:00 p.m.","Jardín Infantil Salón Caminadores",25,30,"Expresión corparal y dancística", null, 2),
(6, "Curso Cultural","Tango", "El tango-danza permite explorar e indagar en una escucha profunda, en una conciencia rítmica y musical
y en el conocimiento detallado del propio cuerpo y del cuerpo del compañero/a. Dado que el tango se afinca en un
contexto específico, resulta necesario adentrarse en su cultura y tradición. El abrazo, la conexión de los cuerpos, la
búsqueda de la alineación, la postura corporal, la escucha musical y la fuerza expresiva del tango son algunos de
los aspectos que se trabajarán durante el taller.", "Lunes y Martes de 5:00 a 7:00 p.m", "Edificio Archivo histórico (500 B) - Sala capacitaciones",25,30, "Expresión corporal y dancística",1,2),
(7, "Curso Cultural", "Música de gaitas y tambores", "El taller busca un acercamiento a los ritmos tradicionales de la Costa Caribe y de las Sabanas de Bolívar a
través de la interpretación musical de instrumentos tradicionales como son las gaitas, maracas, guache y percusión
(Tambora, alegre y llamador), y el estudio de algunos ritmos como son: cumbia, gaita corrida, puya, bullerengue,
fandango, mapalé y chandé, entre otros", "Lunes y Miércoles de 4:00 a 6:00 p.m","Estadio Alfonso López - Exterior Salón 4",10,15, "Música", null, 2),
(8, "Curso Cultural", "Guitarra popular", "Desarrollar habilidades básicas para la interpretación y el acompañamiento de melodías populares, por
medio de la guitarra y la voz, con técnicas de ejecución, apreciación musical, ensamble y proyección.",
 "Martes y Jueves de 12:00 m. a 2:00 p.m","Edificio Cine y Televisión, salón 108",12,15, "Música", null, 2),
(9, "Curso Cultural", "Técnica vocal", "Propiciar un primer encuentro de los estudiantes con su voz y ayudarles en el reconocimiento de las
características de su voz cantada a través de técnicas de postura corporal, respiración, vocalización, entonación y
afinación para el canto individual y grupal.", "Martes y Jueves de 4:30 a 6: 30 p.m","Colegio IPARM Salón 30", 25,30, "Música",1,2),
(10, "Curso Cultural", "Técnica vocal", "Profundizar en el reconocimiento del aparato fonador y en la conciencia técnica de la voz cantada.
También se explora las relaciones del canto grupal y la escucha colectiva. En este nivel se realiza un trabajo técnico
más detallado de la postura corporal, la respiración, vocalización y entonación.", "Martes y Jueves de 6:30 a 8:30 p.m","Colegio IPARM Salón 30", 25,30, "Música",2,2),
(11, "Curso Cultural", "Formación actoral", "Introducir al conocimiento del trabajo del actor, sus herramientas, sus medios expresivos y los
rudimentos técnicos de la actuación, mediante la auto observación, el acondicionamiento psico-físico y algunos
juegos de improvisación.", "lunes de 4 a 6 p.m. y jueves de 4:30 a 6:30 p.m","Auditorio Colegio IPARM (lunes) y salón 18 del Colegio IPARM (jueves)",20,25,"Artes escénicas", 1,2);
*/

DELETE FROM grupoartisticoinstitucional;
insert into Bienestar.grupoartisticoinstitucional values
(1, "Mínimo 5 m fondo por 12 m de ancho","Teatro Experimental","Creación Experimental
y Contemporánea","Mauricio Córdoba", "Amplificación para reproducir pistas, consola de sonido y micrófonos inalámbricos y/o de solapa, consola
de luces pares y otras (condiciones ideales, según la
obra por presentar). Idealmente, piso de madera con
cámara de aire","Expresión Talentos","Se enfoca en la formación de los estudiantes desde las artes escénicas. Trabaja con un repertorio del teatro universal y nacional.
 El grupo prepara piezas teatrales que, por su contenido dramático, promuevan en los espectadores la reflexión crítica sobre aspectos claves de determinada coyuntura.
 Los procesos de montaje se asumen como un taller permanente de formación integral de actores, con conocimientos técnicos básicos sobre escenografía, iluminación, vestuario y maquillaje.",4),
 (2,"Mínimo 5 m fondo por 8 m de ancho", "Danza Contemporánea", "Creación Experimental
y Contemporánea","Astergio Pinto","Amplificación para reproducir pistas. Idealmente, piso
en madera con cámara de aire y/o linóleo.","Expresión Talentos","Trabajo de exploración corporal que recurre a un conjunto de técnicas del movimiento, muy cercanas a las tendencias, estilos y dinámicas de las artes escénicas. La expresividad del cuerpo es un recurso que se explota,
 hasta un nivel protagónico, así como la música que acompaña el movimiento",4),
(3,"Mínimo 10 m fondo por 12 m de ancho","Danzas Folclóricas","Tradiciones y Culturas de Colombia","José David Ramírez","Amplificación para reproducir pistas. Idealmente, piso
en madera con cámara de aire y/o linóleo","Expresión Talentos","Trabajo de investigación, rescate y difusión de las manifestaciones folklóricas de distintas regiones colombianas. A través de un lenguaje moderno, valiéndose de recursos teatrales y de las artes escénicas, busca ser una expresión auténtica de la nación, y ofrece un trabajo profundamente enraizado en los valores del pueblo, en la rica tradición popular.
 En su repertorio involucra danzas y juegos coreográficos.",4);
 
 
-- CARLOS:
-- Insercion area de deportes:
INSERT INTO Bienestar.area 
	(areID, areNombre, areTelefono, areCorreoElectronico, areExtension, areEdificio, areDescripcion) values
	(17, "Actividad Fisica & Deporte",  3165000, "divrecd_bog@unal.edu.co", 17207,"No. 103 Polideportivo","Area encargada de la actividad deportiva en la UNAL.");


INSERT INTO Bienestar.programa (progID, progNombre, Area_areID) values (1701, "Actividad ludico deportiva", 17);
INSERT INTO Bienestar.programa (progID, progNombre, Area_areID) values (1702, "Acondicionamiento físico e instruccion", 17);
INSERT INTO Bienestar.programa (progID, progNombre, Area_areID) values (1703, "Deporte de competencia", 17);
INSERT INTO Bienestar.programa (progID, progNombre, Area_areID) values (1704, "Deporte de alto rendimiento", 17);
INSERT INTO Bienestar.programa (progID, progNombre, Area_areID) values (1705, "Proyectos estratégicos", 17);
 
 -- Inserciones torneos internos:

DELETE FROM torneointerno;
INSERT INTO Bienestar.torneointerno 
	(toridTorneoInterno, torPeriodo, torSedeFacultad, torDeporte, torNombreTorneo, torEstado, torModalidad, torRama, torNivel, torFechaInicio, torFechaFinalizacion, Programa_progID) 
	VALUES
    (1011, '2022-1', 'Facultad de Ingeniería', 'Futbol', 'Copa Ingenieria', 1, 'Eliminacion directa', 'Masculino', 'Intermedio', '2022-06-01', '2022-06-30',1701),
	(1012, '2022-2', 'Facultad de Ciencias Humanas', 'Voleibol', 'Torneo de Voleibol Artes y Humanidades', 1, 'Todos contra todos', 'Femenino', 'Basico', '2022-09-01', '2022-09-30', 1701),
	(1013, '2022-1', 'Facultad de Ciencias', 'Baloncesto', 'Torneo de Baloncesto Física', 0, 'Eliminación directa', 'Masculino', 'Avanzado', '2022-07-01', '2022-07-31', 1701),
	(1014, '2023-1', 'Facultad de Salud', 'Futbol Sala', 'Liga de Fútbol Medicina', 1, 'Todos contra todos', 'Masculino', 'Intermedio', '2023-05-01', '2023-05-31', 1701),
	(1015, '2023-2', 'Facultad de Ciencias Económicas', 'Tenis de Mesa', 'Torneo de Tenis de Mesa Economia', 1, 'Eliminación directa', 'Mixto', 'Basico', '2023-10-01', '2023-10-03', 1701);

INSERT INTO Bienestar.torneointerno VALUES 
(1016, '2022-1', 'Facultad de Ciencias', 'Fútbol', 'Torneo de Futbol de la Facultad de Ciencias', 1, 'Eliminación Simple', 'Masculino', 'Principiante', '2022-05-10', '2022-06-15', 1701),
(1017, '2022-1', 'Facultad de Ingenieria', 'Voleibol', 'Torneo de Voleibol de la Facultad de Ingenieria', 1, 'Eliminación Simple', 'Femenino', 'Intermedio', '2022-06-01', '2022-07-10', 1701),
(1018, '2022-2', 'Facultad de Medicina', 'Baloncesto', 'Torneo de Baloncesto de la Facultad de Medicina', 1, 'Liga', 'Masculino', 'Avanzado', '2022-09-01', '2022-11-10', 1701),
(1019, '2022-2', 'Facultad de Ciencias Humanas', 'Ajedrez', 'Torneo de integracion ajedrez', 1, 'Eliminación Simple', 'Mixto', 'Principiante', '2022-10-01', '2022-10-15', 1701),
(10110, '2023-1', 'Facultad de Ciencias', 'Tenis', 'Torneo de Tenis de la Facultad de Derecho', 0, NULL, 'Femenino', 'Intermedio', '2023-03-01', '2023-04-01', 1701);

-- Inserciones convocatorias de area de deportes:

#select * from convocatoria;
-- cursos libres


INSERT INTO Bienestar.convocatoria (conv_id, convNombre, convFechaApertura, convFechaCierre, convEstado, convPeriodo, Programa_progID, convPAPA)
VALUES
(201, 'Convocatoria Deporte 2021-1', '2021-01-01', '2021-01-31', 1, '2021-1', 1702, 3.5),
(202, 'Convocatoria Deporte 2021-2', '2021-06-01', '2021-06-30', 1, '2021-2', 1702, 3.5),
(203, 'Convocatoria Deporte 2022-1', '2022-01-01', '2022-01-31', 1, '2022-1', 1702, 3.7),
(204, 'Convocatoria Deporte 2022-2', '2022-06-01', '2022-06-30', 1, '2022-2', 1702, 3.0),
(205, 'Convocatoria Deporte 2023-1', '2023-01-01', '2023-01-31', 1, '2023-1', 1702, 3.0),
(206, 'Convocatoria Deporte 2023-2', '2023-06-01', '2023-06-30', 1, '2023-2', 1702, 3.9),
(207, 'Convocatoria Deporte 2024-1', '2024-01-01', '2024-01-31', 1, '2024-2', 1702, 3.8),
(208, 'Convocatoria Deporte 2024-2', '2024-06-01', '2024-06-30', 1, '2024-2', 1702, 3.8),
(209, 'Convocatoria Deporte 2025-1', '2025-01-01', '2025-01-31', 1, '2025-1', 1702, 3.1),
(200, 'Convocatoria Deporte 2025-2', '2025-06-01', '2025-06-30', 1, '2025-2', 1702, 3.2);

-- selecciones deportivas
INSERT INTO Bienestar.convocatoria (conv_id, convNombre, convFechaApertura, convFechaCierre, convEstado, convPeriodo, Programa_progID, convPAPA) VALUES 
(210, 'Convocatoria Deporte 2022-2', '2022-07-01', '2022-07-31', 1, '2022-2', 1703, 3.5),
(211, 'Convocatoria Deporte 2023-1', '2023-01-01', '2023-01-31', 1, '2023-1', 1703, 4.2),
(212, 'Convocatoria Deporte 2023-2', '2023-07-01', '2023-07-31', 0, '2023-2', 1703, 4.3),
(213, 'Convocatoria Deporte 2024-1', '2024-01-01', '2024-01-31', 0, '2024-1', 1703, 4.0),
(214, 'Convocatoria Deporte 2024-2', '2024-07-01', '2024-07-31', 0, '2024-2', 1703, 3.9),
(215, 'Convocatoria Deporte 2025-1', '2025-01-01', '2025-01-31', 0, '2025-1', 1703, 3.9),
(216, 'Convocatoria Deporte 2025-2', '2025-07-01', '2025-07-31', 0, '2025-2', 1703, 3.3),
(217, 'Convocatoria Deporte 2026-1', '2026-01-01', '2026-01-31', 0, '2026-1', 1703, 3.3),
(218, 'Convocatoria Deporte 2026-2', '2026-07-01', '2026-07-31', 0, '2026-2', 1703, 4.5),
(219, 'Convocatoria Deporte 2027-1', '2027-01-01', '2027-01-31', 0, '2027-1', 1703, 3.0);


-- Inserciones convocatorias cursos libres:
DELETE FROM convocatoriacursolibre;
INSERT INTO Bienestar.convocatoriacursolibre (Convocatoria_conv_id, curNombre, curTipoCurso, curCondicion)
VALUES
  (201, 'Fútbol', 'Deporte', 'Abierto'),
  (202, 'Tenis', 'Deporte', 'Abierto'),
  (203, 'Natación', 'Deporte', 'Abierto'),
  (204, 'Vóley', 'Deporte', 'Abierto'),
  (205, 'Baloncesto', 'Deporte', 'Abierto'),
  (206, 'Karate', 'Deporte', 'Abierto'),
  (207, 'Pilates', 'Libre', 'Abierto'),
  (208, 'Yoga', 'Libre', 'Abierto'),
  (209, 'Entrenamiento Funcional', 'Libre', 'Abierto'),
  (200, 'Judo', 'Fitness', 'Abierto');


#select * from convocatoria;

-- Inserciones convocatorias selecciones deportivas:
DELETE FROM convocatoriaseleccion;
INSERT INTO Bienestar.convocatoriaseleccion (Convocatoria_conv_id, convDeporte, convLugar, convHora) VALUES 
(210, 'Futbol', 'Estadio', '15:00:00'),
(211,  'Baloncesto', 'Cancha 2', '10:00:00'),
(212,  'Tenis', 'Cancha de tenis 3', '08:00:00'),
(213,  'Voleibol', 'Cancha 1', '14:00:00'),
(214,  'Tenis de mesa', 'Estadio', '16:00:00'),
(215,  'Karate', 'Polideportivo', '07:00:00'),
(216, 'Judo', 'Polideportivo', '18:00:00'),
(217, 'Futbol Sala', 'Cancha 2', '11:00:00'),
(218, 'Ciclismo', 'Anillo vial', '20:00:00'),
(219, 'Atletismo', 'Polideportivo', '09:00:00');


insert into estudiante_toma_convocatoria values (10101019,210,'2023-03-15');
insert into estudiante_toma_convocatoria values (101010113,217,'2023-04-15');

SET FOREIGN_KEY_CHECKS=1;