USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[Najtańszy sklep lista]    Script Date: 22.07.2023 13:53:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Najtańszy sklep lista]
    @id_produktu int,
    @ilosc int
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM produkty WHERE id_produktu = @id_produktu)
    BEGIN
        RAISERROR('Brak produktu o takim id', 16, 1)
        RETURN
    END

    SELECT 
        s.nazwa_sprzedawcy AS 'Nazwa sklepu',
        c.cena_jednostkowa AS 'Cena jednostkowa',
        (c.cena_jednostkowa * @ilosc) AS 'Cena całkowita'
    FROM
        cennik c
        JOIN sprzedawcy s ON c.id_sprzedawcy = s.id_sprzedawcy
    WHERE
        c.id_produktu = @id_produktu
    ORDER BY
        c.cena_jednostkowa ASC
END
GO

