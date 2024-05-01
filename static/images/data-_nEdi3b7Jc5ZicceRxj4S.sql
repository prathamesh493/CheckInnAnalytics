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
  ("Chantale","tellus@outlook.edu","6988161266","2023-01-11","2023-01-31","single"),
  ("Kieran","cursus.et@hotmail.ca","7216766382","2023-01-14","2023-01-30","single"),
  ("Lillian","aliquet.diam@icloud.couk","5913724730","2023-01-13","2023-01-30","single"),
  ("Chastity","ante.iaculis@protonmail.ca","6496160032","2023-01-13","2023-01-30","single"),
  ("Deborah","cras@protonmail.org","1910606866","2023-01-12","2023-01-30","single"),
  ("Aquila","non.massa.non@protonmail.com","3959441178","2023-01-10","2023-01-30","single"),
  ("Hyatt","interdum.ligula.eu@yahoo.org","7462100628","2023-01-15","2023-01-30","single"),
  ("Sandra","molestie.sed@icloud.couk","8447869633","2023-01-14","2023-01-31","single"),
  ("Alfreda","quis.massa@yahoo.com","0495479677","2023-01-12","2023-01-30","single"),
  ("Maris","volutpat.nulla@google.couk","2180205811","2023-01-12","2023-01-31","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Irene","porttitor.eros@hotmail.ca","4846723076","2023-01-12","2023-01-30","double"),
  ("Xander","integer@yahoo.net","0182624146","2023-01-12","2023-01-31","double"),
  ("Mercedes","ligula.aliquam@hotmail.ca","5297466264","2023-01-13","2023-01-31","double"),
  ("Carter","consectetuer.euismod@hotmail.org","4267542211","2023-01-11","2023-01-31","double"),
  ("Arthur","nunc.ac.mattis@aol.net","6059378646","2023-01-12","2023-01-30","double"),
  ("Victor","condimentum.eget@hotmail.couk","4342067485","2023-01-12","2023-01-30","double"),
  ("Alexis","eget.ipsum@hotmail.net","2554957818","2023-01-13","2023-01-29","double"),
  ("Austin","eu.metus@protonmail.com","6207128401","2023-01-13","2023-01-31","double"),
  ("Orla","duis.a@protonmail.net","5482226045","2023-01-15","2023-01-30","double"),
  ("Audra","bibendum.fermentum.metus@outlook.org","2595815576","2023-01-14","2023-01-30","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Anthony","auctor@icloud.ca","8852712646","2023-01-12","2023-01-30","suite"),
  ("Randall","nunc.mauris@hotmail.net","4489128711","2023-01-11","2023-01-30","suite"),
  ("Neville","id.erat@protonmail.net","1121731061","2023-01-15","2023-01-30","suite"),
  ("Hiram","pulvinar.arcu.et@aol.edu","1149566825","2023-01-14","2023-01-30","suite"),
  ("Dean","aliquet@icloud.com","8682710673","2023-01-13","2023-01-31","suite"),
  ("Hakeem","non.vestibulum@outlook.org","8713637422","2023-01-14","2023-01-30","suite"),
  ("Gregory","et.ultrices@protonmail.com","6295731842","2023-01-14","2023-01-30","suite"),
  ("Octavius","et@yahoo.edu","5144907804","2023-01-11","2023-01-30","suite"),
  ("Erasmus","nisl.nulla@aol.com","4765587077","2023-01-13","2023-01-30","suite"),
  ("Chase","proin.vel@yahoo.org","7652435449","2023-01-15","2023-01-30","suite");
