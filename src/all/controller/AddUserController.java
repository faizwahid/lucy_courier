package all.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.codejava.UserDAO;
import net.codejava.User;

/**
 * Servlet implementation class AddUserController
 */
@WebServlet("/AddUserController")
public class AddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserController() {
        super();
        dao = new UserDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User u = new User();
		u.setFullname(request.getParameter("fullname"));
		u.setEmail(request.getParameter("email"));
		u.setPassword(request.getParameter("password"));
		
		dao.addUser(u);
		
		request.setAttribute("users", UserDAO.getAllUsers());
		RequestDispatcher view = request.getRequestDispatcher("user-view.jsp");
		view.forward(request, response);
	}

}
