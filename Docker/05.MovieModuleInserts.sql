-- create database cinemaMainDB;
-- use cinemaMainDB;

-- select *from Movie;
-- select *from DICTMovieType;
-- select *from DICTMovieState;
-- select *from DICTPersonType;
-- select *from Person;
-- select *from MoviePersonPersonType;

--------------------------------------------------- dictonary inserts ------------------------------------------------------
USE io;
-- 1) Movie Type inserts --

INSERT INTO dictmovietype
VALUES ('Action')
        ,
       ('Animation')
        ,
       ('Comedy')
        ,
       ('Crime')
        ,
       ('Drama')
        ,
       ('Fantasy')
        ,
       ('Historical')
        ,
       ('Horror')
        ,
       ('Romance')
        ,
       ('Science Fiction')
        ,
       ('Thriller')
        ,
       ('Western')
        ,
       ('Other')
PRINT 'Inserted DICTMovieType'
-- 2) Movie State inserts

INSERT INTO dictmoviestate
VALUES ('Upcoming'),
       ('Current'),
       ('Expired')
PRINT 'Inserted DICTMovieState'
--3) Person Type inserts

INSERT INTO dictpersontype
VALUES ('Director')
        ,
       ('Actor')
        ,
       ('Screenwriter')
        ,
       ('Editor')
        ,
       ('Camera Operator')
PRINT 'Inserted DICTPersonType'

--------------------------------------------------- main inserts ------------------------------------------------------

-- 1) Movie inserts --

INSERT INTO movie
VALUES (1, 0, 1, 5, 2, 'Titanic', 'Di Caprio first success', '3:20:00')
        ,
       (1, 1, 0, 1, 1, 'Fast and furious', 'Too fast to catch', '2:15:00')
        ,
       (1, 0, 0, 10, 3, 'Black panther', 'Marvel popular hit', '1:56:00')
        ,
       (1, 1, 0, 2, 2, 'Smolin the king', 'About the whitest of ppl', '1:30:00')
        ,
       (1, 0, 1, 6, 2, 'Women on FTIMS', 'Powerfull and dangerous', '2:37:00')
        ,
       (1, 1, 0, 11, 1, 'Final judgement', 'Final round with Ewka', '1:54:00')
        ,
       (1, 1, 1, 12, 3, 'WEEIA vs FTIMS', 'Only one true win(n)er', '1:40:00')
        ,
       (1, 0, 0, 8, 2, 'Electro exam', 'Rand(time(NULL))', '2:27:00')
        ,
       (1, 0, 1, 4, 2, 'Hope dies last', 'Java 1.2 with prof. Niewiadomski', '2:45:00')
        ,
       (1, 1, 0, 9, 1, 'Here we go again', '2020 sysop editon', '3:03:00')
        ,
       (1, 1, 0, 2, 1, 'WFTIMS true heros', 'Mega saved another student', '1:41:00')
        ,
       (1, 1, 0, 3, 3, 'Its good that you remember', 'S. Sciezko warm-up', '1:30:00')
        ,
       (1, 0, 1, 4, 3, 'First but not last', 'XML exam', '1:42:00')
        ,
       (1, 1, 0, 3, 2, '...yessss, ... of course', 'Electro logic gates lesson', '1:35:00')
        ,
       (1, 1, 1, 9, 3, 'Works like a charm', 'First test suit on object oriented programming',
        '2:15:00')
        ,
       (1, 0, 0, 7, 3, 'Never ending story', 'Mrs Ochelska is not here', '2:20:00')
        ,
       (1, 0, 1, 6, 1, 'Too good to be true', 'Kacpro will be alone today', '1:29:00')
        ,
       (1, 1, 0, 8, 2, 'I will not let you...', 'SQL exam', '2:51:00')
        ,
       (0, 1, 0, 7, 2, 'Bad decisions', 'White Sysops and Shining Kompo', '1:50:00')
        ,
       (1, 1, 0, 2, 1, 'Slowly but surely', 'Kamil Winer walk', '2:04:00')
        ,
       (1, 1, 0, 10, 3, 'Its never too late', 'Trying too start doing anything for studies',
        '2:13:00')
        ,
       (0, 1, 0, 13, 2, 'Blind in elevator', 'Is that 3rd floor?', '1:44:00')
PRINT 'Inserted Movie'
-- 2) Person inserts --

