USE [u_dmatusik]
GO

/****** Object:  View [dbo].[vszczegóły_zamówienia]    Script Date: 22.07.2023 13:52:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vszczegóły_zamówienia] 
as
select sz.*, z.Data, k.*
from Szczegóły_zamówienia sz
join Zamówienia z on z.id_zamówienia = sz.id_zamówienia
join Klient k on k.id_klienta = z.id_klienta
GO

