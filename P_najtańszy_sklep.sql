USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[Najtańszy sklep]    Script Date: 22.07.2023 13:53:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Najtańszy sklep]
    @id_produktu int,
    @ilosc int
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM produkty WHERE id_produktu = @id_produktu)
    BEGIN
        RAISERROR('Brak produktu o takim id', 16, 1)
        RETURN
    END

    SELECT TOP 1
        s.nazwa_sprzedawcy AS 'Najtańszy sklep',
        (c.cena_jednostkowa * @ilosc) AS 'Cena całkowita'
    FROM
        cennik c
        JOIN sprzedawcy s ON c.id_sprzedawcy = s.id_sprzedawcy
    WHERE
        c.id_produktu = @id_produktu
    ORDER BY
        (c.cena_jednostkowa * @ilosc) ASC
END
GO

