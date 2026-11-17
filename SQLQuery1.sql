-- Crear la base de datos

CREATE DATABASE ServicioTecnicoDB;

GO

USE ServicioTecnicoDB;

GO

CREATE TABLE Usuarios (

    UsuarioID        INT IDENTITY(1,1) PRIMARY KEY,

    Nombre           NVARCHAR(100) NOT NULL,

    CorreoElectronico NVARCHAR(100) NOT NULL,

    Telefono         NVARCHAR(20)  NULL

);

CREATE TABLE Equipos (

    EquipoID   INT IDENTITY(1,1) PRIMARY KEY,

    TipoEquipo NVARCHAR(50) NOT NULL,

    Modelo     NVARCHAR(50) NOT NULL,

    UsuarioID  INT NOT NULL,

    CONSTRAINT FK_Equipos_Usuarios

        FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)

);

CREATE TABLE Tecnicos (

    TecnicoID    INT IDENTITY(1,1) PRIMARY KEY,

    Nombre       NVARCHAR(100) NOT NULL,

    Especialidad NVARCHAR(100) NULL

);

CREATE TABLE Reparaciones (

    ReparacionID   INT IDENTITY(1,1) PRIMARY KEY,

    EquipoID       INT NOT NULL,

    FechaSolicitud DATE NOT NULL DEFAULT GETDATE(),

    Estado         NVARCHAR(30) NOT NULL DEFAULT 'Pendiente',

    CONSTRAINT FK_Reparaciones_Equipos

        FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)

);

CREATE TABLE Asignaciones (

    AsignacionID    INT IDENTITY(1,1) PRIMARY KEY,

    ReparacionID    INT NOT NULL,

    TecnicoID       INT NOT NULL,

    FechaAsignacion DATE NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Asignaciones_Reparaciones

        FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),

    CONSTRAINT FK_Asignaciones_Tecnicos

        FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)

);

CREATE TABLE DetallesReparacion (

    DetalleID    INT IDENTITY(1,1) PRIMARY KEY,

    ReparacionID INT NOT NULL,

    Descripcion  NVARCHAR(255) NULL,

    FechaInicio  DATE NULL,

    FechaFin     DATE NULL,

    CONSTRAINT FK_Detalles_Reparaciones

        FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)

);

GO
 