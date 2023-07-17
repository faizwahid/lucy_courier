package all.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import all.dao.RoomDAO;
import all.model.Room;

/**
 * Servlet implementation class AddRoomController
 */
@WebServlet("/AddRoomController")
public class AddBranchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RoomDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBranchController() {
        super();
        dao = new RoomDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Room r = new Room();
		r.setAid(request.getParameter("id"));
		r.setName(request.getParameter("rmName"));
		r.setCap(request.getParameter("rmCap"));
		r.setDesc(request.getParameter("rmDesc"));
		
		dao.addRoom(r);
		
		request.setAttribute("rooms", RoomDAO.getAllRooms());
		RequestDispatcher view = request.getRequestDispatcher("room-view.jsp");
		view.forward(request, response);
	}

}
