USE MASTER
if exists(select *from sysdatabases where name='ACTIVIDADES')
	begin
	drop database ACTIVIDADES
	end
CREATE DATABASE ACTIVIDADES
USE ACTIVIDADES
GO
CREATE TABLE Alumno
(
IDAlumno	VarChar(8) Primary Key Not Null,
Nombres		VarChar(20) Not Null,
Apellidos	VarChar(20) Not Null,
Ciclo		varchar(2) Not Null,
Carnet		varchar(10) Not Null
)
GO
CREATE TABLE Profesor
(
IDProfesor	Varchar(8) Primary Key Not Null,
Nombres		VarChar(20) Not Null,
Apellidos	VarChar(20) Not Null,
Especialidad varchar(20) Not Null
)
CREATE TABLE Turno
(
IDTurno		VarChar(8) Primary Key Not Null,
Turno		varchar(10)Not Null,
Dia			VarChar(20) Not Null,
Hora		DateTime Not Null
)
CREATE TABLE Actividad
(
IDActividad	VarChar(8) Primary Key Not Null,
Actividad	VarChar(20) Not Null,
Turno		VarChar(20) Not Null,
Dia			DateTime Not Null,
Hora		DateTime Not Null,
IDProfesor	Varchar(8) Foreign Key References Profesor(IDProfesor),
IDTurno		VarChar(8) Foreign Key References Turno(IDTurno)
)
CREATE TABLE Matricula
(
IDMatricula	VarChar(8) Primary Key Not Null,
Fecha		DateTime Not Null,
IDActividad	Varchar(8) Foreign Key References Actividad(IDActividad),
IDAlumno	VarChar(8) Foreign Key References Alumno(IDAlumno)
)
