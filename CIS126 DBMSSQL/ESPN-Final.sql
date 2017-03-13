select G as 'GP',
	AB,
	R,
	H,
	B2 as '2B',
	B3 as '3B',
	HR,
	RBI,
	((S)+(B2*2)+(B3*3)+(HR*4)) as TB,
	BB,
	SO,
	SB,
	(H*1.0)/(case when AB=0 then 1 else AB end) as BA
	/* Needs OBP (On base percentage) */
	/* Needs SLG (Slugging Percentage) */
	/* Needs OPS (OBP + SLG) */
	from db_Baseball2015.vwPlayersBatting
	where yearID=2010