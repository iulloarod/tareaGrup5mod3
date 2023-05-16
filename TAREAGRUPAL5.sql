CREATE DATABASE IF NOT EXISTS `myData`;
CREATE TABLE `myData`.`USUARIOS`(
id_usuario INT(25) NOT NULL auto_increment,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
contraseña VARCHAR(20) NOT NULL,
zona_horaria VARCHAR(5)  NOT NULL DEFAULT "UTC-3",
género VARCHAR(40) NOT NULL,
teléfono_contacto INT(20) NOT NULL,
PRIMARY KEY (id_usuario)
);

CREATE TABLE `myData`.`REGISTRO`(
id_ingreso INT(25) auto_increment,
id_usuario INT(25),
fechaHora_ingreso DATE NOT NULL DEFAULT '2023-05-05',
PRIMARY KEY(id_ingreso)
);
#MODIFICAR VALOR POR DEFECTO UTC-3 A UTC-2
ALTER TABLE USUARIOS
ALTER COLUMN zona_horaria SET DEFAULT "UTC-2";

#AGREGAR REGISTRO
INSERT INTO USUARIOS(nombre,apellido,contraseña,género,teléfono_contacto)
VALUES
("JOAQUIN","CERRANO","gato123","MASCULINO",6424565),
("JACK","SPARROW","SK-jswi9","MASCULINO",98762617),
("LEO","REYES","CUMBIA4342","MASCULINO",6424565),
("MARIE","CURIE","NOBEL","FEMENINO",32328973),
("FRIDA","KHALO","CEJAS32","FEMENINO",92837832),
("MICHELLE","BACHELET","PASO2013","FEMENINO",92237266),
("ATURO","PRATT","ALABORDAJE","MASCULINO",92237116),
("ARMANDO","MENDOZA","BETTYBELLA","MASCULINO",98672511);

INSERT INTO REGISTRO (id_ingreso, id_usuario)
VALUES
(1000,1),
(1001,2),
(1002,3),
(1003,4),
(1004,5),
(1005,6),
(1006,7),
(1007,8);
#nueva tabla llamada Contactos
CREATE TABLE `myData`.`CONTACTOS`(
id_contactos INT(20) NOT NULL,
id_usuario INT(25) NOT NULL, 
numero_telefono INT(20),
correo_electronico VARCHAR(50),
PRIMARY KEY(id_contactos)
);
INSERT INTO CONTACTOS (id_contactos, id_usuario, numero_telefono, correo_electronico)
VALUES
(100000,1, 6424565, 'a1marlon27@gmail.com'),
(100001,2, 98762617, 'snarvaezk@gmail.com'),
(100002,3, 6424565, 'lvlmasaluz@gmail.com'),
(100003,4, 32328973, 'aguilar.h.mary@gmail.com'),
(100004,5, 92837832, 'pochochina14@hotmail.com'),
(100005,6, 92237266, 'matiassierra@gmail.com'),
(100006,7, 92237116, 'tinkekacs@gmail.com'),
(100007,8, 98672511, 'mariasegovian59@gmail.com');

#crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE contactos ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
