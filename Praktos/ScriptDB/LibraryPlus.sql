USE [master]
GO
/****** Object:  Database [LibraryPlus]    Script Date: 08.11.2024 16:39:54 ******/
CREATE DATABASE [LibraryPlus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryPlus', FILENAME = N'C:\Users\SveTilo\LibraryPlus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryPlus_log', FILENAME = N'C:\Users\SveTilo\LibraryPlus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryPlus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryPlus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryPlus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryPlus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryPlus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryPlus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryPlus] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryPlus] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryPlus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryPlus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryPlus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryPlus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryPlus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryPlus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryPlus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryPlus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryPlus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryPlus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryPlus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryPlus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryPlus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryPlus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryPlus] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryPlus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryPlus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryPlus] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryPlus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryPlus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryPlus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryPlus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryPlus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryPlus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryPlus] SET QUERY_STORE = OFF
GO
USE [LibraryPlus]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autors]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autors](
	[Id_Autors] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Autors] PRIMARY KEY CLUSTERED 
(
	[Id_Autors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRentalsHistory]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRentalsHistory](
	[Id_BookRentalHistory] [int] IDENTITY(1,1) NOT NULL,
	[Id_Books] [int] NOT NULL,
	[Id_Readers] [int] NOT NULL,
	[RentDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NULL,
 CONSTRAINT [PK_BookRentalsHistory] PRIMARY KEY CLUSTERED 
(
	[Id_BookRentalHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id_Books] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Id_Autors] [int] NOT NULL,
	[Id_Genre] [int] NOT NULL,
	[AvailableCopies] [int] NOT NULL,
	[YearOfPublication] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id_Books] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id_Genres] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id_Genres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Readers]    Script Date: 08.11.2024 16:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[Id_Readers] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[ContactDetails] [int] NOT NULL,
	[RegistrationDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Readers] PRIMARY KEY CLUSTERED 
(
	[Id_Readers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241101120851_Migrations', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Autors] ON 

INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (1, N'Иванович', N'Иван')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (2, N'Петрович', N'Петр')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (3, N'Ильдарович', N'Ильдар')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (4, N'Васильевич', N'Василий')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (5, N'Кузьминович', N'Кузьма')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (6, N'Маратович', N'Марат')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (7, N'Рамилевич', N'Рамиль')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (8, N'Чингизович', N'Чингиз')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (9, N'Альбертович', N'Альберт')
INSERT [dbo].[Autors] ([Id_Autors], [FName], [LName]) VALUES (10, N'Михайлович', N'Михаил')
SET IDENTITY_INSERT [dbo].[Autors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookRentalsHistory] ON 

INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (1, 1, 6, CAST(N'2022-11-01T12:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T12:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (9, 2, 5, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (13, 2, 4, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (14, 3, 3, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (15, 4, 2, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[BookRentalsHistory] ([Id_BookRentalHistory], [Id_Books], [Id_Readers], [RentDate], [DueDate], [ReturnDate]) VALUES (16, 6, 1, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[BookRentalsHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (1, N'1', 1, 1, 1, 1, N'1')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (2, N'2', 2, 2, 2, 2, N'2')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (3, N'3', 3, 3, 3, 3, N'3')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (4, N'4', 4, 4, 4, 4, N'4')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (5, N'5', 5, 5, 5, 5, N'5')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (6, N'6', 6, 6, 6, 6, N'6')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (7, N'7', 7, 7, 7, 7, N'7')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (8, N'8', 8, 8, 8, 8, N'8')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (9, N'9', 9, 9, 9, 9, N'9')
INSERT [dbo].[Books] ([Id_Books], [Title], [Id_Autors], [Id_Genre], [AvailableCopies], [YearOfPublication], [Description]) VALUES (10, N'10', 10, 10, 10, 10, N'10')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (1, N'Драмма')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (2, N'Ужасы')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (3, N'Фантастика')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (4, N'Боевик')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (5, N'Триллер')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (6, N'Биография')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (7, N'Фэнтези')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (8, N'Детектив')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (9, N'Романтика')
INSERT [dbo].[Genres] ([Id_Genres], [Title]) VALUES (10, N'Мистика')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Readers] ON 

INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (1, N'Денисович', N'Денис', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (2, N'Максимович', N'Максим', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (3, N'Каримович', N'Карим', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (4, N'Шамилевич', N'Шамиль', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (5, N'Матвеевич', N'Матвей', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
INSERT [dbo].[Readers] ([Id_Readers], [FName], [LName], [DateOfBirth], [ContactDetails], [RegistrationDate]) VALUES (6, N'Андреевич', N'Андрей', CAST(N'2000-11-01T12:00:00.0000000' AS DateTime2), 1234567890, NULL)
SET IDENTITY_INSERT [dbo].[Readers] OFF
GO
/****** Object:  Index [IX_BookRentalsHistory_Id_Books]    Script Date: 08.11.2024 16:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_BookRentalsHistory_Id_Books] ON [dbo].[BookRentalsHistory]
(
	[Id_Books] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookRentalsHistory_Id_Readers]    Script Date: 08.11.2024 16:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_BookRentalsHistory_Id_Readers] ON [dbo].[BookRentalsHistory]
(
	[Id_Readers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_Id_Autors]    Script Date: 08.11.2024 16:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_Books_Id_Autors] ON [dbo].[Books]
(
	[Id_Autors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_Id_Genre]    Script Date: 08.11.2024 16:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_Books_Id_Genre] ON [dbo].[Books]
(
	[Id_Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookRentalsHistory]  WITH CHECK ADD  CONSTRAINT [FK_BookRentalsHistory_Books_Id_Books] FOREIGN KEY([Id_Books])
REFERENCES [dbo].[Books] ([Id_Books])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookRentalsHistory] CHECK CONSTRAINT [FK_BookRentalsHistory_Books_Id_Books]
GO
ALTER TABLE [dbo].[BookRentalsHistory]  WITH CHECK ADD  CONSTRAINT [FK_BookRentalsHistory_Readers_Id_Readers] FOREIGN KEY([Id_Readers])
REFERENCES [dbo].[Readers] ([Id_Readers])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookRentalsHistory] CHECK CONSTRAINT [FK_BookRentalsHistory_Readers_Id_Readers]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Autors_Id_Autors] FOREIGN KEY([Id_Autors])
REFERENCES [dbo].[Autors] ([Id_Autors])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Autors_Id_Autors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres_Id_Genre] FOREIGN KEY([Id_Genre])
REFERENCES [dbo].[Genres] ([Id_Genres])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres_Id_Genre]
GO
USE [master]
GO
ALTER DATABASE [LibraryPlus] SET  READ_WRITE 
GO
