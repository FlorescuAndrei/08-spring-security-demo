DROP DATABASE  IF EXISTS `spring_security_demo`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo`;
USE `spring_security_demo`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `users`
-- {noop} no encryption/ the encoding algoritm {id}
--

INSERT INTO `users` 
VALUES 
('john','{noop}123',1),
('mary','{bcrypt}$2a$12$pjRJ90UjmSamBS5KgdpK6uLj9mltWQm0x1im5JilVYkZNXsjKGivW',1),
('susan','{bcrypt}$2a$12$kZKfGKSYtN/KJkgob703duIfasDQS3TFKgypLd5S01FvZ1ENtTp96',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_ADMIN');


