drop database if exists Tippspiel;
create database Tippspiel character set utf8mb4 collate utf8mb4_unicode_ci;
use Tippspiel;

create table User (
    ID int not null auto_increment,
    Email varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);

insert into User (Email, Password) values
("admin@test.de", "pw"),
("max@test.de", "pw"),
("mex@test.de", "pw"),
("mix@test.de", "pw"),
("mox@test.de", "pw");


create table Teams (
    ID int not null auto_increment,
    Teamname varchar(50) not null,
    PRIMARY KEY (ID)
);

insert into Teams (Teamname) values
("Team1"),
("Team2"),
("Team3"),
("Team4");


create table Spieltag (
    ID int not null auto_increment,
    
);


create table Tippspiel (
    ID int not null auto_increment,
    Datum date not null,
    Beginn time not null,
    Ende time not null,
    Zeitstempel datetime not null,
    UserID int not null,
    Signatur int not null,
    SollArbeitszeit time not null,
    PausenZeit time not null, 
    primary key (ID),
    foreign key (UserID) references User(ID),
    foreign key (Signatur) references User(ID)
);


create index idx_UserID on Tippspiel(UserID);


insert into Tippspiel (Datum, Beginn, Ende, Zeitstempel, UserID, Signatur, SollArbeitszeit, PausenZeit) 
values
    ("2017-01-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-01-02", "08:00", "16:00", "2018-01-02 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-01-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-01-04", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-02-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-02-02", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-02-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-03-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-03-02", "08:00", "16:20", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2017-03-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-01-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-01-02", "08:00", "16:00", "2018-01-02 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-01-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-01-04", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-02-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-02-02", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-02-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-03-01", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-03-02", "08:00", "16:20", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-03-03", "08:00", "16:00", "2018-01-01 16:00:00", 1, 1, "07:48", "00:45"),
    ("2018-01-01", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-01-02", "08:00", "16:00", "2018-01-02 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-01-03", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-01-04", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-02-01", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-02-02", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-02-03", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-03-01", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-03-02", "08:00", "16:20", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45"),
    ("2018-03-03", "08:00", "16:00", "2018-01-01 16:00:00", 2, 2, "07:48", "00:45")
;

