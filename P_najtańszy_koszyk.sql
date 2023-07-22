USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[Najtańszy_koszyk]    Script Date: 22.07.2023 13:53:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Najtańszy_koszyk]
    @produkty_ilosci ProduktyIlosci READONLY -- parametr tabelowy, który przyjmuje tabelę "produkty_ilosci"
AS
BEGIN
    -- Tworzenie tymczasowej tabeli "koszyk", która będzie przechowywać informacje o cenie każdego produktu
    CREATE TABLE #koszyk
    (
        id_produktu int,
        nazwa_produktu varchar(50),
        nazwa_sprzedawcy varchar(50),
        cena_jednostkowa decimal(18,2),
        ilosc int,
        cena_calkowita decimal(18,2)
    )

    -- Wpisanie danych do tabeli tymczasowej "koszyk" na podstawie informacji z tabeli "produkty_ilosci"
    INSERT INTO #koszyk
    SELECT p.id_produktu, p.nazwa, s.nazwa_sprzedawcy, c.cena_jednostkowa, pi.ilosc, c.cena_jednostkowa * pi.ilosc AS cena_calkowita
    FROM produkty p
    JOIN cennik c ON p.id_produktu = c.id_produktu
    JOIN sprzedawcy s ON c.id_sprzedawcy = s.id_sprzedawcy
    JOIN @produkty_ilosci pi ON pi.id_produktu = p.id_produktu

    -- Wybór najtańszego koszyka z tabeli "koszyk"
    SELECT nazwa_sprzedawcy, SUM(cena_calkowita) AS cena_koszyka
    FROM #koszyk
    GROUP BY nazwa_sprzedawcy
    ORDER BY cena_koszyka ASC

    -- Usunięcie tabeli tymczasowej "koszyk"
    DROP TABLE #koszyk
END
GO

