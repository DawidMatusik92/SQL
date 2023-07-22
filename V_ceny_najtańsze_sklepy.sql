USE [u_dmatusik]
GO

/****** Object:  View [dbo].[ceny_najtansze_sklepy]    Script Date: 22.07.2023 13:47:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ceny_najtansze_sklepy] as

with n as (
select p.nazwa, 
	CAST(AVG(c.cena_jednostkowa) AS decimal(10,2)) AS średnia_cena,
	MIN(c.cena_jednostkowa) as najniższa_cena,
	MAX(c.cena_jednostkowa) as najwyższa_cena
from Cennik as c
join Produkty as p on p.id_produktu = c.id_produktu
join Sprzedawcy as s on c.id_sprzedawcy = s.id_sprzedawcy
group by p.nazwa)


select n.nazwa, n.średnia_cena, n.najniższa_cena, n.najwyższa_cena, s.nazwa_sprzedawcy
from Sprzedawcy s 
join Cennik c on c.id_sprzedawcy = s.id_sprzedawcy
join Produkty p on p.id_produktu = c.id_produktu
join n on p.nazwa = n.nazwa
GROUP BY n.nazwa, n.średnia_cena, n.najniższa_cena, n.najwyższa_cena, s.nazwa_sprzedawcy, s.id_sprzedawcy, c.cena_jednostkowa, p.id_produktu, p.nazwa
HAVING n.najniższa_cena = (select c2.cena_jednostkowa from cennik as c2 where c2.id_sprzedawcy = s.id_sprzedawcy and c2.id_produktu = p.id_produktu and p.nazwa = n.nazwa)




GO

