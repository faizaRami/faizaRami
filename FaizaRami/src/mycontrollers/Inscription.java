package mycontrollers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import myservices.servicepersonne;
import mymodels.Personne;


@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/inscrire.jsp").include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean res = false;
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Personne p = new Personne(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("email"), request.getParameter("mdp"), null);
		 try {
			res = servicepersonne.AjouterPersonne(p);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(res) {
			Personne per = (Personne)session.getAttribute("personne");
			if(per==null) {
				response.sendRedirect("http://localhost:8282/FaizaRami/authentification");
			}
			
		}else {
			out.print("Votre inscription a été echoué");
		}
	}

}