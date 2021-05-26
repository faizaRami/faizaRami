package mycontrollers;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mymodels.Personne;
import mymodels.Role;
import myservices.servicepersonne;
/**
 * Servlet implementation class authentification
 */
@WebServlet("/Authentification")
public class Authentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authentification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	this.getServletContext().getRequestDispatcher("/authentification.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personne p=null;
		String email=request.getParameter("email");
		String password=request.getParameter("mdp");

		
		try {
			p=servicepersonne.Authentification(email,password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(p==null) {
			response.sendRedirect("http://localhost:8282/FaizaRami/authentification");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("personne",p);
			if(p.getRole().equals(Role.ADMIN)) {
				response.sendRedirect("http://localhost:8282/FaizaRami/admin");
			}else {
				response.sendRedirect("http://localhost:8282/FaizaRami/etudiant");
			}
		}
	}

}
