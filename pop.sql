-- Populate script for National Polling Unit Database 

-- --Populate for Gender--
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Gender;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Gender(`ID`,`desc`) VALUES ('f', 'Female');
INSERT INTO Gender(`ID`,`desc`) VALUES ('m', 'Male');
-- ---------------------------------
-- --Populate for Reviews--
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Reviews;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Reviews(`desc`) VALUES ('Peaceful Election');
INSERT INTO Reviews(`desc`) VALUES ('Non-Peaceful Election');
INSERT INTO Reviews(`desc`) VALUES ('No Election');
INSERT INTO Reviews(`desc`) VALUES ('Rigged Election');
INSERT INTO Reviews(`desc`) VALUES ('Perfect Election');
-- -------------------------------

-- --Populate for Users--
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Users;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Users (deviceID,Name,`ID`) VALUES ('123DEV','Anthonia','f');
INSERT INTO Users (deviceID,Name,`ID`) VALUES ('9887DEV','Bulama','m');
INSERT INTO Users (deviceID,Name,`ID`) VALUES ('88485DEV','Afoma','f');
INSERT INTO Users (deviceID,Name,`ID`) VALUES ('qyw7yDEV','Collins','m');
INSERT INTO Users (deviceID,Name,`ID`) VALUES ('yqg34DEV','Kate','f');

-- -------------------------------------------------
-- --Popluate ElectionTypes----
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ElectionTypes;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO ElectionTypes(`desc`) VALUES ('presidential election');
INSERT INTO ElectionTypes(`desc`) VALUES ('national assembly election');
INSERT INTO ElectionTypes(`desc`) VALUES ('governorship election');
INSERT INTO ElectionTypes(`desc`) VALUES ('state house of assembly election');
-- ------------------------------------------------------------------
-- --Popluate ElectionEvents----
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ElectionEvents;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO ElectionEvents(electTypeID,electDate) VALUES (1,'2015-02-14');
INSERT INTO ElectionEvents(electTypeID,electDate) VALUES (2,'2015-02-14');
INSERT INTO ElectionEvents(electTypeID,electDate) VALUES (3,'2015-02-28');
INSERT INTO ElectionEvents(electTypeID,electDate) VALUES (4,'2015-02-28');


-- ---------------------------------
-- --Populate UsersReview--
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE UsersReview;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (1,'123DEV','AB0101001',1);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (2,'9887DEV','AB0101001',2);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (3,'88485DEV','AB0101001',1);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (1,'qyw7yDEV','AB0101002',3);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (4,'yqg34DEV','AB0101002',1);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (3,'9887DEV','AB0101002',1);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (1,'88485DEV','AB0101003',1);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (5,'123DEV','AB0101003',3);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (2,'yqg34DEV','AB0101003',2);
INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) VALUES (1,'yqg34DEV','AB0101004',4);
-- ----------------------------------------
/*-- --Populate UserComments--
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE UserComments;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO UserComments (deviceID,pu_loc_id,`time`,`comment`) VALUES ('123DEV','AB0101001',now(),'Wonderful election, everyone is voting peacefully');
INSERT INTO UserComments (deviceID,pu_loc_id,`time`,`comment`) VALUES ('9887DEV','AB0101001',now(),'Election things!!!!');





INSERT INTO States (stateID,Name) Values('AB','Abia'),('AD', 'Adamawa'),('AK','Akwa Ibom'),('AN','Anambra'),('BA','Bauchi'),
('BN','Benue'),('BO','Borno'),('BY','Bayelsa'),('CR','Cross River'),('DT','Delta'),('EB','Ebonyi'),('ED','Edo'),('EK','Ekiti'),('EN','Enugu'),
('FC','Federal Capital Territory'),('GM','Gombe'),('IM','Imo'),('JG','Jigawa'),('KB','Kebbi'),('KD','Kaduna'),('KG','Kogi'),('KN','Kano'),
('KT','Kastina'),('KW','Kwara'),('LA','Lagos'),('NG','Niger'),('NW','Nasarawa'),('OD','Ondo'),('OG','Ogun'),('OS','Osun'),('OY','Oyo'),
('PL','Plateau'),('RV','Rivers'),('SO','Sokoto'),('TR','Taraba'),('YB','Yobo'),('ZF','Zamfara');

*/
