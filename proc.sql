/*DELIMITER //
DROP PROCEDURE searchPollUnit //
CREATE PROCEDURE searchPollUnit (IN in_pu_loc_id varchar(255),
				  IN in_state varchar(4),
				  IN in_lga varchar(16),
				  IN in_ra varchar(16),
				  IN in_pu varchar(16),
				  IN in_buildingTypeID varchar(16),
				  IN in_lat varchar(16),
				  IN in_long varchar(16),
				  IN in_puLocNumAffilations varchar(3),
				  IN in_puLocDesc varchar(255))
			    
BEGIN
	DECLARE gotsth INT DEFAULT 0;
	DECLARE qstr varchar(512) DEFAULT "";
	    SET @qstr0 = "select n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc from npu n";
	
	  IF  in_pu_loc_id <> '' OR in_state <> '' OR in_lga <> '' OR in_ra <> '' OR in_pu <> '' OR in_buildingTypeID <> '' OR in_lat <> '' OR in_long <> '' OR 
		  in_puLocNumAffilations <> '' OR in_puLocDesc <> '' THEN
		  
		  IF in_pu_loc_id <> '' THEN
			  SET qstr:= concat(qstr," n.pu_loc_id LIKE '%", in_pu_loc_id, "%' ");
			  SET gotsth = TRUE;
		  END IF;
	    
		  IF in_state <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.state LIKE '%", in_state, "%' ");
			  SET gotsth = 1;
		  END IF;
	    
		  IF in_lga <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.lga LIKE '%", in_lga, "%' ");
			  SET gotsth = 2;
		  END IF;
	    
		  IF in_ra <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.ra LIKE '%", in_ra, "%' ");
			  SET gotsth = 3;
		  END IF;
	    
		  IF in_pu <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.pu LIKE '%", in_pu, "%' ");
			  SET gotsth = 4;
		  END IF;
	    
		  IF in_buildingTypeID <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.buildingTypeID LIKE '%", in_buildingTypeID, "%' ");
			  SET gotsth = 5;
		  END IF;
	    
		  IF in_lat <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.lat LIKE '%", in_lat, "%' ");
			  SET gotsth = 6;
		  END IF;
	    
		  IF in_long <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.long LIKE '%", in_long, "%' ");
			  SET gotsth = 7;
		  END IF;
	      
		  IF in_puLocNumAffilations <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.puLocNumAffilations LIKE '%", in_puLocNumAffilations, "%' ");
			  SET gotsth = 8;
		 END IF;
	    
		 IF in_puLocDesc <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.puLocDesc LIKE '%", in_puLocDesc, "%' ");
			  SET gotsth = 9;
		 END IF;
	  END IF;
	    
	  IF gotsth THEN
		SET @qstr = CONCAT(@qstr0," WHERE ",qstr);
	  ELSE 
		SET @qstr =@qstr0; 
	  END IF;
 
      PREPARE stmt FROM @qstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
END //
DELIMITER ;*/


DELIMITER //
DROP PROCEDURE searchPollUnit //
CREATE PROCEDURE searchPollUnit (IN in_pu_loc_id varchar(255),
				  IN in_state varchar(4),
				  IN in_lga varchar(16),
				  IN in_ra varchar(16),
				  IN in_pu varchar(16),
				  IN in_buildingTypeID varchar(16),
				  IN in_lat decimal(11,9),
				  IN in_long decimal(11,9),
				  IN in_puLocNumAffilations varchar(3),
				  IN in_puLocDesc varchar(255))
			    
