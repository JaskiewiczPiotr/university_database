oracle_sql_notes
CREATE USER c###piotr IDENTIFIED BY dumle;
GRANT CONNECT TO C###PIOTR;


INSERT INTO kierunki(id_kierunku, nazwa_kierunku)
VALUES (3, 'Algebra');


INSERT ALL
INTO kierunki VALUES (1, 'Informatyka')
INTO kierunki VALUES (2, 'Matematyka')
INTO kierunki VALUES (3, 'Fizyka')
INTO kierunki VALUES (4, 'Chemia')
INTO kierunki VALUES (5, 'Psychologia')
INTO kierunki VALUES (6, 'Socjologia')
SELECT 1 FROM DUAL;



INSERT ALL
INTO rodzaje_stypendium VALUES (1, 'Socjalne', 500)
INTO rodzaje_stypendium VALUES (2, 'Naukowe', 800)
INTO rodzaje_stypendium VALUES (3, 'Rektora', 1200)
SELECT 1 FROM DUAL;


INSERT ALL
INTO przyznane_stypendia VALUES (1, 450, 500, 1, 1 )
INTO przyznane_stypendia VALUES (2, 800, 800, 2, 2)
INTO przyznane_stypendia VALUES (3, 1200, 1200, 3, 3)
SELECT 1 FROM DUAL;



create table studenci(
id_studenta INT NOT NULL PRIMARY KEY,
imie VARCHAR(30),
nazwisko VARCHAR(30),
data_urodzenia DATE,
id_wydzialu INT,
id_kierunku int,
FOREIGN KEY  (id_wydzialu) REFERENCES wydzialy(id_wydzialu),
FOREIGN KEY  (id_kierunku) REFERENCES kierunki(id_kierunku)
);


alter table studenci add email varchar(50);






INSERT ALL
INTO studenci VALUES(1,'Tomasz', 'Lis', '1989-03-03','1', '3')
INTO studenci VALUES(2,'Agnieszka' ,'Filc', '1991-05-05', '2', '4')
INTO studenci VALUES(3,'Sylwia', 'Jakubik', '1993-03-22', '2', '2')
INTO studenci VALUES(4,'Michal', 'Jakubczyk', '1994-07-18', '1', '3')
INTO studenci VALUES(5,'Adrian', 'Nerko', '1988-08-01','1', '2' )
INTO studenci VALUES(6,'Dominika', 'Agrest', '1992-06-24', '3', '1') 
INTO studenci VALUES(7,'Karolina', 'Wasiak', '1994-09-12', '2', '5')
INTO studenci VALUES(8,'Adam', 'Golec', '1992-09-09', '1', '5')
INTO studenci VALUES(9,'Sebastian', 'Swit', '1993-02-17', '3', '4')
SELECT 1 FROM DUAL;


 ALTER TABLE stypendia RENAME TO rodzaje_stypendium




select przyznane_stypendia.id_przyznane_stypendium, przyznane_stypendia.kwota_stypendium,
studenci.imie, studenci.id_studenta, studenci.nazwisko
from przyznane_stypendia
inner join studenci on
przyznane_stypendia.id_studenta=studenci.id_studenta;



create table wydzialy(
id_wydzialu INT NOT NULL PRIMARY KEY,
nazwa_wydzialu VARCHAR(30)
);
create table kierunki(
id_kierunku INT NOT NULL PRIMARY KEY,
nazwa_kierunku VARCHAR(30)
);
create table rodzaje_stypendium(
id_rodzaju_stypendium INT NOT NULL PRIMARY KEY,
nazwa_rodzaju_stypendium VARCHAR(30),
maksymalna_wysokosc INTEGER
);


create table przyznane_stypendia(
id_przyznane_stypendium INT NOT NULL PRIMARY KEY,
kwota_stypendium integer,
maksymalna_wysokosc INTEGER,
id_studenta integer,
id_rodzaju_stypendium integer,
FOREIGN KEY (id_studenta) REFERENCES studenci(id_studenta),
FOREIGN KEY  (id_rodzaju_stypendium) REFERENCES rodzaje_stypendium(id_rodzaju_stypendium)
);


select przyznane_stypendia.id_przyznane_stypendium, przyznane_stypendia.kwota_stypendium,
studenci.imie, studenci.id_studenta, studenci.nazwisko
from przyznane_stypendia
inner join studenci on
przyznane_stypendia.id_studenta=studenci.id_studenta;


select przyznane_stypendia.id_przyznane_stypendium, przyznane_stypendia.kwota_stypendium,
studenci.imie, studenci.id_studenta, studenci.nazwisko, rodzaje_stypendium.nazwa_rodzaju_stypendium
from przyznane_stypendia
inner join studenci on
przyznane_stypendia.id_studenta=studenci.id_studenta
inner join rodzaje_stypendium on
przyznane_stypendia.id_rodzaju_stypendium = rodzaje_stypendium.id_rodzaju_stypendium



