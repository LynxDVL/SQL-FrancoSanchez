CREATE SCHEMA ASERRADERO;

USE ASERRADERO;

/*           CREACION DE TABLAS           */

-- TABLA CON LOS DATOS DE LOS CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTE 
(
ID_CLIENTE INT AUTO_INCREMENT ,
NOMBRE TEXT(50) NOT NULL ,
DNI INT NOT NULL,
PRIMARY KEY (ID_CLIENTE)
)
;

-- TABLA CON TIPOS DE MADERA Y STOCK DE C/U
CREATE TABLE IF NOT EXISTS MADERA
(
ID_MADERA INT AUTO_INCREMENT ,
MADERA TEXT(20) NOT NULL ,
CANTIDAD DECIMAL(8, 2) NOT NULL DEFAULT 0,
PRIMARY KEY (ID_MADERA)
) 
;

-- TABLA CON LAS CARACTERÍSTICAS DE LOS ARTÍCULOS Y CANTIDAD DE MADERA USADA POR C/U
CREATE TABLE IF NOT EXISTS ARTICULO
(
ID_ARTICULO INT AUTO_INCREMENT ,
NOMBRE VARCHAR(50) NOT NULL ,
PRECIO DECIMAL(7, 2) NOT NULL ,
MADERA_USADA DECIMAL(4, 2) ,
ID_MADERA INT ,
PRECIO_ANTERIOR DECIMAL(7, 2), 
PRIMARY KEY (ID_ARTICULO) ,
FOREIGN KEY (ID_MADERA) REFERENCES MADERA (ID_MADERA)
) 
;

-- TABLA CON LOS PEDIDOS HECHOS POR CLIENTES
CREATE TABLE IF NOT EXISTS PEDIDO
(
ID_PEDIDO INT AUTO_INCREMENT ,
CANTIDAD INT NOT NULL DEFAULT 1 ,
FECHA DATE ,
ID_ARTICULO INT ,
ID_CLIENTE INT,
PRIMARY KEY (ID_PEDIDO) ,
FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO (ID_ARTICULO) ,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
) 
;

-- TABLA CON LOS DATOS DE LOS PROVEEDORES
CREATE TABLE IF NOT EXISTS PROVEEDOR
(
ID_PROVEEDOR INT AUTO_INCREMENT ,
NOMBRE VARCHAR(40) NOT NULL ,
EMAIL VARCHAR(40) NOT NULL,
TELEFONO VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_PROVEEDOR)
)
;

-- TABLA DE MADERA SUMINISTRADA POR LOS PROVEEDORES
CREATE TABLE IF NOT EXISTS SUMINISTROS
(
ID_SUMINISTROS INT AUTO_INCREMENT ,
CANTIDAD DECIMAL(7, 2) NOT NULL,
FECHA DATE ,
COSTO DECIMAL(7, 2) NOT NULL ,
ID_PROVEEDOR INT ,
ID_MADERA INT ,
PRIMARY KEY (ID_SUMINISTROS) ,
FOREIGN KEY (ID_MADERA) REFERENCES MADERA (ID_MADERA) ,
FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR (ID_PROVEEDOR)
) 
;


/*            INSERCION DE DATOS             */

-- INSERCION DATOS DE CLIENTES
INSERT INTO CLIENTE (NOMBRE, DNI)
VALUES ("Alejandro", 25868921), ("Diego Thionis", 28785621), ("Leandro Nierenberger", 23589641),
	   ("Carlos Arnaldo", 15385621), ("Ernesto Enrique", 20464441), ("Agustin Lamberti", 42352352), 
       ("Martin Bossio", 33897752), ("Rocio Lappa", 36878741), ("Lucas Daniel", 33694911),
       ("Gaston Fasit", 42042015), ("Jorge Perales", 18777161), ("Pablo Azure", 37879522),
       ("Teofilo Garzon", 30202014), ("Analia Massa", 39978652), ("Roberto Caglia", 9222152),
	   ("Paola Parras", 33898526), ("Flavia Lopez", 24566241), ("Lucia Gutierrez", 44785235);
  
