package zoo_tp2;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class squelette_appli {
	
	static final String CONN_URL = "jdbc:oracle:thin:@im2ag-oracle.e.ujf-grenoble.fr:1521:im2ag";
	
	static final String USER = "duvernet";
	static final String PASSWD = "duvernetBD";

	static Connection conn; 
    public static void ajouterAnimal() throws SQLException {
            String nomA = LectureClavier.lireChaine("Nom de l'animal :");
            String sexe = LectureClavier.lireChaine("Sexe :");
            String type = LectureClavier.lireChaine("Type :");
            String fonction = LectureClavier.lireChaine("Fonction :");
            String pays = LectureClavier.lireChaine("Pays :");
            int noCage = LectureClavier.lireEntier("noCage :");

            /* insert Les animaux*/
            PreparedStatement prep1 = squelette_appli.conn.prepareStatement("Insert into LesAnimaux (nomA, sexe, type_an, fonction_cage, pays, noCage) values (?,?,?,?,?,?)");
            prep1.setString(1, nomA);
            prep1.setString(2, sexe);
            prep1.setString(3, type);
            prep1.setString(4, fonction);
            prep1.setString(5, pays);
            prep1.setInt(6, noCage);
            prep1.executeQuery();
    }
    
    public static void afficherCages() throws SQLException {
            // code m�tier de la fonctionnalit�
            int cage = LectureClavier.lireEntier("Numero de la cage : ");
            System.out.println("Fonction de la cage :");
            String fonction = LectureClavier.lireChaine();

            ResultSet rs = conn.prepareStatement("SELECT noCage FROM LesCages").executeQuery();
            while (rs.next()) {
                for (int i = 1; i <= 1; i++) {
                    if (i > 1) System.out.print(",  ");
                    int columnValue = rs.getInt(i);
                    System.out.print(columnValue);
                }
                System.out.println("");
            }
    }
    
     public static void updateLesCages() throws SQLException {
            /*UPDATE Les cages*/
            String fonction = LectureClavier.lireChaine("Fonction :");
            int noCage = LectureClavier.lireEntier("noCage :");

            PreparedStatement prep1 = conn.prepareStatement("UPDATE LesCages SET fonction = ? WHERE noCage = ?");
            prep1.setString(1, fonction);
            prep1.setInt(2, noCage);
            prep1.executeQuery();
     }
     
     public static void deplacerAnimalCage() throws SQLException{
            String nomA = LectureClavier.lireChaine("Nom de l'animal");
            PreparedStatement prep = conn.prepareStatement("SELECT LesCages.noCage FROM LesCages JOIN LesAnimaux ON LesCages.fonction = LesAnimaux.fonction_cage WHERE LesAnimaux.nomA = ?");
            prep.setString(1, nomA);
            ResultSet rs = prep.executeQuery();
            
            System.out.println("NoCages :");
            while (rs.next()) {
                for (int i = 1; i <= 1; i++) {
                    if (i > 1) System.out.print(",  ");
                    int columnValue = rs.getInt(i);
                    System.out.print(columnValue);
                }
                System.out.println("");
            }
            
            int noCage = LectureClavier.lireEntier("noCage :");
            PreparedStatement prep1 = conn.prepareStatement("UPDATE LesAnimaux SET noCage = ? WHERE nomA = ?");
            prep1.setInt(1, noCage);
            prep1.setString(2, nomA);
            prep1.executeQuery();
     
     }
    
	
    public static void main(String args[]) {

        try {
        
  	    // Enregistrement du driver Oracle
  	    System.out.print("Loading Oracle driver... "); 
  	    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());  	    System.out.println("loaded");
  	    
  	    // Etablissement de la connection
  	    System.out.print("Connecting to the database... "); 
 	    conn = DriverManager.getConnection(CONN_URL,USER,PASSWD);
   	    System.out.println("connected");
  	    
  	    // Desactivation de l'autocommit
            conn.setAutoCommit(false);
  	    System.out.println("Autocommit disabled");
           
            deplacerAnimalCage();
            
            conn.close(); 
 	    
  	    System.out.println("bye.");
  	    
  	    // traitement d'exception
          } catch (SQLException e) {
              System.err.println("failed");
              System.out.println("Affichage de la pile d'erreur");
  	          e.printStackTrace(System.err);
              System.out.println("Affichage du message d'erreur");
              System.out.println(e.getMessage());
              System.out.println("Affichage du code d'erreur");
  	          System.out.println(e.getErrorCode());	    

          }
     }
}
/*
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



update LesAnimaux set noCage=2 where nomA = 'Milou';





*/
