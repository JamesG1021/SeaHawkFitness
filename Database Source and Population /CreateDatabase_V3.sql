SET FOREIGN_KEY_CHECKS=0;

drop table IF EXISTS equipment;
drop table IF EXISTS rents;
drop table IF EXISTS students;
drop table IF EXISTS trainers;
drop table IF EXISTS trains;
drop table IF EXISTS takes;
drop table IF EXISTS courses;
drop table IF EXISTS instructs;
drop table IF EXISTS events;
drop table IF EXISTS attending;
drop table IF EXISTS sa_events;
drop table IF EXISTS instructs_events;

create table equipment(
  equipID integer(6),
  equipName varchar(20),
  primary key(equipID)) engine = innodb;

create table rents(
  equipID integer(6),
  studentID integer(9),
  primary key(equipID))
  engine = innodb;

alter table rents
add constraint eID_ibfk_1 foreign key(equipID) references equipment(equipID);

create table students(
  studentID integer(9),
  name varchar(40),
  primary key(studentID)) engine = innodb;

alter table rents
add constraint sID_ibfk_1 foreign key(studentID) references students(studentID);

create table trainers(
   instructorID integer(9),
   name varchar(40),
   primary key(instructorID)) engine = innodb;

create table trains(
   instructorID integer(9),
   studentID integer(9),
   primary key(instructorID, studentID)) engine = innodb;

alter table trains
add constraint sID_ibfk_2 foreign key(studentID) references students(studentID);

alter table trains
add constraint iID_ibfk_1 foreign key(instructorID) references trainers(instructorID);

create table takes(
  studentID integer(9),
  courseID integer(6),
  primary key(studentID, courseID)) engine = innodb;

alter table takes
add constraint sID_ibfk_3 foreign key(studentID) references students(studentID);

create table courses(
  courseID integer(6),
  courseName varchar(40),
  time varchar(6),
  description varchar(255),   ## Description added to courses
  day varchar(10),
  primary key(courseID)) engine = innodb;
/* some weirdness in this table on the data dictionary*/

alter table takes
add constraint cID_ibfk_1 foreign key(courseID) references courses(courseID);

create table instructs(
  instructorID integer(9),
  courseID integer(6),
  primary key(instructorID, courseID)) engine = innodb;

alter table instructs
add constraint cID_ibfk_2 foreign key(courseID) references courses(courseID);
alter table instructs
add constraint iID_ibfk_3 foreign key(instructorID) references trainers(instructorID);

create table events(
  eventId integer(6),
  time varchar(6),
  day varchar(10),
  description varchar(255),     ## Description added to events
  eventName varchar(10),
  primary key(eventID)) engine = innodb;

create table instructs_events (
  eventID integer(6),
  instructorID integer(9),
  primary key(eventID, instructorID)) engine = innodb;

alter table instructs_events
add constraint iID_ibfk_6 foreign key(instructorID) references trainers(instructorID);

alter table instructs_events
add constraint iID_ibfk_7 foreign key(eventID) references events(eventID);

create table sa_events(
  name varchar(30),
  day varchar(10),
  time varchar(6),
  description varchar(255),     ## Description added to sa_events
  instructorID integer(9),
  enrolled integer(5) DEFAULT 0,  ## Added enrolled to check against capacity
  capacity integer(5),
  primary key(name,day,time)) engine = innodb;
/* some weirdness on the data dictionary for this one*/

alter table sa_events
add constraint iID_ibfk_5 foreign key(instructorID) references trainers(instructorID);


create table attending(
  studentID integer(9),
  day varchar(10),
  time varchar(6),
  primary key(studentID, day)) engine = innodb;

alter table attending
add constraint sID_ibfk_4 foreign key(studentID) references students(studentID);
SET FOREIGN_KEY_CHECKS=1;
