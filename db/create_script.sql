-- Step: 01
-- Goal: Create a new database mvc-2209c-herkansen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            02-006-2023      Shahed Amer                     New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `mvc-2209c-herkansen`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `mvc-2209c-herkansen`;

-- Use database Mvc-2209c-P4
Use `mvc-2209c-herkansen`;

-- Step: 02
-- Goal: Create a new table Examen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Shahed Amer                    New
-- **********************************************************************************

-- Drop table Lespakket
DROP TABLE IF EXISTS Lespakket;

CREATE TABLE IF NOT EXISTS Lespakket
(
    Id                   TINYINT         UNSIGNED     NOT NULL    AUTO_INCREMENT
   ,PakketNaam          VARCHAR(50)                  NOT NULL
   ,AantalLessen         INT(10)                      NOT NULL
   ,Rijbewijscategorie   VARCHAR(5)       NOT NULL
   ,Prijs                VARCHAR(10)                      NOT NULL
   ,IsActief             BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen          VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt      DateTime(6)                     NOT NULL
   ,DatumGewijzigd       DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Lespakket_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Lespakket with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            02-06-2023      Shahed Amer                    New
-- **********************************************************************************/

INSERT INTO Lespakket
(
    PakketNaam
   ,AantalLessen       
   ,Rijbewijscategorie
   ,Prijs  
   ,IsActief
   ,Opmerkingen
   ,DatumAangemaakt
   ,DatumGewijzigd
)
VALUES
     ('Personenauto Extra', '40', 'B', '2700', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Vrachtwagen Subliem', '60', 'C', '5400', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bus Extraordinaire', '80', 'D', '7300', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bromfiets', '10', 'AM', '230', 1, NULL, SYSDATE(6), SYSDATE(6));


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Step: 06
-- Goal: Create a new table Leerling
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Shahed Amer                    New
-- **********************************************************************************/

-- Drop table Leerling
DROP TABLE IF EXISTS Leerling;

CREATE TABLE IF NOT EXISTS Leerling
(
    Id                       TINYINT         UNSIGNED            NOT NULL    AUTO_INCREMENT
   ,Voornaam                 VARCHAR(50)                         NOT NULL
   ,Tussenvoegsel            VARCHAR(10)                         NOT NULL
   ,Achternaam               VARCHAR(30)                         NOT NULL
   ,Mobiel                   VARCHAR(12)                        NOT NULL
   ,IsActief                 BIT                                NOT NULL    DEFAULT 1
   ,Opmerkingen              VARCHAR(250)                       NULL    DEFAULT NULL
   ,DatumAangemaakt          DateTime(6)                        NOT NULL
   ,DatumGewijzigd           DateTime(6)                        NOT NULL

   ,CONSTRAINT      PK_Leerling_Id   PRIMARY KEY CLUSTERED(Id)
   

) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table Voertuig with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Shahed Amer                    New
-- **********************************************************************************/

INSERT INTO Leerling
(
     Voornaam                 
    ,Tussenvoegsel            
    ,Achternaam               
    ,Mobiel    
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES 
('Bas', 'De', 'Bakker', '06-28493823', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Terence', '', 'Draaijer', '06-39398734', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Samuel', '', 'Werachter', '06-24383291', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Sharida', '', 'Tetehuka', '06-48293823', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Fatma', '', 'Yilmaz', '06-34291234', 1, NULL, SYSDATE(6), SYSDATE(6));

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Step: 04
-- Goal: Create a new table LeerlingPerLesPakket
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Shahed Amer                    New
-- **********************************************************************************/

-- Drop table LeerlingPerLesPakket
DROP TABLE IF EXISTS LeerlingPerLesPakket;

CREATE TABLE IF NOT EXISTS LeerlingPerLesPakket
(
    Id                      TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,LespakketId                TINYINT          UNSIGNED               NOT NULL
   ,LeerlingId            TINYINT             UNSIGNED            NOT NULL
   ,StartDatumRijlessen     DATE                                NOT NULL
   ,DatumRijbewijsBehaald   VARCHAR(20)                                NOT NULL
   ,IsActief                BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen             VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt         DateTime(6)                     NOT NULL
   ,DatumGewijzigd          DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_LeerlingPerLesPakket_Id   PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_LeerlingPerLesPakket_LespakketId_Lespakket_Id FOREIGN KEY (LespakketId) REFERENCES Lespakket(Id)
   ,CONSTRAINT      FK_LeerlingPerLesPakket_LeerlingId_Leerling_Id FOREIGN KEY (LeerlingId) REFERENCES Leerling(Id)

) ENGINE=InnoDB;

-- Step: 05
-- Goal: Fill table LeerlingPerLesPakket with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Shahed Amer                    New
-- **********************************************************************************

INSERT INTO LeerlingPerLesPakket
(
    LespakketId
    ,LeerlingId
    ,StartDatumRijlessen
    ,DatumRijbewijsBehaald
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('1', '5','2023-05-23' ,'NULL',1, NULL, SYSDATE(6), SYSDATE(6))
    ,('4', '1','2022-06-03' ,'05-08-2022',1, NULL, SYSDATE(6), SYSDATE(6))
    ,('1', '1','2023-06-02' ,'NULL',1, NULL, SYSDATE(6), SYSDATE(6))
    ,('3', '4', '2023-01-01','NULL',1, NULL, SYSDATE(6), SYSDATE(6))
    ,('1', '2', '2022-11-30','23-05-2023',1, NULL, SYSDATE(6), SYSDATE(6))
    ,('2', '3', '2022-06-06','06-06-2023',1, NULL, SYSDATE(6), SYSDATE(6));