-- INSERCION DATOS DE PROVEEDORES  
INSERT INTO PROVEEDOR (NOMBRE, EMAIL, TELEFONO)
VALUES ("MADERIN SRL", "INFO@MADERINSRL.COM", "1152550399"),
	   ("MADERAS MOITS", "CONTACTO@MADERASMOITS.COM", "1144547189"),
       ("VIRUTERO", "INFO@VIRUTERO.COM", "1196960011"),
       ("PYLMAQUINARIA", "VENTAS@PYLMAQUINARIA.COM", "1188759321"),
       ("AFILADOSECHEVERRE", "AFILADOSECHEVERRE@GMAIL.COM", "1178786325"),
       ("FORESTALOPEZ", "INFO@FORESTALOPEZ.COM", "1109092521");
       
-- INSERCION DATOS DE TIPOS DE MADERA Y STOCK        
INSERT INTO MADERA (MADERA, CANTIDAD)
VALUES ("PINO ELLIOTIS", 10000.25), ("PINO PARANA", 1200.88), ("GUAYABIRA", 0),
       ("EUCALYPTUS GRANDIS", 8650.55), ("ALAMO", 0), ("SALIGNA", 5896.78), 
       ("PARAISO", 3142), ("LAUREL", 0), ("MARMELERO", 0);
 
-- INSERCION DATOS DE ARTICULOS
INSERT INTO ARTICULO (NOMBRE, PRECIO, MADERA_USADA, ID_MADERA)
VALUES ('MACHIMBRE 1" EUCALYPTUS GRANDIS', 2200, 20, 4), ('MACHIMBRE 1" PINO ELLIOTIS', 2200, 20, 1), 
	   ('MACHIMBRE 1" PINO PARANA', 2200, 20, 2), ('MACHIMBRE 1/2" EUCALYPTUS GRANDIS', 1200, 10, 4),
       ('MACHIMBRE 1/2" PINO ELLIOTIS', 1200, 10, 1), ('MACHIMBRE 1/2" PINO PARANA', 1200, 10, 2),
       ('TIRANTE 2" x 6" x 10 Pies PINO ELLIOTIS', 1701, 10, 1), ('TIRANTE 2" x 6" x 13 Pies PINO ELLIOTIS', 2211, 13, 1),
       ('TIRANTE 2" x 6" x 20 Pies PINO ELLIOTIS', 3400, 20, 1), ('TIRANTE 2" x 6" x 10 Pies PINO PARANA', 1801, 10, 2), 
       ('TIRANTE 2" x 6" x 13 Pies PINO PARANA', 2341, 13, 2), ('TIRANTE 2" x 6" x 20 Pies PINO PARANA', 3602, 20, 2),
       ('TIRANTE 2" x 6" x 10 Pies EUCALYPTUS GRANDIS', 1701, 10, 4), ('TIRANTE 2" x 6" x 13 Pies EUCALYPTUS GRANDIS', 2211, 13, 4),
       ('TIRANTE 2" x 6" x 20 Pies EUCALYPTUS GRANDIS', 3400, 20, 4), ('CLAVADOR 2" x 2" x 13 Pies SALIGNA', 563.7, 4.34, 6);
       
-- INSERCION DATOS DE PEDIDOS
INSERT INTO PEDIDO (CANTIDAD, FECHA, ID_ARTICULO, ID_CLIENTE)
VALUES (50, "2022-7-13", 1, 1), (23, "2022-7-15", 1, 2), (53, "2022-7-17", 5, 3),
	   (30, "2022-7-18", 16, 4), (14, "2022-7-13", 15, 5), (18, "2022-7-19", 9, 6),
       (80, "2022-7-20", 2, 8), (150, "2022-7-23", 1, 10), (60, "2022-7-24", 16, 11);      
       
-- INSERCION DATOS DE PEDIDOS
INSERT INTO SUMINISTROS (CANTIDAD, FECHA, COSTO, ID_PROVEEDOR, ID_MADERA)
VALUES (1500, "2022-7-13", 75, 1, 1), (1000, "2022-7-15", 72, 2, 1), (1000, "2022-7-17", 75, 1, 4),
	   (1000, "2022-7-18", 70, 2, 4), (500, "2022-7-13", 150, 6, 6), (400, "2022-7-19", 200, 6, 3);
       
       
