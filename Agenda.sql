
CREATE DATABASE Agenda;
GO


USE Agenda;
GO

CREATE TABLE EMPLEADO (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Cedula NVARCHAR(50) NOT NULL,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Departamento NVARCHAR(100) NOT NULL,
    Municipio NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255) NOT NULL,
    Telefono NVARCHAR(20),
    Celular NVARCHAR(20) NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    FechaIngreso DATE NOT NULL,
    Profesion NVARCHAR(100) NOT NULL,
    Puesto NVARCHAR(100) NOT NULL,
    Salario DECIMAL(18, 2) NOT NULL
);
GO

-- Crear un empleado
CREATE PROCEDURE spCreateEmpleado
    @Cedula NVARCHAR(50),
    @Nombres NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @FechaNacimiento DATE,
    @Departamento NVARCHAR(100),
    @Municipio NVARCHAR(100),
    @Direccion NVARCHAR(255),
    @Telefono NVARCHAR(20),
    @Celular NVARCHAR(20),
    @Correo NVARCHAR(100),
    @FechaIngreso DATE,
    @Profesion NVARCHAR(100),
    @Puesto NVARCHAR(100),
    @Salario DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
        INSERT INTO EMPLEADO (Cedula, Nombres, Apellidos, FechaNacimiento, Departamento, Municipio, Direccion, Telefono, Celular, Correo, FechaIngreso, Profesion, Puesto, Salario)
        VALUES (@Cedula, @Nombres, @Apellidos, @FechaNacimiento, @Departamento, @Municipio, @Direccion, @Telefono, @Celular, @Correo, @FechaIngreso, @Profesion, @Puesto, @Salario);
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Leer todos los empleados
CREATE PROCEDURE spGetEmpleados
AS
BEGIN
    SELECT * FROM EMPLEADO;
END
GO

-- Leer un empleado por Id
CREATE PROCEDURE spGetEmpleadoById
    @Id INT
AS
BEGIN
    SELECT * FROM EMPLEADO WHERE Id = @Id;
END
GO

-- Actualizar un empleado
CREATE PROCEDURE spUpdateEmpleado
    @Id INT,
    @Cedula NVARCHAR(50),
    @Nombres NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @FechaNacimiento DATE,
    @Departamento NVARCHAR(100),
    @Municipio NVARCHAR(100),
    @Direccion NVARCHAR(255),
    @Telefono NVARCHAR(20),
    @Celular NVARCHAR(20),
    @Correo NVARCHAR(100),
    @FechaIngreso DATE,
    @Profesion NVARCHAR(100),
    @Puesto NVARCHAR(100),
    @Salario DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
        UPDATE EMPLEADO
        SET Cedula = @Cedula, Nombres = @Nombres, Apellidos = @Apellidos, FechaNacimiento = @FechaNacimiento, Departamento = @Departamento, Municipio = @Municipio, Direccion = @Direccion, Telefono = @Telefono, Celular = @Celular, Correo = @Correo, FechaIngreso = @FechaIngreso, Profesion = @Profesion, Puesto = @Puesto, Salario = @Salario
        WHERE Id = @Id;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Eliminar un empleado
CREATE PROCEDURE spDeleteEmpleado
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
        DELETE FROM EMPLEADO WHERE Id = @Id;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO
