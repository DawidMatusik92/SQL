USE [u_dmatusik]
GO

/****** Object:  View [dbo].[Lista_produktów_ceny]    Script Date: 22.07.2023 13:51:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[Lista_produktów_ceny] as
select p.nazwa, c.cena_jednostkowa, s.nazwa_sprzedawcy
from Produkty p
join Cennik c on c.id_produktu = p.id_produktu
join Sprzedawcy s on c.id_sprzedawcy = s.id_sprzedawcy
GO

