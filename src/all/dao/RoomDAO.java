package all.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import all.db.ConnectionManager;
import all.model.Room;

public class RoomDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int rmId;
	static String id,rmName,rmCap,rmDesc;

	// add room
		public void addRoom(Room bean) {

			id = bean.getAid();
			rmName = bean.getName();
			rmCap = bean.getCap();
			rmDesc = bean.getDesc();
		

			try {
				// call getConnection() method
				con = ConnectionManager.getConnection();

				// 3. create statement
				ps = con.prepareStatement("INSERT INTO room(id,rmName,rmCap,rmDesc)VALUES(?,?,?,?)");
				ps.setString(1, id);
				ps.setString(2, rmName);
				ps.setString(3, rmCap);
				ps.setString(3, rmDesc);
			
				// 4. execute query
				ps.executeUpdate();
				System.out.println("Successfully inserted");

				// 5. close connection
				con.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		public static List<Room> getAllRooms(){
			List<Room> rooms = new ArrayList<Room>();
			
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				stmt = con.createStatement();
				String sql = "SELECT * FROM room ORDER BY rmId";
				
				//4. execute query
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {		//process result
					Room r = new Room();
					r.setId(rs.getInt("rmId"));
					r.setAid(rs.getString("id"));
					r.setName(rs.getString("rmName"));
					r.setCap(rs.getString("rmCap"));
					r.setDesc(rs.getString("rmDesc"));
					rooms.add(r);
				}
				
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
			
			
			return rooms;
		}
		
		public static Room getRoomById(int rmId) {
			Room r = new Room();
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				ps = con.prepareStatement("SELECT * FROM room WHERE rmId=?");
				ps.setInt(1, rmId);
				
				//4. execute query
				rs = ps.executeQuery();
				if(rs.next()) {
				r.setId(rs.getInt("rmId"));
				r.setAid(rs.getString("id"));
				r.setName(rs.getString("rmName"));
				r.setCap(rs.getString("rmCap"));
				r.setDesc(rs.getString("rmDesc"));
				
				}
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();	
			}			
			return r;
		}
		
		//delete room	
			public void deleteRoom(int rmId) {
				try {
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement 			
					ps = con.prepareStatement("DELETE FROM room WHERE rmId=?");
					ps.setInt(1, rmId);
					
					//4. execute query
					ps.executeUpdate();
					
					//5. close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();	
				}			
			}
			
			//update room
			
			public void updateRoom(Room bean) {
				
				rmId = bean.getId();
				id = bean.getAid();
				rmName = bean.getName();
				rmCap  = bean.getCap();
				rmDesc = bean.getDesc();
				
				try {			
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement
					ps = con.prepareStatement("UPDATE room SET id=?,rmName=?,rmCap=?,rmDesc=? WHERE rmId=?");
					ps.setString(1, id);
					ps.setString(2, rmName);
					ps.setString(3, rmCap);
					ps.setString(4, rmDesc);
					ps.setInt(5, rmId);
					
					//4. execute query
					ps.executeUpdate();
					
					System.out.println("Successfully update");
					
					//5. close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();
					
				}
			}	

	}