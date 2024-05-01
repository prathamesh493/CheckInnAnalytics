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
  ("Solomon","leo@protonmail.couk","7743811431","2023-04-02","2023-04-24","single"),
  ("Martin","sed.pede@outlook.edu","3160812649","2023-04-04","2023-04-29","single"),
  ("Timothy","nunc.interdum@google.couk","4477478518","2023-04-03","2023-04-23","single"),
  ("Knox","maecenas.mi@hotmail.org","7149714115","2023-04-03","2023-04-26","single"),
  ("Isaiah","dignissim.magna@icloud.edu","5343144482","2023-04-04","2023-04-24","single"),
  ("Harlan","facilisis.eget@aol.org","5378841327","2023-04-03","2023-04-28","single"),
  ("Ian","arcu.vivamus.sit@hotmail.net","2771265084","2023-04-04","2023-04-29","single"),
  ("Brennan","donec.feugiat@protonmail.net","9823174078","2023-04-03","2023-04-27","single"),
  ("Adrian","urna.nunc.quis@hotmail.edu","4681685284","2023-04-04","2023-04-24","single"),
  ("Basil","ipsum.dolor.sit@icloud.net","4352092156","2023-04-03","2023-04-28","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("India","lectus.quis@outlook.couk","4321541245","2023-04-03","2023-04-26","double"),
  ("Maggy","et.malesuada.fames@protonmail.com","1887272787","2023-04-03","2023-04-23","double"),
  ("Dylan","eu.placerat@hotmail.net","5114522355","2023-04-03","2023-04-23","double"),
  ("Laith","nunc@outlook.com","9790435314","2023-04-04","2023-04-24","double"),
  ("Ryder","nunc.sed.orci@protonmail.couk","1166872460","2023-04-04","2023-04-26","double"),
  ("Keaton","sit.amet@google.com","2203763145","2023-04-03","2023-04-23","double"),
  ("Gray","et.magnis@yahoo.edu","7131869373","2023-04-02","2023-04-30","double"),
  ("Gavin","at.velit@hotmail.org","6922822551","2023-04-04","2023-04-24","double"),
  ("Tate","velit.quisque@icloud.org","7758771385","2023-04-02","2023-04-24","double"),
  ("Zelda","aliquam@outlook.edu","8245436516","2023-04-03","2023-04-23","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Alisa","ac.mattis@yahoo.couk","2369636655","2023-04-04","2023-04-27","suite"),
  ("Kyle","gravida.aliquam@protonmail.couk","5123573479","2023-04-04","2023-04-28","suite"),
  ("Cole","natoque.penatibus@protonmail.couk","5966158111","2023-04-04","2023-04-26","suite"),
  ("Geoffrey","mauris.suspendisse.aliquet@protonmail.edu","5287667752","2023-04-04","2023-04-30","suite"),
  ("Jesse","non.quam@google.edu","1314483534","2023-04-03","2023-04-25","suite"),
  ("Jameson","praesent.eu@aol.org","8143295323","2023-04-04","2023-04-23","suite"),
  ("Ethan","neque.tellus.imperdiet@hotmail.com","1645247505","2023-04-04","2023-04-26","suite");
