CREATE DATABASE [InfoMentorTeams]
GO

USE [InfoMentorTeams]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Mensajes] DROP CONSTRAINT IF EXISTS [FK__Mensajes__identi__4316F928]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Mensajes] DROP CONSTRAINT IF EXISTS [FK__Mensajes__identi__4222D4EF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Mensajes] DROP CONSTRAINT IF EXISTS [FK__Mensajes__identi__3D5E1FD2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Mensajes] DROP CONSTRAINT IF EXISTS [FK__Mensajes__identi__3C69FB99]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conversaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Conversaciones] DROP CONSTRAINT IF EXISTS [FK__Conversac__ident__412EB0B6]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conversaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Conversaciones] DROP CONSTRAINT IF EXISTS [FK__Conversac__ident__3B75D760]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnalisisParametro]') AND type in (N'U'))
ALTER TABLE [dbo].[AnalisisParametro] DROP CONSTRAINT IF EXISTS [FK__AnalisisP__idPar__4BAC3F29]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnalisisParametro]') AND type in (N'U'))
ALTER TABLE [dbo].[AnalisisParametro] DROP CONSTRAINT IF EXISTS [FK__AnalisisP__idAna__4AB81AF0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Analisis]') AND type in (N'U'))
ALTER TABLE [dbo].[Analisis] DROP CONSTRAINT IF EXISTS [FK__Analisis__idConv__47DBAE45]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[Parametros]
GO
/****** Object:  Table [dbo].[Mentores]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[Mentores]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[Mensajes]
GO
/****** Object:  Table [dbo].[Conversaciones]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[Conversaciones]
GO
/****** Object:  Table [dbo].[AnalisisParametro]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[AnalisisParametro]
GO
/****** Object:  Table [dbo].[Analisis]    Script Date: 17/1/2024 10:25:57 ******/
DROP TABLE IF EXISTS [dbo].[Analisis]
GO
/****** Object:  Table [dbo].[Analisis]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analisis](
	[id] [uniqueidentifier] NOT NULL,
	[idConversacion] [nvarchar](100) NOT NULL,
	[comentario] [nvarchar](1000) NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnalisisParametro]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalisisParametro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAnalisis] [uniqueidentifier] NOT NULL,
	[idParametro] [int] NOT NULL,
	[calificacion] [decimal](18, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversaciones]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversaciones](
	[id] [int] NULL,
	[identifier] [nvarchar](100) NOT NULL,
	[identifierMentor] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[id] [int] NULL,
	[identifier] [nvarchar](100) NOT NULL,
	[identifierConversacion] [nvarchar](100) NULL,
	[identifierMentor] [nvarchar](100) NULL,
	[content] [nvarchar](1000) NULL,
	[fecha] [datetime] NULL,
	[TipoUsuario] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentores]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentores](
	[id] [int] NULL,
	[identifier] [nvarchar](100) NOT NULL,
	[nombre] [nvarchar](25) NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 17/1/2024 10:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[id] [int] NOT NULL,
	[detalle] [nvarchar](300) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[si] [decimal](18, 3) NOT NULL,
	[no] [decimal](18, 3) NOT NULL,
	[parcial] [decimal](18, 3) NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Conversaciones] ([id], [identifier], [identifierMentor]) VALUES (1, N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1687885112283', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>En realidad todos los trabajos de este Club los he presentado, sin embargo, solo me preocupa el tema de las faltas</p>', CAST(N'2023-06-27T16:58:32.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1688093942615', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimado, si esas faltas no cuentan</p>', CAST(N'2023-06-30T02:59:02.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1688093960361', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>No cuentan ni las notas ni faltas ya que no es algo propio de la carrera</p>', CAST(N'2023-06-30T02:59:20.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1690415761190', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te terminó de ir en progreso 3? Apruebas todo?&nbsp;</p>
<p>&nbsp;</p>
<p>El lunes tendré información de la beca y mantenimiento en base a notas y asistencias.&nbsp;</p>
<p>&nbsp;</p>
<p>Cualquier duda estoy pendiente.</p>', CAST(N'2023-07-26T23:56:01.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1690415908495', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban, la verdad todo bien. Si paso todas las materias pero tuvimos un problema con un profesor que, a nuestro criterio, calificó mal nuestro trabajo final. Pero en todo caso ya estamos en eso y aún así si paso.', CAST(N'2023-07-26T23:58:28.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1690415928338', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Super gracias! Quedo pendiente a esta información entonces', CAST(N'2023-07-26T23:58:48.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1690415935551', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Cómo siempre gracias por estar pendiente', CAST(N'2023-07-26T23:58:55.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1690836982825', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale estimado, con gusto, me cuentas como se resuelve lo que me comentas del docente porfa, si no para reunirnos.&nbsp;</p>', CAST(N'2023-07-31T20:56:22.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1691640820919', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buenas Noches Esteban un gusto, me acaban de informar que usted es mi mentor , muchas gracias por su mensaje. Hace unos días me acerque al campus de la Universidad para ver de que forman me podrían ayudar ya que recientemente hackearon todas mis cuentas, incluyendo correos que tienen acceso al ID/ Universidad y me ayudaron con su correo. El motivo de mi escrito es para poder realizar el cambio de correo a esta nueva cuenta &nbsp;<a href="mailto:dinueirj@gmail.com" rel="noreferrer noopener" title="mailto:dinueirj@gmail.com" target="_blank">dinueirj@gmail.com</a> y estar pendiente de todas las notificaciones y correos que tenga que realizar. Igualmente me podría ayudar con los resultados del examen de ingles para conocer al nivel que tengo que ingresar en este semestre, espero su respuesta. Muchas gracias por su comprensión, linda noche.</p>', CAST(N'2023-08-10T04:13:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1691640970495', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1686704988847"></attachment>
Desconozco de la respectiva información, me podrías ayudar con los requisitos que necesito por favor, seria de mucha ayuda.
<p></p>', CAST(N'2023-08-10T04:16:10.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1692210580522', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Un saludo Esteban, buenas tardes, disculpe me podría ayudar con información de mi horario de clases para el ingreso de mi semestre en el área de Derecho al igual que los resultados de Ingles para poder conocer sobre mi nivel. Muchas Gracias, espero su respuesta.</p>', CAST(N'2023-08-16T18:29:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1692212297487', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1691640820919"></attachment>
Hola, listo perdona la demora ya solicito se actualice tu correo 
<p></p>', CAST(N'2023-08-16T18:58:17.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1692212310502', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1691640970495"></attachment>
Y con los aplicativos me refería a teams, banner, etc
<p></p>', CAST(N'2023-08-16T18:58:30.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1692212331730', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1692210580522"></attachment>
Entiendo que esa info estará habilitada en la primera quincena de septiembre estimada 
<p></p>', CAST(N'2023-08-16T18:58:51.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1692640105319', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buenos días , entiendo, muchas gracias por la información.</p>', CAST(N'2023-08-21T17:48:25.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1694024429818', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buenas tardes, un saludo Esteban, cómo esta? &nbsp;Por comunicarle que ya he recibido mi horario de la facultad de derecho , cómo puedo agendar el horario de las clases de ingles? &nbsp;</p>
<p>Espero su respuesta, muchas gracias...</p>
<p>&nbsp;</p>', CAST(N'2023-09-06T18:20:29.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1694024437759', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>&nbsp;</p>
<p><img alt="imagen" src="https://graph.microsoft.com/v1.0/chats/19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces/messages/1694024437759/hostedContents/aWQ9eF8wLWV1cy1kMi1jNDVjMzBhOTVlNzA1NjdhMGZmNGVlMzhkNWE1MDljZCx0eXBlPTEsdXJsPWh0dHBzOi8vdXMtYXBpLmFzbS5za3lwZS5jb20vdjEvb2JqZWN0cy8wLWV1cy1kMi1jNDVjMzBhOTVlNzA1NjdhMGZmNGVlMzhkNWE1MDljZC92aWV3cy9pbWdv/$value" width="444.6614583333333" height="250" itemid="0-eus-d2-c45c30a95e70567a0ff4ee38d5a509cd" style="vertical-align:bottom"></p>
<p>&nbsp;</p>', CAST(N'2023-09-06T18:20:37.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1694024717166', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Porfa para gestionar lo de inglés te recomiendo escribir a <a href="mailto:elizabeth.arias@udla.edu.ec" rel="noreferrer noopener" title="mailto:elizabeth.arias@udla.edu.ec" target="_blank">elizabeth.arias@udla.edu.ec</a></p>', CAST(N'2023-09-06T18:25:17.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695168329338', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>te recomiendo continuar gestionando la tarjeta Udla Discover, pero quizás si no te entregan a tiempo debas tener un plan b</p>', CAST(N'2023-09-20T00:05:29.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695171205944', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Desde lo que se acepta 24h</p>', CAST(N'2023-09-20T00:53:25.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695391374269', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Qué tal estimado, qué pasa si no cancelo los valores que tengo que pagar hasta hoy ?', CAST(N'2023-09-22T14:02:54.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695423622833', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, corres riesgo de bloqueos&nbsp;</p>', CAST(N'2023-09-22T23:00:22.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695566509844', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buenos días Esteban un cordial saludo, me he tratado de comunicar todos estos días para poder tomar las clases de Ingles y adelantarlo ya que luego se me acumulan materias, le agradecería mucho si me puede ayudar por favor. Gracias lindo día.</p>', CAST(N'2023-09-24T14:41:49.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695685976691', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, porfa con elizabeth arias</p>', CAST(N'2023-09-25T23:52:56.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695839563603', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buenas Tardes Esteban, como estas ? Disculpa la molestia, seria posible que me puedas ayudar? Quisiera poder eliminar de mi horario el Club de Frances A1 ya que existe una confusión de inscripción, espero tu respuesta, linda tarde</p>', CAST(N'2023-09-27T18:32:43.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1695844148928', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, quieres cambiar horario del club o algo asi?</p>', CAST(N'2023-09-27T19:49:08.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696359403636', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Paciencia porfa</p>', CAST(N'2023-10-03T18:56:43.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696359427384', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Ya ok, me da miedo que me den el otro año', CAST(N'2023-10-03T18:57:07.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696359446011', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Entiendo, más te aseguro que no va a ser asi ', CAST(N'2023-10-03T18:57:26.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696372027872', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>ENtiendo que esto si están justificando los profes</p>', CAST(N'2023-10-03T22:27:07.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696372040639', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>mañana ?&nbsp;</p>', CAST(N'2023-10-03T22:27:20.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696372045276', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Porfa para que converses con la docente de inglés y te deje dar mañana&nbsp;</p>', CAST(N'2023-10-03T22:27:25.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696372048916', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Si</p>
<attachment id="1696372040639"></attachment>
<p></p>', CAST(N'2023-10-03T22:27:28.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696444966020', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jorge, ya está aplicada la beca</p>', CAST(N'2023-10-04T18:42:46.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696444978420', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Comentame si hay alguna dificultad con el pago?&nbsp;</p>', CAST(N'2023-10-04T18:42:58.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696451051312', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Ya cancelo hoy en la noche todo estimado esteban </p>', CAST(N'2023-10-04T20:24:11.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696452149881', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale, grcias</p>', CAST(N'2023-10-04T20:42:29.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696459208611', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Esteban, buenas tardes. Un gusto saludarte. Te saluda José Andrés Murgueytio, mi número de Banner es A00054748.</p>', CAST(N'2023-10-04T22:40:08.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696459289876', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Te escribo para consultarte sobre las licencias Udemy de la universidad. Desde finales del semestre pasado he estado usando una licencia que nos dieron desde la facultad (creo) y aparentemente, segun un correo que recibimos hay una nueva oportunidad de acceder a nuevas licencias. En este nuevo correo nos dicen que las licencias no se retiran si el estudiante las usa, pero mi duda es si la misma política aplica para quienes adquirimos la licencia en el semestre anterior. De no ser así, creería que lo mejor es postular a estas nuevas licencias, verdad?</p>', CAST(N'2023-10-04T22:41:29.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696459332759', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Te pregunto esto porque no se si lo de las licencias se maneja directamente en la Facultad de Derecho o también desde otros departamentos de la universidad</p>', CAST(N'2023-10-04T22:42:12.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696459339080', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>De antemano gracias por tu respuesta</p>', CAST(N'2023-10-04T22:42:19.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696459723443', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, entiendo que no se caduca hasta que acabe el convenio&nbsp;</p>', CAST(N'2023-10-04T22:48:43.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696517690064', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Gracias</p>', CAST(N'2023-10-05T14:54:50.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696536731302', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Estimado si haces por transferencia recuerda registrar el pago</p>', CAST(N'2023-10-05T20:12:11.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696537044303', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Aye no pude realizar el. pago estimado esteban el día de hoy le realizo con tarjeta </p>', CAST(N'2023-10-05T20:17:24.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696537059139', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale, gracias</p>', CAST(N'2023-10-05T20:17:39.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696941948204', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban sabes algo de mi titulo?', CAST(N'2023-10-10T12:45:48.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970174649', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, ya lo están imprimiendo al titulo, en estos días ya está</p>', CAST(N'2023-10-10T20:36:14.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970413222', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Y el registro en el Senecyt', CAST(N'2023-10-10T20:40:13.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970420470', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Igual está en esos días? O ya está?', CAST(N'2023-10-10T20:40:20.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970435503', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Ellos demoran hasta 40 días en registrar</p>', CAST(N'2023-10-10T20:40:35.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970456727', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Quizás si demore eso un poco más pero es ya no es proceso de la Udla&nbsp;</p>', CAST(N'2023-10-10T20:40:56.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696970466229', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Listo estoy pendiente', CAST(N'2023-10-10T20:41:06.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696975663904', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, hoy se procederá a inhabilitar tus cuentas estimado</p>', CAST(N'2023-10-10T22:07:43.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696975688908', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Ya que no está registrado el pago. Apenas lo realices se procederá con el desbloqueo.&nbsp;</p>', CAST(N'2023-10-10T22:08:08.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696976395669', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Buena tarde estimado esteban mil disculpas tube un inconveniente con la tarjeta ya están cancelados los valores </p>', CAST(N'2023-10-10T22:19:55.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696976410675', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>para que no me bloqueen si me ayudas gestionando por fsvory</p>', CAST(N'2023-10-10T22:20:10.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696976486053', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Gracias estimado, ya no te van a bloquear, más bien ya te van a quitar el bloqueo de banner que tenías</p>', CAST(N'2023-10-10T22:21:26.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696976516436', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>A ti muy amable y mil. disculpas la demora </p>', CAST(N'2023-10-10T22:21:56.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1696976553430', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale tranqui estimado. UN buen semestre!&nbsp;</p>', CAST(N'2023-10-10T22:22:33.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697460823143', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban sabes algo del título? Sigo sin respuesta', CAST(N'2023-10-16T12:53:43.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697463969663', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Y tampoco me llegar el Mail q me dijiste que debe llegar el proceso ha finalizado …', CAST(N'2023-10-16T13:46:09.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697494046752', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Esta en proceso masivo de impresión de titulos estimado. El tiempo estimado desde que inicias la solicitud de graduación, hasta entregar el titulo es de 3 meses. Por lo que tenemos plazo hasta el 9 de noviembre. Yo esperaría esté antes pero entiendo que quizás pueda demorar un poco más&nbsp;</p>', CAST(N'2023-10-16T22:07:26.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697564391389', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban', CAST(N'2023-10-17T17:39:51.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697564404750', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Necesito hablar contigo', CAST(N'2023-10-17T17:40:04.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697569964162', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, te parece si te agendo a las 3pm?</p>', CAST(N'2023-10-17T19:12:44.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697569977041', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div>
<attachment id="1697569964162"></attachment>
Si por favor</div>', CAST(N'2023-10-17T19:12:57.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697569996989', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>listo quedas agendada</p>', CAST(N'2023-10-17T19:13:16.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1697574182539', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>banner.udla.edu.ec / portal de autoservicio / menú de servicio / solicitud de servicio / eliminación de materia&nbsp;</p>', CAST(N'2023-10-17T20:23:02.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700102620881', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Daniela, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual al promedio de la carrera.&nbsp;</span></li><li><span style="font-size:inherit">Asistencia mayor o igual al 80%.</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-16T02:43:40.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700102688149', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Shirley, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual al promedio de la carrera.&nbsp;</span></li><li><span style="font-size:inherit">Asistencia mayor o igual al 80%.</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-16T02:44:48.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700104231878', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Muy buenas noches si muchas gracias la verdad la materia q estoy baja es Fundamentos', CAST(N'2023-11-16T03:10:31.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700161675607', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, te recomendaría tutorías, muchas veces eso puede ayudar a reforzar conocimientos antes de que se acumulen</p>', CAST(N'2023-11-16T19:07:55.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700162584332', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Y cómo podría hacer eso', CAST(N'2023-11-16T19:23:04.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700162615334', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Ingresando a banner.udla.edu.ec / portal de autoservicio / menú de servicio / solicitud de servicio / solicitud de tutorías</p>', CAST(N'2023-11-16T19:23:35.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700166518808', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Ok', CAST(N'2023-11-16T20:28:38.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700179070233', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Esteban buenas noches , cómo estás ? Por comunicarte, he enviado un correo para solicitar la corrección de un trabajo de fundamentos históricos (Leónides Rojas) pero no tengo respuesta de ello, cómo me podrías ayudar ? Me comunican que lo deben enviar por correo mediante mi mentor o cómo podría hacer ?', CAST(N'2023-11-16T23:57:50.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700179953861', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, cómo estás? Cuándo tienes traje con el docente?&nbsp;</p>', CAST(N'2023-11-17T00:12:33.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700179975014', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Imposible, los mentores no tenemos contacto con los docentes</p>', CAST(N'2023-11-17T00:12:55.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700179995775', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Lo que te recomendaría es copiar a tu coordinador en el mail para contactarlo, o en la próxima clase mencionarle&nbsp;</p>', CAST(N'2023-11-17T00:13:15.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700267119090', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jordan, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual al promedio de la carrera.&nbsp;</span></li><li><span style="font-size:inherit">Asistencia mayor o igual al 80%.</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-18T00:25:19.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700267133257', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jorge, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual al promedio de la carrera.&nbsp;</span></li><li><span style="font-size:inherit">Asistencia mayor o igual al 80%.</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-18T00:25:33.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700320568095', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div>Buenos días Esteban como está <br>
Disculpe la molestia, el día de ayer falleció mi abuelita y tenía una defensa de proyecto, hablé con el profe de la materia y me dijo que para darme un trabajo que sustituya la nota tenía que justificar por mentoria<br>
Entonces me gustaría saber si me puede ayudar con eso porfavor</div>', CAST(N'2023-11-18T15:16:08.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700508780798', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada Cinthya, lamento mucho la pérdida.&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2023-11-20T19:33:00.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700508784282', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>TE mandé la info por mail</p>', CAST(N'2023-11-20T19:33:04.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700527873708', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Edith, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual a 6.&nbsp;</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-21T00:51:13.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1700795270725', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola José Andrés, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que todo vaya muy bien.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería recordarte que este semestre cuentas con mi apoyo como mentor. Te aliento a dar lo mejor de ti y aprobar todas las materias.&nbsp;</p>
<p>&nbsp;</p>
<p>Recuerda que la beca que presentas tiene ciertos requisitos de mantenimiento. Los cuales son:&nbsp;</p>
<ul>
<li><span style="font-size:inherit">Promedio mayor o igual al promedio de la carrera.&nbsp;</span></li><li><span style="font-size:inherit">Asistencia mayor o igual al 80%.</span></li></ul>
<p><span style="font-size:inherit">Estoy seguro de que puedes lograrlo, y cualquier inquietud estoy pendiente. Una buena noche!&nbsp;</span></p>', CAST(N'2023-11-24T03:07:50.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205258272', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Estimada, imposible lo que me pides, mentores no tenemos contacto con docentes</p>', CAST(N'2023-11-28T21:00:58.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205269996', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Te recomendaría enviar un amil a tu coordinador y a tu profe</p>', CAST(N'2023-11-28T21:01:09.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205274865', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Para que confirme estas salidas</p>', CAST(N'2023-11-28T21:01:14.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205278530', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Y asi puedan ayudarte</p>', CAST(N'2023-11-28T21:01:18.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205291228', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>mail*</p>
<attachment id="1701205269996"></attachment>
<p></p>', CAST(N'2023-11-28T21:01:31.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205313212', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Pero la profe me pide que el mentor puede enviar el correo. Entonces hablo con mi coordinador?', CAST(N'2023-11-28T21:01:53.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205336389', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>SI porfa</p>', CAST(N'2023-11-28T21:02:16.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205394969', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Ya gracias, en este caso tendría que hablar con El profe Diego ? El es coordinado de Administrcion ?', CAST(N'2023-11-28T21:03:14.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701205494397', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Si', CAST(N'2023-11-28T21:04:54.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701467254916', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jorge, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Me gustaría recomendarte tutorías para todos los promedios inferiores a 7,5</p>', CAST(N'2023-12-01T21:47:34.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701467714371', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jordan, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Me gustaría consultar si hay dificultades con las materias, y recomendarte tutorías para todos los promedios menores a 7,5</p>', CAST(N'2023-12-01T21:55:14.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701467829458', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jeremy, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Me gustaría recomendarte tutorías para materias con promedio inferior a 7,5. Y consultar por dificultades</p>', CAST(N'2023-12-01T21:57:09.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701649060322', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Buenas noches Esteban', CAST(N'2023-12-04T00:17:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701649067995', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'De pronto sabes que día no tenemos clases', CAST(N'2023-12-04T00:17:47.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701721810467', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, el viernes es feriado</p>', CAST(N'2023-12-04T20:30:10.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1701741875866', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Gracias estimado Esteban </p>', CAST(N'2023-12-05T02:04:35.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702047122023', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban', CAST(N'2023-12-08T14:52:02.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702047124030', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Una consulta', CAST(N'2023-12-08T14:52:04.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702047129740', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Cuando es la incorporación', CAST(N'2023-12-08T14:52:09.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702047134823', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'General', CAST(N'2023-12-08T14:52:14.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702319728424', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, justo están mandando unos correos para las incorporaciones de Enero</p>', CAST(N'2023-12-11T18:35:28.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702606515807', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te está yendo en este progreso 2? Espero que todo haya ido muy bien!&nbsp;</p>
<p>&nbsp;</p>
<p>De paso aprovecho para desearte unas felices fiestas!&nbsp;</p>', CAST(N'2023-12-15T02:15:15.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702608013113', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Bien muchas gracias lo q me preocupa es q me pidieron unos documentos', CAST(N'2023-12-15T02:40:13.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702608018960', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Y no entregue a tiempo', CAST(N'2023-12-15T02:40:18.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702608029650', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Q es el título y la cédula', CAST(N'2023-12-15T02:40:29.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702666946190', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, te recomiendo enviar cuanto antes</p>', CAST(N'2023-12-15T19:02:26.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702956972523', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te está yendo en este progreso 2? Espero que todo haya ido muy bien!&nbsp;</p>
<p>&nbsp;</p>
<p>De paso aprovecho para desearte unas felices fiestas!&nbsp;</p>', CAST(N'2023-12-19T03:36:12.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702956997046', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te está yendo en este progreso 2? Espero que todo haya ido muy bien!&nbsp;</p>
<p>&nbsp;</p>
<p>De paso aprovecho para desearte unas felices fiestas!&nbsp;</p>', CAST(N'2023-12-19T03:36:37.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1702957177971', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te está yendo en este progreso 2? Espero que todo haya ido muy bien!&nbsp;</p>
<p>&nbsp;</p>
<p>De paso aprovecho para desearte unas felices fiestas!&nbsp;</p>', CAST(N'2023-12-19T03:39:37.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703028442471', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te terminó de ir en este progreso 2? Espero que todo haya ido muy bien!&nbsp;</p>
<p>&nbsp;</p>
<p>De paso aprovecho para desearte unas felices fiestas!&nbsp;</p>', CAST(N'2023-12-19T23:27:22.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703032900886', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola estimado cómo estás ?', CAST(N'2023-12-20T00:41:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703032913710', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Yo bien por aquí aprovechando las vacaciones pero igual trabajo jeje', CAST(N'2023-12-20T00:41:53.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703032940890', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Y te cuento que mejoré mucho en notas que estaba baja, aún me falta unas materias pero al regresar completo evaluaciones y todo', CAST(N'2023-12-20T00:42:20.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703032950898', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Gracias por tus buenos deseos, también que tengas felices fiestas ??', CAST(N'2023-12-20T00:42:30.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1703185940872', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola estimada, bien y tú?&nbsp;</p>
<p>&nbsp;</p>
<p>Muchas gracias los buenos deseos. Y dale con todo en fin de progreso 2 e inicio de progreso 3!&nbsp;</p>', CAST(N'2023-12-21T19:12:20.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704243200911', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Que tal Esteban buenas noches </p>', CAST(N'2024-01-03T00:53:20.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704243218246', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Quería saber cuál era el proceso para cambiarme a modalidad online el próximo semestre </p>', CAST(N'2024-01-03T00:53:38.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704312469270', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jordan, cómo estás?</p>', CAST(N'2024-01-03T20:07:49.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704312483030', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Claro que si, te parece si agendamos una reunión para la semana que viene y te explico a detalle?</p>', CAST(N'2024-01-03T20:08:03.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704326423955', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale, podria ser el jueves de la otra semana ?</p>', CAST(N'2024-01-04T00:00:23.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704326947800', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Si claro, puedes 7pm?</p>', CAST(N'2024-01-04T00:09:07.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704336471031', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Entiendo que son los que se pidieron en un inicio de las materias que se usaron para homologar', CAST(N'2024-01-04T02:47:51.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704408302560', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>a esa hora tengo clases estimado&nbsp;</p>', CAST(N'2024-01-04T22:45:02.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704411700281', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>tipo que hora puedes el próximo jueves?</p>', CAST(N'2024-01-04T23:41:40.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704411732991', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'a las 4:30 estimado ', CAST(N'2024-01-04T23:42:12.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704411893649', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale te agendo</p>', CAST(N'2024-01-04T23:44:53.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704412536937', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>dale esteban estamos hablando&nbsp;</p>', CAST(N'2024-01-04T23:55:36.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418254095', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div>
<attachment id="1704336471031"></attachment>
Cómo ?</div>', CAST(N'2024-01-05T01:30:54.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418265257', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Una consulta cómo saco mi promedio de las materias ???', CAST(N'2024-01-05T01:31:05.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418532312', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, es una regla de 3 en base a los créditos y notas finales</p>', CAST(N'2024-01-05T01:35:32.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418539033', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>de cada materia</p>', CAST(N'2024-01-05T01:35:39.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418547289', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>los créditos los tienes en los silabos del aula virtual</p>', CAST(N'2024-01-05T01:35:47.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418552989', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Y las notas todavía no tienes el total</p>', CAST(N'2024-01-05T01:35:52.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418571361', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Pero toma en cuenta que progreso 1 pesa el 25% de tu nota final, progreso 2 el 35% y progreso 3 3l 40%</p>', CAST(N'2024-01-05T01:36:11.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418592981', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Quiero sacar el promedio del segundo progreso', CAST(N'2024-01-05T01:36:32.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704418598089', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Cómo podría sacarlo ??', CAST(N'2024-01-05T01:36:38.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704423763773', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola José, Andrés cómo estás?&nbsp;</p>
<p>&nbsp;</p>
<p>Espero que estés teniendo un buen inicio de año.&nbsp;</p>
<p>&nbsp;</p>
<p>Quería consultarte cómo te terminó de ir en progreso 2? Y alentarte a aprovechar al máximo estás últimas semanas del semestre, éxitos!&nbsp;</p>', CAST(N'2024-01-05T03:02:43.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704496782654', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola profe buenas noches, quizás habría la posibilidad de tener un trabajo para subir mis notas por favor :c', CAST(N'2024-01-05T23:19:42.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704496868329', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1704418592981"></attachment>
Hola estimada, cómo estás?&nbsp;
<p></p>
<p>&nbsp;</p>
<p>Para poder calcular, debes revisar en el aula virtual los créditos por materia y hacer regla de 3, toma en cuenta que cada progreso tiene un distinto peso, progreso 1 pesa 25%, progreso 2 35% y progreso 3 40%</p>', CAST(N'2024-01-05T23:21:08.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704496892043', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p></p>
<attachment id="1704496782654"></attachment>
Esto te recomendaría consultar directamente con tus docentes estimada&nbsp;
<p></p>', CAST(N'2024-01-05T23:21:32.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704502995878', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div>
<attachment id="1704496892043"></attachment>
No era para usted jaja</div>', CAST(N'2024-01-06T01:03:15.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704502997158', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Perdón', CAST(N'2024-01-06T01:03:17.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704659083141', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Buenas tardes como está ?', CAST(N'2024-01-07T20:24:43.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704659093124', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Una consulta si yo no alcancé a entregar el deber a tiempo sobre cuánto me tendrían que calificar el profesor', CAST(N'2024-01-07T20:24:53.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704745534543', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, cómo estás?</p>', CAST(N'2024-01-08T20:25:34.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704745543096', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Por favor necesito comunicarme contigo.&nbsp;</p>', CAST(N'2024-01-08T20:25:43.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704746174462', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Buenas tardes Esteban', CAST(N'2024-01-08T20:36:14.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704746183045', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Le puedo llamar?', CAST(N'2024-01-08T20:36:23.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704769098749', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban será que puedes revisar mis notas de las materias por favor', CAST(N'2024-01-09T02:58:18.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704837745903', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Entiendo que te ponen 0, con todo te recomendaría conversar con tu profe a ver si te da alguna alternativa.&nbsp;</p>', CAST(N'2024-01-09T22:02:25.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838398558', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola Jeremy, cómo estás?</p>', CAST(N'2024-01-09T22:13:18.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838412714', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Te han pasado las notas de progreso 2 solo 4 materias.&nbsp;</p>', CAST(N'2024-01-09T22:13:32.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838416184', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>&nbsp;</p>
<p><img alt="imagen" src="https://graph.microsoft.com/v1.0/chats/19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces/messages/1704838416184/hostedContents/aWQ9eF8wLWV1cy1kMjAtZDlhODg5NjE1MzY0YTk2ODMwMTYxNGM4Mzk1YjgyNzAsdHlwZT0xLHVybD1odHRwczovL3VzLWFwaS5hc20uc2t5cGUuY29tL3YxL29iamVjdHMvMC1ldXMtZDIwLWQ5YTg4OTYxNTM2NGE5NjgzMDE2MTRjODM5NWI4MjcwL3ZpZXdzL2ltZ28=/$value" width="621.2686567164179" height="250" itemid="0-eus-d20-d9a889615364a968301614c8395b8270" style="vertical-align:bottom"></p>
<p>&nbsp;</p>', CAST(N'2024-01-09T22:13:36.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838428752', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>En las cuales están bajas 3</p>', CAST(N'2024-01-09T22:13:48.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838435607', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Si debes mejorar para estas últimas semanas&nbsp;</p>', CAST(N'2024-01-09T22:13:55.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838441147', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Te recomendaría tutorías&nbsp;</p>', CAST(N'2024-01-09T22:14:01.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838572492', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Las tutorías las puedo ver en el banner', CAST(N'2024-01-09T22:16:12.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838574077', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Verdad', CAST(N'2024-01-09T22:16:14.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838592348', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Si estimado</p>', CAST(N'2024-01-09T22:16:32.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704838602257', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>En el portal de autoservicio, menú de servicio, solicitud de servicio</p>', CAST(N'2024-01-09T22:16:42.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921885995', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Entonces voy a poner un mensaje de fuera de la oficina para que te escriban mis estudiantes <emoji id="confused" alt="??" title="Confundido"></emoji>&nbsp;jaja</p>', CAST(N'2024-01-10T21:24:45.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921897485', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>noo jaja ok&nbsp;</p>', CAST(N'2024-01-10T21:24:57.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921906436', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>hasta cuándo?</p>', CAST(N'2024-01-10T21:25:06.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921943084', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>te van a cambiar a costa rica?&nbsp;<emoji id="tmi" alt="??" title="Demasiada información"></emoji></p>', CAST(N'2024-01-10T21:25:43.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921952606', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Solo hasta el lunes jaja</p>', CAST(N'2024-01-10T21:25:52.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704921975785', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>bueno <emoji id="sad" alt="??" title="Triste"></emoji></p>', CAST(N'2024-01-10T21:26:15.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922000201', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>amigo, por fis dame guardando las cositas que te encargué jeje no sé si mañana nos hagan ir, Tú estarás en el noa?</p>', CAST(N'2024-01-10T21:26:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922029146', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>No se nada todavía pero si de una te doy guardando y en todo caso te dejo las cosas en NOA si es que van</p>', CAST(N'2024-01-10T21:27:09.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922067942', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>dale, veamos qué nos avisan más luego</p>', CAST(N'2024-01-10T21:27:47.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922077264', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>muchas gracias&nbsp;</p>', CAST(N'2024-01-10T21:27:57.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922080932', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>de unash&nbsp;</p>', CAST(N'2024-01-10T21:28:00.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922088774', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Suerte ahí Majo cualquier cosa estamos en contacto&nbsp;</p>', CAST(N'2024-01-10T21:28:08.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922114349', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Dale amigo, ya te estaré avisando <emoji id="smile" alt="??" title="Sonrisa"></emoji>&nbsp;qué te vaya bien!</p>', CAST(N'2024-01-10T21:28:34.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704922145607', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Gracias <emoji id="smile" alt="??" title="Sonrisa"></emoji>&nbsp;</p>', CAST(N'2024-01-10T21:29:05.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704926304755', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Amigo, entiendo que nos toca ir mañana a todos presencial</p>', CAST(N'2024-01-10T22:38:24.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704926334816', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>ip</p>', CAST(N'2024-01-10T22:38:54.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704926338630', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Mañana te llevo jeje</p>', CAST(N'2024-01-10T22:38:58.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704926342033', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Sip*</p>', CAST(N'2024-01-10T22:39:02.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1704926361800', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>muchas gracias, nos vemos mañana <emoji id="smile" alt="??" title="Sonrisa"></emoji></p>', CAST(N'2024-01-10T22:39:21.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705004725107', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Que tal Esteban si vamos a tener la reunión el día de hoy ?</p>', CAST(N'2024-01-11T20:25:25.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705007838872', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola, perdona no estoy en la oficina, porfa para el lunes tener la reunión&nbsp;</p>', CAST(N'2024-01-11T21:17:18.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705353335817', N'19:26efc9f4-e638-438b-b5e9-608b70918068_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div>Hola buenas tardes<br>
Talvez podrías asesorarme cómo es eso de las prácticas pre profesionales ?</div>', CAST(N'2024-01-15T21:15:35.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705357894262', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_c17acd46-57f9-48ea-8946-263444af8453@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban, cómo estás ? Disculpa quisiera tener información sobre  la modalidad de las clases que vamos a tener, ya que unos profesores nos dicen que debemos ir presencial y otros virtual. Igualmente he conversado con mis compañeros y de otras carreras que estudian también en la noche , les han mandado virtual todo el semestre. Quisiera saber sobre la decisión  de la universidad para estar pendiente, muchas gracias , linda tarde', CAST(N'2024-01-15T22:31:34.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705368676677', N'19:5ad8e21a-3e46-49e8-9f79-89841536af7f_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Estimado Esteban a que correo tengo que enviar mi certificado?</p>', CAST(N'2024-01-16T01:31:16.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705369282596', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dc35ead4-d082-4e5f-a16e-e07c5e6a5433@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Hola amigo, tal vez estás por aquí?</p>', CAST(N'2024-01-16T01:41:22.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705370172552', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_dd9cc1be-f4f9-44ba-8a8a-f4f3cd70d6d7@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Que tal Esteban para que día podríamos tener la reunión </p>', CAST(N'2024-01-16T01:56:12.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705374077915', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Buenas noches como está ?', CAST(N'2024-01-16T03:01:17.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705374136213', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_a9c5da34-41bd-4b9a-be3e-d96d851eb1ff@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div><attachment id="bfb101ece45946be988be560a74322f3"></attachment></div>', CAST(N'2024-01-16T03:02:16.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705381728826', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban', CAST(N'2024-01-16T05:08:48.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705381749067', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Te comento que la profesora de inglés me mandó un mensaje por temas', CAST(N'2024-01-16T05:09:09.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705381765336', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Que llene para el examen recuperativo y aún no se acaba el progreso 3', CAST(N'2024-01-16T05:09:25.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705381769231', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_f53f0f67-99ea-4dd9-9d2a-a90ae62a414c@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Que debo hacer', CAST(N'2024-01-16T05:09:29.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705411269497', N'19:983c6c1f-2c5e-443b-8fe9-b0206667794d_b3b136f8-ff90-4c3d-8120-b59337d86368@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div><br>
Buenos dias Esteban como está<br>
Disculpe la hora, lo que pasa Esque quería comentarle una situación, lo que pasa es que he estado teniendo bastantes problemas con la materia de biomedica, el profe no me pudo tomar el examen y adicional en la exposición del proyecto tuve problemas con mi grupo de trabajo. La verdad Esque quiero ser muy sincera con usted, este semestre fue muy complicado para mí porque he estado atravesando problemas personales, no me he sentido nada bien y no es excusa sin embargo, uno de esos problemas es con la carrera en general, no me siento conforme. El motivo por el que principalmente le escribo es por esa materia, si necesita hablar conmigo porfavor me avisa o me llama <br>
Muchas gracias <br>
Quedo atenta</div>', CAST(N'2024-01-16T13:21:09.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705420026895', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Hola Esteban qué tal', CAST(N'2024-01-16T15:47:06.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705420033091', N'19:7a67fb61-96f3-42b9-b3f0-e1e4b447f053_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Sabes cuándo es la incorporación', CAST(N'2024-01-16T15:47:13.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705435007768', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N' Hola Esteban buenas tardes, espero que estés bien', CAST(N'2024-01-16T19:56:47.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705435026785', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Te quería consultar sobre mis faltas, cómo puedo saber si pierdo o no la beca', CAST(N'2024-01-16T19:57:06.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705435234597', N'19:39a86f16-1744-46ef-a3e9-9ccac10da48d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Aunque estaba viendo el porcentaje global y no supera el número Máximo de faltas', CAST(N'2024-01-16T20:00:34.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705437880101', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<div><img src="https://graph.microsoft.com/v1.0/chats/19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces/messages/1705437880101/hostedContents/aWQ9LHR5cGU9MSx1cmw9aHR0cHM6Ly91cy1wcm9kLmFzeW5jZ3cudGVhbXMubWljcm9zb2Z0LmNvbS92MS9vYmplY3RzLzAtZXVzLWQ2LTkwMDc2MWRiMjVkZDM5MjNhNTc2ZTZjYmQ1ZjRjNDBkL3ZpZXdzL2ltZ28=/$value" style="width:2573px; height:1448px"></div>', CAST(N'2024-01-16T20:44:40.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705437899541', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Muy buenas tardes quería ver si me ayuda con esto por favor', CAST(N'2024-01-16T20:44:59.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705437921970', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'No se que responder en esta pregunta', CAST(N'2024-01-16T20:45:21.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705437938986', N'19:2020f9a2-d2ab-4456-a225-04591a42e2a1_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Para poder dar la prueba de conocimiento de inglés', CAST(N'2024-01-16T20:45:38.000' AS DateTime), N'Estudiante')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705449649935', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<attachment id="1704423763773"></attachment>
<p>Hola Esteban. Gracias por el mensaje, todo en orden en progreso 1 y 2, en el 3 lo mismo </p>', CAST(N'2024-01-17T00:00:49.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705449780842', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Solamente tengo una duda, hay una materia que se llama Prácticas de servicio a la comunidad donde básicamente solo debemos preparar una exposición en todo el semestre. Yo ya expuse y francamente he faltado porque me parece super ilógico ir para literalmente no aprender nada, solo escuchar a los demás (en temas que ya hemos visto). Tengo el 21% de faltas, eso me afecta en algo ? Cómo ya terminó la carrera ciertamente no estoy muy preocupado de mantener la beca.</p>', CAST(N'2024-01-17T00:03:00.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705449864785', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>Sobre está materia ya vamos a hablar con la coordinación de la facultad por que en verdad es una perdida de tiempo, quizá sea por la metodología de la profesora. Pero en todo caso, solamente tengo esta duda acerca de el porcentaje de faltas y si eso puede impedir mi graduación </p>', CAST(N'2024-01-17T00:04:24.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mensajes] ([id], [identifier], [identifierConversacion], [identifierMentor], [content], [fecha], [TipoUsuario]) VALUES (1, N'1705449870282', N'19:5506023b-c312-4f94-8d52-5f97c47ae00d_983c6c1f-2c5e-443b-8fe9-b0206667794d@unq.gbl.spaces', N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'<p>De antemano gracias por tu respuesta </p>', CAST(N'2024-01-17T00:04:30.000' AS DateTime), N'Consejero Estudiantil')
GO
INSERT [dbo].[Mentores] ([id], [identifier], [nombre], [email]) VALUES (1, N'983c6c1f-2c5e-443b-8fe9-b0206667794d', N'Esteban Alfonso Aguirre', N'esteban.aguirre@udla.edu.ec')
GO
INSERT [dbo].[Parametros] ([id], [detalle], [descripcion], [si], [no], [parcial], [activo]) VALUES (1, N'Saluda con buenos dias, buenas tardes u otro?', NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 1)
GO
INSERT [dbo].[Parametros] ([id], [detalle], [descripcion], [si], [no], [parcial], [activo]) VALUES (2, N'Dá respuesta al requerimiento o direcciona correctamente al usuario?', NULL, CAST(1.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 1)
GO
ALTER TABLE [dbo].[Analisis]  WITH CHECK ADD FOREIGN KEY([idConversacion])
REFERENCES [dbo].[Conversaciones] ([identifier])
GO
ALTER TABLE [dbo].[AnalisisParametro]  WITH CHECK ADD FOREIGN KEY([idAnalisis])
REFERENCES [dbo].[Analisis] ([id])
GO
ALTER TABLE [dbo].[AnalisisParametro]  WITH CHECK ADD FOREIGN KEY([idParametro])
REFERENCES [dbo].[Parametros] ([id])
GO
ALTER TABLE [dbo].[Conversaciones]  WITH CHECK ADD FOREIGN KEY([identifierMentor])
REFERENCES [dbo].[Mentores] ([identifier])
GO
ALTER TABLE [dbo].[Conversaciones]  WITH CHECK ADD FOREIGN KEY([identifierMentor])
REFERENCES [dbo].[Mentores] ([identifier])
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([identifierConversacion])
REFERENCES [dbo].[Conversaciones] ([identifier])
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([identifierMentor])
REFERENCES [dbo].[Mentores] ([identifier])
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([identifierConversacion])
REFERENCES [dbo].[Conversaciones] ([identifier])
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([identifierMentor])
REFERENCES [dbo].[Mentores] ([identifier])
GO
