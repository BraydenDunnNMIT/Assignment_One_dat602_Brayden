/* 
Brayden Dunn DDL script for DAT602 Milestone one,
contains the DDL script for the database as well as 
thereoretical crud operations to show how the data may be 
manipulated.
*/



use master;
go
drop database if exists dat602_A1_DDL;
go
create database dat602_A1_DDL;
go
use dat602_A1_DDL;
go

--Creates account table
create table Account(
Account_ID int primary key not null identity,
Registration_Date date not null,
Username varchar(30) unique not null,
Password varchar(30) unique not null,
login_Attempts int not null,
Is_Locked int not null,
Is_Administrator int not null
);

--Creates highscore table

create table highscore(
Score_ID int primary key not null identity,
Score_Value varchar(20) 
);

create table Player(
Player_ID int primary key not null identity,
Account_ID int foreign key references Account(Account_ID),
Name varchar(30) unique not null,
Health int not null,
Current_health int,
Player_level int
);

create table Player_Type(
Player_Type int primary key not null identity,
Player_ID int foreign key references Player(Player_ID),
);

create table inventory (
Inventory_Id int primary key not null identity,
Player_ID int foreign key references Player(Player_ID),
);

create table game_session(
Game_session_id int primary key not null identity,
Player_ID int foreign key references Player(Player_ID),
is_active int not null,
lobby_code varchar(30) unique not null
);

create table game(
Game_id int primary key not null identity,
Game_session_id int foreign key references game_session(game_session_ID),
Dungeon_level int
);

create table Tile (
Tile_ID int primary key not null identity,
Game_ID int foreign key references game(Game_ID),
xPos int,
yPos int,
Home_Start_Tile int
);

create table item(
Item_ID int primary key not null identity,
Inventory_ID int foreign key references Inventory(Inventory_ID),
Tile_ID int foreign key references Tile(Tile_ID),
Item_name varchar(20)unique not null,
item_quantity int not null
);

create table item_type(
Player_type int primary key not null identity,
Player_ID int foreign key references Player(Player_ID),
);




--Insert script part starts here.

-- To note; 0 represents false while a one represents true.


--Insert statements into account tables

insert into Account(Registration_Date, Username, Password, login_Attempts, Is_Locked, Is_Administrator) values ('2019-4-12', 'Romeo303', 'Password123', '1', '0', '0');
insert into Account(Registration_Date, Username, Password, login_Attempts, Is_Locked, Is_Administrator) values ('2020-2-7', 'Juliet202', 'Tower31', '3', '0', '1');
insert into Account(Registration_Date, Username, Password, login_Attempts, Is_Locked, Is_Administrator) values ('2023-3-31', 'HackerMan', 'NotAhacker123', '3', '1', '0');
insert into Account(Registration_Date, Username, Password, login_Attempts, Is_Locked, Is_Administrator) values ('2015-1-24', 'TempUsername', 'TempPassword', '1', '0', '0');

--Insert statements into player tables


/*
Dummy data to show what data might look like when a user account is created as well as a player character. 
This would be the Create and Read part of a CRUD operation with the user/player data being created and read by the database.
*/

insert into Player(Account_ID, Name, Health, Current_health, Player_level) values ('1','DungeonMaster23', '100', '50', '2');
insert into Player(Account_ID, Name, Health, Current_health, Player_level) values ('2','TestingTest', '100', '100', '1');


--Outputs the results from database
select * from Account 
select * from player 

/*If a user wishes to have their data deleted or an admin deletes their data.
In this example the 'HackerMan' account gets deleted.
This would be the Delete in the CRUD operations.
*/ 
delete from Account where Username ='HackerMan';
select * from Account

/* 
If a user wishes to update their information
This would be the U in the CRUD operations.
*/ 

update Account 
set Username = 'new user'
where Account_ID = 4;
select * from Account

--If the system wishes to update someone's status to locked after 3 attempts.
--*This works if you change the login attempt value to 3*
update Account
set Is_Locked = '1'
where login_Attempts = 3;

select * from Account 










