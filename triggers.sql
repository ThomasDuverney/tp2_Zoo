/*Question 1 */

CREATE OR REPLACE TRIGGER trigger_nb_maladie
  BEFORE INSERT OR DELETE ON LesMaladies
  FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE LesAnimaux SET nb_maladies = nb_maladies + 1 WHERE nomA = :NEW.nomA;
    END IF;
    IF DELETING THEN
        UPDATE LesAnimaux SET nb_maladies = nb_maladies - 1 WHERE nomA = :old.nomA;
    END IF;
END;
/

/*Question 2 */

CREATE OR REPLACE TRIGGER trigger_cage_fonction
  BEFORE INSERT OR UPDATE ON lesAnimaux
  FOR EACH ROW  
  DECLARE 
    func varchar2(20);
  BEGIN
    SELECT fonction INTO func from lesCages where noCage = :new.noCage;
    IF func!=:new.fonction_cage THEN
      raise_application_error(-20001, 'ERREUR: Vous ne pouvez pas insérer un animal dans cette cage : fonction incompatible');
    END IF;
  END;
/

/*Question 3*/
CREATE OR REPLACE TRIGGER trigger_cage_gardee
  BEFORE INSERT OR UPDATE ON lesAnimaux
  FOR EACH ROW  
  DECLARE 
    nbGardien NUMBER;
  BEGIN
    SELECT count(*) INTO nbGardien from LesGardiens where noCage = :new.noCage;
    IF nbGardien<1 THEN
      raise_application_error(-20001, 'ERREUR: Vous ne pouvez pas insérer un animal dans cette cage : cage non gardéeS');
    END IF;
  END;
/
