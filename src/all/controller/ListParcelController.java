package all.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import all.dao.RoomDAO;

/**
 * Servlet implementation class ListRoomController
 */
@WebServlet("/ListRoomController")
public class ListParcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListParcelController() {
        super();
        dao = new RoomDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("rooms", RoomDAO.getAllRooms());
		RequestDispatcher view = request.getRequestDispatcher("room-view.jsp");
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("rooms", RoomDAO.getAllRooms());
		RequestDispatcher view = request.getRequestDispatcher("room-view.jsp");
		view.forward(request, response);
	}

}