BEGIN
	DECLARE gotsth INT DEFAULT 0;
	DECLARE qstr varchar(512) DEFAULT "";
	    SET @qstr0 = "select n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,ur.deviceID,ur.reviewID from npu n left join UsersReview ur on n.pu_loc_id = ur.pu_loc_id ";
	
	  IF  in_pu_loc_id <> '' OR in_state <> '' OR in_lga <> '' OR in_ra <> '' OR in_pu <> '' OR in_buildingTypeID <> '' OR in_lat <> '' OR in_long <> '' OR  in_puLocNumAffilations <> '' OR in_puLocDesc <> '' THEN
		  
		  IF in_pu_loc_id <> '' THEN
			  SET qstr:= concat(qstr," n.pu_loc_id LIKE '%", in_pu_loc_id, "%' "); 
			  SET gotsth = TRUE;
		  END IF;
	    
		  IF in_state <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.state LIKE '", in_state, "%' ");
			  SET gotsth = 1;
		  END IF;
	    
		  IF in_lga <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.lga LIKE '", in_lga, "%' ");
			  SET gotsth = 2;
		  END IF;
	    
		  IF in_ra <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.ra LIKE '%", in_ra, "%' ");
			  SET gotsth = 3;
		  END IF;
	    
		  IF in_pu <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.pu LIKE '%", in_pu, "%' ");
			  SET gotsth = 4;
		  END IF;
	    
		  IF in_buildingTypeID <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.buildingTypeID LIKE '%", in_buildingTypeID, "%' ");
			  SET gotsth = 5;
		  END IF;
	    
		 IF in_lat <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, "n.lat LIKE '", in_lat,  "%' " );
			  SET gotsth = 6;
		  END IF;
	    
		  IF in_long <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.long LIKE '", in_long, "%' ");
			  SET gotsth = 7;
		  END IF;
	      
		  IF in_puLocNumAffilations <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.puLocNumAffilations LIKE '%", in_puLocNumAffilations, "%' ");
			  SET gotsth = 8;
		 END IF;
	    
		 IF in_puLocDesc <> '' THEN
			IF gotsth THEN SET qstr = CONCAT(qstr, " AND "); END IF;
			  SET qstr = CONCAT(qstr, " n.puLocDesc LIKE '%", in_puLocDesc, "%' ");
			  SET gotsth = 9;
		 END IF;
	  END IF;
	    
	  IF gotsth THEN
		SET @qstr = CONCAT(@qstr0," WHERE ",qstr);
	  ELSE 
		SET @qstr =@qstr0; 
	  END IF;
 
      PREPARE stmt FROM @qstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
END //
DELIMITER ;


/*mysqldump -P 3310 -h 127.0.0.1 -u mysql_user -p database_name table_name */


-- -------------------------------------------------------------
-- Procedure to delete User

DELIMITER //
DROP PROCEDURE IF EXISTS deleteUser //
CREATE PROCEDURE deleteUser(IN in_deviceID varchar(64))
BEGIN

DELETE FROM Users WHERE deviceID=in_deviceID;

END //
DELIMITER ;
-- ----------------------------

-- Procedure to add structures review

DELIMITER //
DROP PROCEDURE IF EXISTS addReview //
CREATE PROCEDURE addReview(IN in_desc varchar(255))
BEGIN

INSERT INTO Reviews(`desc`) VALUES(in_desc);

END //
DELIMITER ;
-- ----------------------------

-- Procedure to return all predefined reviews

DELIMITER //
DROP PROCEDURE IF EXISTS getAllReview //
CREATE PROCEDURE getAllReview()

BEGIN

SELECT reviewID as `ID`,`desc` FROM Reviews;

END //
DELIMITER ;
-- -----------------------
-- Procedure to save user review

DELIMITER //
DROP PROCEDURE IF EXISTS addUserReview //
CREATE PROCEDURE addUserReview(IN in_deviceID varchar(64),
			      IN in_name varchar(100),
			      IN in_genderID char(1),
			      IN in_reviewID int,
			      IN in_pu_loc_id varchar(25),
			      IN in_electID INT)
BEGIN

declare a varchar (255);

SET a = (select count(deviceID) from  Users where deviceID = in_deviceID);


IF a = 1 THEN
    INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) values (in_reviewID,in_deviceID,in_pu_loc_id,in_electID);
END IF;

IF a = 0 THEN 
    INSERT INTO Users (deviceID,Name,`ID`) VALUES (in_deviceID,in_name,in_genderID);
    INSERT INTO UsersReview(reviewID,deviceID,pu_loc_id,electID) values (in_reviewID,in_deviceID,in_pu_loc_id,in_electID);
END IF;

END //
DELIMITER ;
-- call addUserReview('123test','tonia','f',8,'AB0101001',1);
-- ----------------------

-- -Procedure to return users reviews based on the polling unit

DELIMITER //
DROP PROCEDURE IF EXISTS getUserReviewForPollUnit //
CREATE PROCEDURE getUserReviewForPollUnit(IN in_pu_loc_id varchar(255))

BEGIN

SELECT n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,ur.deviceID,ur.reviewID,r.desc FROM UsersReview ur
left join npu n on ur.pu_loc_id = n.pu_loc_id 
left join Reviews r on ur.reviewID = r.reviewID
WHERE ur.pu_loc_id = in_pu_loc_id;

END //
DELIMITER ;
-- ----------------------------------------------------
-- -Procedure to return users reviews based on the polling unit and election events

DELIMITER //
DROP PROCEDURE IF EXISTS getUserReviewByElection //
CREATE PROCEDURE getUserReviewByElection(IN in_pu_loc_id varchar(255),
					  IN in_electID int)

