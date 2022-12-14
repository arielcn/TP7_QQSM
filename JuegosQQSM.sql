USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 4/8/2022 11:30:33 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JuegoQQSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoQQSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoQQSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoQQSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoQQSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoQQSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoQQSM] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoQQSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoQQSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoQQSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoQQSM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JuegoQQSM', N'ON'
GO
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  User [alumno]    Script Date: 4/8/2022 11:30:33 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 4/8/2022 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[pozoGanado] [int] NOT NULL,
	[comodinDobleChance] [bit] NOT NULL,
	[comodin50] [bit] NOT NULL,
	[comodinSaltear] [bit] NOT NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 4/8/2022 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[textoPregunta] [varchar](200) NOT NULL,
	[nivelDificultad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 4/8/2022 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[opcionRespuesta] [char](1) NOT NULL,
	[textoRespuesta] [varchar](200) NOT NULL,
	[correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (1, N'¿Cuantos equipos hay en la primera division argentina?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (3, N'¿Quien fue el campeón de la liga 21/22?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (4, N'¿A partir de que fecha de la liga 21/22 se implementó el VAR en Argentina?', 3)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (5, N'¿Quien es el actual arquero de Estudiantes?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (6, N'¿Cuantos cambios se permiten en la liga argentina?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (7, N'¿Cuanto pago Manchester City por el traspaso de Julian Alvarez?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (8, N'¿Como se llama el estadio de Boca Juniors?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (9, N'¿En que año Argentinos Juniors su última Copa Libertadores?', 3)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (10, N'¿Cuantas Copas Libertadores tiene Boca?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (11, N'¿Cual es el apodo de Marcelo Gallardo?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (12, N'¿Cuantos equipos descienden?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (13, N'¿Cual es el apodo de Estudiantes de la Plata?', 2)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (14, N'¿Quien es el máximo goleador del fútbol argentino?', 3)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (15, N'¿Cual fue el jugador con más expulsiones?', 3)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (16, N'¿Cual es el club con mas descensos a la Segunda División?', 3)
INSERT [dbo].[Preguntas] ([idPregunta], [textoPregunta], [nivelDificultad]) VALUES (17, N'¿Cual es el estadio con mayor capacidad?', 1)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (1, 1, N'A', N'23', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (2, 1, N'B', N'26', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (3, 1, N'C', N'19', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (4, 1, N'D', N'28', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (5, 3, N'A', N'Boca Juniors', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (6, 3, N'B', N'River Plate', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (7, 3, N'C', N'Velez Sarsfield', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (8, 3, N'D', N'Colon', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (9, 4, N'A', N'Fecha 8', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (11, 4, N'B', N'Fecha 5', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (12, 4, N'C', N'Fecha 2', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (14, 5, N'A', N'Ezequiel Unsain', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (15, 5, N'B', N'Enrique Bologna', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (16, 5, N'C', N'Mariano Andujar', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (17, 5, N'D', N'Gaston Gomez', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (18, 4, N'D', N'Fecha 11', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (19, 6, N'A', N'3', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (20, 6, N'B', N'5', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (21, 6, N'C', N'7', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (22, 6, N'D', N'4', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (23, 7, N'A', N'U$D 20.000.000', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (26, 7, N'B', N'U$D 32.000.000', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (27, 7, N'C', N'U$D 21.000.000', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (28, 7, N'D', N'U$D 15.000.000', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (29, 8, N'A', N'La Bombonera', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (30, 8, N'B', N'El Monumental', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (31, 8, N'C', N'El Cilindro', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (32, 8, N'D', N'Jose Amalfinati', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (33, 9, N'A', N'1984', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (34, 9, N'B', N'1992', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (35, 9, N'C', N'1985', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (36, 9, N'D', N'1977', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (37, 10, N'A', N'5', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (38, 10, N'B', N'7', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (39, 10, N'C', N'6', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (40, 10, N'D', N'8', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (41, 11, N'A', N'Oso', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (42, 11, N'B', N'Muñeco', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (43, 11, N'C', N'Nene', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (44, 11, N'D', N'Virrey', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (45, 12, N'A', N'1', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (46, 12, N'B', N'2', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (47, 12, N'C', N'3', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (48, 12, N'D', N'4', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (49, 13, N'A', N'El Canalla', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (50, 13, N'B', N'El Ciclon', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (51, 13, N'C', N'Pincharrata', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (52, 13, N'D', N'El Granate', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (53, 14, N'A', N'Martin Palermo', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (54, 14, N'B', N'Arsenio Erico', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (55, 14, N'C', N'Angel Labruna', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (56, 14, N'D', N'Manuel Pelegrina', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (57, 15, N'A', N'Fabian Cubero', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (58, 15, N'B', N'Roberto Trotta', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (59, 15, N'C', N'Leonardo Astrada', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (60, 15, N'D', N'Agustin Rossi', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (61, 16, N'A', N'Ferro', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (62, 16, N'B', N'Quilmes', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (63, 16, N'C', N'Unión', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (64, 16, N'D', N'Godoy Cruz', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (65, 17, N'A', N'El de racimg', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (66, 17, N'B', N'El de Boca', 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (69, 17, N'C', N'El de river', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [opcionRespuesta], [textoRespuesta], [correcta]) VALUES (70, 17, N'D', N'El de velez', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
