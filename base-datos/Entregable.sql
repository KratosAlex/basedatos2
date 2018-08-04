--Creación de la tabla Almacen
CREATE TABLE Almacen(Numero_Almacen INTEGER,
Ubicacion_Almacen VARCHAR2(40),
CONSTRAINT PK_Numero_Almacen PRIMARY KEY (Numero_Almacen) );

--Creación de la tabla Cliente
CREATE TABLE Cliente(Numero_Cliente INTEGER,
Numero_Almacen INTEGER, Nombre_Cliente VARCHAR2(50),
CONSTRAINT PK_Numero_Cliente PRIMARY KEY (Numero_Cliente),
CONSTRAINT FK1_Numero_Almacen FOREIGN KEY (Numero_Almacen) REFERENCES Almacen(Numero_Almacen) );

--Creación de la tabla Vendedor
CREATE TABLE Vendedor(Numero_Vendedor INTEGER,
Nombre_Vendedor VARCHAR2(60), Area_Ventas VARCHAR2(40),
CONSTRAINT PK_Numero_Vendedor PRIMARY KEY (Numero_Vendedor) );

--Creación de la tabla Ventas
CREATE TABLE Ventas(ID_Ventas INTEGER,
Numero_Cliente INTEGER, Numero_Vendedor INTEGER,
Monto_Venta FLOAT(126),
CONSTRAINT PK_ID_Ventas PRIMARY KEY (ID_Ventas),
CONSTRAINT FK2_Numero_Cliente FOREIGN KEY (Numero_Cliente) REFERENCES Cliente(Numero_Cliente),
CONSTRAINT FK3_Numero_Vendedor FOREIGN KEY (Numero_Vendedor) REFERENCES Vendedor(Numero_Vendedor) );

--Generamos el procedimiento para guarda almacen
CREATE OR REPLACE PROCEDURE Guardar_Almacen(MY_NM IN INTEGER, MY_UA IN VARCHAR2)
AS
BEGIN
INSERT INTO Almacen VALUES(MY_NM, MY_UA);
END;
/

--Generamos el procedimiento para guardar cliente
CREATE OR REPLACE PROCEDURE Guardar_Cliente(MY_NC IN INTEGER, MY_NA IN INTEGER, MY_C IN VARCHAR2)
AS
BEGIN
INSERT INTO Cliente VALUES(MY_NC, MY_NA, MY_C);
END;
/

--Generamos el procedimiento para guardar vendedor
CREATE OR REPLACE PROCEDURE Guardar_Vendedor(MY_NV IN INTEGER, MY_V IN VARCHAR2, MY_AV IN VARCHAR2)
AS
BEGIN
INSERT INTO Vendedor VALUES(MY_NV, MY_V, MY_AV);
END;
/

--Generamos el procedimiento para guardar Ventas
CREATE OR REPLACE PROCEDURE Guardar_Ventas(MY_IDV IN INTEGER, MY_NC IN INTEGER, MY_NV IN VARCHAR2, MY_MV IN FLOAT)
AS
BEGIN
INSERT INTO Ventas VALUES(MY_IDV, MY_NC, MY_NV, MY_MV);
END;
/

--Generamos el procedimiento para borrar almacen
CREATE OR REPLACE PROCEDURE Borrar_Almacen(MY_NM IN INTEGER)
AS
BEGIN
DELETE FROM Almacen WHERE Numero_Almacen=MY_NM;
END;
/

--Generamos el procedimiento para borrar ventas
CREATE OR REPLACE PROCEDURE Borrar_Ventas(MY_ID IN INTEGER)
AS
BEGIN
DELETE FROM Ventas WHERE ID_Ventas=MY_ID;
END;
/

--Generamos el procedimiento para borrar cliente
CREATE OR REPLACE PROCEDURE Borrar_Cliente(MY_NC IN INTEGER)
AS
BEGIN
DELETE FROM Cliente WHERE Numero_Cliente=MY_NC;
END;
/

--Generamos el procedimiento para borrar vendedor
CREATE OR REPLACE PROCEDURE Borrar_Vendedor(MY_NV IN INTEGER)
AS
BEGIN
DELETE FROM Vendedor WHERE Numero_Vendedor=MY_NV;
END;
/

--Generamos el procedimiento para actualizar almacen
CREATE OR REPLACE PROCEDURE Actualizar_Almacen(MY_NM IN INTEGER, MY_UA IN VARCHAR2)
AS BEGIN
UPDATE Almacen SET Ubicacion_Almacen=MY_UA WHERE Numero_Almacen=MY_NM;
END;
/

