
DELETE FROM LesGardiens WHERE noCage = 88;
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesMaladies WHERE nomA = 'pattenrond';
DELETE FROM LesEmployes WHERE nomE = 'hermione';
INSERT INTO LesEmployes VALUES ('hermione', 'angleterre');
INSERT INTO LesCages VALUES (88, 'flereur', 10);
INSERT INTO LesGardiens VALUES (88, 'hermione');
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
INSERT INTO LesMaladies VALUES ('pattenrond','grippe');
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
COMMIT;


DELETE FROM LesGardiens WHERE noCage = 88;
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesMaladies WHERE nomA = 'pattenrond';
DELETE FROM LesEmployes WHERE nomE = 'hermione';
INSERT INTO LesEmployes VALUES ('hermione', 'angleterre');
INSERT INTO LesCages VALUES (88, 'flereur', 10);
INSERT INTO LesGardiens VALUES (88, 'hermione');
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
INSERT INTO LesMaladies VALUES ('pattenrond','grippe');
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesMaladies;
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
COMMIT;
