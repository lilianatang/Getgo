drop DATABASE getgo;

CREATE database Getgo;
USE Getgo;

/* tables creation */

CREATE table `course`(
	`course_id` int(7) primary key auto_increment,
	`course_name` varchar(100),
	`credits` varchar(10),
	`decription` varchar(100)
);

CREATE table `instituition`(
	`university_id` int(7) primary key auto_increment,
	`school_name` varchar(40),
	`city` varchar(40),
	`province` varchar(10),
	`country` varchar(80),
	`postal_code` varchar(10),
	`type` varchar(10),
	`description` varchar(100)
);


CREATE table `department`(
	`department_id` int(7) primary key auto_increment,
	`university_id` int(7),
	`department_name` varchar(40),
	`average_mark` int(3),
	`description` varchar(100),
	INDEX(`university_id`),
	FOREIGN KEY (`university_id`)
	REFERENCES `instituition`(`university_id`)
);

CREATE table `major`(
	`major_id` int(7) primary key auto_increment,
	`department_id` int(7),
	`university_id` int(7),
	`name` varchar(40),
	`description` varchar(100),
	INDEX(`department_id`),
	FOREIGN KEY (`department_id`)
	REFERENCES `department`(`department_id`),

	INDEX(`university_id`),
	FOREIGN KEY (`university_id`)
	REFERENCES `instituition`(`university_id`)

);

CREATE table `group`(
	`course_id` int(7),
	`university_id` int(10),
	`group` varchar(8),
	INDEX(`course_id`),
	FOREIGN KEY (`course_id`)
	REFERENCES `course`(`course_id`)

);


	/* format for user_id is 00000 (5 digits) */
CREATE table `condition`(
	`condition_id` int(10) primary key auto_increment,
	`university_id` int(10) not null,
	`department_id` int(10) not null,
    `condition` varchar(80),
    INDEX (`university_id`), 
    FOREIGN KEY (`university_id`)
    REFERENCES `instituition`(`university_id`),

    INDEX (`department_id`),
    FOREIGN KEY (`department_id`)
    REFERENCES `department`(`department_id`)
);


CREATE table profile(
	`student_id` int(5) primary key auto_increment,
	`first_name` varchar(40),
	`last_name` varchar(40),
	`email` varchar(80),
	`city` varchar(40),
	`province` varchar(10),
	`country` varchar(10),
	`postal_code` varchar(10),
	`international` int(1),
	`password` varchar(40),
	`highestEducation` varchar(30),

	INDEX (`student_id`),
	FOREIGN KEY (`student_id`)
	REFERENCES profile(`student_id`)
);


CREATE table profile_marks(
	`student_id` int(5),
	`course_id` int(7),
	`mark` int(4),


	INDEX (`student_id`),
	FOREIGN KEY (`student_id`)
	REFERENCES `profile`(`student_id`),

	INDEX (`course_id`),
	FOREIGN KEY (`course_id`)
	REFERENCES `group`(`course_id`)
);


