USE io;
INSERT INTO dbo.dictpermission (name, code)
VALUES ('Dodawanie filmow', 1),
       ('Usuwanie filmow', 2),
       ('Edytowanie filmow', 3),
       ('Tworzenie nowych uzytkownikow', 4),
       ('Usuwanie uzytkownikow', 5),
       ('Tworzenie raportow', 6),
       ('Administrator', 7),
       ('Pracownik', 8)
PRINT 'Inserted DICTPermission'
