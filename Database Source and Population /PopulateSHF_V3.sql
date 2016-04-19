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

insert into equipment values
(850120, 'Kayak');
insert into equipment values
(850121, 'Kayak');
insert into equipment values
(850122, 'Tent');
insert into equipment values
(850123, 'Tent');
insert into equipment values
(850124, 'Canoe');
insert into equipment values
(850125, 'Canoe');
insert into equipment values
(850126, 'Corn Hole');
insert into equipment values
(850127, 'Corn Hole');
insert into equipment values
(850128, 'Sleeping Bag');
insert into equipment values
(850129, 'Grill');

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

insert into courses values
(123450,'Yoga Flow','9:30am','10:30am','A new form of Yoga that will get the energy flowing.', 'Monday','200');
insert into courses values
(123451,'Core','8:00am','9:00am','Blast your abdominals with this half hour hell.','Tuesday','150');
insert into courses values
(123452,'Yoga relax','9:00am','10:00am','Relax and unwind with this meditative soothing Yoga session.','Wednesday','100');
insert into courses values
(123453,'Yogalates','2:00pm','3:00pm','A pleasant and exhilerating blending of Yoga and Pilates.','Thursday','175');
insert into courses values
(123454,'Cardio Dance','4:00pm','5:00pm','An upbeat and aggresive Cardio Dance session,  get ready to sweat!','Friday','100');
insert into courses values
(123455,'Body Pump','2:00pm','3:00pm','Engage your whole body in this vigarous workout.','Monday','150');
insert into courses values
(123456,'Pilates','8:00am','9:00am','You love it, we love it, Pilates.','Tuesday','200');
insert into courses values
(123457,'Yoga Relax','3:00pm','4:00pm','Relax and unwind with this meditative soothing Yoga session.','Wednesday','150');
insert into courses values
(123458,'Cycle30','9:00am','10:00am','30 minutes of intense bicycling action!','Thursday','100');
insert into courses values
(123459,'Hydrofit','1:00pm','2:00pm','Low impact aquatic exercise fun!','Friday','175');

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

insert into events values
(890120,'8:00pm','Saturday','High paced hip hop and latin dance fitness.','Zumba');
insert into events values
(890121,'9:00am','Friday','Get on the fast track to that beach body with our first time offering of Insanity!', 'Insanity');
insert into events values
(890122,'8:00am','Satuday','Blast fat away with P90x',  'P90x');

insert into sa_events values
('Kayaking Trip','04-05-16','8:00am', '04-10-16','Kayak in the Everglades',950123459, 10,20,50);
insert into sa_events values
('Camping Trip','03-21-16', '9:00am', '03-28-16','Come join us for camping in the Appalachian Mountains',950123458, 10, 15,75);

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

SET FOREIGN_KEY_CHECKS=1;
