package mydao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import mymodels.Personne;
import mymodels.Role;

public class daopersonne {
	
	
	public static int AjouterEtudiant(Personne p) throws ClassNotFoundException, SQLException {
		Connexion.connect();
		int res = Connexion.Maj("INSERT INTO `personne`(`nom`, `prenom`, `email`, `mdp`, `role`) VALUES ('"+p.getNom()+"','"+p.getPrenom()+"','"+p.getEmail()+"','"+p.getMdp()+"','etudiant')");
		Connexion.disconnect();
		return res;
	}
	public static int getIdPerByName(String name) throws ClassNotFoundException, SQLException {
		int idper=0;
		Connexion.connect();
		ResultSet res = Connexion.Select("select id from personne where nom='"+name+"'");
		if(res.next()) {
			idper=res.getInt(1);
		}
		Connexion.disconnect();
		return idper;
	}
	public static Personne PersonneParId(int id) throws ClassNotFoundException, SQLException {
		Personne p=null;
		Connexion.connect();
		ResultSet res = Connexion.Select("select * from personne where id="+id);
		if(res.next()) {
			p=new Personne(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), null);
			if(res.getString(6).equals("etudiant")) {
				p.setRole(Role.ETUDIANT);
			} else if(res.getString(6).equals("admin")) {
				p.setRole(Role.ADMIN);
			}else {
				p.setRole(Role.AUTEUR);
			}
		}
		Connexion.disconnect();
		return p;
	}
	public static ArrayList<Personne> listeauteurs() throws SQLException, ClassNotFoundException{
		ArrayList<Personne> personne = new ArrayList<Personne>();
		Connexion.connect();
		ResultSet res = Connexion.Select("select * from personne where Role='auteur'");
		while(res.next()) {
			Personne p=new Personne(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), Role.AUTEUR);
			personne.add(p);
		}
		Connexion.disconnect();
		return personne;
	}	

	public static boolean PersonneExiste(String email) throws ClassNotFoundException, SQLException {
		boolean exist = false ;
		Connexion.connect();
		ResultSet res = Connexion.Select("select * from personne where email='"+email+"'");
		if(res.next()) {
			exist=true;
		}
		Connexion.disconnect();
		return exist;
	}
	
	public static Personne authentification(String login,String password) throws SQLException, ClassNotFoundException {
		ResultSet res = null;
		Personne p=null;
		Connexion.connect();
		res = Connexion.Select("select * from personne where email='"+login+"' and mdp='"+password+"'");
		if(res.next()) {
			p=new Personne(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), null);
			if(res.getString(6).equals("etudiant")) {
				p.setRole(Role.ETUDIANT);
			} else if(res.getString(6).equals("admin")) {
				p.setRole(Role.ADMIN);
			}else {
				p.setRole(Role.AUTEUR);
			}
		}
		Connexion.disconnect();
		return p;
	}
}