BEGIN

SELECT n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,ur.deviceID,ur.reviewID,r.desc,ur.electID FROM UsersReview ur
left join npu n on ur.pu_loc_id = n.pu_loc_id 
left join Reviews r on ur.reviewID = r.reviewID
WHERE ur.pu_loc_id = in_pu_loc_id and ur.electID = in_electID;

END //
DELIMITER ;

-- -----------------
-- Procedure to return summary of reviewID based on electID and Polling unit
DELIMITER //
DROP PROCEDURE IF EXISTS getReviewSummary //
CREATE PROCEDURE getReviewSummary(
                             IN in_pu_loc_id varchar(255))

BEGIN

    -- select COUNT(*), ur.reviewID, r.desc from UsersReview ur 
    select  ur.reviewID as `ID`, r.desc as Reviews, COUNT(ur.reviewID) as Number_of_Reviews, 
    ur.electID,e.electDate, et.desc from UsersReview ur 
    left join Reviews r on ur.reviewID = r.reviewID
    left join ElectionEvents e on ur.electID = e.electID
    left join ElectionTypes et on e.electTypeID = et.electTypeID
    where  ur.pu_loc_id= in_pu_loc_id GROUP BY ur.reviewID;
END //
DELIMITER ;


-- -------------------------------------

-- -Procedure to return users reviews based on the reviewID

DELIMITER //
DROP PROCEDURE IF EXISTS getUserReviewForPollUnitByReviewID //
CREATE PROCEDURE getUserReviewForPollUnitByReviewID(IN in_reviewID int)

BEGIN

SELECT n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,ur.deviceID,ur.reviewID FROM UsersReview ur
left join npu n on ur.pu_loc_id = n.pu_loc_id 
WHERE ur.reviewID = in_reviewID;

END //
DELIMITER ;
-- ------------------------------------------
-- Procedure to update predefined review

DELIMITER //
DROP PROCEDURE IF EXISTS updateReview //
CREATE PROCEDURE updateReview(IN in_reviewID int,
			      IN in_desc varchar(255))
BEGIN

UPDATE Reviews
SET 
`desc`= in_desc
WHERE reviewID = in_reviewID;

END //
DELIMITER ;
-- ----------------------------

-- Procedure to delete predefined review

DELIMITER //
DROP PROCEDURE IF EXISTS deleteReview //
CREATE PROCEDURE deleteReview(IN in_reviewID int )
BEGIN

DELETE FROM Reviews WHERE reviewID = in_reviewID;

END //
DELIMITER ;
-- ----------------------------
-- Procedure to update user review

DELIMITER //
DROP PROCEDURE IF EXISTS updateUserReview //
CREATE PROCEDURE updateUserReview(IN in_reviewID int,
			      IN in_deviceID varchar(64),
			      IN in_pu_loc_id varchar(4))
BEGIN

UPDATE UsersReview
SET 
reviewID = in_reviewID
WHERE deviceID = in_deviceID and pu_loc_id= in_pu_loc_id;

END //
DELIMITER ;
-- ----------------------------

-- Procedure to delete user review

DELIMITER //
DROP PROCEDURE IF EXISTS delUserReview //
CREATE PROCEDURE delUserReview(IN in_reviewID int,
			      IN in_deviceID varchar(64),
			      IN in_pu_loc_id varchar(4))
BEGIN

DELETE FROM  UsersReview
WHERE reviewID = in_reviewID and deviceID = in_deviceID and pu_loc_id= in_pu_loc_id;

END //
DELIMITER ;
-- ----------------------------

-- Procedure to add user comment

DELIMITER //
DROP PROCEDURE IF EXISTS addUserComment //
CREATE PROCEDURE addUserComment(
			      IN in_deviceID varchar(64),
			      IN in_pu_loc_id varchar(4),
			      IN in_time timestamp,
			      IN in_comment varchar(5000))
BEGIN

INSERT INTO UserComments(deviceID,pu_loc_id, `time`, `comment`) VALUES(in_deviceID,in_pu_loc_id,in_time, in_comment);

END //
DELIMITER ;
-- ----------------------------

-- Procedure to update user comment

DELIMITER //
DROP PROCEDURE IF EXISTS updateUserComment //
CREATE PROCEDURE updateUserComment(
			      IN in_deviceID varchar(64),
			      IN in_pu_loc_id varchar(4),
			      IN in_time timestamp,
			      IN in_comment varchar(5000))
BEGIN

UPDATE UserComments
SET 
`comment` = in_comment, `time` = in_time
WHERE deviceID = in_deviceID and pu_loc_id = in_pu_loc_id;

