CREATE DATABASE io;
GO

USE io;
--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- SETTINGS  - Table contains settings of system
--- CREATED BY: PZajac
--- drop table SETTINGS
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'SETTINGS'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table SETTINGS';

        CREATE TABLE [dbo].settings (
            id     BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited

            symbol NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            value  NVARCHAR(250) COLLATE polish_cs_as        NOT NULL DEFAULT '',

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT settings_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'SETTINGS_Id')
--BEGIN
--	Print 'Crating index  SETTINGS_Id';
--	CREATE UNIQUE INDEX SETTINGS_Id 	 ON SETTINGS(Id);
--END;
--GO
--- finish SETTINGS

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Product  - Table contains product detail
--- CREATED BY: PZajac
--- drop table Product
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Product'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Product';

        CREATE TABLE [dbo].product (
            id    BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name  NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            price DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT product_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Product_Id')
--BEGIN
--	Print 'Crating index  Product_Id';
--	CREATE UNIQUE INDEX Product_Id 	 ON Product(Id);
--END;
--GO
--- finish Product


--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- PackPO  - Table contains pack position
--- CREATED BY: PZajac
--- drop table PackPO
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'PackPO'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table PackPO';

        CREATE TABLE [dbo].packpo (
            id        BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            packhid   BIGINT                                    NOT NULL DEFAULT 0,
            productid BIGINT                                    NOT NULL DEFAULT 0,

            -- Fields to be edited
            amount    DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'
            _price    DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- This line should be removed if the table does not have primary key
            CONSTRAINT packpo_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'PackPO_Id')
--BEGIN
--	Print 'Crating index  PackPO_Id';
--	CREATE UNIQUE INDEX PackPO_Id 	 ON PackPO(Id);
--END;
--GO
--- finish PackPO

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- PackH  - Table cointains pack header
--- CREATED BY: PZajac
--- drop table PackH
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'PackH'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table PackH';

        CREATE TABLE [dbo].packh (
            id     BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name   NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'
            _price DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- This line should be removed if the table does not have primary key
            CONSTRAINT packh_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'PackH_Id')
--BEGIN
--	Print 'Crating index  PackH_Id';
--	CREATE UNIQUE INDEX PackH_Id 	 ON PackH(Id);
--END;
--GO
--- finish PackH

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- SalePO  - Table contains sale position
--- CREATED BY: PZajac
--- drop table SalePO
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'SalePO'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table SalePO';

        CREATE TABLE [dbo].salepo (
            id      BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            packhid BIGINT                                    NOT NULL DEFAULT 0,
            salehid BIGINT                                    NOT NULL DEFAULT 0,

            -- Fields to be edited
            amount  DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'
            _price  DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- This line should be removed if the table does not have primary key
            CONSTRAINT salepo_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'SalePO_Id')
--BEGIN
--	Print 'Crating index  SalePO_Id';
--	CREATE UNIQUE INDEX SalePO_Id 	 ON SalePO(Id);
--END;
--GO
--- finish SalePO

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- SaleH  - Table contains sale header
--- CREATED BY: PZajac
--- drop table SaleH
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'SaleH'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table SaleH';

        CREATE TABLE [dbo].saleh (
            id       BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            userid   BIGINT                                    NOT NULL DEFAULT 0,

            -- Fields to be edited

            -- Other fiels
            saledate DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'
            _price   DECIMAL(9, 2)                             NOT NULL DEFAULT 0,

            -- This line should be removed if the table does not have primary key
            CONSTRAINT saleh_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'SaleH_Id')
--BEGIN
--	Print 'Crating index  SaleH_Id';
--	CREATE UNIQUE INDEX SaleH_Id 	 ON SaleH(Id);
--END;
--GO
--- finish SaleH

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Users  - Table contains users information
--- CREATED BY: PZajac
--- drop table Users
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Users'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Users';

        CREATE TABLE [dbo].users (
            id           BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            firstname    NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            lastname     NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            login        NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            passwordhash NVARCHAR(MAX) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            codehash     NVARCHAR(MAX) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            basesalary   DECIMAL(9, 2)                             NOT NULL DEFAULT 0,
            hourlyrate   DECIMAL(9, 2)                             NOT NULL DEFAULT 0,
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT users_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Users_Id')
--BEGIN
--	Print 'Crating index  Users_Id';
--	CREATE UNIQUE INDEX Users_Id 	 ON Users(Id);
--END;
--GO
--- finish Users

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- UsersPermission  - Table contains info about users permission
--- CREATED BY: PZajac
--- drop table UsersPermission
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'UsersPermission'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table UsersPermission';

        CREATE TABLE [dbo].userspermission (
            id           BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            permissionid BIGINT                                    NOT NULL DEFAULT 0,
            userid       BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT userspermission_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'UsersPermission_Id')
--BEGIN
--	Print 'Crating index  UsersPermission_Id';
--	CREATE UNIQUE INDEX UsersPermission_Id 	 ON UsersPermission(Id);
--END;
--GO
--- finish UsersPermission

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTPermission  - Table contains dictionary of user permission
--- CREATED BY: PZajac
--- drop table DICTPermission
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTPermission'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTPermission';

        CREATE TABLE [dbo].dictpermission (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(200)                             NOT NULL DEFAULT '',
            code INT                                       NOT NULL DEFAULT 0,
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictpermission_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTPermission_Id')
--BEGIN
--	Print 'Crating index  DICTPermission_Id';
--	CREATE UNIQUE INDEX DICTPermission_Id 	 ON DICTPermission(Id);
--END;
--GO
--- finish DICTPermission

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- TnAData  - Table contains T&A workers data
--- CREATED BY: PZajac
--- drop table TnAData
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'TnAData'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table TnAData';

        CREATE TABLE [dbo].tnadata (
            id       BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            usersid  BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited
            dateday  DATE                                      NOT NULL DEFAULT '1900-01-01',
            timefrom DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            timeto   DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT tnadata_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'TnAData_Id')
--BEGIN
--	Print 'Crating index  TnAData_Id';
--	CREATE UNIQUE INDEX TnAData_Id 	 ON TnAData(Id);
--END;
--GO
--- finish TnAData

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Task  - Table contains task detail
--- CREATED BY: PZajac
--- drop table Task
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Task'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Task';

        CREATE TABLE [dbo].task (
            id          BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name        NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            description NVARCHAR(1000) COLLATE polish_cs_as       NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT task_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Task_Id')
--BEGIN
--	Print 'Crating index  Task_Id';
--	CREATE UNIQUE INDEX Task_Id 	 ON Task(Id);
--END;
--GO
--- finish Task

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Schedule  - Table contains user's shwduled tasks
--- CREATED BY: PZajac
--- drop table Schedule
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Schedule'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Schedule';

        CREATE TABLE [dbo].schedule (
            id              BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            usersid         BIGINT                                    NOT NULL DEFAULT 0,
            taskid          BIGINT                                    NOT NULL DEFAULT 0,
            shedulestatusid BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited
            datefrom        DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            dateto          DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT schedule_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Schedule_Id')
--BEGIN
--	Print 'Crating index  Schedule_Id';
--	CREATE UNIQUE INDEX Schedule_Id 	 ON Schedule(Id);
--END;
--GO
--- finish Schedule

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTScheduleStatus  - Table contains dictionary of schedule status
--- CREATED BY: PZajac
--- drop table DICTScheduleStatus
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTScheduleStatus'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTScheduleStatus';

        CREATE TABLE [dbo].dictschedulestatus (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictschedulestatus_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTScheduleStatus_Id')
--BEGIN
--	Print 'Crating index  DICTScheduleStatus_Id';
--	CREATE UNIQUE INDEX DICTScheduleStatus_Id 	 ON DICTScheduleStatus(Id);
--END;
--GO
--- finish DICTScheduleStatus

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Movie  - Table contains info about movie
--- CREATED BY: PZajac
--- drop table Movie
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Movie'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Movie';

        CREATE TABLE [dbo].movie (
            id           BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields
            flg2d        TINYINT                                   NOT NULL DEFAULT 0,
            flg3d        TINYINT                                   NOT NULL DEFAULT 0,
            flgvr        TINYINT                                   NOT NULL DEFAULT 0,
            -- Fields that will be joined with other tables
            movietypeid  BIGINT                                    NOT NULL DEFAULT 0,
            moviestateid BIGINT                                    NOT NULL DEFAULT 0,

            -- Fields to be edited
            title        NVARCHAR(250) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            description  NVARCHAR(1000) COLLATE polish_cs_as       NOT NULL DEFAULT '',
            movietime    TIME(3)                                            DEFAULT '00:00:00',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT movie_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Movie_Id')
--BEGIN
--	Print 'Crating index  Movie_Id';
--	CREATE UNIQUE INDEX Movie_Id 	 ON Movie(Id);
--END;
--GO
--- finish Movie

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTMovieType  - Table contains dictionary of movie type
--- CREATED BY: PZajac
--- drop table DICTMovieType
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTMovieType'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTMovieType';

        CREATE TABLE [dbo].dictmovietype (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictmovietype_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTMovieType_Id')
--BEGIN
--	Print 'Crating index  DICTMovieType_Id';
--	CREATE UNIQUE INDEX DICTMovieType_Id 	 ON DICTMovieType(Id);
--END;
--GO
--- finish DICTMovieType

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTMovieState  - Table contains dictionary of movie state
--- CREATED BY: PZajac
--- drop table DICTMovieState
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTMovieState'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTMovieState';

        CREATE TABLE [dbo].dictmoviestate (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictmoviestate_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTMovieState_Id')
--BEGIN
--	Print 'Crating index  DICTMovieState_Id';
--	CREATE UNIQUE INDEX DICTMovieState_Id 	 ON DICTMovieState(Id);
--END;
--GO
--- finish DICTMovieState

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Hall  - Table contains hall info
--- CREATED BY: PZajac
--- drop table Hall
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Hall'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Hall';

        CREATE TABLE [dbo].hall (
            id          BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields
            flg2d       TINYINT                                   NOT NULL DEFAULT 0,
            flg3d       TINYINT                                   NOT NULL DEFAULT 0,
            flgvr       TINYINT                                   NOT NULL DEFAULT 0,
            flgx        INT                                       NOT NULL DEFAULT 0,
            flgy        INT                                       NOT NULL DEFAULT 0,
            -- Fields that will be joined with other tables

            -- Fields to be edited
            name        NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            description NVARCHAR(1000) COLLATE polish_cs_as       NOT NULL DEFAULT '',

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT hall_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Hall_Id')
--BEGIN
--	Print 'Crating index  Hall_Id';
--	CREATE UNIQUE INDEX Hall_Id 	 ON Hall(Id);
--END;
--GO
--- finish Hall

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTPersonType  - Table contains dictionary of person type
--- CREATED BY: PZajac
--- drop table DICTPersonType
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTPersonType'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTPersonType';

        CREATE TABLE [dbo].dictpersontype (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictpersontype_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTPersonType_Id')
--BEGIN
--	Print 'Crating index  DICTPersonType_Id';
--	CREATE UNIQUE INDEX DICTPersonType_Id 	 ON DICTPersonType(Id);
--END;
--GO
--- finish DICTPersonType

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Person  - Table contains information about person
--- CREATED BY: PZajac
--- drop table Person
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Person'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Person';

        CREATE TABLE [dbo].person (
            id        BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            firstname NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            lastname  NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            dateborn  DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT person_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Person_Id')
--BEGIN
--	Print 'Crating index  Person_Id';
--	CREATE UNIQUE INDEX Person_Id 	 ON Person(Id);
--END;
--GO
--- finish Person

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- MoviePersonPersonType  - Table connect movie with person and person type
--- CREATED BY: PZajac
--- drop table MoviePersonPersonType
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'MoviePersonPersonType'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table MoviePersonPersonType';

        CREATE TABLE [dbo].moviepersonpersontype (
            id           BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            movieid      BIGINT                                    NOT NULL DEFAULT 0,
            persontypeid BIGINT                                    NOT NULL DEFAULT 0,
            personid     BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT moviepersonpersontype_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'MoviePersonPersonType_Id')
--BEGIN
--	Print 'Crating index  MoviePersonPersonType_Id';
--	CREATE UNIQUE INDEX MoviePersonPersonType_Id 	 ON MoviePersonPersonType(Id);
--END;
--GO
--- finish MoviePersonPersonType

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Performance  - Table contains info about performance
--- CREATED BY: PZajac
--- drop table Performance
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Performance'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Performance';

        CREATE TABLE [dbo].performance (
            id      BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            hallid  BIGINT                                    NOT NULL DEFAULT 0,
            movieid BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited
            addtime TIME(3)                                   NOT NULL DEFAULT '00:00:00',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT performance_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Performance_Id')
--BEGIN
--	Print 'Crating index  Performance_Id';
--	CREATE UNIQUE INDEX Performance_Id 	 ON Performance(Id);
--END;
--GO
--- finish Performance

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- Reservation  - Table contains info about reservation
--- CREATED BY: PZajac
--- drop table Reservation
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'Reservation'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table Reservation';

        CREATE TABLE [dbo].reservation (
            id              BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields
            flgposx         INT                                       NOT NULL DEFAULT 0,
            flgposy         INT                                       NOT NULL DEFAULT 0,

            -- Fields that will be joined with other tables
            statusid        BIGINT                                    NOT NULL DEFAULT 0,
            timetableid     BIGINT                                    NOT NULL DEFAULT 0,
            reservationdate DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01',
            -- Fields to be edited

            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT reservation_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'Reservation_Id')
--BEGIN
--	Print 'Crating index  Reservation_Id';
--	CREATE UNIQUE INDEX Reservation_Id 	 ON Reservation(Id);
--END;
--GO
--- finish Reservation

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- DICTReservationStatus  - Table contains dictionary of reservation status
--- CREATED BY: PZajac
--- drop table DICTReservationStatus
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'DICTReservationStatus'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table DICTReservationStatus';

        CREATE TABLE [dbo].dictreservationstatus (
            id   BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables

            -- Fields to be edited
            name NVARCHAR(100) COLLATE polish_cs_as        NOT NULL DEFAULT '',
            -- Other fiels

            -- Fields to be calculated only by triggers
            -- This kind of fields must begin with '_'

            -- This line should be removed if the table does not have primary key
            CONSTRAINT dictreservationstatus_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'DICTReservationStatus_Id')
--BEGIN
--	Print 'Crating index  DICTReservationStatus_Id';
--	CREATE UNIQUE INDEX DICTReservationStatus_Id 	 ON DICTReservationStatus(Id);
--END;
--GO
--- finish DICTReservationStatus

--------------------------------------------------------------------------------------------
--- TABLE DEFINITION
--- TimeTable  - Table contains info about timetable
--- CREATED BY: PZajac
--- drop table TimeTable
--------------------------------------------------------------------------------------------

IF db_name() <> 'master' AND
   NOT exists(SELECT *
              FROM information_schema.tables
              WHERE table_name = 'TimeTable'
                AND table_type = 'BASE TABLE')
    BEGIN
        PRINT 'Creating table TimeTable';

        CREATE TABLE [dbo].timetable (
            id              BIGINT IDENTITY (1,1) NOT FOR REPLICATION NOT NULL, -- Primary Key
            -- Status-like fields

            -- Fields that will be joined with other tables
            performanceid   BIGINT                                    NOT NULL DEFAULT 0,
            -- Fields to be edited
            performancedate DATETIME2(3)                              NOT NULL DEFAULT '1900-01-01'
                -- Other fiels

                -- Fields to be calculated only by triggers
                -- This kind of fields must begin with '_'

                -- This line should be removed if the table does not have primary key
                CONSTRAINT timetable_id PRIMARY KEY CLUSTERED (id)
        );

    END;
GO
-- This line should be removed if the table has primary key
--if not exists (select * from sysindexes where name like 'TimeTable_Id')
--BEGIN
--	Print 'Crating index  TimeTable_Id';
--	CREATE UNIQUE INDEX TimeTable_Id 	 ON TimeTable(Id);
--END;
--GO

--- finish TimeTable