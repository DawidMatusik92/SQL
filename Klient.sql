USE [u_dmatusik]
GO

/****** Object:  Table [dbo].[Klient]    Script Date: 22.07.2023 13:43:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Klient](
	[id_klienta] [int] NOT NULL,
	[Imię] [nchar](20) NOT NULL,
	[Nazwisko] [nchar](20) NOT NULL,
	[ID_miasta] [int] NOT NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[id_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Klient]  WITH CHECK ADD  CONSTRAINT [FK_Klient_Miasto] FOREIGN KEY([ID_miasta])
REFERENCES [dbo].[Miasto] ([ID_miasta])
GO

ALTER TABLE [dbo].[Klient] CHECK CONSTRAINT [FK_Klient_Miasto]
GO