/*           VISTAS            */       
       
-- Vista de los artículos ordenados por la Madera utilizada
CREATE OR REPLACE VIEW ASERRADERO.VW_ARTICULO
AS SELECT * FROM ASERRADERO.ARTICULO ORDER BY ID_MADERA;

-- Vista de los clientes que compraron machimbre de 1 pulgada
CREATE OR REPLACE VIEW ASERRADERO.VW_CLIENTES_MACHIMBRE_EUCA
AS SELECT * FROM ASERRADERO.CLIENTE WHERE ID_CLIENTE IN 
(SELECT ID_CLIENTE FROM ASERRADERO.PEDIDO WHERE ID_ARTICULO = 1);

-- Vista de los articulos con compras mayoristas
CREATE OR REPLACE VIEW ASERRADERO.VW_ARTICULOS_MAYORISTAS
AS SELECT * FROM ASERRADERO.ARTICULO WHERE ID_ARTICULO IN
(SELECT ID_ARTICULO FROM ASERRADERO.PEDIDO WHERE CANTIDAD >= 60);

-- Vista de los proveedores que compramos en cantidad 
CREATE OR REPLACE VIEW ASERRADERO.VW_PROVEEDORES_MAYORISTAS
AS SELECT * FROM ASERRADERO.PROVEEDOR WHERE ID_PROVEEDOR IN 
(SELECT ID_PROVEEDOR FROM ASERRADERO.SUMINISTROS WHERE CANTIDAD >= 1000);

-- Vista de las maderas de bajo costo
CREATE OR REPLACE VIEW ASERRADERO.VW_MADERAS_BARATAS
AS SELECT * FROM ASERRADERO.MADERA WHERE ID_MADERA IN 
(SELECT ID_MADERA FROM ASERRADERO.SUMINISTROS WHERE COSTO < 100);


/*           FUNCIONES             */

DROP FUNCTION IF EXISTS FN_SUMA
-- FUNCION INTERNA DE SUMA
delimiter //
CREATE FUNCTION FN_SUMA (P1 INT, P2 INT, P3 INT)
RETURNS INT
DETERMINISTIC
-- LOGICA SQL
BEGIN
SET @RES_SUMA = 0;
SELECT P1+P2+P3 INTO @RES_SUMA;
RETURN @RES_SUMA;
END //
delimiter ;


DROP FUNCTION IF EXISTS FN_PROVEEDORES
-- FUNCION INTERNA DE CONSULTAR TEL PROVEEDORES
delimiter //
CREATE FUNCTION FN_PROVEEDORES (s CHAR(40))
RETURNS CHAR(100)
DETERMINISTIC
-- LOGICA SQL
BEGIN
SET @TELEFONO = CHAR(30);
SET @NOMBRE = CHAR(40);
SELECT TELEFONO INTO @TELEFONO FROM ASERRADERO.PROVEEDOR WHERE NOMBRE LIKE CONCAT('%', s, '%') LIMIT 1;
SELECT NOMBRE INTO @NOMBRE FROM ASERRADERO.PROVEEDOR WHERE NOMBRE LIKE CONCAT('%', s, '%') LIMIT 1;
RETURN CONCAT('NOMBRE: ', @NOMBRE, '| TELEFONO: ', @TELEFONO);
END //
delimiter ;


/*           STORE PROCEDURES            */

-- STORE PROCEDURE que ordena segun campo y orden los Suministros.
DROP PROCEDURE IF EXISTS sp_suministros_ordenados;
delimiter //
-- CREACION Y PARAMETROS
CREATE PROCEDURE sp_suministros_ordenados (INOUT campo varchar(20), INOUT orden varchar(4))
BEGIN 
-- LOGICA SQL
SET @t1 = CONCAT('SELECT * FROM suministros U ORDER BY', ' ',campo,' ',orden);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
END //
delimiter ;


