USE [master]
GO
/****** Object:  Database [Uni]    Script Date: 4/4/2025 11:56:00 ******/
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
/****** Object:  User [alumno]    Script Date: 4/4/2025 11:56:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 4/4/2025 11:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[CarrerasXUniversidad]    Script Date: 4/4/2025 11:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrerasXUniversidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NOT NULL,
	[idUniversidad] [int] NOT NULL,
 CONSTRAINT [PK_CarrerasXUniversidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 4/4/2025 11:56:00 ******/
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
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 4/4/2025 11:56:00 ******/
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
/****** Object:  Table [dbo].[Universidades]    Script Date: 4/4/2025 11:56:00 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 4/4/2025 11:56:00 ******/
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
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (1, CAST(5000.00 AS Decimal(10, 2)), 5, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuVz6xnGr3VT8tqc-lBdBqk5FNFGNh67yUaw&s', N'Ingenieria de Sistemas')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (2, CAST(4500.00 AS Decimal(10, 2)), 5, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdKsjEhoGsaYVEHOxBMmYqEh3uzCgIDK8SYA&s', N'Ciencias de la Computacion')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (3, CAST(8000.00 AS Decimal(10, 2)), 4, N'https://universidadesdemexico.mx/img/article/que-es-mejor-gestion-empresarial-o-administracion-de-empresas', N'Administracion de Empresas')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (4, CAST(7500.00 AS Decimal(10, 2)), 4, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3kIhOUFw4uOYAWY7XdOI18eQWMnXvY81T4w&s', N'Marketing')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (5, CAST(6000.00 AS Decimal(10, 2)), 5, N'https://img1.wsimg.com/isteam/ip/8aa1873e-fd8d-4b12-8bc5-92e876717fed/ingenieros%20civiles.jpg', N'Ingenieria Civil')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (6, CAST(5800.00 AS Decimal(10, 2)), 5, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGQS1izwbUjM7UJJPSxZy4tjh6zpW-d-CPqw&s', N'Arquitectura')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (7, CAST(4000.00 AS Decimal(10, 2)), 3, N'https://universidadeuropea.com/resources/media/images/herramientas_diseno_grafico.width-640.jpg', N'Diseno Grafico')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (8, CAST(4200.00 AS Decimal(10, 2)), 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLXASyBn3sSAZpaifhGKhhNcAitIQUMRY8cg&s', N'Gastronomia')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (9, CAST(7000.00 AS Decimal(10, 2)), 4, N'https://www.carreras.unse.edu.ar/wp-content/uploads/2020/09/ingenieriaelectronica.jpg', N'Ingenieria Electronica')
INSERT [dbo].[Carreras] ([Id], [Costo], [Duracion], [Foto], [Nombre]) VALUES (10, CAST(6800.00 AS Decimal(10, 2)), 4, N'https://micarrerauniversitaria.com/wp-content/uploads/2018/02/ingenieria-de-telecomunicaciones-4.jpg', N'Telecomunicaciones')
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([Id], [Nombre], [Apellido], [FechaNac], [Dni], [Mail], [Carrera], [Foto], [IdUsuario]) VALUES (1, N'John', N'Doe', CAST(N'2000-05-15' AS Date), N'12345678', N'johndoe@example.com', 1, NULL, 2)
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
SET IDENTITY_INSERT [dbo].[Universidades] ON 

INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (1, N'Universidad de Buenos Aires', N'Publica', N'Ciudad Autónoma de Buenos Aires, Argentina', N'https://pbs.twimg.com/profile_images/1477305958762229763/v4TvQZt7_400x400.jpg', N'La Universidad de Buenos Aires (UBA), fundada en 1821, es una de las instituciones educativas más prestigiosas de Argentina y América Latina. Pública y gratuita, se destaca por su excelencia académica y su compromiso con la formación de profesionales, científicos e investigadores. Con 13 facultades que abarcan una amplia variedad de disciplinas, la UBA ha sido cuna de destacados Premios Nobel y figuras relevantes en diversos ámbitos. Su sistema de ingreso, a través del Ciclo Básico Común (CBC), garantiza un acceso igualitario a una educación de calidad, consolidándola como un pilar del desarrollo educativo y cultural del país.')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (2, N'Universidad Torcuato Di Tella', N'Privada', N'Ciudad Autónoma de Buenos Aires, Argentina', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP8VCW4LSWHplGgEw0r9fnWQEH1EAmllOPnQ&s', N'La Universidad Torcuato Di Tella (UTDT), fundada en 1991 en la Ciudad de Buenos Aires, es una institución privada reconocida por su excelencia académica, enfoque interdisciplinario y formación de líderes en diversas áreas. Con una oferta educativa que incluye carreras de grado, posgrados y programas ejecutivos, la UTDT se destaca por su enfoque en la investigación, el pensamiento crítico y la innovación. Inspirada en los valores de la familia Di Tella, históricamente vinculada al desarrollo cultural e industrial de Argentina, la universidad fomenta un ambiente académico de alto nivel, orientado a la formación de profesionales con impacto global.')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (3, N'Universidad Tecnológica Nacional', N'Publica', N'Argentina', N'https://pbs.twimg.com/profile_images/909940434755096576/SH9q-yOc_400x400.jpg', N'La UTN, fundada en 1948, es una universidad pública argentina con enfoque exclusivo en la ingeniería y las ciencias aplicadas. Con más de 30 facultades regionales distribuidas en todo el país, es una de las mayores formadoras de ingenieros en América Latina. Su modelo educativo combina excelencia académica, investigación aplicada y un fuerte vínculo con la industria, contribuyendo al desarrollo tecnológico y productivo de Argentina.')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (4, N'Instituto Tecnológico de Buenos Aires', N'Privada', N'Ciudad Autónoma de Buenos Aires, Argentina', N'https://pbs.twimg.com/profile_images/719613392382779392/UgqrF492_400x400.jpg', N'El ITBA, fundado en 1959, es una universidad privada de referencia en ingeniería, tecnología y management. Con un enfoque en la innovación y la sostenibilidad, el ITBA combina formación académica de alto nivel con investigación de vanguardia y colaboración con empresas e instituciones globales. Reconocido por su ambiente de excelencia, forma líderes preparados para enfrentar los desafíos del futuro.')
INSERT [dbo].[Universidades] ([Id], [Nombre], [Tipo], [Ubicacion], [Foto], [Descripcion]) VALUES (5, N'Universidad de Palermo', N'Privada', N'Ciudad Autónoma de Buenos Aires, Argentina', N'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fudepalermo&psig=AOvVaw1y5RFhJ1rBXd5-l3ZoUrUE&ust=1732188496802000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIDz_ZDn6okDFQAAAAAdAAAAABAE', N'La Universidad de Palermo, creada en 1986, es una institución privada ubicada en Buenos Aires que se destaca por su enfoque innovador y dinámico en la enseñanza. Con una amplia oferta académica en áreas como diseño, comunicación, negocios, derecho y tecnología, la UP fomenta la creatividad, la internacionalización y el espíritu emprendedor. Su modelo educativo está orientado a formar profesionales globales y adaptados a los cambios del mundo contemporáneo.')
SET IDENTITY_INSERT [dbo].[Universidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (1, N'admin', N'adminUser', N'admin@example.com', N'adminPass')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (2, N'estudiante', N'johndoe', N'johndoe@example.com', N'password123')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (3, N'profesor', N'profCarlos', N'carlos@example.com', N'profpass1')
INSERT [dbo].[Usuarios] ([Id], [Tipo], [NombreUsuario], [Mail], [Contraseña]) VALUES (4, N'profesor', N'profAna', N'ana@example.com', N'profpass2')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[CarrerasXUniversidad]  WITH CHECK ADD  CONSTRAINT [FK_CarrerasXUniversidad_Carreras] FOREIGN KEY([idCarrera])
REFERENCES [dbo].[Carreras] ([Id])
GO
ALTER TABLE [dbo].[CarrerasXUniversidad] CHECK CONSTRAINT [FK_CarrerasXUniversidad_Carreras]
GO
ALTER TABLE [dbo].[CarrerasXUniversidad]  WITH CHECK ADD  CONSTRAINT [FK_CarrerasXUniversidad_Universidades] FOREIGN KEY([idUniversidad])
REFERENCES [dbo].[Universidades] ([Id])
GO
ALTER TABLE [dbo].[CarrerasXUniversidad] CHECK CONSTRAINT [FK_CarrerasXUniversidad_Universidades]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_Usuarios]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Carreras] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carreras] ([Id])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Carreras]
GO
USE [master]
GO
ALTER DATABASE [Uni] SET  READ_WRITE 
GO
