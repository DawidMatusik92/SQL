USE [u_dmatusik]
GO

/****** Object:  StoredProcedure [dbo].[Przeglądanie_historii_zakupów]    Script Date: 22.07.2023 13:55:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Przeglądanie_historii_zakupów]
@użytkownik int
as
begin
	select *
	from v_suma_zamówienia
	where @użytkownik = id_klienta
end
GO

