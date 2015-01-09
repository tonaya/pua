/*National Polling Unit Database
Designed by Anthonia Ohwovoriole
On 12/12/2014
Added ElectionTypes and Election Event tables on 05/01/2015
altered UsersReview table and added electTypeID on 05/01/2015
*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS States;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE States (
stateID char(4),
Name varchar(64),
PRIMARY KEY(stateID)
);




SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Reviews;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE Reviews(
reviewID int auto_increment,
`desc`  varchar(255) not null,
primary key(reviewID)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Gender;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE Gender(
`ID` char(1),
`desc`  char(6) not null,
primary key(`ID`)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Users(
deviceID varchar(64) not null,
Name  varchar(100),
`ID`  char(1) not null,
primary key(deviceID),
foreign key(`ID`) references Gender(`ID`) on delete cascade on update no action
);



SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS UserComments;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE UserComments(
deviceID varchar(64) not null,
pu_loc_id varchar(255) not null,
`time` timestamp not null,
`comment` varchar(5000),
primary key(deviceID,pu_loc_id),
foreign key(deviceID) references Users(deviceID) on delete cascade on update no action,
foreign key(pu_loc_id) references npu(pu_loc_id) on delete cascade on update no action
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ElectionTypes;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE ElectionTypes(
electTypeID INT auto_increment,
`desc` varchar(255),
primary key (electTypeID)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ElectionEvents;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE ElectionEvents(
electID INT auto_increment,
electTypeID INT,
electDate date,
primary key (electID),
Foreign key(electTypeID) references ElectionTypes(electTypeID) on delete cascade on update no action
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS UsersReview;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE UsersReview(
rid int auto_increment,
reviewID int not null,
deviceID varchar(64) not null,
pu_loc_id varchar(255) not null,
electID int,
primary key(rid),
foreign key(reviewID) references Reviews(reviewID) on delete cascade on update no action,
foreign key(deviceID) references Users(deviceID) on delete cascade on update no action,
foreign key(pu_loc_id) references npu(pu_loc_id) on delete cascade on update no action,
foreign key(electID) references ElectionEvents(electID) on delete cascade on update no action
);