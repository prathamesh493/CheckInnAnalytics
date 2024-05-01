DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `checkin` varchar(255),
  `checkout` varchar(255),
  `roomtype` TEXT default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Janna","nulla.integer@google.ca","0455446775","2023-02-01","2023-02-26","single"),
  ("Kenyon","eu.lacus.quisque@outlook.net","6157142709","2023-02-06","2023-02-27","single"),
  ("Kimberley","mollis@yahoo.com","0563835998","2023-02-05","2023-02-26","single"),
  ("Lev","porttitor@google.org","9344636677","2023-02-05","2023-02-26","single"),
  ("Victor","et.euismod@outlook.edu","4185095040","2023-02-05","2023-02-26","single"),
  ("Ebony","senectus@aol.edu","9594645362","2023-02-02","2023-02-26","single"),
  ("Clio","nisl.arcu@outlook.couk","8179776859","2023-02-05","2023-02-27","single"),
  ("Kibo","ac.ipsum.phasellus@aol.edu","8623685737","2023-02-07","2023-02-25","single"),
  ("Maya","lorem@hotmail.ca","0211517244","2023-02-07","2023-02-28","single"),
  ("Lawrence","et.netus@google.org","6122928814","2023-02-03","2023-02-27","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Jillian","dui@protonmail.ca","7476892810","2023-02-02","2023-02-27","single"),
  ("Samson","ac@aol.couk","8202443984","2023-02-06","2023-02-28","single"),
  ("Colby","nam.consequat@protonmail.edu","2216448718","2023-02-04","2023-02-28","single"),
  ("Bruce","enim@protonmail.couk","6867267799","2023-02-04","2023-02-25","single"),
  ("Katelyn","sed.orci@icloud.org","5336242376","2023-02-06","2023-02-28","single"),
  ("Yoshio","amet.risus.donec@icloud.edu","7387674473","2023-02-05","2023-02-27","double"),
  ("Baxter","ornare.lectus.ante@outlook.com","6577135069","2023-02-07","2023-02-25","double"),
  ("Tanya","amet.consectetuer.adipiscing@protonmail.ca","1832815223","2023-02-06","2023-02-25","double"),
  ("Dolan","sed.eget@yahoo.com","5629337124","2023-02-05","2023-02-25","double"),
  ("Joelle","nunc.ac@protonmail.ca","4482456590","2023-02-06","2023-02-25","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Orla","placerat.velit@outlook.couk","8332893766","2023-02-04","2023-02-24","double"),
  ("Raymond","in.condimentum@aol.couk","1235534667","2023-02-06","2023-02-28","double"),
  ("Andrew","sed.leo@yahoo.org","6643878058","2023-02-05","2023-02-26","double"),
  ("Hamish","placerat.augue.sed@google.net","5603122585","2023-02-02","2023-02-28","double"),
  ("Lani","etiam.imperdiet@google.edu","2225484688","2023-02-05","2023-02-25","double"),
  ("Shelby","lacus.etiam@hotmail.com","5527182878","2023-02-07","2023-02-26","double"),
  ("Naida","cras.sed@yahoo.edu","7262120038","2023-02-07","2023-02-25","double"),
  ("Kasper","ac.orci@hotmail.org","2783534416","2023-02-05","2023-02-26","double"),
  ("Stewart","ac.tellus@hotmail.com","6652441111","2023-02-07","2023-02-26","double"),
  ("Judah","erat.semper@outlook.org","2667307838","2023-02-06","2023-02-28","double");
