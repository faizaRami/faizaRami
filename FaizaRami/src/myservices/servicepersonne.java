package myservices;
import mymodels.Personne;
import java.sql.SQLException;
import java.util.ArrayList;

import mydao.daopersonne;


public class servicepersonne {
	
	public static boolean AjouterPersonne(Personne p) throws ClassNotFoundException, SQLException {
		boolean exist = daopersonne.PersonneExiste(p.getEmail());
		if(exist) {
			return false;
		}else {
			int res = daopersonne.AjouterEtudiant(p);
			return res == 1;
		}
	}
	
	public static Personne Authentification(String login,String password) throws ClassNotFoundException, SQLException {
		return daopersonne.authentification(login, password);
	}
	public static ArrayList<Personne> listeauteurs() throws ClassNotFoundException, SQLException{
		return daopersonne.listeauteurs();
	}
	
}