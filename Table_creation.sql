
/*Create the tables */

CREATE TABLE teacher(
	Teacher_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(40) NOT NULL,
	Birth_Date DATE,
	primary key(Teacher_ID)
) ENGINE = INNODB;

CREATE TABLE learner(
	Learner_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(40) NOT NULL,
	Birth_Date DATE,
	Class_room VARCHAR(20),
	Score SMALLINT,
	Teacher_ID SMALLINT,
	
	FOREIGN KEY (Teacher_ID)
		REFERENCES teacher(Teacher_id)
		ON DELETE CASCADE,
		
	primary key(Learner_ID)
) ENGINE = INNODB;

CREATE TABLE exercise(
	Exercise_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Alterable BOOLEAN,
	Name VARCHAR(50),
	primary key(Exercise_ID)
) ENGINE = INNODB;

CREATE TABLE badge(
	Badge_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Meaning TEXT,
	primary key(Badge_ID)	
) ENGINE = INNODB;

CREATE TABLE questions(
	Question_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Marking_scheme SMALLINT,
	Difficulty ENUM('easy','medium','hard'),
	Question_text TEXT,
	primary key(Question_ID)
) ENGINE = INNODB;

CREATE TABLE schedule(
	Schedule_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Exercise_ID SMALLINT,
	
	FOREIGN KEY (Exercise_ID)
		REFERENCES exercise(Exercise_ID)
		ON DELETE CASCADE,
		
	Learner_ID SMALLINT,
	
	FOREIGN KEY (Learner_ID)
		REFERENCES learner(Learner_ID)
		ON DELETE CASCADE,
	Date_exercise DATETIME NOT NULL,	
	primary key(Schedule_ID)
) ENGINE = INNODB;

CREATE TABLE answers(
	Answer_ID SMALLINT NOT NULL AUTO_INCREMENT,
	Question_ID SMALLINT,
	
	FOREIGN KEY (Question_ID)
		REFERENCES questions(Question_ID)
		ON DELETE CASCADE,
		
	Exercise_ID SMALLINT,
	
	FOREIGN KEY (Exercise_ID)
		REFERENCES exercise(Exercise_ID)
		ON DELETE CASCADE,
		
	Answer TEXT,
	primary key(Answer_ID)
) ENGINE = INNODB;
