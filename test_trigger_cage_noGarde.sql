/*Test du troisième trigger avec un insert (trigger_cage_gardee)*/
DELETE FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesGardiens WHERE noCage = 88;
INSERT INTO LesCages VALUES (88, 'chat', 17);
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
COMMIT;

/*Test du troisième trigger avec un update (trigger_cage_gardee)*/
DELETE FROM LesAnimaux WHERE nomA = 'pattenrond';
DELETE FROM LesCages WHERE noCage = 88;
DELETE FROM LesGardiens WHERE noCage = 89;
INSERT INTO LesGardiens VALUES (88, 'hermione');
INSERT INTO LesCages VALUES (88, 'chat', 17);
INSERT INTO LesCages VALUES (89, 'chat', 17);
INSERT INTO LesAnimaux VALUES ('pattenrond', 'male', 'chat', 'flereur', 'angleterre', 1993, 88, 0);
UPDATE LesAnimaux SET noCage = 89 WHERE nomA = 'pattenrond';
COMMIT;
