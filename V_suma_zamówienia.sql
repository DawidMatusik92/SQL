USE [u_dmatusik]
GO

/****** Object:  View [dbo].[v_suma_zamówienia]    Script Date: 22.07.2023 13:51:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[v_suma_zamówienia]
AS
SELECT 
    sz.id_zamówienia,
    SUM(sz.ilość * sz.cena) AS suma,
    z.Data,
    k.id_klienta
FROM Szczegóły_zamówienia sz
JOIN Zamówienia z ON z.id_zamówienia = sz.id_zamówienia
JOIN Klient k ON k.id_klienta = z.id_klienta
GROUP BY sz.id_zamówienia, z.Data, k.id_klienta
GO

