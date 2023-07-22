USE [u_dmatusik]
GO

/****** Object:  View [dbo].[kateria_i_produkty_ceny]    Script Date: 22.07.2023 13:50:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[kateria_i_produkty_ceny] as
select k.nazwa as nazwa_kategorii, p.nazwa as nazwa_produktu, c.cena_jednostkowa, s.nazwa_sprzedawcy
from kategoria k
join Produkty p on k.id_kategorii = p.id_kategorii
join Cennik c on p.id_produktu = c.id_produktu
join Sprzedawcy s on s.id_sprzedawcy = c.id_sprzedawcy
GO

