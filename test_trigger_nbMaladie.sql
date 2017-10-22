/*Test du premier trigger avec un insert (trigger_nb_maladie)*/
DELETE FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesMaladies WHERE nomA = 'pattenrond';
DELETE FROM LesGardiens WHERE nomE = 'hermione';
INSERT INTO LesCages VALUES (88, 'flereur', 17);
INSERT INTO LesGardiens VALUES (88, 'hermione');
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
INSERT INTO LesMaladies VALUES ('pattenrond','grippe');
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
COMMIT;

/*Test du premier trigger avec un delete (trigger_nb_maladie)*/
DELETE FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesMaladies WHERE nomA = 'pattenrond';
DELETE FROM LesGardiens WHERE nomE = 'hermione';
INSERT INTO LesCages VALUES (88, 'flereur', 17);
INSERT INTO LesGardiens VALUES (88, 'hermione');
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
INSERT INTO LesMaladies VALUES ('pattenrond','grippe');
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesMaladies;
SELECT * FROM LesAnimaux WHERE nomA = 'pattenrond';
COMMIT;
