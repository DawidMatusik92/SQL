USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[filtrowanie_wszystko]    Script Date: 22.07.2023 13:53:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[filtrowanie_wszystko]
@minimalna_cena int,
@maksymalna_cena int,
@kategoria NVARCHAR(50),
@nazwa_sprzedawcy NVARCHAR(50)
as
begin
	select *
	from kateria_i_produkty_ceny
	where cena_jednostkowa > @minimalna_cena 
	and cena_jednostkowa < @maksymalna_cena 
	and nazwa_kategorii = @kategoria 
	and nazwa_sprzedawcy = @nazwa_sprzedawcy
end
GO

