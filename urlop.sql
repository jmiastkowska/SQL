create database urlop;
use urlop;
create table bieszczady (
id bigint AUTO_INCREMENT PRIMARY KEY,
miejscowosc VARCHAR(50)
);

alter table bieszczady 
add lokum Varchar(50);
alter table bieszczady 
add zameldowanie date;
alter table bieszczady 
add wymeldowanie date;
show tables;

create table atrakcje (
id bigint AUTO_INCREMENT PRIMARY KEY,
miejscowosc VARCHAR(50),
rodzaj varchar(255),
cena integer
);
ALTER TABLE bieszczady RENAME TO noclegi;
ALTER TABLE noclegi MODIFY COLUMN lokum VARCHAR (100);
INSERT INTO noclegi (miejscowosc, lokum)  VALUES ('polanczyk', 'domek');
INSERT INTO noclegi (miejscowosc, lokum)  VALUES ('solina', 'domek');
INSERT INTO noclegi (miejscowosc, lokum)  VALUES ('berezka', 'apartament');
INSERT INTO noclegi (miejscowosc, lokum)  VALUES ('hoczew', 'hotel');
show tables;
select * from noclegi;



ALTER TABLE noclegi MODIFY COLUMN zameldowanie date;
INSERT INTO noclegi (zameldowanie)  VALUES ('2020-07-12');
INSERT INTO noclegi (zameldowanie)  VALUES ('2020-07-13');
INSERT INTO noclegi (zameldowanie)  VALUES ('2020-07-13');
INSERT INTO noclegi (zameldowanie)  VALUES ('2020-07-14');
show tables;
show table noclegi;
select * from noclegi;
alter table noclegi
drop column zameldowanie;
select * from noclegi;
INSERT INTO atrakcje 
(miejscowosc, rodzaj, cena) 
VALUES ('polanczyk', 'punty_widokowe', 35);
INSERT INTO atrakcje 
(miejscowosc, rodzaj, cena) 
VALUES ('polanczyk', 'rejs', 80.00);
INSERT INTO atrakcje 
(miejscowosc, rodzaj, cena) 
VALUES ('berezka', 'zoo', 12.00);
INSERT INTO atrakcje 
(miejscowosc, rodzaj, cena) 
VALUES ('berezka', 'punkt_widokowy', 10.00);
INSERT INTO atrakcje 
(miejscowosc, rodzaj, cena) 
VALUES ('solina', 'zapora', 15.50);
select * from atrakcje;
ALTER TABLE atrakcje drop COLUMN id_wymeldowanie;
select * from atrakcje;
ALTER TABLE atrakcje add COLUMN id_wymeldowanie INT DEFAULT 2 REFERENCES adres(id);
UPDATE atrakcje SET id_wymeldowanie = 2020 WHERE id < 3;
UPDATE atrakcje SET id_wymeldowanie = 2021 WHERE id >= 3;
select * from atrakcje;
SELECT a.miejscowosc, p.rodzaj, a.lokum
from
atrakcje p
join 
noclegi a
ON (a.miejscowosc = p.miejscowosc);
SELECT DISTINCT miejscowosc FROM atrakcje
WHERE miejscowosc LIKE 'p__%' AND cena > 30;
select miejscowosc 
from atrakcje
where cena between 0 and 30;
select * from atrakcje;
SELECT rodzaj, cena FROM atrakcje
WHERE miejscowosc = 'polanczyk' OR NOT rodzaj LIKE 'p%';
SELECT p.miejscowosc, rodzaj, cena FROM 
	atrakcje p 
RIGHT JOIN
	noclegi a 
ON (a.id = p.id)
ORDER BY a.id;