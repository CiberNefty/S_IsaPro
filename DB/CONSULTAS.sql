USE transporte;

# CONSULTAR TODOS LOS CLIENTES
SELECT * FROM Cliente;

#2. Consultar Cargos y su Estado
SELECT C.Numero_Cargo, CL.Nombre AS Cliente, E.Nombre AS Estado, C.Total
FROM Cargo C
JOIN Cliente CL ON C.Id_Cliente = CL.Id_Cliente
JOIN Cargo_Estados CE ON C.Numero_Cargo = CE.Numero_Cargo
JOIN Estado E ON CE.Id_Estado = E.Id_Estado;

#3. Consultar Detalles de un Cargo Específico
SELECT D.ItemDetalle, D.Costo_Unitario, D.Cantidad, D.Mercaderia
FROM DetallesCargo D
WHERE D.Numero_Cargo = 'C001';

#4. Listar Conductores y sus Vehículos
SELECT CO.Nombre AS Conductor, V.Numero_Placa, V.Marca
FROM Conductor CO
JOIN Vehiculo V ON CO.Id_Conductor = V.Id_Conductor;

#Actualización de Datos
UPDATE Cliente
SET Direccion = 'Nueva Calle 789'
WHERE Id_Cliente = 'CL001';

# Eliminación de Datos
DELETE FROM Cargo
WHERE Numero_Cargo = 'C002';
