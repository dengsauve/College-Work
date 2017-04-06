create table DogLicense(
	License int not null primary key,
	Expires date not null,
	constraint ck_expires check (Expires > '01/01/1990'),
	Sex varchar(2) not null,
	constraint ck_sex check (Sex in ('M', 'F', 'NM', 'SF')),
	PetName varchar(255),
	Breed varchar(255),
	OwnerLastName varchar(255) not null,
	OwnerFirstName varchar(255),
	"Address" varchar(50) not null,
	City varchar(30) default 'Spokane',
	State varchar(2) default 'WA',
	Zip varchar(5), /*Needs to be in range of 99201 - 99212*/
	constraint ch_zip check (Zip in ('99201', '99202', '99203', '99204',
	'99205', '99206', '99207', '99208', '99209', '99210', '99211', '99212')),
	Phone varchar(14),
	Fee varchar(3) not null,
	AggressiveDog varchar(1) default 'F'
)