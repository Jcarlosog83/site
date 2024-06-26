SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asignar_prof_act]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asignar_prof_act](
	[IdAsignacion] [int] NOT NULL,
	[IdProfesor] [int] NOT NULL,
	[IdAsignatura] [int] NOT NULL,
 CONSTRAINT [PK_Asignar_prof_act] PRIMARY KEY CLUSTERED 
(
	[IdAsignacion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profesor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profesor](
	[IDProfesor] [int] NOT NULL,
	[Nombres] [varchar](20) NOT NULL,
	[Apellidos] [varchar](20) NOT NULL,
	[Especialidad] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Profesor__7E6CC920] PRIMARY KEY CLUSTERED 
(
	[IDProfesor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad](
	[IDActividad] [int] NOT NULL,
	[Actividad] [varchar](15) NOT NULL,
	[Turno] [varchar](12) NOT NULL,
	[Dia] [datetime] NOT NULL,
	[Hora] [datetime] NOT NULL,
 CONSTRAINT [PK__Actividad__023D5A04] PRIMARY KEY CLUSTERED 
(
	[IDActividad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumno]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alumno](
	[IDAlumno] [int] NOT NULL,
	[Nombres] [varchar](20) NOT NULL,
	[Apellidos] [varchar](20) NOT NULL,
	[Ciclo] [varchar](4) NOT NULL,
	[Carnet] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Alumno__7C8480AE] PRIMARY KEY CLUSTERED 
(
	[IDAlumno] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Turno]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Turno](
	[IDTurno] [int] NOT NULL,
	[Turno] [varchar](10) NOT NULL,
	[Dia] [varchar](10) NOT NULL,
	[Hora] [datetime] NOT NULL,
 CONSTRAINT [PK__Turno__00551192] PRIMARY KEY CLUSTERED 
(
	[IDTurno] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matricula]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Matricula](
	[IDMatricula] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDActividad] [int] NOT NULL,
	[IDAlumno] [int] NOT NULL,
	[IDTurno] [int] NULL,
	[IDProfesor] [int] NULL,
 CONSTRAINT [PK__Matricula__060DEAE8] PRIMARY KEY CLUSTERED 
(
	[IDMatricula] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actividad_Actividad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actividad]'))
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_Actividad] FOREIGN KEY([IDActividad])
REFERENCES [dbo].[Actividad] ([IDActividad])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_Actividad]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actividad_Actividad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actividad]'))
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_Actividad1] FOREIGN KEY([IDActividad])
REFERENCES [dbo].[Actividad] ([IDActividad])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_Actividad1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Matricula__IDAct__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[Matricula]'))
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK__Matricula__IDAct__07020F21] FOREIGN KEY([IDActividad])
REFERENCES [dbo].[Actividad] ([IDActividad])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK__Matricula__IDAct__07020F21]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Matricula__IDAlu__07F6335A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Matricula]'))
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK__Matricula__IDAlu__07F6335A] FOREIGN KEY([IDAlumno])
REFERENCES [dbo].[Alumno] ([IDAlumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK__Matricula__IDAlu__07F6335A]
