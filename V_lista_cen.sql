USE [u_dmatusik]
GO

/****** Object:  View [dbo].[lista_cen]    Script Date: 22.07.2023 13:50:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[lista_cen] AS
SELECT s.nazwa_sprzedawcy, c.cena_jednostkowa, p.nazwa
FROM Sprzedawcy s
JOIN Cennik c ON s.id_sprzedawcy = c.id_sprzedawcy
JOIN Produkty p ON c.id_produktu = p.id_produktu;
GO