-- STORE PROCEDURE que inserta o elimina registros segun lo pedido
DROP procedure IF EXISTS `sp_registros_pedidos`;
DELIMITER //
-- CREACION Y PARAMETROS
CREATE PROCEDURE sp_registros_pedidos (IN ACCION VARCHAR(10), IN PEDIDO_IN INT, 
IN CANTIDAD_IN INT, IN FECHA_IN DATE, 
IN ARTICULO_IN INT, IN CLIENTE_IN INT)
-- LOGICA SQL
BEGIN
CASE (ACCION)
	-- Insercion de Registros
	WHEN 'INSERT' THEN
	INSERT INTO PEDIDO (ID_PEDIDO, CANTIDAD, FECHA, ID_ARTICULO, ID_CLIENTE)
					VALUES (PEDIDO_IN, CANTIDAD_IN, FECHA_IN, ARTICULO_IN, CLIENTE_IN);
                    SELECT * FROM PEDIDO ORDER BY ID_PEDIDO DESC;
                    
	-- Eliminacion de Registros
	WHEN 'DELETE' THEN
		DELETE FROM PEDIDO WHERE ID_PEDIDO = PEDIDO_IN;
		SET @ESTADO_ELIMINACION = CONCAT('PEDIDO ', PEDIDO_IN, ' ELIMINADO CON ÉXITO');
		SELECT @ESTADO_ELIMINACION;
        
	-- Accion mal introducida
	ELSE SELECT 'ERROR CON LA ACCIÓN';
END CASE;
END //
DELIMITER ;


/*          CREACION DE LOGS Y TRIGGERS           */

-- CREACION DE LAS TABLAS LOG
drop table if exists LOG_PEDIDO;
CREATE TABLE IF NOT EXISTS LOG_PEDIDO
(
ID_LOG INT AUTO_INCREMENT, 
NOMBRE_DE_ACCION VARCHAR(10), 
USUARIO VARCHAR(100), 
FECHA DATE, 
HORA TIME,
PRIMARY KEY (ID_LOG)
);


drop table if exists LOG_ARTICULO;
CREATE TABLE IF NOT EXISTS LOG_ARTICULO
(
ID_LOG INT AUTO_INCREMENT, 
NOMBRE_DE_ACCION VARCHAR(10) , 
USUARIO VARCHAR(100), 
FECHA DATE, 
HORA TIME,
PRIMARY KEY (ID_LOG)
);

-- TRIGGER QUE ASIGNA EL PRECIO ANTERIOR A LA TABLA AUTOMATICAMENTE
DROP TRIGGER IF EXISTS TRG_BEFORE_ARTICULO;
delimiter //
CREATE TRIGGER TRG_BEFORE_ARTICULO before update ON ASERRADERO.ARTICULO
for each row
 begin
 SET NEW.precio_anterior= OLD.PRECIO;
 end //
 delimiter ; 
 
-- TRIGGER QUE AUDITA LA ACCION
DROP TRIGGER IF EXISTS TRG_AFTER_ARTICULO;
delimiter //
CREATE TRIGGER TRG_AFTER_ARTICULO AFTER update ON ASERRADERO.ARTICULO
for each row
 begin
 INSERT INTO LOG_ARTICULO (NOMBRE_DE_ACCION, USUARIO, FECHA, HORA)
 VALUES ("UPDATE", current_user(), current_date(), current_time());
 end //
 delimiter ;  
 
 
 -- TRIGGER QUE ASIGNA LA FECHA DE HOY EN EL INSERT
DROP TRIGGER IF EXISTS TRG_BEFORE_PEDIDO;
delimiter //
CREATE TRIGGER TRG_BEFORE_PEDIDO before INSERT ON ASERRADERO.PEDIDO
for each row
 begin
 SET NEW.FECHA = current_date();
 end //
 delimiter ; 
 
 -- TRIGGER QUE AUDITA LA ACCION
 DROP TRIGGER IF EXISTS TRG_AFTER_PEDIDO;
delimiter //
CREATE TRIGGER TRG_AFTER_PEDIDO AFTER INSERT ON ASERRADERO.PEDIDO
for each row
 begin
 INSERT INTO LOG_PEDIDO (NOMBRE_DE_ACCION, USUARIO, FECHA, HORA)
 VALUES ("INSERT", current_user(), current_date(), current_time());
 end //
 delimiter ;  
              