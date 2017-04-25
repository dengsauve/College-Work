create table CoinCollection
(
	IdPk int identity(1,1) primary key,
	Mint varchar(2),
	constraint chk_Mint check(Mint in ('D', 'P', ' ', 'S', 'O', 'CC')),
	Condition varchar(2),
	constraint chk_Condition check(Condition in ('P', 'BU', 'UC', 'VF', 'F', 'G', 'P')),
	Denomination varchar(2) default 'P',
	constraint chk_Denomination check(Denomination in ('P', 'N', 'D', 'Q', 'HD', 'D')),
	YearId int,
	CoinNotes varchar(128)
)