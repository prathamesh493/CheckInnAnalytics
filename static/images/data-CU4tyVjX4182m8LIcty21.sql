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
  ("Virginia","magna.a@protonmail.ca","3380625597","2023-02-14","2023-02-28","single"),
  ("Cameron","ornare.libero.at@protonmail.couk","3122631848","2023-02-13","2023-02-28","single"),
  ("Yasir","enim.condimentum@hotmail.couk","4212012721","2023-02-12","2023-02-26","single"),
  ("Regina","mauris@outlook.ca","1849153703","2023-02-12","2023-02-28","single"),
  ("Maris","nascetur@google.ca","2861632081","2023-02-13","2023-02-27","single"),
  ("Ignacia","nibh.dolor@protonmail.net","1395843924","2023-02-11","2023-02-26","single"),
  ("Tarik","eros@yahoo.org","4154672410","2023-02-12","2023-02-28","single"),
  ("Pamela","semper@icloud.net","7961033329","2023-02-11","2023-02-27","single"),
  ("Leilani","bibendum.fermentum.metus@aol.couk","7084175640","2023-02-14","2023-02-27","single"),
  ("Cade","ac.ipsum@protonmail.net","8766659331","2023-02-14","2023-02-27","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Patricia","non@icloud.net","1793885713","2023-02-12","2023-02-28","double"),
  ("Illiana","consequat.enim.diam@aol.couk","9786895946","2023-02-12","2023-02-26","double"),
  ("TaShya","convallis.convallis@protonmail.net","4144466786","2023-02-12","2023-02-27","double"),
  ("Ingrid","sit@protonmail.couk","1333453729","2023-02-12","2023-02-28","double"),
  ("Nyssa","elit.pharetra@icloud.couk","6176911340","2023-02-13","2023-02-28","double"),
  ("Orla","vel.arcu@protonmail.couk","0418380665","2023-02-13","2023-02-27","double"),
  ("Colt","nec@yahoo.net","4143176215","2023-02-13","2023-02-28","double"),
  ("Kiara","ac.mattis.ornare@yahoo.ca","4165326217","2023-02-11","2023-02-28","double"),
  ("Caleb","dui.semper.et@google.org","1967799381","2023-02-14","2023-02-27","double"),
  ("Cain","odio.a@yahoo.edu","1375243869","2023-02-13","2023-02-27","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Ralph","integer@hotmail.org","3747652411","2023-02-14","2023-02-27","suite"),
  ("Sonia","arcu.vestibulum.ante@hotmail.net","9751172654","2023-02-12","2023-02-26","suite"),
  ("Wanda","vehicula@yahoo.net","1350839689","2023-02-14","2023-02-27","suite"),
  ("Quintessa","integer@outlook.com","1106717068","2023-02-12","2023-02-27","suite"),
  ("Garrett","purus.duis.elementum@google.com","4320377499","2023-02-13","2023-02-28","suite"),
  ("Yoshio","nibh.dolor@protonmail.ca","3468284674","2023-02-13","2023-02-27","suite"),
  ("Cairo","suspendisse.eleifend@yahoo.couk","0842460709","2023-02-13","2023-02-26","suite"),
  ("Quinn","cum.sociis@protonmail.org","7540888130","2023-02-14","2023-02-26","suite"),
  ("Phillip","nunc.quis.arcu@protonmail.net","6876519548","2023-02-15","2023-02-26","suite"),
  ("Cecilia","ornare.elit@outlook.org","8464466135","2023-02-15","2023-02-27","suite");
