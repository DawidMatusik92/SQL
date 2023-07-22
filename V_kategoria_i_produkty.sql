USE [u_dmatusik]
GO

/****** Object:  View [dbo].[kateria_i_produkty]    Script Date: 22.07.2023 13:48:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[kateria_i_produkty] as
select k.nazwa as nazwa_kategorii, p.nazwa
from kategoria k
join Produkty p on k.id_kategorii = p.id_kategorii
GO

