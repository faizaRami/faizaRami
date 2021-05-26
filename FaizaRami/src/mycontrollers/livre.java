package mycontrollers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mymodels.Categorie;
import mymodels.Livre;
import mymodels.Personne;

import myservices.servicelivre;


/**
 * Servlet implementation class livre
 */
@WebServlet("/livre")
public class livre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public livre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean res = false;
		/*HttpSession session = request.getSession();*/
		PrintWriter out = response.getWriter();
		
		
		Livre l = new Livre(Integer.parseInt( request.getParameter("isbn")), request.getParameter("titre"), request.getParameter("genre"), request.getParameter("description"),Integer.parseInt( request.getParameter("ae")), new Categorie(0,request.getParameter("nomCa"), null, null) ,new Personne(0,request.getParameter("nompa"), null, null, null, null) );
		 try {
			res = servicelivre.Ajouterlivre(l);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(res) {
	out.print("votre livre a été bien ajouté");
	
			
		}else {
			out.print("Votre livre a été echoué");
		}
		}

}