INSERT INTO `course` (`course_id`, `course_name`, `credits`, `description`) VALUES
(1, 'English Language Arts 30-1', '5'),
(2, 'Mathematics 30-1', '5'),
(4, 'Biology 30', '5'),
(5, 'Computing Science 35 AP', '5'),
(6, 'Computing Science ADV(CTS-5Cr', '5'),
(7, 'Mathematics 31', '5'),
(8, 'Physics (AP) 35', '5'),
(9, 'Physics 30', '5'),
(10, 'Chemistry 30', '5'), 
(11, 'Dance 35', '5'),
(12, 'Portfolio Art 35', '5'),
(13, 'Dance Composition 35', '5'),
(14, 'Directing 35', '5'),
(15, 'Drawing(Adv Techn) 35(CTS-5Cr)', '5'),
(16, 'Film & Media Arts 35(CTS-5Cr)', '5'),
(17, 'Film Studies 35', '5'),
(18, 'Applied Graphic Arts 35', '5'),
(19, 'Music 35', '5'),
(20, 'Instrumental Jazz 35', '5'),
(21, 'Painting (Adv Techn) 35', '5'),
(22, 'Jazz Dance 35', '5'),
(23, 'Pottery/Ceramics(Adv Techn) 35', '5'),
(24, 'Sculpting (Adv Techn) 35', '5'),
(25, 'Shooting the Screenplay 35', '5'),
(26, 'Tap Dance 35', '5'),
(27, 'Technical Theatre 35 (5Cr)', '5'),
(28, 'Technical Theatre EPS 35', '5'),
(29, 'Theatre Arts 35', '5'),
(30, 'Vocal Jazz 35', '5'),
(31, 'Ballet 35', '5'),
(32, 'Band 35', '5'),
(33, 'Adv Acting/Touring Theatre 35', '5'),
(34, 'Adv Tech-Print/Draw/Sculp(5Cr)', '5'),
(35, 'Choir 35', '5'),
(36, 'CommunicationTech Adv(CTS-5Cr)', '5'),
(37, 'Contemporary Dance 35', '5'),
(38, 'Performing Arts 35A', '5'),
(39, 'Drama 30', '5'),
(40, 'General Music 30', '5'),
(41, 'Band Music 35', '5'),
(42, 'Musical Theatre 35', '5'),
(43, 'Art 30', '5'),
(44, 'Art 31', '5'),
(45, 'Instrumental Music 30', '5'),
(46, 'Choral Music 30', '5'),
(47, 'Aboriginal Studies 30', '5'),
(48, 'Social Studies 30-1', '5'),
(49, 'Hungarian 35', '5'),
(50, 'Cree Lang & Culture 30-3Y', '5'),
(51, 'Cree Lang & Culture 30-6Y', '5'),
(52, 'Cree Language & Culture 30-9Y', '5'),
(53, 'Cree L & C 30-12Y', '5'),
(54, 'Cree Lang & Culture 30', '5'),
(55, 'Portuguese 35', '5'),
(56, 'Portuguese Lang &Culture 35-3Y', '5'),
(57, 'Swedish 35', '5'),
(58, 'Spanish Lang & Culture 30-3Y', '5'),
(59, 'Spanish Lang & Culture 30-6Y', '5'),
(60, 'Spanish Lang & Culture 30-9Y', '5'),
(61, 'Spanish Language Arts 30', '5'),
(62, 'Am Sgn Lng & Deaf Culture 35', '5'),
(63, 'Am Sign L & C 35-9Y', '5'),
(64, 'American Sign Lang Arts 35', '5'),
(65, 'Latin 30', '5'),
(66, 'Italian Lang & Culture 30-3Y', '5'),
(67, 'Italian Lang & Culture 30-6Y', '5'),
(68, 'Chinese Lang & Culture 30-3Y', '5'),
(69, 'Chinese Lang & Culture 30-6Y', '5'),
(70, 'Chinese Lang & Culture 30-9Y', '5'),
(71, 'Chinese Language Arts 30', '5'),
(72,'Korean Lang & Culture 35' , '5'),
(73,	'Polish Language & Arts 35','5'),
(74,	'Korean Lang & Culture 35-3Y', '5'),
(75,	'Polish Lang & Culture 35 - 12Y','5'),
(76,	'Polish Lang & Culture 35 - 3Y',	'5'),
(77,	'Francais 30-1',	'5'),
(78,	'Francais 30-2',	'5'),
(79,	'French 30 (New)',	'5'),
(80,	'French 30-9Y',	'5' ,''),
(81,	'French 31	5', '5'),
(82,	'French Language Arts 30-1',	'5'),
(83,	'French Language Arts 30-2',	'5'),
(84,	'French 30-3Y',	'5'),
(85,	'Punjabi Lang & Culture 30-3Y',	'5'),
(86,	'Punjabi Lang & Culture 30-9Y',	'5',''),
(87,	'Punjabi Lang & Culture 35',	'5'),
(88,	'Sikh and Punjabi 35',	'5'),
(89,	'Hebrew 35',	'5'),
(90,	'Hebrew Language Arts 35',	'5'),
(91,	'Greek 35',	'5'),
(92,	'Arabic L & C 35-12Y', '5'),
(93,	'Arabic L & C 35-6Y',	'5'),
(94,	'German Lang & Culture 30-3Y',	'5'),
(95,	'German Lang & Culture 30-6Y',	'5'),
(96,	'German Lang & Culture 30-9Y','5'),
(97,	'German Language Arts 30',	'5'),
(98,	'German Language Arts 35',	'5'),
(99,	'Polish 35',	'5'),
(100,	'Blackfoot Lang & Cult 30',	'5'),
(101,	'Japanese 30', 	'5'),
(102,	'Japanese Lang & Culture 30-3Y',	'5'),
(103,	'Japanese Lang & Culture 30-6Y',	'5'),
(104,	'Japanese Lang & Culture 30-9Y',	'5'),
(105,	'Ukrainian Lang Arts 30',	'5'),
(106,	'Ukranian Lang & Culture 30-3Y',	'5'),
(107,	'Ukranian Lang & Culture 30-6Y',	'5'),
(108,	'Ukranian Lang & Culture 30-9Y','5'),
(109,	'Science 30', 	'5'),
(110,	'Mathematics 30-2',	'5'),
(111,	'Macro-Economics 30', '5'),
(112,	'Community Health Adv (CTS-5Cr)', '5'),
(113,	'Foods Adv (CTS-5Cr)',	'5'),
(114,	'Agriculture Adv (CTS-5Cr)',	'5'),
(115,	'Wildlife Adv (CTS-5Cr)',	'5'),
(116,	'Forestry Adv (CTS-5Cr)','5'),
(117,	'Micro-Economics 30',	'5'),
(118,	'Physical Education 30',	'5'),
(119,	'Applied Sociology 30',	'5'),
(120,	'Cultural and Physical Anthropology 30', '5'),
(121,	'Experimental Psychology 30','5'),
(122,	'International Politics 30',	'5'),
(123,	'Philosophies of Man 30','5'),
(124,	'Religious Studies 35', '5'),
(125,	'Western World History 30',	'5'),
(126,	'World Geography 30', '5'),
(127,	'World Religion 30', '5'),
(128,	'Community Care Services',	'3 or 5'),
(129,	'Construction Technologies', '3 or 5'),
(130,	'Cosmetology', '3 or 5'),
(131,	'Criminal Justice Studies',	'3 or 5'),
(132,	'Design Studies',	'3 or 5'),
(133,	'Electro-Technologies',	'3 or 5'),
(134,	'Enterprise and innovation', '3 or 5'),
(135,	'Enviromental Stewardship',	'3 or 5'),
(136,	'Esthetics', '3 or 5'),
(137,	'Fabrication Studies', '3 or 5'),
(138,	'Fashion Studies', '3 or 5'),
(139,	'Financial Management', '3 or 5'),
(140,	'Health Care Aide', '3 or 5'),
(141,	'Health Care Services', '3 or 5'),
(142,	'Human & Social Services', '3 or 5'),
(143,	'Information Processing', '3 or 5'),
(144,	'Legal Studies', '3 or 5'),
(145,	'Logistics', '3 or 5'),
(146,	'Management & Marketing', '3 or 5'),
(147,	'Mechanics', '3 or 5'),
(148,	'Networking', '3 or 5'),
(149,	'Power Engineering', '3 or 5'),
(150,	'Primary Resources', '3 or 5'),
(151,	'Recreation Leadership', '3 or 5' ),
(152,	'Tourism Studies', '3 or 5'),
(153, 'Russian 35', '5');