INSERT INTO person (firstname, lastname, dateborn)
VALUES ('Mateusz', 'Walczak', '1982-07-30')
        ,
       ('Konrad', 'Kajszczak', '1938-09-02')
        ,
       ('Brad', 'Pitt', '1974-05-13')
        ,
       ('Morgan', 'Freeman', '1956-09-11')
        ,
       ('Michal', 'Zebrowski', '1975-11-28')
        ,
       ('Geaorge', 'Clooney', '1972-09-11')
        ,
       ('Angelina', 'Jolie', '1968-11-25')
        ,
       ('Leonardo', 'Di Caprio', '1990-03-23')
        ,
       ('Piotr', 'Adamczyk', '1982-06-13')
        ,
       ('Katarzyna', 'Kowalska', '1949-01-03')
PRINT 'Inserted Person'

-- 3) MoviePersonPerosnType inserts 

INSERT INTO moviepersonpersontype (movieid, persontypeid, personid)
VALUES (1, 1, 3)
        ,
       (1, 2, 4)
        ,
       (1, 2, 7)
        ,
       (1, 3, 6)
        ,
       (1, 5, 2)
        ,
       (2, 1, 1)
        ,
       (2, 2, 7)
        ,
       (2, 2, 9)
        ,
       (2, 4, 3)
        ,
       (2, 3, 6)
        ,
       (3, 1, 1)
        ,
       (3, 2, 4)
        ,
       (3, 2, 5)
        ,
       (3, 4, 7)
        ,
       (3, 3, 2)
        ,
       (4, 1, 4)
        ,
       (4, 2, 3)
        ,
       (4, 2, 1)
        ,
       (4, 3, 5)
        ,
       (4, 5, 2)
        ,
       (5, 1, 2)
        ,
       (5, 1, 7)
        ,
       (5, 2, 3)
        ,
       (5, 4, 5)
        ,
       (5, 3, 4)
        ,
       (6, 1, 10)
        ,
       (6, 1, 9)
        ,
       (6, 2, 8)
        ,
       (6, 2, 7)
        ,
       (6, 3, 2)
        ,
       (6, 4, 3)
        ,
       (7, 1, 8)
        ,
       (7, 2, 8)
        ,
       (7, 4, 7)
        ,
       (7, 3, 5)
        ,
       (8, 1, 7)
        ,
       (8, 2, 8)
        ,
       (8, 2, 9)
        ,
       (8, 5, 5)
        ,
       (8, 2, 2)
        ,
       (9, 1, 10)
        ,
       (9, 1, 3)
        ,
       (9, 2, 9)
        ,
       (9, 4, 5)
        ,
       (9, 3, 2)
        ,
       (10, 1, 7)
        ,
       (10, 2, 10)
        ,
       (10, 2, 8)
        ,
       (10, 2, 9)
        ,
       (10, 3, 2)
        ,
       (11, 1, 4)
        ,
       (11, 2, 3)
        ,
       (11, 2, 6)
        ,
       (11, 3, 7)
        ,
       (11, 5, 5)
        ,
       (12, 1, 1)
        ,
       (12, 2, 7)
        ,
       (12, 2, 9)
        ,
       (12, 3, 5)
        ,
       (12, 4, 6)
        ,
       (13, 1, 1)
        ,
       (13, 2, 4)
        ,
       (13, 2, 5)
        ,
       (13, 4, 7)
        ,
       (13, 3, 2)
        ,
       (14, 1, 4)
        ,
       (14, 2, 3)
        ,
       (14, 2, 1)
        ,
       (14, 3, 5)
        ,
       (14, 5, 2)
        ,
       (15, 1, 2)
        ,
       (15, 1, 7)
        ,
       (15, 2, 3)
        ,
       (15, 4, 5)
        ,
       (15, 3, 4)
        ,
       (16, 1, 10)
        ,
       (16, 1, 9)
        ,
       (16, 2, 8)
        ,
       (16, 2, 7)
        ,
       (17, 1, 8)
        ,
       (17, 2, 8)
        ,
       (17, 3, 6)
        ,
       (17, 4, 8)
        ,
       (18, 1, 8)
        ,
       (18, 2, 3)
        ,
       (18, 2, 9)
        ,
       (18, 5, 5)
        ,
       (18, 2, 2)
        ,
       (19, 1, 10)
        ,
       (19, 1, 3)
        ,
       (19, 2, 7)
        ,
       (19, 3, 5)
        ,
       (19, 5, 2)
        ,
       (20, 1, 9)
        ,
       (20, 2, 10)
        ,
       (20, 2, 8)
        ,
       (20, 2, 9)
        ,
       (20, 3, 2)
        ,
       (21, 1, 10)
        ,
       (21, 2, 10)
        ,
       (21, 2, 4)
        ,
       (21, 3, 5)
        ,
       (21, 4, 2)
        ,
       (22, 1, 6)
        ,
       (22, 2, 7)
        ,
       (22, 3, 1)
        ,
       (22, 4, 2)
PRINT 'Inserted MoviePersonPersonType'
