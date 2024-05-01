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
  ("Patience Washington","ut.erat@yahoo.couk","4357981404","2023-03-11","2023-03-29","single"),
  ("Wing Parks","magna.nam@hotmail.org","6181274223","2023-02-25","2023-02-15","single"),
  ("Idona Savage","lobortis.augue.scelerisque@hotmail.net","3513825395","2023-01-24","2023-03-30","single"),
  ("Mona Waller","curabitur@aol.edu","7159816262","2023-03-13","2023-03-01","single"),
  ("Declan Garcia","non@yahoo.net","1213460569","2023-03-20","2023-03-25","single"),
  ("Julian Welch","sapien.gravida.non@yahoo.net","2376581385","2023-01-28","2023-02-09","single"),
  ("Aspen Ayala","donec.nibh.enim@icloud.ca","8086984635","2023-01-19","2023-03-05","single"),
  ("Erich Henson","ipsum.porta@icloud.net","8446457503","2023-01-17","2023-03-23","single"),
  ("Keith Kane","feugiat.metus@hotmail.com","2658517523","2023-02-16","2023-03-01","single"),
  ("Sage Cantrell","eget@protonmail.org","9994102527","2023-01-22","2023-01-27","single");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Jael Collier","pede.blandit@outlook.edu","0919567486","2023-01-29","2023-02-20","single"),
  ("Julian Vargas","suspendisse@google.com","9966077241","2023-02-08","2023-03-21","single"),
  ("Athena Blair","nunc.ullamcorper.velit@google.net","1703653856","2023-01-29","2023-03-13","single"),
  ("Tate Anderson","imperdiet.non@outlook.org","7217502397","2023-01-28","2023-02-22","single"),
  ("Florence Paul","nec.malesuada@protonmail.edu","8509226921","2023-01-23","2023-02-15","single"),
  ("Jarrod Howe","scelerisque@outlook.net","1129988470","2023-01-27","2023-03-11","double"),
  ("Gareth Garza","congue.turpis.in@aol.ca","6038708307","2023-01-23","2023-02-27","double"),
  ("Gavin Riddle","magna.duis@aol.net","0497614469","2023-02-13","2023-03-21","double"),
  ("Francis Whitney","enim.etiam@aol.net","5011898502","2023-03-18","2023-02-05","double"),
  ("Fletcher Wooten","in.consequat@aol.couk","2765726514","2023-03-18","2023-03-23","double");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Nolan Mccarty","sit.amet@yahoo.couk","2496511146","2023-01-30","2023-03-23","double"),
  ("Bert Fletcher","ut@aol.org","9713318047","2023-03-04","2023-01-31","double"),
  ("Imelda Browning","erat.neque@icloud.com","4838496963","2023-03-23","2023-02-07","double"),
  ("Ebony Hurley","arcu.et@icloud.com","5688676045","2023-02-23","2023-02-09","double"),
  ("Leila Wolfe","lorem.vehicula@protonmail.com","4058617657","2023-02-18","2023-03-14","double"),
  ("Clark Roberson","aliquam@hotmail.com","8427252423","2023-03-15","2023-02-11","double"),
  ("Harrison Meyers","orci.consectetuer.euismod@protonmail.ca","4600246643","2023-02-02","2023-02-20","double"),
  ("Yoshi Madden","amet@yahoo.com","7537844763","2023-01-31","2023-03-04","double"),
  ("Juliet Beck","nec.diam.duis@google.net","7266176890","2023-02-07","2023-03-30","double"),
  ("Giacomo Head","cras.vulputate.velit@hotmail.edu","9661700620","2023-02-11","2023-03-15","double");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Adrienne Larson","sed.consequat@protonmail.org","1274546438","2023-02-23","2023-02-12","suite"),
  ("Berk Craig","eget@icloud.ca","3755183715","2023-02-05","2023-01-23","suite"),
  ("Melinda Flores","sapien@google.com","4293781293","2023-02-14","2023-03-04","suite"),
  ("Barclay Coleman","quis.arcu@google.net","8921997247","2023-03-06","2023-03-28","suite"),
  ("Sylvester Hewitt","sociis.natoque.penatibus@icloud.couk","4626861125","2023-01-27","2023-03-14","suite"),
  ("Kenyon Dale","ut@yahoo.net","5455543462","2023-01-17","2023-03-14","suite"),
  ("Eugenia Sears","tincidunt@outlook.com","7136212115","2023-02-23","2023-02-01","suite"),
  ("Lucian Wall","dictum.eu@protonmail.edu","9658693272","2023-01-23","2023-01-31","suite"),
  ("Alfonso Nguyen","natoque.penatibus.et@hotmail.edu","4578572106","2023-01-24","2023-03-08","suite"),
  ("Burke Kirk","ut@protonmail.org","2128728799","2023-02-21","2023-02-11","suite");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Malcolm Morrow","nulla.eu.neque@hotmail.net","1275525549","2023-03-14","2023-01-24","suite"),
  ("Deanna Riddle","integer.tincidunt@google.edu","7126681305","2023-02-28","2023-04-01","suite"),
  ("Eaton Maddox","nisi.sem.semper@protonmail.ca","7235883783","2023-02-08","2023-02-01","suite"),
  ("Isabelle Moon","dapibus.id@google.net","1226421783","2023-02-20","2023-03-12","suite"),
  ("Camden Manning","lectus.justo@protonmail.edu","8961625486","2023-03-13","2023-02-15","suite");
