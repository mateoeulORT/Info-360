USE [master]
GO
/****** Object:  Database [Uni]    Script Date: 8/11/2024 15:19:56 ******/
CREATE DATABASE [Uni]
 CONTAINMENT = NONE

ALTER DATABASE [Uni] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Uni].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Uni] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Uni] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Uni] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Uni] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Uni] SET ARITHABORT OFF 
GO
ALTER DATABASE [Uni] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Uni] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Uni] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Uni] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Uni] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Uni] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Uni] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Uni] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Uni] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Uni] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Uni] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Uni] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Uni] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Uni] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Uni] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Uni] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Uni] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Uni] SET RECOVERY FULL 
GO
ALTER DATABASE [Uni] SET  MULTI_USER 
GO
ALTER DATABASE [Uni] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Uni] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Uni] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Uni] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Uni] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Uni', N'ON'
GO
ALTER DATABASE [Uni] SET QUERY_STORE = OFF
GO
USE [Uni]
GO
/****** Object:  User [alumno]    Script Date: 8/11/2024 15:19:56 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Becas]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Becas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUniversidad] [int] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Foto] [varchar](255) NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUniversidad] [int] NULL,
	[Costo] [decimal](10, 2) NULL,
	[Duracion] [int] NULL,
	[Foto] [varchar](255) NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condiciones]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condiciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUniversidad] [int] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Foto] [varchar](255) NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[FechaNac] [date] NULL,
	[Dni] [varchar](20) NULL,
	[Mail] [varchar](100) NULL,
	[Carrera] [int] NULL,
	[Foto] [varchar](255) NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCarrera] [int] NULL,
	[Descripcion] [text] NOT NULL,
	[Marcada] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Edad] [int] NULL,
	[Dni] [varchar](20) NULL,
	[Bio] [text] NULL,
	[IdUniversidad] [int] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universidades]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Ubicacion] [varchar](100) NULL,
	[Foto] [varchar](255) NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/11/2024 15:19:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Mail] [varchar](100) NULL,
	[Contraseña] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Becas] ON 

INSERT [dbo].[Becas] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (1, 1, N'Beca Excelencia', NULL, N'Beca para los estudiantes con mejor rendimiento academico')
INSERT [dbo].[Becas] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (2, 2, N'Beca Inclusion', NULL, N'Beca para estudiantes de bajos recursos')
INSERT [dbo].[Becas] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (3, 3, N'Beca Andina', NULL, N'Beca especial para estudiantes de la region andina')
INSERT [dbo].[Becas] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (4, 4, N'Beca Tecnica', NULL, N'Beca para estudiantes de programas tecnicos')
INSERT [dbo].[Becas] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (5, 5, N'Beca Innovacion', NULL, N'Beca para proyectos de innovacion tecnologica')
SET IDENTITY_INSERT [dbo].[Becas] OFF
GO
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (1, 1, CAST(5000.00 AS Decimal(10, 2)), 5, NULL, N'Ingenieria de Sistemas')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (2, 1, CAST(4500.00 AS Decimal(10, 2)), 5, NULL, N'Ciencias de la Computacion')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (3, 2, CAST(8000.00 AS Decimal(10, 2)), 4, NULL, N'Administracion de Empresas')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (4, 2, CAST(7500.00 AS Decimal(10, 2)), 4, NULL, N'Marketing')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (5, 3, CAST(6000.00 AS Decimal(10, 2)), 5, NULL, N'Ingenieria Civil')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (6, 3, CAST(5800.00 AS Decimal(10, 2)), 5, NULL, N'Arquitectura')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (7, 4, CAST(4000.00 AS Decimal(10, 2)), 3, NULL, N'Diseno Grafico')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (8, 4, CAST(4200.00 AS Decimal(10, 2)), 3, NULL, N'Gastronomia')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (9, 5, CAST(7000.00 AS Decimal(10, 2)), 4, NULL, N'Ingenieria Electronica')
INSERT [dbo].[Carreras] ([Id], [IdUniversidad], [Costo], [Duracion], [Foto], [Nombre]) VALUES (10, 5, CAST(6800.00 AS Decimal(10, 2)), 4, NULL, N'Telecomunicaciones')
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[Condiciones] ON 

INSERT [dbo].[Condiciones] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (1, 1, N'Condicion Especial', NULL, N'Requisitos adicionales para los estudiantes')
INSERT [dbo].[Condiciones] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (2, 2, N'Condicion Deportiva', NULL, N'Requisitos para estudiantes deportistas')
INSERT [dbo].[Condiciones] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (3, 3, N'Condicion Socioeconomica', NULL, N'Condiciones para estudiantes con dificultades economicas')
INSERT [dbo].[Condiciones] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (4, 4, N'Condicion Tecnica', NULL, N'Requisitos para programas tecnicos especializados')
INSERT [dbo].[Condiciones] ([Id], [IdUniversidad], [Nombre], [Foto], [Descripcion]) VALUES (5, 5, N'Condicion Innovadora', NULL, N'Requisitos para programas de innovacion')
SET IDENTITY_INSERT [dbo].[Condiciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([Id], [Nombre], [Apellido], [FechaNac], [Dni], [Mail], [Carrera], [Foto], [IdUsuario]) VALUES (1, N'John', N'Doe', CAST(N'2000-05-15' AS Date), N'12345678', N'johndoe@example.com', 1, NULL, 2)
INSERT [dbo].[Estudiantes] ([Id], [Nombre], [Apellido], [FechaNac], [Dni], [Mail], [Carrera], [Foto], [IdUsuario]) VALUES (2, N'Jane', N'Smith', CAST(N'1999-08-21' AS Date), N'87654321', N'janesmith@example.com', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (1, 1, N'Te interesa resolver problemas de tecnología?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (2, 1, N'Te gustan las matemáticas y la lógica?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (3, 1, N'Te ves trabajando en el sector de software?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (4, 2, N'Te gusta analizar datos y patrones?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (5, 2, N'Tienes interés en algoritmos y estructuras de datos?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (6, 2, N'Te gusta la investigación en computación?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (7, 3, N'Te ves liderando un equipo en el futuro?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (8, 3, N'Tienes interés en la gestión empresarial?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (9, 3, N'Te gustan las finanzas y contabilidad?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (10, 4, N'Te interesa el comportamiento del consumidor?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (11, 4, N'Te gustaría crear estrategias de marketing?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (12, 4, N'Eres creativo y analítico?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (13, 5, N'Te gusta diseñar estructuras y edificios?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (14, 5, N'Tienes habilidades en física y matemáticas?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (15, 5, N'Te gustaría trabajar en proyectos de construcción?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (16, 6, N'Te gusta el diseño y la estética?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (17, 6, N'Tienes interés en el dibujo y modelado 3D?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (18, 6, N'Te interesa la arquitectura sustentable?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (19, 7, N'Te gusta el diseño visual?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (20, 7, N'Tienes interés en la creación de contenido gráfico?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (21, 7, N'Eres bueno en el uso de herramientas de diseño?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (22, 8, N'Te apasiona la cocina y la gastronomía?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (23, 8, N'Te gusta experimentar con sabores y texturas?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (24, 8, N'Te ves trabajando en un restaurante o empresa de alimentos?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (25, 9, N'Te interesa el diseño y construcción de dispositivos electrónicos?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (26, 9, N'Tienes habilidades en circuitos y electrónica?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (27, 9, N'Te gustaría trabajar en tecnología avanzada?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (28, 10, N'Te interesa el funcionamiento de las redes de telecomunicaciones?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (29, 10, N'Tienes interés en comunicaciones y transmisión de datos?', 0)
INSERT [dbo].[Preguntas] ([Id], [IdCarrera], [Descripcion], [Marcada]) VALUES (30, 10, N'Te ves trabajando en el sector de telecomunicaciones?', 0)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesores] ON 

INSERT [dbo].[Profesores] ([Id], [Nombre], [Apellido], [Edad], [Dni], [Bio], [IdUniversidad], [IdUsuario]) VALUES (1, N'Carlos', N'Ramirez', 45, N'23456789', N'Doctor en Ingenieria de Sistemas', 1, 3)
INSERT [dbo].[Profesores] ([Id], [Nombre], [Apellido], [Edad], [Dni], [Bio], [IdUniversidad], [IdUsuario]) VALUES (2, N'Ana', N'Gomez', 40, N'98765432', N'Experta en Administracion de Empresas', 2, 4)
SET IDENTITY_INSERT [dbo].[Profesores] OFF
GO
SET IDENTITY_INSERT [dbo].[Universidades] ON 

INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (1, N'Universidad Nacional', N'Publica', N'Lima, Peru', NULL, N'Universidad Nacional del Peru')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (2, N'Universidad Privada', N'Privada', N'Cusco, Peru', NULL, N'Universidad Privada de prestigio')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (3, N'Universidad Andina', N'Publica', N'Arequipa, Peru', NULL, N'Universidad de la region andina')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (4, N'Instituto Superior', N'Privada', N'Trujillo, Peru', NULL, N'Instituto tecnico de calidad')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (5, N'Universidad Tecnologica', N'Publica', N'Tacna, Peru', NULL, N'Universidad orientada a la tecnologia')
SET IDENTITY_INSERT [dbo].[Universidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (1, N'admin', N'adminUser', N'admin@example.com', N'adminPass')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (2, N'estudiante', N'johndoe', N'johndoe@example.com', N'password123')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (3, N'profesor', N'profCarlos', N'carlos@example.com', N'profpass1')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (4, N'profesor', N'profAna', N'ana@example.com', N'profpass2')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Estudian__2724B2D1F23F6EC7]    Script Date: 8/11/2024 15:19:57 ******/
ALTER TABLE [dbo].[Estudiantes] ADD UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Estudian__C0308575E4F5CDEE]    Script Date: 8/11/2024 15:19:57 ******/
ALTER TABLE [dbo].[Estudiantes] ADD UNIQUE NONCLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__C0308575ED67040D]    Script Date: 8/11/2024 15:19:57 ******/
ALTER TABLE [dbo].[Profesores] ADD UNIQUE NONCLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__2724B2D1D8D72270]    Script Date: 8/11/2024 15:19:57 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__6B0F5AE0507C1857]    Script Date: 8/11/2024 15:19:57 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preguntas] ADD  DEFAULT ((0)) FOR [Marcada]
GO
ALTER TABLE [dbo].[Becas]  WITH CHECK ADD FOREIGN KEY([IdUniversidad])
REFERENCES [dbo].[Universidades] ([Id])
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD FOREIGN KEY([IdUniversidad])
REFERENCES [dbo].[Universidades] ([Id])
GO
ALTER TABLE [dbo].[Condiciones]  WITH CHECK ADD FOREIGN KEY([IdUniversidad])
REFERENCES [dbo].[Universidades] ([Id])
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD FOREIGN KEY([Carrera])
REFERENCES [dbo].[Carreras] ([Id])
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carreras] ([Id])
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD FOREIGN KEY([IdUniversidad])
REFERENCES [dbo].[Universidades] ([Id])
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Uni] SET  READ_WRITE 
GO
