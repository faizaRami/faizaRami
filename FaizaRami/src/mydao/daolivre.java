package mydao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mymodels.Livre;


public class daolivre {

	public static Livre LivreParId(int id) throws ClassNotFoundException, SQLException {
		Livre l=null;
		Connexion.connect();
		ResultSet res = Connexion.Select("select * from livre where id="+id);
		if(res.next()) {
			l=new Livre(res.getInt(1), res.getInt(2), res.getString(3), res.getString(4),res.getString(5), res.getInt(6), null,null);
		}
		Connexion.disconnect();
		return l;
	}
	public static ArrayList<Livre> listelivre() throws SQLException, ClassNotFoundException{
		ArrayList<Livre> livres = new ArrayList<Livre>();
		Connexion.connect();
		ResultSet res = Connexion.Select("select * from livre");
		while(res.next()) {
			Livre l =new Livre(res.getInt(1), res.getInt(2), res.getString(3),res.getString(4),res.getString(5),res.getInt(6),null, null);
			l.setCategorie(daocategorie.categorieParId(res.getInt(7)));
			l.setAuteur(daopersonne.PersonneParId(res.getInt(8)));
			livres.add(l);
		}
		Connexion.disconnect();
		return livres;
	}
	public static int Ajouterlivre(Livre l) throws ClassNotFoundException, SQLException {
		int a=daocategorie.getIdCatByName(l.getCategorie().getNom());
		int b=daopersonne.getIdPerByName(l.getAuteur().getNom());
		Connexion.connect();
		int res = Connexion.Maj("INSERT INTO `livre`(`isbn`, `titre`, `genre`, `description`, `annee_edition`,`idcategorie`,`idauteur`) VALUES ("+l.getIsbn()+",'"+l.getTitre()+"','"+l.getGenre()+"','"+l.getDescription()+"',"+l.getAnnee_edition()+","+a+","+b+")");
		Connexion.disconnect();
		return res;
	}
	public static boolean livreExiste(int isbn) throws ClassNotFoundException, SQLException {
		boolean exist=false;
		Connexion.connect();
		ResultSet res=Connexion.Select("select * from livre where isbn="+isbn);
		if(res.next()) {
			exist=true;
		}
		Connexion.disconnect();
		return exist;

		
	}



}
