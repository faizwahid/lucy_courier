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
import net.codejava.User;

public class UserDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int id;
	static String fullname,email,password;
	
	public User checkLogin(String email, String password) throws SQLException, 
			ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
		String dbUser = "root";
		String dbPassword = "";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String sql = "SELECT * FROM users WHERE email = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet result = statement.executeQuery();

		User user = null;

		if (result.next()) {
			user = new User();
			user.setFullname(result.getString("fullname"));
			user.setEmail(email);
		}

		connection.close();

		return user;
	}
		
	//add new user (register)
			public void add(User bean) throws NoSuchAlgorithmException{
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
					ps=con.prepareStatement("insert into users(email,password)values(?,?)");
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
		public void addUser(User bean) {

			fullname = bean.getFullname();
			email = bean.getEmail();
			password = bean.getPassword();
		

			try {
				// call getConnection() method
				con = ConnectionManager.getConnection();

				// 3. create statement
				ps = con.prepareStatement("INSERT INTO users(fullname,email,password)VALUES(?,?,?)");
				ps.setString(1, fullname);
				ps.setString(2, email);
				ps.setString(3, password);
			
				// 4. execute query
				ps.executeUpdate();
				System.out.println("Successfully inserted");

				// 5. close connection
				con.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		public static List<User> getAllUsers(){
			List<User> users = new ArrayList<User>();
			
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				stmt = con.createStatement();
				String sql = "SELECT * FROM users ORDER BY id";
				
				//4. execute query
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {		//process result
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setFullname(rs.getString("fullname"));
					u.setEmail(rs.getString("email"));
					u.setPassword(rs.getString("password"));
					users.add(u);
				}
				
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
			
			
			return users;
		}
		
		public static List<User> getUserId() {
			List<User> users = new ArrayList<User>();
			try {
				//call getConnection() method  			
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//4. execute query
				ResultSet rs = stmt.executeQuery("select id, fullname from users");

				while (rs.next()) {
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setFullname(rs.getString("fullname"));
					users.add(u);

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			
			}

			return users;
		}
		
		public static User getUserById(int id) {
			User u = new User();
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
				ps.setInt(1, id);
				
				//4. execute query
				rs = ps.executeQuery();
				if(rs.next()) {
				u.setId(rs.getInt("id"));
				u.setFullname(rs.getString("fullname"));
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
				public static User getUser(User bean)  {   
					//get email
					email = bean.getEmail();
					String searchQuery = "select * from users where email='" + email + "'";
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
			public void deleteUser(int id) {
				try {
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement 			
					ps = con.prepareStatement("DELETE FROM users WHERE id=?");
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
			
			public void updateUser(User bean) {
				
				id = bean.getId();
				fullname = bean.getFullname();
				email  = bean.getEmail();
				password = bean.getPassword();
				
				try {			
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement
					ps = con.prepareStatement("UPDATE users SET fullname=?,email=?,password=? WHERE id=?");
					ps.setString(1, fullname);
					ps.setString(2, email);
					ps.setString(3, password);
					ps.setInt(4, id);
					
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