END //
DELIMITER ;
-- ----------------------------

-- Procedure to delete user comment

DELIMITER //
DROP PROCEDURE IF EXISTS delUserComment //
CREATE PROCEDURE delUserComment(
			      IN in_deviceID varchar(64),
			      IN in_pu_loc_id varchar(4),
			      IN in_time timestamp,
			      IN in_comment varchar(5000))
BEGIN

DELETE FROM UserComments WHERE  deviceID = in_deviceID and pu_loc_id= in_pu_loc_id and  `comment`=in_comment;

END //
DELIMITER ;
-- ---------------------------------
-- PROCEDURES TO SELECT DATA FROM THE DATABASE

-- Procedure to return all Users

DELIMITER //
DROP PROCEDURE IF EXISTS getAllUser //
CREATE PROCEDURE getAllUser()

BEGIN

SELECT deviceID,Name,`ID` FROM Users;

END //
DELIMITER ;
-- ----------------------------------------

-- Procedure to return gender

DELIMITER //
DROP PROCEDURE IF EXISTS getGender //
CREATE PROCEDURE getGender()

BEGIN

SELECT `ID`,`desc` FROM Gender;

END //
DELIMITER ;
-- ------------------------------------

-- -----------------------------------------
-- Procedure to return all Users comment

DELIMITER //
DROP PROCEDURE IF EXISTS getAllUserComment //
CREATE PROCEDURE getAllUserComment()

BEGIN

SELECT deviceID,pu_loc_id,`time`,`comment` FROM UserComments;

END //
DELIMITER ;

-- ----------------------------------------------

-- ---------------------------------------
-- Procedure to return users comments based on the polling unit

DELIMITER //
DROP PROCEDURE IF EXISTS getUserCommentsForPollUnit//
CREATE PROCEDURE getUserCommentsForPollUnit(IN in_pu_loc_id varchar(255))

BEGIN

SELECT n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,uc.deviceID,uc.time, uc.comment FROM UserComments uc
left join npu n on uc.pu_loc_id = n.pu_loc_id 
WHERE uc.pu_loc_id = in_pu_loc_id;

END //
DELIMITER ;
-- ------------------------------------

-- Procedure to return users comments based on the time it was added

DELIMITER //
DROP PROCEDURE IF EXISTS getUserCommentsForPollUnitByTime//
CREATE PROCEDURE getUserCommentsForPollUnitByTime(IN in_time timestamp)

BEGIN

SELECT n.pu_loc_id,n.state,n.lga,n.ra,n.pu,n.buildingTypeID,n.lat,n.long,n.puLocNumAffilations,n.puLocDesc,uc.deviceID,uc.time, uc.comment FROM UserComments uc
left join npu n on uc.pu_loc_id = n.pu_loc_id 
WHERE uc.time = in_time;

END //
DELIMITER ; 
-- -----------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS getPollUnit //
CREATE PROCEDURE getPollUnit( IN in_lat decimal(11,9),
			    IN in_long decimal(11,9) )
			      
BEGIN

declare lng1 double;
declare lng2 double;
declare lat1 double;
declare lat2 double;

set lat1 = (in_lat - 0.018);-- lower bound
set lat2 = (in_lat + 0.018); -- upper bound

set lng1 = (in_long - 0.018);-- lower bound
set lng2 = (in_long + 0.018); -- upper bound

select pu_loc_id,state,lga,ra,pu,buildingTypeID,lat,`long`,puLocNumAffilations,puLocDesc  from npu
where lat between lat1 and lat2 AND `long` between lng1 and lng2;

END //
DELIMITER ;

-- -----------------------------
-- Procedure to return Poll Unit details
DELIMITER //
DROP PROCEDURE IF EXISTS getPollUnitDetails //
CREATE PROCEDURE getPollUnitDetails( IN in_pu_loc_id varchar(255) )
			      
BEGIN

select pu_loc_id,state,lga,ra,pu,buildingTypeID,lat,`long`,puLocNumAffilations,puLocDesc 
from npu where pu_loc_id = in_pu_loc_id;

END //
DELIMITER ;

-- ----------------------------------------

-- Procedure to return election events

DELIMITER //
DROP PROCEDURE fetchElectionEvents //
CREATE PROCEDURE fetchElectionEvents()

BEGIN

SELECT e.electID,e.electTypeID,et.desc,e.electDate FROM ElectionEvents e
LEFT JOIN ElectionTypes et on e.electTypeID = et.electTypeID;

END //

DELIMITER ;
-- ------------------------------------------------