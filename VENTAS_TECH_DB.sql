CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Territorio;
GO

CREATE TABLE Territorio (
    id_territorio INT PRIMARY KEY,
    Localidad VARCHAR(50),
    Provincia VARCHAR(50),
    Región VARCHAR(50)
);
GO

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    Categoría VARCHAR(50),
    Descripción VARCHAR(100),
    Costo DECIMAL(10,2),
    Precio DECIMAL(10,2)
);
GO

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    id_territorio INT,
    Fecha_Registro DATE,
    Email VARCHAR(50),
    Nombre_cliente VARCHAR(50),
    Tipo_de_cliente VARCHAR(5),

    CONSTRAINT FK_Clientes_Territorio
        FOREIGN KEY (id_territorio)
        REFERENCES Territorio(id_territorio)
);
GO

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    id_cliente INT,
    Canal VARCHAR(50),
    Fecha_venta DATE,
    Total_venta DECIMAL(10,2),

    CONSTRAINT FK_Ventas_Productos
        FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto),

    CONSTRAINT FK_Ventas_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
);

INSERT INTO Territorio
    (id_territorio, Localidad, Provincia, Región)
VALUES
    (1, 'Olavarría', 'Buenos Aires', 'Pampeana'),
    (2, 'Mar del Plata', 'Buenos Aires', 'Pampeana'),
    (3, 'Córdoba', 'Córdoba', 'Centro'),
    (4, 'Rosario', 'Santa Fe', 'Centro'),
    (5, 'Mendoza', 'Mendoza', 'Cuyo');
GO

INSERT INTO Productos
    (id_producto, Categoría, Descripción, Costo, Precio)
VALUES
    (1, 'Computación', 'Laptop Pro 15', 850.00, 1200.00),
    (2, 'Accesorios', 'Mouse Inalámbrico', 15.00, 28.00),
    (3, 'Computación', 'Monitor 4K 27"', 300.00, 450.00),
    (4, 'Audio', 'Auriculares BT Pro', 75.00, 120.00),
    (5, 'Almacenamiento', 'SSD Externo 1TB', 85.00, 130.00),
    (6, 'Accesorios', 'Teclado Mecánico', 60.00, 95.00);
GO

INSERT INTO Clientes
    (id_cliente, id_territorio, Fecha_Registro, Email, Nombre_cliente, Tipo_de_cliente)
VALUES
    (1, 1, '2024-01-05', 'maria@mail.com', 'María López', 'IND'),
    (2, 2, '2024-01-10', 'carlos@mail.com', 'Carlos Ruiz', 'EMP'),
    (3, 3, '2024-02-01', 'ana@mail.com', 'Ana Gómez', 'IND'),
    (4, 4, '2024-02-15', 'pedro@mail.com', 'Pedro Sanz', 'EMP'),
    (5, 5, '2024-03-01', 'laura@mail.com', 'Laura Torres', 'IND');
GO

INSERT INTO Ventas
    (id_venta, id_producto, id_cliente, Canal, Fecha_venta, Total_venta)
VALUES
    (1,  1, 1, 'Online',    '2024-03-05', 2400.00),
    (2,  2, 2, 'Tienda',    '2024-03-06', 140.00),
    (3,  3, 3, 'Online',    '2024-03-07', 450.00),
    (4,  4, 1, 'Tienda',    '2024-03-08', 240.00),
    (5,  5, 4, 'Online',    '2024-03-10', 390.00),
    (6,  6, 2, 'Tienda',    '2024-03-11', 380.00),
    (7,  1, 5, 'Online',    '2024-03-12', 1200.00),
    (8,  2, 3, 'Tienda',    '2024-03-13', 224.00),
    (9,  4, 4, 'Online',    '2024-03-14', 120.00),
    (10, 3, 5, 'Tienda',    '2024-03-15', 900.00);
GO

SELECT * FROM Territorio;
SELECT * FROM Productos;
SELECT * FROM Clientes;
SELECT * FROM Ventas;
GO