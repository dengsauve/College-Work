-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dennis Sauve
-- Create date: 03/15/2017
-- Description:	A SP to lookup ESPN styled data based on two variables
-- =============================================
CREATE PROCEDURE spGetTeam 
	-- Add the parameters for the stored procedure here
	@teamID varchar(20) = '', 
	@yearID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/* BA Leader */
	select TOP(1) 'Batting AVG' as 'Leader',
		nameFirst + ' ' + nameLast as 'Name',
		(H*1.0)/(case when AB=0 then 1 else AB end) as 'BA'
		from db_Baseball2015.vwPlayersBatting
		where (AB*1.0) / (select MAX(G) from db_Baseball2015.vwPlayersBatting where teamID=@teamID and yearID=@yearID) >= 3.1
		and yearID=@yearID
		and teamID=@teamID
		order by 'BA' desc;
	/* HR Leader */
	select TOP(1) 'Home Runs' as 'Leader',
		nameFirst + ' ' + nameLast as 'Name',
		HR
		from db_Baseball2015.vwPlayersBatting
		where (AB*1.0) / (select MAX(G) from db_Baseball2015.vwPlayersBatting where teamID=@teamID and yearID=@yearID) >= 3.1
		and yearID=@yearID
		and teamID=@teamID
		order by HR desc;
	/* RBI Leader */
	select TOP(1) 'RBI' as 'Leader',
		nameFirst + ' ' + nameLast as 'Name',
		RBI
		from db_Baseball2015.vwPlayersBatting
		where (AB*1.0) / (select MAX(G) from db_Baseball2015.vwPlayersBatting where teamID=@teamID and yearID=@yearID) >= 3.1
		and yearID=@yearID
		and teamID=@teamID
		order by RBI desc;
	/* OBP Leader */
	select TOP(1) 'OBP' as 'Leader',
		nameFirst + ' ' + nameLast as 'Name',
		((H + BB + HBP)*1.0 / (case when (AB + BB + HBP)=0 then 1 else (AB + BB + HBP) end)) as 'OBP'
		from db_Baseball2015.vwPlayersBatting
		where (AB*1.0) / (select MAX(G) from db_Baseball2015.vwPlayersBatting where teamID=@teamID and yearID=@yearID) >= 3.1
		and yearID=@yearID
		and teamID=@teamID
		order by 'OBP' desc;
	/* Still need to code in batting leaders for H */
	select TOP(1) 'Hits' as 'Leader',
		nameFirst + ' ' + nameLast as 'Name',
		H
		from db_Baseball2015.vwPlayersBatting
		where (AB*1.0) / (select MAX(G) from db_Baseball2015.vwPlayersBatting where teamID=@teamID and yearID=@yearID) >= 3.1
		and yearID=@yearID
		and teamID=@teamID
		order by H desc;
	/* Main Body of Page Data */
	select nameFirst + ' ' + nameLast as 'NAME',
		G as 'GP',
		AB,
		R,
		H,
		B2 as '2B',
		B3 as '3B',
		HR,
		RBI,
		((S)+(B2*2)+(B3*3)+(HR*4)) as 'TB',
		BB,
		SO,
		SB,
		(H*1.0)/(case when AB=0 then 1 else AB end) as 'BA',
		((H + BB + HBP)*1.0 / (case when (AB + BB + HBP)=0 then 1 else (AB + BB + HBP) end)) as 'OBP',
		((S)+(B2*2)+(B3*3)+(HR*4))*1.0 / (case when AB=0 then 1 else AB end) as 'SLG',
		((H + BB + HBP)*1.0 / (case when (AB + BB + HBP)=0 then 1 else (AB + BB + HBP) end)) + (((S)+(B2*2)+(B3*3)+(HR*4))*1.0 / (case when AB=0 then 1 else AB end)) as 'OPS'
		from db_Baseball2015.vwPlayersBatting
		where yearID=@yearID and teamID=@teamID
		order by 'BA' desc;
	/* Footer/Total Data */
	select teamID as 'NAME',
		MAX(G) as 'GP',
		SUM(AB) as 'AB',
		SUM(R) as 'R',
		SUM(H) as 'H',
		SUM(B2) as '2B',
		SUM(B3) as '3B',
		SUM(HR) as 'HR',
		SUM(RBI) as 'RBI',
		(SUM(S)+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4)) as 'TB',
		SUM(BB) as 'BB',
		SUM(SO) as 'SO',
		SUM(SB) as 'SB',
		(SUM(H)*1.0)/(case when SUM(AB)=0 then 1 else SUM(AB) end) as 'BA',
		((SUM(H) + SUM(BB) + SUM(HBP))*1.0 / (case when (SUM(AB) + SUM(BB) + SUM(HBP))=0 then 1 else (SUM(AB) + SUM(BB) + SUM(HBP)) end)) as 'OBP',
		((SUM(S))+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4))*1.0 / (case when SUM(AB)=0 then 1 else SUM(AB) end) as 'SLG',
		((SUM(H) + SUM(BB) + SUM(HBP))*1.0 / (case when (SUM(AB) + SUM(BB) + SUM(HBP))=0 then 1 else (SUM(AB) + SUM(BB) + SUM(HBP)) end)) + 
			(((SUM(S))+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4))*1.0 / (case when SUM(AB)=0 then 1 else SUM(AB) end)) as 'OPS'
		from db_Baseball2015.vwPlayersBatting
		where yearID=@yearID and teamID=@teamID
		group by teamID
END
GO
