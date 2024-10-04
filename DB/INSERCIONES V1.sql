USE transporte;
-- Inserciones para Ayudante
INSERT INTO Ayudante (Id_Ayudante, Cedula, Nombre, Apellido, Direccion, Telefono) VALUES 
('A001', 12345678, 'Juan', 'Pérez', 'Calle 123', '3111234567'),
('A002', 87654321, 'María', 'López', 'Calle 456', '3117654321');

-- Inserciones para Categoria
INSERT INTO Categoria (Id_Categoria, Descripcion) VALUES 
('C001', 'Particular'),
('C002', 'Profesional');

-- Inserciones para Cliente
INSERT INTO Cliente (Id_Cliente, Cedula, Nombre, Apellido, Direccion, Telefono, Correo) VALUES 
('CL001', '98765432', 'Carlos', 'Martínez', 'Calle 789', '3201234567', 'carlos@mail.com'),
('CL002', '12345678', 'Ana', 'Gómez', 'Calle 321', '3207654321', 'ana@mail.com');

-- Inserciones para Estado
INSERT INTO Estado (Id_Estado, Nombre) VALUES 
('E001', 'Pendiente'),
('E002', 'Completado');

-- Inserciones para Usuario
INSERT INTO Usuario (Id_Usuario, Cedula, Nombre, Apellido, Id_Tipo_Usuario, Nombre_Usuario, Password, Direccion, Telefono, Correo) VALUES 
('U001', '11111111', 'Luis', 'Rojas', 'TU001', 'luisrojas', 'password123', 'Calle 111', '3001234567', 'luis@mail.com'),
('U002', '22222222', 'Sofía', 'Martínez', 'TU002', 'sofimartinez', 'password456', 'Calle 222', '3007654321', 'sofia@mail.com');

-- Inserciones para Vehiculo
INSERT INTO Vehiculo (Numero_Placa, Id_Conductor, Id_Ayudante, Marca, Modelo, Color, CapcidadMax, PasajerosMax) VALUES 
('ABC123', 'C001', 'A001', 'Toyota', 'Corolla', 'Rojo', '5', '4'),
('XYZ789', 'C002', 'A002', 'Honda', 'Civic', 'Negro', '5', '4');

-- Inserciones para Cargo
INSERT INTO Cargo (Numero_Cargo, Id_Cliente, Id_Usuario, Numero_Placa, Id_Distrito, Descuento, Subtotal, IVA, Total) VALUES 
('C001', 'CL001', 'U001', 'ABC123', 'D001', 0.05, 100000, 19000, 117000),
('C002', 'CL002', 'U002', 'XYZ789', 'D002', 0.10, 200000, 38000, 242000);

-- Inserciones para Cargo_Estados
INSERT INTO Cargo_Estados (Numero_Cargo, Id_Estado, Fecha) VALUES 
('C001', 'E001', '2023-10-01 10:00:00'),
('C002', 'E002', '2023-10-02 12:00:00');

-- Inserciones para DetallesCargo
INSERT INTO DetallesCargo (Numero_Cargo, ItemDetalle, Costo_Unitario, Mercaderia, Cantidad, Unidad) VALUES 
('C001', 'D001', 50000, 'Servicio de transporte', 2, 'Servicio'),
('C002', 'D002', 100000, 'Servicio de transporte', 1, 'Servicio');

-- Inserciones para Departamento
INSERT INTO Departamento (Id_Departamento, Nombre) VALUES 
('D001', 'Antioquia'),
('D002', 'Cundinamarca');

-- Inserciones para Provincia
INSERT INTO Provincia (Id_Provincia, Nombre, Id_Departamento) VALUES 
('P001', 'Medellín', 'D001'),
('P002', 'Bogotá', 'D002');

-- Inserciones para Distrito
INSERT INTO Distrito (Id_Distrito, Nombre, Id_Provincia) VALUES 
('D001', 'Centro', 'P001'),
('D002', 'Suba', 'P002');

-- Inserciones para Tipo_usuario
INSERT INTO Tipo_usuario (Id_Tipo_Usuario, Descripcion) VALUES 
('TU001', 'Administrador'),
('TU002', 'Operador');
