USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[Pobierz_ceny_produktu]    Script Date: 22.07.2023 13:54:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pobierz_ceny_produktu]
    @nazwa_produktu NVARCHAR(50)
AS
BEGIN
    SELECT cena_jednostkowa, nazwa_sprzedawcy
    FROM Lista_produktów_ceny
    WHERE nazwa = @nazwa_produktu;
END
GO

