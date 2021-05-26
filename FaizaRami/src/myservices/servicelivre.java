package myservices;

import java.sql.SQLException;
import java.util.ArrayList;

import mydao.daolivre;
import mymodels.Livre;

public class servicelivre {

		
		 public static ArrayList<Livre> listelivre() throws SQLException, ClassNotFoundException{
				
				
				return ( ArrayList<Livre>)daolivre.listelivre();
			}

	 public static boolean Ajouterlivre(Livre l) throws SQLException, ClassNotFoundException{
				
				boolean exist=daolivre.livreExiste(l.getIsbn());
				if(exist) {
					return false;
				}else {
					int res= daolivre.Ajouterlivre(l);
					return res==1;
				}
				
		
}
}