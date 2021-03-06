#This file is to create all the tables and to set up some useful logic inside the Database

#disable foreign key checking so that the tables may be populated in the future
SET FOREIGN_KEY_CHECKS=0;

#Drop all existing tables with the same name
drop table IF EXISTS equipment;
drop table IF EXISTS rents;
drop table IF EXISTS students;
drop table IF EXISTS admin;
drop table IF EXISTS trainers;
drop table IF EXISTS trains;
drop table IF EXISTS takes;
drop table IF EXISTS courses;
drop table IF EXISTS instructs;
drop table IF EXISTS events;
drop table IF EXISTS attending;
drop table IF EXISTS sa_events;
drop table IF EXISTS instructs_events;

#Creates the equipment table 
create table equipment(
  equipID integer(6),
  equipName varchar(20),
  equipPrice integer(6),
  primary key(equipID)) engine = innodb;

#Create the rents table
create table rents(
  equipID integer(6),
  studentID integer(9),
  primary key(equipID, studentID))
  engine = innodb;

#Add a foreign key constraint on rents
alter table rents
add constraint eID_ibfk_1 foreign key(equipID) references equipment(equipID) ON DELETE CASCADE ON UPDATE CASCADE;

#Create the students table
create table students(
  studentID integer(9),
  name varchar(40),
  primary key(studentID)) engine = innodb;
  
#Add a foreign key constraint on rents
alter table rents
add constraint sID_ibfk_1 foreign key(studentID) references students(studentID) ON DELETE CASCADE ON UPDATE CASCADE;

#Create the trainers table
create table trainers(
   instructorID integer(9),
   name varchar(40),
   primary key(instructorID)) engine = innodb;

#Create the admin table
create table admin(
  instructorID integer(9),
  name varchar(40),
  primary key(instructorID)) engine = inodb;
  
#create the trains table
create table trains(
   instructorID integer(9),
   studentID integer(9),
   primary key(instructorID, studentID)) engine = innodb;

#Adds foreign key constraints to the trains table
alter table trains
add constraint sID_ibfk_2 foreign key(studentID) references students(studentID) ON DELETE CASCADE ON UPDATE CASCADE;

alter table trains
add constraint iID_ibfk_1 foreign key(instructorID) references trainers(instructorID) ON DELETE CASCADE ON UPDATE CASCADE;

#Creates the takes table
create table takes(
  studentID integer(9),
  courseID integer(6),
  primary key(studentID, courseID)) engine = innodb;

#Adds a foreign key constraint to the takes table
alter table takes
add constraint sID_ibfk_3 foreign key(studentID) references students(studentID) ON DELETE CASCADE ON UPDATE CASCADE;

#Creates the courses table
create table courses(
  courseID integer(6),
  courseName varchar(40),
  startTime varchar(6),
  endTime varchar(6),
  studio varchar(80),
  description varchar(255),
  day varchar(10),
  primary key(courseID)) engine = innodb;

#Adds a foreign key constraint to the takes table
alter table takes
add constraint cID_ibfk_1 foreign key(courseID) references courses(courseID) ON DELETE CASCADE ON UPDATE CASCADE;

#Create the instructs table
create table instructs(
  instructorID integer(9),
  courseID integer(6),
  primary key(instructorID, courseID)) engine = innodb;

#Add foreign key constraints to the instructs table
alter table instructs
add constraint cID_ibfk_2 foreign key(courseID) references courses(courseID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table instructs
add constraint iID_ibfk_3 foreign key(instructorID) references trainers(instructorID) ON DELETE CASCADE ON UPDATE CASCADE;

#Create the events table
create table events(
  eventID integer(6),
  time varchar(6),
  startDate varchar(10),
  endDate varchar(10),
  description varchar(255),     ## Description added to events
  eventName varchar(10),
  primary key(eventID)) engine = innodb;

#Creates the instructs_events table
create table instructs_events (
  eventID integer(6),
  instructorID integer(9),
  primary key(eventID, instructorID)) engine = innodb;

#Adds foreign key checks to the instructs_events table
alter table instructs_events
add constraint iID_ibfk_6 foreign key(instructorID) references trainers(instructorID) ON DELETE CASCADE ON UPDATE CASCADE;

alter table instructs_events
add constraint iID_ibfk_7 foreign key(eventID) references events(eventID) ON DELETE CASCADE ON UPDATE CASCADE;

#Create a trigger so all events are sa_events
delimiter #
create trigger add_sa_events after insert on events
  for each row
  BEGIN
  insert into sa_events(adventureID, name, startDate, endDate, time, description) values(NEW.eventID, NEW.eventName, NEW.startDate, NEW.endDate, NEW.time, NEW.description);
    end#
    delimiter ;

#Create table sa_events
create table sa_events(
  adventureID integer(6),
  name varchar(30),
  startDate varchar(10),
  endDate varchar(10),
  time varchar(10),
  description varchar(255),     ## Description added to sa_events
  instructorID integer(9),
  enrolled integer(5) DEFAULT 0,  ## Added enrolled to check against capacity
  capacity integer(5),
  price integer(5),
  primary key(adventureID)) engine = innodb;
/* some weirdness on the data dictionary for this one*/

#add a foreign key constraint to the sa_events table
alter table sa_events
add constraint iID_ibfk_5 foreign key(instructorID) references trainers(instructorID);

#create the attending table
create table attending(
  studentID integer(9),
  day varchar(10),
  time varchar(6),
  primary key(studentID, day)) engine = innodb;

#add a foreign key constraint to the attending table
alter table attending
add constraint sID_ibfk_4 foreign key(studentID) references students(studentID) ON DELETE CASCADE ON UPDATE CASCADE;

#views
create view trainer_name as
select distinct name from trainers;
#views
create view rental_name as
select distinct name from equipment;

#intersect
create view rented_name as
select * from equipment where equipment.equipID in (select equipID from rents);

#aggregate function average
create view avg_capacity as
select avg(capacity) from sa_events;

#nested subquerry and stuff
create view students_renting as
select * from students where exists (select * from rents where rents.studentID = students.studentID);

#stored function example
DELIMITER $$
CREATE FUNCTION valid_id(id_number integer) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE valid varchar(10);

    IF id_number > 950123455 THEN
        SET valid = 'FALSE';
    ELSE
        SET valid = 'TRUE';
    END IF;

 RETURN (valid);
END $$
DELIMITER ;

#stored function example
select name, valid_id(instructorID) from trainers ORDER BY name;

#stored procedure
DELIMITER $$

CREATE PROCEDURE totalparticipants
(OUT total int)
BEGIN
    select sum(enrolled) from sa_events;
  END $$
DELIMITER ;
