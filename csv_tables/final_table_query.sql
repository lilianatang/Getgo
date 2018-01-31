drop DATABASE Getgo;

CREATE database Getgo;
USE Getgo;

/* tables creation */

CREATE table `course`(
	`id` int(21) primary key auto_increment,
	`name` varchar(100),
	`credits` varchar(10),
	`decription` varchar(200)
);

CREATE table `institution`(
	`id` int(21) primary key auto_increment,
	`name` varchar(100),
	`city` varchar(40),
	`province` varchar(10),
	`country` varchar(80),
	`pc_zip` varchar(10),
	`type` varchar(10),
	`description` varchar(100)
);


CREATE table `department`(
	`id` int(21) primary key auto_increment,
	`institution_id` int(21),
	`name` varchar(100),
	`average_mark` int(3),
	`description` varchar(100),
	INDEX(`institution_id`),
	FOREIGN KEY (`institution_id`)
	REFERENCES `institution`(`id`)
);

CREATE table `major`(
	`id` int(21) primary key auto_increment,
	`department_id` int(21),
	`institution_id` int(21),
	`name` varchar(100),
	`description` varchar(100),
	INDEX(`department_id`),
	FOREIGN KEY (`department_id`)
	REFERENCES `department`(`id`),

	INDEX(`institution_id`),
	FOREIGN KEY (`institution_id`)
	REFERENCES `institution`(`id`)

);

CREATE table `group`(
	`course_id` int(21),
	`institution_id` int(21),
	`group` varchar(24),
	INDEX(`course_id`),
	FOREIGN KEY (`course_id`)
	REFERENCES `course`(`id`),
	
	INDEX(`institution_id`),
	FOREIGN KEY (`institution_id`)
	REFERENCES `institution`(`id`)
);


	/* format for user_id is 00000 (5 digits) */
CREATE table `condition`(
	`id` int(21) primary key auto_increment,
	`institution_id` int(21) not null,
	`department_id` int(21) not null,
	`min_mark` int(5) not null,
	
   INDEX(`institution_id`),
	FOREIGN KEY (`institution_id`)
	REFERENCES `institution`(`id`),

    INDEX (`department_id`),
    FOREIGN KEY (`department_id`)
    REFERENCES `department`(`id`)
);


CREATE table profile(
	`id` int(21) primary key auto_increment,
	`first_name` varchar(40),
	`last_name` varchar(40),
	`email` varchar(80),
	`city` varchar(40),
	`province` varchar(10),
	`country` varchar(10),
	`pc_zip` varchar(10),
	`international` int(1),
	`password` varchar(40),
	`highest_education` varchar(30)
);

CREATE table linked_condition(
	`id` int(21) primary key auto_increment,
	`condition_id` int(21) not null,
	`condition_group` varchar(8),
	
	INDEX (`condition_id`), 
    FOREIGN KEY (`condition_id`)
    REFERENCES `condition`(`id`)
    
);

CREATE table profile_marks(
	`student_id` int(21) ,
	`course_id` int(21),
	`mark` int(4),

	INDEX (`student_id`),
	FOREIGN KEY (`student_id`)
	REFERENCES `profile`(`id`),

	INDEX (`course_id`),
	FOREIGN KEY (`course_id`)
	REFERENCES `group`(`course_id`)
);

