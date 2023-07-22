USE [u_dmatusik]
GO

/****** Object:  Table [dbo].[Szczegóły_zamówienia]    Script Date: 22.07.2023 13:45:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Szczegóły_zamówienia](
	[id_szzamówienia] [nchar](10) NOT NULL,
	[id_zamówienia] [int] NOT NULL,
	[id_produktu] [int] NOT NULL,
	[ilość] [int] NOT NULL,
	[cena] [money] NOT NULL,
 CONSTRAINT [PK_Szczegóły_zamówienia] PRIMARY KEY CLUSTERED 
(
	[id_szzamówienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia]  WITH CHECK ADD  CONSTRAINT [FK_Szczegóły_zamówienia_Produkty] FOREIGN KEY([id_produktu])
REFERENCES [dbo].[Produkty] ([id_produktu])
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia] CHECK CONSTRAINT [FK_Szczegóły_zamówienia_Produkty]
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia]  WITH CHECK ADD  CONSTRAINT [FK_Szczegóły_zamówienia_Zamówienia] FOREIGN KEY([id_zamówienia])
REFERENCES [dbo].[Zamówienia] ([id_zamówienia])
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia] CHECK CONSTRAINT [FK_Szczegóły_zamówienia_Zamówienia]
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia]  WITH CHECK ADD  CONSTRAINT [CK_Szczegóły_zamówienia_cena] CHECK  (([cena]>(0)))
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia] CHECK CONSTRAINT [CK_Szczegóły_zamówienia_cena]
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia]  WITH CHECK ADD  CONSTRAINT [CK_Szczegóły_zamówienia_ilość] CHECK  (([ilość]>(0)))
GO

ALTER TABLE [dbo].[Szczegóły_zamówienia] CHECK CONSTRAINT [CK_Szczegóły_zamówienia_ilość]
GO

