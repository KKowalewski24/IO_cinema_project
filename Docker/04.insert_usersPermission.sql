USE io;
INSERT INTO dbo.userspermission (userid, permissionid)
VALUES (1, 1)
        ,
       (2, 1)
        ,
       (2, 2)
        ,
       (2, 3)
        ,
       (1, 6)
        ,
       (4, 1)
        ,
       (2, 4)
        ,
       (2, 5);
PRINT 'Inserted UsersPermission'
