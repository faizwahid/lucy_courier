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
import net.codejava.Branch;


public class BranchDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int bid;
	static String bname,bstreet,bcity,bstate,bzip,bcountry;
	
	public Branch checkLogin(String bname, String bcountry) throws SQLException, 
			ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
		String dbUser = "root";
		String dbPassword = "";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String sql = "SELECT * FROM branch WHERE bname = ? and bcountry = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, bname);
		statement.setString(2, bcountry);

		ResultSet Branch = statement.executeQuery();

		Branch branch = null;
		
		ResultSet result = null;
		if (result.next()) {
			branch = new Branch();
			branch.setBname(result.getString("bname"));
			branch.setBcountry(bcountry);
		}

		connection.close();

		return branch;
	}
		
	//add new user (register)
			public void add(Branch bean) throws NoSuchAlgorithmException{
				//get email,name and password
				bname = bean.getBname();
				bcountry = bean.getBcountry();

				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(bcountry.getBytes());

				byte byteData[] = md.digest();

				//convert the byte to hex format
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}
				String bcountry = sb.toString();

				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("insert into branch(bname,bcountry)values(?,?)");
					ps.setString(1,bname);
					ps.setString(2,bcountry);
					//4. execute query
					ps.executeUpdate();			
					
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

			}
	
		// add user
		public void addBranch(Branch bean) {

			bname = bean.getBname();
			bstreet =bean.getBstreet();
			bcity = bean.getBcity();
			bstate = bean.getBstate();
			bzip = bean.getBzip();
			bcountry= bean.getBcountry();
		

			try {
				// call getConnection() method
				con = ConnectionManager.getConnection();

				// 3. create statement
				ps = con.prepareStatement("INSERT INTO branch(bname,bstreet,bcity,bstate,bzip,bcountry)VALUES(?,?,?,?,?,?)");
				ps.setString(1, bname);
				ps.setString(2, bstreet);
				ps.setString(3, bcity);
				ps.setString(4, bstate);
				ps.setString(5, bzip);
				ps.setString(6, bcountry);
				
				// 4. execute query
				ps.executeUpdate();
				System.out.println("Successfully inserted");

				// 5. close connection
				con.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		public static List<Branch> getAllBranch(){
			List<Branch> branch = new ArrayList<Branch>();
			
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				stmt = con.createStatement();
				String sql = "SELECT * FROM branch ORDER BY bid";
				
				//4. execute query
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {		//process result
					Branch u = new Branch();
					u.setBid(rs.getInt("bid"));
					u.setBname(rs.getString("bname"));
					u.setBstreet(rs.getString("bstreet"));
					u.setBcity(rs.getString("bcity"));
					u.setBstate(rs.getString("bstate"));
					u.setBzip(rs.getString("bzip"));
					u.setBcountry(rs.getString("bcountry"));
					branch.add(u);
				}
				
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
			
			
			return branch;
		}
		
		public static List<Branch> getBranchId() {
			List<Branch> branch = new ArrayList<Branch>();
			try {
				//call getConnection() method  			
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//4. execute query
				ResultSet rs = stmt.executeQuery("select bid, bname from branch");

				while (rs.next()) {
					Branch u = new Branch();
					u.setBid(rs.getInt("bid"));
					u.setBname(rs.getString("bname"));
					branch.add(u);

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			
			}

			return branch;
		}
		
		public static Branch getBranchById(int id) {
			Branch u = new Branch();
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				ps = con.prepareStatement("SELECT * FROM branch WHERE bid=?");
				ps.setInt(1, id);
				
				//4. execute query
				rs = ps.executeQuery();
				if(rs.next()) {
					u.setBid(rs.getInt("bid"));
					u.setBname(rs.getString("bname"));
					u.setBstreet(rs.getString("bstreet"));
					u.setBcity(rs.getString("bcity"));
					u.setBstate(rs.getString("bstate"));
					u.setBzip(rs.getString("bzip"));
					u.setBcountry(rs.getString("bcountry"));
				
				}
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();	
			}			
			return u;
		}
		
		//method to get user
				public static Branch getBranch(Branch bean)  {   
					//get email
					bname = bean.getBname();
					String searchQuery = "select * from branch where bname='" + bname + "'";
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
							String bname = rs.getString("bname");
							bean.setBname(bname);
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
			public void deleteBranch(int id) {
				try {
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement 			
					ps = con.prepareStatement("DELETE FROM branch WHERE bid=?");
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
			
			public void updateBranch(Branch bean) {
				
				bid = bean.getBid();
				bname = bean.getBname();
				bstreet =bean.getBstreet();
				bcity = bean.getBcity();
				bstate = bean.getBstate();
				bzip = bean.getBzip();
				bcountry= bean.getBcountry();
				
				try {			
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement
					ps = con.prepareStatement("UPDATE branch SET bname=?,bstreet=?,bcity=?,bstate=?,bzip=?,bcountry=?  WHERE bid=?");
					ps.setString(1, bname);
					ps.setString(2, bstreet);
					ps.setString(3, bcity);
					ps.setString(4, bstate);
					ps.setString(5, bzip);
					ps.setString(6, bcountry);
					ps.setInt(7, bid);
					
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
