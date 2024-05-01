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
  ("Irma","eu.odio@hotmail.org","7267244230","2023-01-30","2023-02-17","single"),
  ("Quamar","ultrices.a.auctor@yahoo.ca","6625628172","2023-01-28","2023-02-14","single"),
  ("Cassidy","adipiscing.ligula@protonmail.net","5161524517","2023-01-30","2023-02-17","single"),
  ("Claire","a@yahoo.edu","5283659648","2023-02-01","2023-02-16","single"),
  ("Rafael","nec.euismod@icloud.org","0166413217","2023-01-31","2023-02-17","single"),
  ("Matthew","fringilla@aol.couk","8692712333","2023-01-31","2023-02-17","single"),
  ("Jasmine","nullam.suscipit@protonmail.edu","3724569411","2023-01-29","2023-02-16","single"),
  ("Grant","hendrerit.neque@protonmail.couk","5281251182","2023-01-30","2023-02-15","single"),
  ("Gage","adipiscing.lobortis@icloud.edu","1419115012","2023-02-01","2023-02-17","single"),
  ("Hoyt","tempor.arcu@protonmail.ca","2538611721","2023-01-29","2023-02-14","single");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Camden","feugiat.metus@aol.ca","0298297119","2023-01-31","2023-02-15","double"),
  ("Kibo","luctus.lobortis.class@icloud.org","1531495264","2023-01-30","2023-02-14","double"),
  ("Melodie","gravida@outlook.org","1958729832","2023-01-28","2023-02-16","double"),
  ("Felix","donec.consectetuer@protonmail.com","6311565733","2023-02-01","2023-02-15","double"),
  ("Justin","sollicitudin.adipiscing.ligula@yahoo.com","9160053534","2023-01-29","2023-02-18","double"),
  ("Hop","non.sollicitudin@yahoo.ca","7101437869","2023-01-29","2023-02-17","double"),
  ("Yardley","velit@google.net","2881543835","2023-02-01","2023-02-18","double"),
  ("August","neque.sed.dictum@hotmail.com","2237029498","2023-01-30","2023-02-15","double"),
  ("Gannon","convallis.in.cursus@icloud.com","6065113836","2023-01-27","2023-02-17","double"),
  ("Riley","luctus.et.ultrices@google.com","5594622019","2023-01-29","2023-02-18","double");
INSERT INTO `myTable` (`name`,`email`,`phone`,`checkin`,`checkout`,`roomtype`)
VALUES
  ("Cullen","consectetuer.mauris@icloud.couk","7130657539","2023-01-29","2023-02-16","suite"),
  ("Bert","mauris.vel@icloud.org","1996293283","2023-01-29","2023-02-17","suite"),
  ("Garth","semper.erat@protonmail.org","1584226644","2023-01-28","2023-02-16","suite"),
  ("Grant","quam@aol.org","5255312845","2023-02-01","2023-02-16","suite"),
  ("Shana","sit.amet.luctus@aol.couk","0727472643","2023-01-29","2023-02-18","suite"),
  ("Price","mi@icloud.couk","2533383776","2023-01-30","2023-02-16","suite"),
  ("Jaquelyn","luctus@google.net","5232536320","2023-01-31","2023-02-16","suite"),
  ("Uriah","consectetuer.adipiscing.elit@yahoo.couk","6203466472","2023-01-29","2023-02-17","suite"),
  ("Amelia","nam.nulla@google.com","3721963574","2023-01-28","2023-02-17","suite"),
  ("Danielle","ut.nisi.a@icloud.couk","5090685882","2023-01-28","2023-02-17","suite");
