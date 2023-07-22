USE [u_dmatusik]
GO

/****** Object:  Table [dbo].[Produkty]    Script Date: 22.07.2023 13:44:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Produkty](
	[id_produktu] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [nchar](30) NOT NULL,
	[id_kategorii] [int] NOT NULL,
 CONSTRAINT [PK_Produkty2] PRIMARY KEY CLUSTERED 
(
	[id_produktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Produkty_nazwa] UNIQUE NONCLUSTERED 
(
	[nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_kategoria] FOREIGN KEY([id_kategorii])
REFERENCES [dbo].[kategoria] ([id_kategorii])
GO

ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_kategoria]
GO

