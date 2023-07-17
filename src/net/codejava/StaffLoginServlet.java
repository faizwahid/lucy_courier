package net.codejava;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginStaff")
public class StaffLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public StaffLoginServlet() {
        super();
       
    }
    	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    			throws ServletException, IOException {
    		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		
    		StaffDAO staffDao = new StaffDAO();
    		
    		try {
    			Staff staff = staffDao.checkLogin(email, password);
    			String destPage = "loginStaff.jsp";
    			
    			if (staff != null) {
    				HttpSession session = request.getSession();
    				session.setAttribute("staff", staff);
    				destPage = "ListStaffController";
    			} else {
    				String message = "Invalid email/password";
    				request.setAttribute("message", message);
    			}
    			
    			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
    			dispatcher.forward(request, response);
    			
    		} catch (SQLException | ClassNotFoundException ex) {
    			throw new ServletException(ex);
    		}
    	}
    	

}
