USE [u_dmatusik]
GO

/****** Object:  View [dbo].[ceny_produktów]    Script Date: 22.07.2023 13:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ceny_produktów] (nazwa, średnia_cena, najniższa_cena, najwyższa_cena)
as 
select p.nazwa,
	CAST(AVG(c.cena_jednostkowa) AS decimal(10,2)) AS średnia_cena,
	MIN(c.cena_jednostkowa) as najniższa_cena,
	MAX(c.cena_jednostkowa) as najwyższa_cena
from Cennik as c
join Produkty as p on p.id_produktu = c.id_produktu
join Sprzedawcy as s on c.id_sprzedawcy = s.id_sprzedawcy
group by p.nazwa
GO

