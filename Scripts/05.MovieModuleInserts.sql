-- create database cinemaMainDB;
-- use cinemaMainDB;

-- select *from Movie;
-- select *from DICTMovieType;
-- select *from DICTMovieState;
-- select *from DICTPersonType;
-- select *from Person;
-- select *from MoviePersonPersonType;

--------------------------------------------------- dictonary inserts ------------------------------------------------------

-- 1) Movie Type inserts --

INSERT INTO dictmovietype
VALUES ('Action')
INSERT INTO dictmovietype
VALUES ('Animation')
INSERT INTO dictmovietype
VALUES ('Comedy')
INSERT INTO dictmovietype
VALUES ('Crime')
INSERT INTO dictmovietype
VALUES ('Drama')
INSERT INTO dictmovietype
VALUES ('Fantasy')
INSERT INTO dictmovietype
VALUES ('Historical')
INSERT INTO dictmovietype
VALUES ('Horror')
INSERT INTO dictmovietype
VALUES ('Romance')
INSERT INTO dictmovietype
VALUES ('Science Fiction')
INSERT INTO dictmovietype
VALUES ('Thriller')
INSERT INTO dictmovietype
VALUES ('Western')
INSERT INTO dictmovietype
VALUES ('Other')

-- 2) Movie State inserts

INSERT INTO dictmoviestate
VALUES ('Upcoming')
INSERT INTO dictmoviestate
VALUES ('Current')
INSERT INTO dictmoviestate
VALUES ('Expired')

--3) Person Type inserts

INSERT INTO dictpersontype
VALUES ('Director')
INSERT INTO dictpersontype
VALUES ('Actor')
INSERT INTO dictpersontype
VALUES ('Screenwriter')
INSERT INTO dictpersontype
VALUES ('Editor')
INSERT INTO dictpersontype
VALUES ('Camera Operator')

--------------------------------------------------- main inserts ------------------------------------------------------

-- 1) Movie inserts --

INSERT INTO movie
VALUES (1, 0, 1, 5, 2, 'Titanic', 'Di Caprio first success', '3:20:00');
INSERT INTO movie
VALUES (1, 1, 0, 1, 1, 'Fast and furious', 'Too fast to catch', '2:15:00');
INSERT INTO movie
VALUES (1, 0, 0, 10, 3, 'Black panther', 'Marvel popular hit', '1:56:00');
INSERT INTO movie
VALUES (1, 1, 0, 2, 2, 'Smolin the king', 'About the whitest of ppl', '1:30:00');
INSERT INTO movie
VALUES (1, 0, 1, 6, 2, 'Women on FTIMS', 'Powerfull and dangerous', '2:37:00');
INSERT INTO movie
VALUES (1, 1, 0, 11, 1, 'Final judgement', 'Final round with Ewka', '1:54:00');
INSERT INTO movie
VALUES (1, 1, 1, 12, 3, 'WEEIA vs FTIMS', 'Only one true win(n)er', '1:40:00');
INSERT INTO movie
VALUES (1, 0, 0, 8, 2, 'Electro exam', 'Rand(time(NULL))', '2:27:00');
INSERT INTO movie
VALUES (1, 0, 1, 4, 2, 'Hope dies last', 'Java 1.2 with prof. Niewiadomski', '2:45:00');
INSERT INTO movie
VALUES (1, 1, 0, 9, 1, 'Here we go again', '2020 sysop editon', '3:03:00');
INSERT INTO movie
VALUES (1, 1, 0, 2, 1, 'WFTIMS true heros', 'Mega saved another student', '1:41:00');
INSERT INTO movie
VALUES (1, 1, 0, 3, 3, 'Its good that you remember', 'S. Sciezko warm-up', '1:30:00');
INSERT INTO movie
VALUES (1, 0, 1, 4, 3, 'First but not last', 'XML exam', '1:42:00');
INSERT INTO movie
VALUES (1, 1, 0, 3, 2, '...yessss, ... of course', 'Electro logic gates lesson', '1:35:00');
INSERT INTO movie
VALUES (1, 1, 1, 9, 3, 'Works like a charm', 'First test suit on object oriented programming',
        '2:15:00');
INSERT INTO movie
VALUES (1, 0, 0, 7, 3, 'Never ending story', 'Mrs Ochelska is not here', '2:20:00');
INSERT INTO movie
VALUES (1, 0, 1, 6, 1, 'Too good to be true', 'Kacpro will be alone today', '1:29:00');
INSERT INTO movie
VALUES (1, 1, 0, 8, 2, 'I will not let you...', 'SQL exam', '2:51:00');
INSERT INTO movie
VALUES (0, 1, 0, 7, 2, 'Bad decisions', 'White Sysops and Shining Kompo', '1:50:00');
INSERT INTO movie
VALUES (1, 1, 0, 2, 1, 'Slowly but surely', 'Kamil Winer walk', '2:04:00');
INSERT INTO movie
VALUES (1, 1, 0, 10, 3, 'Its never too late', 'Trying too start doing anything for studies',
        '2:13:00');
INSERT INTO movie
VALUES (0, 1, 0, 13, 2, 'Blind in elevator', 'Is that 3rd floor?', '1:44:00');

-- 2) Person inserts --

INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Mateusz', 'Walczak', '1982-07-30')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Konrad', 'Kajszczak', '1938-09-02')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Brad', 'Pitt', '1974-05-13')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Morgan', 'Freeman', '1956-09-11')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Michal', 'Zebrowski', '1975-11-28')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Geaorge', 'Clooney', '1972-09-11')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Angelina', 'Jolie', '1968-11-25')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Leonardo', 'Di Caprio', '1990-03-23')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Piotr', 'Adamczyk', '1982-06-13')
INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Katarzyna', 'Kowalska', '1949-01-03')

-- 3) MoviePersonPerosnType inserts 

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 1, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 2, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 3, 6)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 5, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (2, 1, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (2, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (2, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (2, 4, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (2, 3, 6)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (3, 1, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (3, 2, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (3, 2, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (3, 4, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (3, 3, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (4, 1, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (4, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (4, 2, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (4, 3, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (4, 5, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (5, 1, 2)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (5, 1, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (5, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (5, 4, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (5, 3, 4)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 1, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 1, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 3, 2)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (6, 4, 3)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (7, 1, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (7, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (7, 4, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (7, 3, 5)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (8, 1, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (8, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (8, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (8, 5, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (8, 2, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (9, 1, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (9, 1, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (9, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (9, 4, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (9, 3, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (10, 1, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (10, 2, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (10, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (10, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (10, 3, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (11, 1, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (11, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (11, 2, 6)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (11, 3, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (11, 5, 5)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (12, 1, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (12, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (12, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (12, 3, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (12, 4, 6)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (13, 1, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (13, 2, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (13, 2, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (13, 4, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (13, 3, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (14, 1, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (14, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (14, 2, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (14, 3, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (14, 5, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (15, 1, 2)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (15, 1, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (15, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (15, 4, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (15, 3, 4)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (16, 1, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (16, 1, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (16, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (16, 2, 7)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (17, 1, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (17, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (17, 3, 6)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (17, 4, 8)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (18, 1, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (18, 2, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (18, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (18, 5, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (18, 2, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (19, 1, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (19, 1, 3)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (19, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (19, 3, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (19, 5, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (20, 1, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (20, 2, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (20, 2, 8)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (20, 2, 9)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (20, 3, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (21, 1, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (21, 2, 10)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (21, 2, 4)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (21, 3, 5)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (21, 4, 2)

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (22, 1, 6)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (22, 2, 7)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (22, 3, 1)
INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (22, 4, 2)