--Generamos el procedimiento para actualizar ventas
CREATE OR REPLACE PROCEDURE Actualizar_Ventas(MY_IDV IN INTEGER, MY_NC IN INTEGER, MY_NV IN VARCHAR2, MY_MV IN FLOAT)
AS BEGIN
UPDATE Ventas SET Numero_Cliente=MY_NC, Numero_Vendedor=MY_NV, Monto_Venta=MY_MV WHERE ID_Ventas=MY_IDV;
END;
/

--Generamos el procedimiento para actualizar cliente
CREATE OR REPLACE PROCEDURE Actualizar_Cliente(MY_NC IN INTEGER, MY_NA IN INTEGER, MY_C IN VARCHAR2)
AS BEGIN
UPDATE Cliente SET Numero_Almacen=MY_NA, Nombre_Cliente=MY_C WHERE Numero_Cliente=MY_NC;
END;
/

--Generamos el procedimiento para actualizar vendedor
CREATE OR REPLACE PROCEDURE Actualizar_Vendedor(MY_NV IN INTEGER, MY_V IN VARCHAR2, MY_AV IN VARCHAR2)
AS BEGIN
UPDATE Vendedor SET Nombre_Vendedor=MY_V, Area_Ventas=MY_AV WHERE Numero_Vendedor=MY_NV;
END;
/

--Generamos el procedimiento para buscar todos los almacenes
CREATE OR REPLACE PROCEDURE Buscar_Almacenes(CUR_A OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_A FOR
SELECT * FROM Almacen;
END;
/

--Generamos el procedimiento para buscar todos las ventas
CREATE OR REPLACE PROCEDURE Buscar_Ventas(CUR_VS OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_VS FOR
SELECT * FROM Ventas;
END;
/

--Generamos el procedimiento para buscar todos los clientes
CREATE OR REPLACE PROCEDURE Buscar_Clientes(CUR_C OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_C FOR
SELECT * FROM Cliente;
END;
/

--Generamos el procedimiento para buscar todos los vendedores
CREATE OR REPLACE PROCEDURE Buscar_Vendedores(CUR_VR OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_VR FOR
SELECT * FROM Vendedor;
END;
/

--Generamos el procedimiento para buscar almacenes por PK
CREATE OR REPLACE PROCEDURE Buscar_AlmacenesPK(MY_NA IN INTEGER, CUR_PKA OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_PKA FOR
SELECT * FROM Almacen WHERE Numero_Almacen=MY_NA;
END;
/

--Generamos el procedimiento para buscar Ventas por PK
CREATE OR REPLACE PROCEDURE Buscar_VentasPK(MY_IDV IN INTEGER, CUR_PKVS OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_PKVS FOR
SELECT * FROM Ventas WHERE ID_Ventas=MY_IDV;
END;
/

--Generamos el procedimiento para buscar Clientes por PK
CREATE OR REPLACE PROCEDURE Buscar_ClientesPK(MY_NC IN INTEGER, CUR_PKC OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_PKC FOR
SELECT * FROM Cliente WHERE Numero_Cliente=MY_NC;
END;
/

--Generamos el procedimiento para buscar Ventas por PK
CREATE OR REPLACE PROCEDURE Buscar_VendedorPK(MY_NV IN INTEGER, CUR_PKVR OUT SYS_REFCURSOR)
AS
BEGIN
--Aqui vamos a abrir el cursor
OPEN CUR_PKVR FOR
SELECT * FROM Vendedor WHERE Numero_Vendedor=MY_NV;
END;
/

--Guardar los datos de almacen y cliente con la informacion del excel
BEGIN
Guardar_Almacen(1, 'Plymouth');
Guardar_Almacen(2, 'Superior');
Guardar_Almacen(3, 'Bismarck');
Guardar_Almacen(4, 'Fargo');
END;
/
SELECT * FROM Almacen;

BEGIN
Guardar_Cliente(18765, 4, 'Delta systems');
Guardar_Cliente(18830, 3, 'A. Levy and Sons');
Guardar_Cliente(19242, 3, 'Ranier Company');
Guardar_Cliente(18841, 2, 'R. W. Flood Inc.');
Guardar_Cliente(18899, 2, 'Seward Systems');
Guardar_Cliente(19565, 1, 'Stodolas Inc.');
END;
/
SELECT * FROM Cliente;

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ALMACEN_CLIENTES
AS
CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN;
CURSOR CUR_CLIENTE IS SELECT * FROM CLIENTE;
BEGIN

FOR REC_AL IN CUR_ALMACEN LOOP
  FOR REC_CLI IN CUR_CLIENTE LOOP
   DBMS_OUTPUT.PUT_LINE('AQUI DEBE ESTA TU LOGICA');
  END LOOP;
 END LOOP;
END;
/

