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

INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Buffy","nisl.elementum@aol.edu","2511726656","2023-03-05","2023-03-21","single"),
  ("Hope","magna.duis.dignissim@hotmail.couk","5742953444","2023-03-04","2023-03-25","single"),
  ("Phelan","faucibus.ut@aol.org","4109817631","2023-03-05","2023-03-22","single"),
  ("Natalie","risus.donec@outlook.couk","2072091433","2023-03-05","2023-03-22","single"),
  ("Vladimir","vulputate@outlook.com","2113135746","2023-03-02","2023-03-27","single"),
  ("Kathleen","magnis.dis.parturient@icloud.com","0563566844","2023-03-03","2023-03-23","single"),
  ("Nehru","enim.diam@aol.org","2611763951","2023-03-04","2023-03-27","single"),
  ("Alan","nisi.magna.sed@aol.ca","4658351813","2023-03-06","2023-03-26","single"),
  ("Emily","pretium@google.com","3533248921","2023-03-03","2023-03-22","single"),
  ("Brody","nec.mollis.vitae@google.net","7941473776","2023-03-03","2023-03-30","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Idola","aliquam.ultrices.iaculis@outlook.com","6316853832","2023-03-04","2023-03-27","double"),
  ("Xandra","nunc@aol.com","1902524634","2023-03-01","2023-03-27","double"),
  ("Travis","tempor.augue.ac@protonmail.com","2086521442","2023-03-05","2023-03-24","double"),
  ("Clare","rutrum.non.hendrerit@google.com","4401179344","2023-03-04","2023-03-19","double"),
  ("Kay","a@hotmail.edu","3731119411","2023-03-03","2023-03-19","double"),
  ("Austin","nec@yahoo.com","8353677161","2023-03-01","2023-03-19","double"),
  ("Adrian","donec.consectetuer.mauris@yahoo.org","6185848875","2023-03-03","2023-03-25","double"),
  ("William","in.faucibus.morbi@google.ca","3215213105","2023-03-04","2023-03-25","double"),
  ("Wayne","nullam@outlook.couk","1097361545","2023-03-03","2023-03-24","double"),
  ("Solomon","non.magna@icloud.com","7713147063","2023-03-03","2023-03-26","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Halla","magna.nam@protonmail.couk","8612767263","2023-03-02","2023-03-24","suite"),
  ("Dawn","ante@outlook.org","8171622058","2023-03-02","2023-03-19","suite"),
  ("Jakeem","arcu.vel@aol.edu","8186586488","2023-03-05","2023-03-19","suite"),
  ("Angelica","sed.nunc@protonmail.org","2437929454","2023-03-02","2023-03-28","suite"),
  ("Tamekah","et.ultrices@protonmail.couk","2234255612","2023-03-04","2023-03-22","suite"),
  ("Hanna","non.magna.nam@aol.com","2976382584","2023-03-03","2023-03-19","suite"),
  ("Cole","eu.dolor.egestas@aol.com","1718688440","2023-03-02","2023-03-23","suite"),
  ("Walter","a@aol.couk","3686576676","2023-03-06","2023-03-27","suite"),
  ("Merrill","ut.pharetra@aol.net","9868924637","2023-03-03","2023-03-23","suite"),
  ("Gabriel","ornare.libero.at@yahoo.com","4855571082","2023-03-05","2023-03-27","suite");
