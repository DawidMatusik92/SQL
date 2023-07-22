USE [u_dmatusik]
GO

/****** Object:  Table [dbo].[Zamówienia]    Script Date: 22.07.2023 13:45:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zamówienia](
	[id_zamówienia] [int] NOT NULL,
	[id_klienta] [int] NOT NULL,
	[Data] [date] NOT NULL,
 CONSTRAINT [PK_Zamówienia] PRIMARY KEY CLUSTERED 
(
	[id_zamówienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Zamówienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienia_Klient] FOREIGN KEY([id_klienta])
REFERENCES [dbo].[Klient] ([id_klienta])
GO

ALTER TABLE [dbo].[Zamówienia] CHECK CONSTRAINT [FK_Zamówienia_Klient]
GO

