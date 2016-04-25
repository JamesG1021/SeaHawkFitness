#This file is used to populate the tables inside the database

#Populate the admin table
insert into admin values
(123456789, 'SFAdmin');

#Populate the students table
insert into students values
(950000001, 'James');
insert into students values
(950000002, 'Amanda');
insert into students values
(950000003, 'Sean');
insert into students values
(950000004, 'Ben');
insert into students values
(950000005, 'Bryan');
insert into students values
(950000006, 'Josh');
insert into students values
(950000007, 'Tess');
insert into students values
(950000008, 'Joshua');
insert into students values
(950000009, 'Megan');
insert into students values
(950000010, 'Lora');
insert into students values
(950000011, 'Amber');
insert into students values
(950000012, 'Jake');
insert into students values
(950000013, 'Jeff');
insert into students values
(950000014, 'Dill');
insert into students values
(950000015, 'Laura');
insert into students values
(950000016, 'Lin');
insert into students values
(950000017, 'Daniel');
insert into students values
(950000018, 'Mitch');
insert into students values
(950000019, 'Channing');
insert into students values
(950000020, 'Bob');

#Populate the trainers table
insert into trainers values
(950123450, 'Mohammad');
insert into trainers values
(950123451, 'Ghandi');
insert into trainers values
(950123452, 'Benjamin');
insert into trainers values
(950123453, 'Tesla');
insert into trainers values
(950123454, 'Minoto');
insert into trainers values
(950123455, 'Obama');
insert into trainers values
(950123456, 'Mozart');
insert into trainers values
(950123457, 'Bach');
insert into trainers values
(950123458, 'Beehtoven');
insert into trainers values
(950123459, 'Einstien');

#Populate the trains table
insert into trains values
(950123450,950000001);
insert into trains values
(950123450,950000002);
insert into trains values
(950123451,950000003);
insert into trains values
(950123451,950000004);
insert into trains values
(950123452,950000005);
insert into trains values
(950123452,950000006);
insert into trains values
(950123453,950000007);
insert into trains values
(950123453,950000008);
insert into trains values
(950123454,950000009);
insert into trains values
(950123454,950000010);
insert into trains values
(950123455,950000011);
insert into trains values
(950123455,950000012);
insert into trains values
(950123456,950000013);
insert into trains values
(950123456,950000014);
insert into trains values
(950123457,950000015);
insert into trains values
(950123457,950000016);
insert into trains values
(950123458,950000017);
insert into trains values
(950123458,950000018);
insert into trains values
(950123459,950000019);
insert into trains values
(950123459,950000020);

#Populate the equipment table
insert into equipment values
(850120, 'Kayak', 19);
insert into equipment values
(850121, 'Kayak', 19);
insert into equipment values
(850122, 'Tent', 15);
insert into equipment values
(850123, 'Tent', 15);
insert into equipment values
(850124, 'Canoe', 24);
insert into equipment values
(850125, 'Canoe', 24);
insert into equipment values
(850126, 'Corn Hole', 12);
insert into equipment values
(850127, 'Corn Hole', 12);
insert into equipment values
(850128, 'Sleeping Bag', 9);
insert into equipment values
(850129, 'Grill', 14);

#Populate the rents table
insert into rents values
(850120,950000002);
insert into rents values
(850122,950000004);
insert into rents values
(850124,950000006);
insert into rents values
(850126,950000008);
insert into rents values
(850128,950000010);

#Populate the courses table
insert into courses values
(123450,'Yoga Flow','9:30am','10:30am','Studio 129','A new form of Yoga that will get the energy flowing.', 'Monday');
insert into courses values
(123451,'Core','8:00am','9:00am','Studio 226/228','Blast your abdominals with this half hour hell.','Tuesday');
insert into courses values
(123452,'Yoga relax','9:00am','10:00am','Studio 129','Relax and unwind with this meditative soothing Yoga session.','Wednesday');
insert into courses values
(123453,'Yogalates','2:00pm','3:00pm','Studio 129','A pleasant and exhilerating blending of Yoga and Pilates.','Thursday');
insert into courses values
(123454,'Cardio Dance','4:00pm','5:00pm','Studio 226/228','An upbeat and aggresive Cardio Dance session,  get ready to sweat!','Friday');
insert into courses values
(123455,'Body Pump','2:00pm','3:00pm','Studio 226/228','Engage your whole body in this vigarous workout.','Monday');
insert into courses values
(123456,'Pilates','8:00am','9:00am','Studio 129','You love it, we love it, Pilates.','Tuesday');
insert into courses values
(123457,'Yoga Relax','3:00pm','4:00pm','Studio 129','Relax and unwind with this meditative soothing Yoga session.','Wednesday');
insert into courses values
(123458,'Cycle30','9:00am','10:00am','Studio 223','30 minutes of intense bicycling action!','Thursday');
insert into courses values
(123459,'Hydrofit','1:00pm','2:00pm','Indoor Pool','Low impact aquatic exercise fun!','Friday');

#Populate the instructs table
insert into instructs values
(950123450,123450);
insert into instructs values
(950123451,123451);
insert into instructs values
(950123452,123452);
insert into instructs values
(950123453,123453);
insert into instructs values
(950123454,123454);
insert into instructs values
(950123455,123455);
insert into instructs values
(950123456,123456);
insert into instructs values
(950123457,123457);
insert into instructs values
(950123458,123458);
insert into instructs values
(950123459,123459);

#Populate the takes table
insert into takes values
(950000001,123450);
insert into takes values
(950000003,123451);
insert into takes values
(950000005,123452);
insert into takes values
(950000007,123453);
insert into takes values
(950000009,123454);
insert into takes values
(950000011,123455);
insert into takes values
(950000013,123456);
insert into takes values
(950000015,123457);
insert into takes values
(950000017,123458);
insert into takes values
(950000019,123459);

#Populate the events table
insert into events values
(890120,'8:00pm','07-12-16', '07-12-16','High paced hip hop and latin dance fitness.','Zumba');
insert into events values
(890121,'9:00am','05-25-16','05-25-16','Get on the fast track to that beach body with our first time offering of Insanity!', 'Insanity');
insert into events values
(890122,'8:00am','04-22-16','04-22-16','Blast fat away with P90x',  'P90x');

#Populate the sa_events table
insert into sa_events values
(758200,'Kayaking Trip','04-05-16', '04-10-16','6:00pm','Kayak in the Everglades',950123459, 10,20,50);
insert into sa_events values
(758210,'Camping Trip','03-21-16', '03-28-16','5:00pm','Come join us for camping in the Appalachian Mountains',950123458, 10, 15,75);

#Populate the attending table
insert into attending values
(950000020, '04-05-16', '8:00am');
insert into attending values
(950000018, '04-05-16', '8:00am');
insert into attending values
(950000016, '04-05-16', '8:00am');
insert into attending values
(950000014, '04-05-16', '8:00am');
insert into attending values
(950000012, '03-21-16', '9:00am');
insert into attending values
(950000010, '03-21-16', '9:00am');
insert into attending values
(950000008, '03-21-16', '9:00am');
insert into attending values
(950000006, '03-21-16', '9:00am');

#turn on foreign key checking after the tables have been populated
SET FOREIGN_KEY_CHECKS=1;
