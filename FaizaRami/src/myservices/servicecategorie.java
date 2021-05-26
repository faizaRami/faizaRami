package myservices;

import java.sql.SQLException;
import java.util.ArrayList;
import mydao.daocategorie;
import mymodels.Categorie;

public class servicecategorie {
	public static ArrayList<Categorie> listecategorie() throws SQLException, ClassNotFoundException{
		
		
		return ( ArrayList<Categorie>)daocategorie.listecategorie();
	}

}