INSERT INTO `department` (`department_id`, `university_id`, `department_name`, `average_mark`) VALUES
(1	,1	,'Faculty of Science'	,	70),
(2	,1	,'Faculty of Arts'	,	70),
(3	,1	,'Faculty of Engineering'	,70	),
(4	,1	,'Faculty of Nursing'	,70	),
(5	,1	,'Faculty of Agricultural, Life, and Environmental Science'	,70	),
(6	,1	,'Faculty of Physical Education and Recreaion'	,70	),
(7	,2	,'School of Business'	,65	),
(8	,2	,'Faculty of Nursing',	65),
(9	,2	,'Faculty of Science',	65),
(10	,2	,'Faculty of Arts', 65),
(11	,2	,'Faculty of Engineering Transfer',	70),
(12	,2	,'Faculty of Fine Arts',	60),
(13	,2	,'Faculty of Communication Studies',	65),
(14	,4	,'Faculty of Science',	60),
(15	,4	,'Bachelor of Managment program', 	65),
(16	,4	,'Bachelor of Arts program',	60),
(17	,4	,'Bachelor of Management & Bachelor of Science in Chemistry Dual Degrees',	65),
(18	,3	,'3-year B.A Biology',	60),
(19	,3	,'3-year B.A Chemistry',	60),
(20	,3	,'4-year B.A Psychology',	60),
(21	,3	,'4-year B.A Environmental Studies',	60),
(22	,3	,'4-year B.A Environmental Studies Chemistry',	60),
(23	,3	,'4-year B.A Politics-History-Economics',	60),
(24	,3	,'3-year B.Sc Biology',	60),
(25	,3	,'3-year B.Sc Chemistry',	60),
(26	,3	,'4-year B.Sc Computing Science',60),
(27	,3	,'4-year B.Sc Environmental Studies Biology',60),
(28	,3	,'4-year Environmental Studies Chemistry', 60),
(29	,3	,'4-year B.Sc. Environmental Studies Computing Science',	60),
(30	,3	,'4-year B.Com	60', 60);


