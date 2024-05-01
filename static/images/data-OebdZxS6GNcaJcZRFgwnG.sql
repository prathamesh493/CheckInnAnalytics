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
  ("Tyler","scelerisque.scelerisque@yahoo.com","4881144580","2023-02-01","2023-02-17","single"),
  ("Cain","laoreet.posuere@protonmail.edu","4838206458","2023-02-01","2023-02-16","single"),
  ("Melissa","et.lacinia@protonmail.org","1218451743","2023-01-31","2023-02-16","single"),
  ("Bruno","tortor.at.risus@protonmail.edu","9642846261","2023-01-28","2023-02-17","single"),
  ("Riley","magna.tellus@outlook.edu","8569151120","2023-01-30","2023-02-17","single"),
  ("Deirdre","luctus.ut@aol.edu","3309714347","2023-01-29","2023-02-18","single"),
  ("Lacey","amet.ornare.lectus@aol.org","3150783512","2023-01-29","2023-02-17","single"),
  ("Dominic","amet.ante.vivamus@protonmail.couk","5738212194","2023-01-29","2023-02-18","single"),
  ("Eliana","aliquam@protonmail.net","5556177316","2023-01-30","2023-02-16","single"),
  ("Cade","natoque.penatibus@yahoo.com","3268181828","2023-02-01","2023-02-17","single");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Jared","tellus.suspendisse@hotmail.edu","8976822642","2023-01-28","2023-02-14","double"),
  ("Kaseem","nec.eleifend@yahoo.net","0447881852","2023-01-31","2023-02-16","double"),
  ("Glenna","dolor.fusce@hotmail.edu","7208668712","2023-02-01","2023-02-15","double"),
  ("Quinlan","erat.vivamus@protonmail.ca","9353898263","2023-01-31","2023-02-14","double"),
  ("Griffin","sociis.natoque.penatibus@hotmail.com","7721974235","2023-01-31","2023-02-14","double"),
  ("Orli","aliquam.enim@protonmail.com","2325323615","2023-01-30","2023-02-16","double"),
  ("Todd","dis.parturient.montes@hotmail.com","0856256871","2023-02-01","2023-02-16","double"),
  ("Whoopi","adipiscing.elit.aliquam@aol.net","4638837815","2023-01-29","2023-02-16","double"),
  ("Sonya","duis.mi@hotmail.ca","6511423451","2023-01-28","2023-02-15","double"),
  ("Jolene","rutrum.fusce.dolor@yahoo.couk","6746761416","2023-02-01","2023-02-17","double");
INSERT INTO bookings (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Rhona","molestie.orci.tincidunt@google.ca","8122207041","2023-01-28","2023-02-17","suite"),
  ("Diana","augue.sed@protonmail.edu","7487649123","2023-01-31","2023-02-17","suite"),
  ("Priscilla","donec.tempor@icloud.couk","1618795055","2023-01-27","2023-02-17","suite"),
  ("Heidi","pede.et@hotmail.com","7875744722","2023-01-27","2023-02-15","suite"),
  ("Felix","tellus.nunc.lectus@yahoo.edu","4119850543","2023-01-28","2023-02-17","suite"),
  ("Chester","in.dolor@google.net","4328371162","2023-01-31","2023-02-17","suite"),
  ("Hannah","libero.integer@icloud.org","4091460256","2023-01-28","2023-02-15","suite"),
  ("Xavier","pede.nonummy@hotmail.net","1394579617","2023-01-29","2023-02-14","suite"),
  ("Keane","at.auctor@outlook.edu","1963846434","2023-02-01","2023-02-16","suite"),
  ("Quemby","magna.praesent.interdum@protonmail.couk","4572686125","2023-01-30","2023-02-18","suite");
