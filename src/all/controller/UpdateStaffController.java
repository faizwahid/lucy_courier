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
 * Servlet implementation class UpdateRoomController
 */
@WebServlet("/UpdateRoomController")
public class UpdateStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RoomDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStaffController() {
        super();
        dao = new RoomDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rmId = Integer.parseInt(request.getParameter("rmId"));
		request.setAttribute("r", RoomDAO.getRoomById(rmId));
		RequestDispatcher view = request.getRequestDispatcher("room-update.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Room r = new Room();
		r.setId(Integer.parseInt(request.getParameter("rmId")));
		r.setAid(request.getParameter("id"));
		r.setName(request.getParameter("rmName"));
		r.setCap(request.getParameter("rmCap"));
		r.setDesc(request.getParameter("rmDesc"));
		
		dao.updateRoom(r);
		
		request.setAttribute("rooms", RoomDAO.getAllRooms());
		RequestDispatcher view = request.getRequestDispatcher("room-view.jsp");
		view.forward(request, response);
	}

}
