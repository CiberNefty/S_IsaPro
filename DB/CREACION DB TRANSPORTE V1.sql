DROP DATABASE IF EXISTS transporte;
CREATE DATABASE IF NOT EXISTS transporte;
USE transporte;

CREATE TABLE Ayudante (
Id_Ayudante		CHAR(10) NOT NULL PRIMARY KEY,
Cedula 			INT NOT NULL,    
Nombre 			VARCHAR(50),
Apellido 		VARCHAR(50),
Direccion 		VARCHAR(100),
Telefono 		VARCHAR(20)
);

CREATE TABLE Cargo(
Numero_Cargo CHAR(10) NOT NULL,
Id_Cliente   CHAR(10) NOT NULL,
Id_Usuario   CHAR(10) NOT NULL,
Numero_Placa CHAR(6) NOT NULL,
Id_Distrito	 CHAR(10) NOT NULL,
Descuento    DECIMAL(10,4) NULL,
Subtotal     DECIMAL(10,4) NULL,
IVA    		 DECIMAL(10,4) NULL,
Total    	 DECIMAL(11,4) NULL
);

CREATE TABLE Cargo_Estados(
Numero_Cargo  CHAR(10) NOT NULL,
Id_Estado     CHAR(10) NOT NULL,
Fecha         DATETIME NULL);

CREATE TABLE Estado(
Id_Estado     CHAR(10) NOT NULL,
Nombre		  VARCHAR(40));

CREATE TABLE Categoria(
Id_Categoria   CHAR(10) NOT NULL,
Descripcion    VARCHAR(60) NOT NULL);

CREATE TABLE Cliente(
Id_Cliente   CHAR(10) NOT NULL,
Cedula	     CHAR(8) NULL,
Nombre       VARCHAR(60) NULL,
Apellido       VARCHAR(80) NULL,
Direccion       VARCHAR(100) NULL,
Telefono       VARCHAR(15) NULL,
Correo       VARCHAR(50) NULL);


CREATE TABLE Conductor(
Id_Conductor    CHAR(10) NOT NULL,
Cedula          CHAR(10) NOT NULL UNIQUE,
Nombre		VARCHAR(20) NULL,
Apellido	VARCHAR(60) NULL,
Direccion	VARCHAR(100) NULL,
Telefono	VARCHAR(15) NULL,
Correo		VARCHAR(15) NULL,
Id_Categoria	CHAR(10) NOT NULL);

CREATE TABLE Departamento(
Id_Departamento	  CHAR(10) NOT NULL,
Nombre		  VARCHAR(50) NOT NULL);

CREATE TABLE DetallesCargo(
Numero_Cargo      CHAR(10) NOT NULL,
ItemDetalle	  CHAR(10) NOT NULL,
Costo_Unitario	  INT NULL,
Mercaderia	  VARCHAR(100) NULL,
Cantidad	  INT NULL,
Unidad		  VARCHAR(50) NOT NULL
);

CREATE TABLE Distrito(
Id_Distrito	CHAR(10) NOT NULL,
Nombre		VARCHAR(50) NOT NULL,
Id_Provincia	CHAR(10) NOT NULL);

CREATE TABLE Provincia(
Id_Provincia 	CHAR(10) NOT NULL,
Nombre		VARCHAR(50) NOT NULL,
Id_Departamento CHAR(10) NOT NULL);

CREATE TABLE Tipo_usuario(
Id_Tipo_Usuario  CHAR(10) NOT NULL,
Descripcion	 VARCHAR(60) NOT NULL
); 

CREATE TABLE Usuario(
Id_Usuario	CHAR(10) NOT NULL,
Cedula		CHAR(10) NOT NULL UNIQUE,
Nombre		VARCHAR(60) NOT NULL,
Apellido		VARCHAR(80) NOT NULL,
Id_Tipo_Usuario	CHAR(10) NOT NULL,
Nombre_Usuario	VARCHAR(80) NOT NULL,
Password	VARCHAR(4000) NOT NULL,
Direccion 	VARCHAR(100) NOT NULL,
Telefono	VARCHAR(15) NULL,
Correo		VARCHAR(50) NULL
);

CREATE TABLE Vehiculo(
Numero_Placa  	CHAR(6) NOT NULL,
Id_Conductor	CHAR(10) NOT NULL,
Id_Ayudante		CHAR(10) NOT NULL,
Marca			VARCHAR(50) NOT NULL,
Modelo			VARCHAR(50) NOT NULL,
Color			VARCHAR(50) NOT NULL,
CapcidadMax		VARCHAR(6) NOT NULL,
PasajerosMax	VARCHAR(2) NOT NULL
);

-- LLAVES PRIMARIAS
ALTER TABLE Cargo ADD PRIMARY KEY (Numero_Cargo ASC);
ALTER TABLE Cargo_Estados ADD PRIMARY KEY (Numero_Cargo ASC, Id_Estado ASC);
ALTER TABLE Estado ADD PRIMARY KEY (Id_Estado ASC);
ALTER TABLE Categoria ADD PRIMARY KEY (Id_Categoria ASC);
ALTER TABLE Cliente ADD PRIMARY KEY (Id_Cliente ASC);
ALTER TABLE Conductor ADD PRIMARY KEY (Id_Conductor ASC);
ALTER TABLE Departamento ADD PRIMARY KEY (Id_Departamento ASC);
ALTER TABLE DetallesCargo ADD PRIMARY KEY (Numero_Cargo ASC, ItemDetalle ASC);
ALTER TABLE Distrito ADD PRIMARY KEY (Id_Distrito ASC);
ALTER TABLE Provincia ADD PRIMARY KEY (Id_Provincia ASC);
ALTER TABLE Tipo_usuario ADD PRIMARY KEY (Id_Tipo_Usuario ASC);
ALTER TABLE Usuario ADD PRIMARY KEY (Id_Usuario ASC);
ALTER TABLE Vehiculo ADD PRIMARY KEY (Numero_Placa ASC);

-- LLAVES FORANEAS
ALTER TABLE Cargo ADD FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente);
ALTER TABLE Cargo ADD FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario);
ALTER TABLE Cargo ADD FOREIGN KEY (Numero_Placa) REFERENCES Vehiculo(Numero_Placa);
ALTER TABLE Cargo ADD FOREIGN KEY (Id_Distrito) REFERENCES Distrito(Id_Distrito);
ALTER TABLE Cargo_Estados ADD FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado);
ALTER TABLE Cargo_Estados ADD FOREIGN KEY (Numero_Cargo) REFERENCES Cargo(Numero_Cargo);
ALTER TABLE Conductor ADD FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria);
ALTER TABLE DetallesCArgo ADD FOREIGN KEY (Numero_Cargo) REFERENCES Cargo(Numero_Cargo);
ALTER TABLE Distrito ADD FOREIGN KEY (Id_Provincia) REFERENCES Provincia(Id_Provincia);
ALTER TABLE Provincia ADD FOREIGN KEY (Id_Departamento) REFERENCES Departamento(Id_Departamento);
ALTER TABLE Vehiculo ADD FOREIGN KEY (Id_Conductor) REFERENCES Conductor(Id_Conductor);
ALTER TABLE Vehiculo ADD FOREIGN KEY (Id_Ayudante) REFERENCES Ayudante(Id_Ayudante);