INSERT INTO `major` (`major_id`, `department_id`, `university_id`, `name`) VALUES
(1,	1,	1,	'Applied Mathematics'),
(2,	1,	1,	'Astrophysics'),
(3,	1,	1,	'Atmospheric Science'),
(4,	1,	1,	'Biochemistry'),
(5,	1,	1,	'Biological Science'),
(6,	1,	1,	'Biology'),
(7,	1,	1,	'Cell Biology'),
(8,	1,	1,	'Chemistry'),
(9,	1,	1,	'Computing Science'),
(10,	1,	1,	'Earth and Atmospheric Science'),
(11,	1,	1,	'Ecology, Evolution and Environmental Biology'),
(12,	1,	1,	'Environmental Earth Science'),
(13,	1,	1,	'Geology'),
(14,	1,	1,	'Geophysics'),
(15,	1,	1,	'Immunology and Infection'),
(16,	1,	1,	'Integrative Physiology'),
(17,	1,	1,	'Mathematical Physics'),
(18,	1,	1,	'Mathematics'),
(19,	1,	1,	'Molecular, Cellular and Developmental Biology'),
(20,	1,	1,	'Neuroscience'),
(21,	1,	1,	'Paleontology'),
(22,	1,	1,	'Pharmacology'),
(23,	1,	1,	'Physical Science'),
(24,	1,	1,	'Physics'),
(25,	1,	1,	'Physiology'),
(26,	1,	1,	'Planning'),
(27,	1,	1,	'Psychology'),
(28,	1,	1,	'Science and Education'),
(29,	1,	1,	'Statistics'),
(30,	1,	1,	'Undeclared');


INSERT INTO `instituition` (`university_id`, `school_name`, `city`, `province`, `country`, `postal_code`, `type`) VALUES

(1,	'University of Alberta',	'Edmonton',	'AB',	'Canada',	'T6G 2R3', 'University'),
(2,	'Macewan University', 	'Edmonton',	'AB',	'Canada',	'T5J 4S2',	'University'),
(3,	'Kings University',	'Edmonton',	'AB',	'Canada',	'T6B 2H3',	'University'),
(4,	'Concordia',	'Edmonton',	'AB',	'Canada',	'T5B 4E4',	'University');



