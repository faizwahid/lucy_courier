package net.codejava;

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
import net.codejava.Staff;


public class StaffDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int id;
	static String name,address,email,password;
	
	public Staff checkLogin(String email, String password) throws SQLException, 
			ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
		String dbUser = "root";
		String dbPassword = "";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String sql = "SELECT * FROM staff WHERE email = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet result = statement.executeQuery();

		Staff staff = null;

		if (result.next()) {
			staff = new Staff();
			staff.setName(result.getString("name"));
			staff.setEmail(email);
		}

		connection.close();

		return staff;
	}
		
	//add new user (register)
			public void add(Staff bean) throws NoSuchAlgorithmException{
				//get email,name and password
				email = bean.getEmail();
				password = bean.getPassword();

				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(password.getBytes());

				byte byteData[] = md.digest();

				//convert the byte to hex format
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}
				String pass = sb.toString();

				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("insert into staff(email,password)values(?,?)");
					ps.setString(1,email);
					ps.setString(2,pass);
					//4. execute query
					ps.executeUpdate();			
					
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

			}
	
		// add user
		public void addStaff(Staff bean) {

			name = bean.getName();
			address = bean.getAddress();
			email = bean.getEmail();
			password = bean.getPassword();
		

			try {
				// call getConnection() method
				con = ConnectionManager.getConnection();

				// 3. create statement
				ps = con.prepareStatement("INSERT INTO staff(name,address,email,password)VALUES(?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, address);
				ps.setString(3, email);
				ps.setString(4, password);
			
				// 4. execute query
				ps.executeUpdate();
				System.out.println("Successfully inserted");

				// 5. close connection
				con.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		public static List<Staff> getAllStaff(){
			List<Staff> staff = new ArrayList<Staff>();
			
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				stmt = con.createStatement();
				String sql = "SELECT * FROM staff ORDER BY id";
				
				//4. execute query
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {		//process result
					Staff u = new Staff();
					u.setId(rs.getInt("id"));
					u.setName(rs.getString("name"));
					u.setAddress(rs.getString("address"));
					u.setEmail(rs.getString("email"));
					u.setPassword(rs.getString("password"));
					staff.add(u);
				}
				
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
			
			
			return staff;
		}
		
		public static List<Staff> getStaffId() {
			List<Staff> staff = new ArrayList<Staff>();
			try {
				//call getConnection() method  			
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//4. execute query
				ResultSet rs = stmt.executeQuery("select id, name from staff");

				while (rs.next()) {
					Staff u = new Staff();
					u.setId(rs.getInt("id"));
					u.setName(rs.getString("name"));
					staff.add(u);

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			
			}

			return staff;
		}
		
		public static Staff getUserById(int id) {
			Staff u = new Staff();
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				ps = con.prepareStatement("SELECT * FROM staff WHERE id=?");
				ps.setInt(1, id);
				
				//4. execute query
				rs = ps.executeQuery();
				if(rs.next()) {
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setAddress(rs.getString("address"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				
				}
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();	
			}			
			return u;
		}
		
		//method to get user
				public static Staff getStaff(Staff bean)  {   
					//get email
					email = bean.getEmail();
					String searchQuery = "select * from staff where email='" + email + "'";
					try {
						//call getConnection() method 
						con = ConnectionManager.getConnection();
						//3. create statement  
						stmt = con.createStatement();
						//execute statement
						rs = stmt.executeQuery(searchQuery);

						boolean more = rs.next();

						// if user exists set the isValid variable to true
						if (more) {
							String email = rs.getString("email");
							bean.setEmail(email);
							bean.setValid(true);
						}
						// if user does not exist set the isValid variable to false
						else if (!more) {
							bean.setValid(false);
						}
						//5. close connection
						con.close();	
					}catch(Exception e) {
						e.printStackTrace();		
					}
					return bean;
				}
		
		//delete user	
			public void deleteStaff(int id) {
				try {
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement 			
					ps = con.prepareStatement("DELETE FROM staff WHERE id=?");
					ps.setInt(1, id);
					
					//4. execute query
					ps.executeUpdate();
					
					//5. close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();	
				}			
			}
			
			//update user
			
			public void updateStaff(Staff bean) {
				
				id = bean.getId();
				name = bean.getName();
				address = bean.getAddress();
				email  = bean.getEmail();
				password = bean.getPassword();
				
				try {			
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement
					ps = con.prepareStatement("UPDATE staff SET name=?,address=?,email=?,password=? WHERE id=?");
					ps.setString(1, name);
					ps.setString(2, address);
					ps.setString(3, email);
					ps.setString(4, password);
					ps.setInt(5, id);
					
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
