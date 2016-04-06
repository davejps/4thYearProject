drop database if exists `statssportsdata`;
CREATE DATABASE IF NOT EXISTS `statssportsdata`;

USE `statssportsdata`;

create table if not exists sessions
(
	sessionId date not null,
    startTime time not null,
	endTime time not null,
	bottomLeftLat DOUBLE not null,
	bottomLeftLong DOUBLE not null,
	bottomRightLat DOUBLE not null,
	bottomRightLong DOUBLE not null,
	topLeftLat DOUBLE not null,
	topLeftLong DOUBLE not null,
	PRIMARY KEY(`sessionId`)
)ENGINE=InnoDB;

create table if not exists gps
(
    GPSTime Time  not null,
	latitude DOUBLE not null,
	longitude DOUBLE  not null,
	speed DOUBLE  not null,
	sessionId Date not null,
	FOREIGN KEY(`sessionId`) REFERENCES `sessions`(`sessionId`)ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

create table if not exists accelerometer
(
    GPSTime Time not null,
	x DOUBLE not null,
	z DOUBLE not null,
	y DOUBLE not null,
	sessionId Date not null,
	FOREIGN KEY(`sessionId`) REFERENCES `sessions`(`sessionId`)ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;
