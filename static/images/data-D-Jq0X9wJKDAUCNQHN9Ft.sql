DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `checkin` varchar(255),
  `checkout` varchar(255),
  `roomtype` TEXT default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Sebastian","sagittis.felis.donec@google.ca","3883744033","2023-02-28","2023-03-10","single"),
  ("Norman","eu.tempor@protonmail.edu","5282816977","2023-02-27","2023-03-12","single"),
  ("William","enim.diam@hotmail.org","4967874274","2023-02-27","2023-03-11","single"),
  ("Oliver","nam.interdum@google.net","3468577176","2023-02-25","2023-03-12","single"),
  ("Kirk","eu.nulla@hotmail.ca","8477938344","2023-02-27","2023-03-12","single"),
  ("Gannon","feugiat.metus.sit@hotmail.com","5579356043","2023-02-24","2023-03-13","single"),
  ("Herrod","dolor@aol.edu","5583725053","2023-02-24","2023-03-12","single"),
  ("Daryl","tincidunt.nibh@aol.org","2083223442","2023-02-27","2023-03-13","single"),
  ("Orson","in.consectetuer.ipsum@hotmail.edu","8746537868","2023-02-25","2023-03-12","single"),
  ("Charde","dui.nec@outlook.com","1397813832","2023-02-24","2023-03-13","single");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Nyssa","sed.dui.fusce@yahoo.org","4307913469","2023-02-28","2023-03-13","double"),
  ("Lance","ut@protonmail.org","3157372548","2023-02-27","2023-03-13","double"),
  ("Allistair","ornare.tortor@hotmail.org","3655354557","2023-02-26","2023-03-11","double"),
  ("Cleo","lorem.vehicula@google.edu","7645363575","2023-02-27","2023-03-12","double"),
  ("Fulton","ipsum@protonmail.edu","2146560316","2023-02-26","2023-03-13","double"),
  ("Amy","ipsum.primis@google.edu","5355955434","2023-02-28","2023-03-10","double"),
  ("Ashely","est.tempor@outlook.com","7008643537","2023-02-24","2023-03-11","double"),
  ("Chaim","dolor.nulla.semper@protonmail.ca","8458708454","2023-02-28","2023-03-11","double"),
  ("Germaine","nisl@hotmail.org","1662158645","2023-02-25","2023-03-11","double"),
  ("Bernard","eleifend.vitae@protonmail.org","6761046316","2023-02-25","2023-03-13","double");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Reuben","ipsum.suspendisse@aol.ca","4318367217","2023-02-28","2023-03-11","suite"),
  ("Fulton","ultrices.posuere.cubilia@outlook.net","4490896675","2023-02-25","2023-03-12","suite"),
  ("Hashim","nisi.nibh.lacinia@google.couk","4139377284","2023-02-25","2023-03-11","suite"),
  ("Kimberly","scelerisque@icloud.ca","8770541395","2023-02-28","2023-03-11","suite"),
  ("Nayda","pellentesque@icloud.net","6782718283","2023-02-27","2023-03-11","suite"),
  ("Inga","eu.eros.nam@aol.couk","1796847349","2023-02-27","2023-03-11","suite"),
  ("Nerea","fringilla.euismod.enim@google.couk","8826780631","2023-02-28","2023-03-13","suite"),
  ("Tanner","ut.aliquam@protonmail.net","8248053036","2023-02-26","2023-03-13","suite"),
  ("Daphne","nam.tempor@icloud.edu","6317767694","2023-02-25","2023-03-11","suite"),
  ("Ora","dui@yahoo.org","2810062680","2023-02-27","2023-03-12","suite");
