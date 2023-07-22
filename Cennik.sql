USE [u_dmatusik]
GO

/****** Object:  Table [dbo].[Cennik]    Script Date: 22.07.2023 13:43:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cennik](
	[id_sprzedawcy] [int] NOT NULL,
	[id_produktu] [int] NOT NULL,
	[cena_jednostkowa] [money] NOT NULL,
	[id_cennik] [int] NOT NULL,
 CONSTRAINT [PK_Cennik] PRIMARY KEY CLUSTERED 
(
	[id_cennik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cennik]  WITH CHECK ADD  CONSTRAINT [FK_Cennik_Produkty] FOREIGN KEY([id_produktu])
REFERENCES [dbo].[Produkty] ([id_produktu])
GO

ALTER TABLE [dbo].[Cennik] CHECK CONSTRAINT [FK_Cennik_Produkty]
GO

ALTER TABLE [dbo].[Cennik]  WITH CHECK ADD  CONSTRAINT [FK_Cennik_Sprzedawcy] FOREIGN KEY([id_sprzedawcy])
REFERENCES [dbo].[Sprzedawcy] ([id_sprzedawcy])
GO

ALTER TABLE [dbo].[Cennik] CHECK CONSTRAINT [FK_Cennik_Sprzedawcy]
GO

ALTER TABLE [dbo].[Cennik]  WITH CHECK ADD  CONSTRAINT [check_cena_jednostkowa] CHECK  (([cena_jednostkowa]>(0)))
GO

ALTER TABLE [dbo].[Cennik] CHECK CONSTRAINT [check_cena_jednostkowa]
GO

