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
import net.codejava.Parcel;


public class ParcelDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int id,weight,height,length,width,price;
	static String sname,sadd,snum,rname,radd,rnum,bbranch;
	
	
	
	
		// add user
		public void addParcel(Parcel bean) {

			id = bean.getId();
			sname = bean.getSname();
			sadd = bean.getSadd();
			snum  = bean.getSnum();
			rname = bean.getRname();
			radd = bean.getRadd();
			rnum = bean.getRnum();
			bbranch  = bean.getBbranch();
			weight = bean.getWeight();
			height = bean.getHeight();
			length = bean.getLength();
			width  = bean.getWidth();
			price = bean.getPrice();
		

			try {
				// call getConnection() method
				con = ConnectionManager.getConnection();

				// 3. create statement
				ps = con.prepareStatement("Insert into parcel(sname,sadd,snum,rname,radd,rnum,bbranch,weight,height,length,width,price)VALUES(?,?,?,??,?,?,??,?,?,?)");
				ps.setString(1, sname);
				ps.setString(2, sadd);
				ps.setString(3, snum);
				ps.setString(4, rname);
				ps.setString(5, radd);
				ps.setString(6, rnum);
				ps.setString(7, bbranch);
				ps.setInt(8, weight);
				ps.setInt(9, height);
				ps.setInt(10, length);
				ps.setInt(11, width);
				ps.setInt(12, price);
			
				// 4. execute query
				ps.executeUpdate();
				System.out.println("Successfully inserted");

				// 5. close connection
				con.close();

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		
		public static List<Parcel> getAllParcel(){
			List<Parcel> parcel = new ArrayList<Parcel>();
			
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				stmt = con.createStatement();
				String sql = "SELECT * FROM parcel ORDER BY id";
				
				//4. execute query
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {		//process result
					Parcel u = new Parcel();
					u.setId(rs.getInt("id"));
				
					
				}
				
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
			
			
			return parcel;
		}
		
		public static List<Parcel> getParcelId() {
			List<Parcel> parcel = new ArrayList<Parcel>();
			try {
				//call getConnection() method  			
				con = ConnectionManager.getConnection();
				//3. create statement  
				stmt = con.createStatement();
				//4. execute query
				ResultSet rs = stmt.executeQuery("select id, sname from parcel");

				while (rs.next()) {
					Parcel u = new Parcel();
					u.setId(rs.getInt("id"));
					u.setSname(rs.getString("sname"));
		

				}
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			
			}

			return parcel;
		}
		
		public static Parcel getUserById(int id) {
			Parcel u = new Parcel();
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				
				//3. create statement 
				ps = con.prepareStatement("SELECT * FROM parcel WHERE id=?");
				ps.setInt(1, id);
				
				//4. execute query
				rs = ps.executeQuery();
				if(rs.next()) {
				u.setId(rs.getInt("id"));
				
				}
				//5. close connection
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();	
			}			
			return u;
		}
		
		//method to get user
				public static Parcel getParcel(Parcel bean)  {   
					//get email
					 sname = bean.getSname();
					String searchQuery = "select * from parcel where sname='" + sname + "'";
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
							String sname = rs.getString("sname");
							bean.setSname(sname);
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
			public void deleteParcel(int id) {
				try {
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement 			
					ps = con.prepareStatement("DELETE FROM parcel WHERE id=?");
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
			
			public void updatePrcel(Parcel bean) {
				
				id = bean.getId();
				sname = bean.getSname();
				sadd = bean.getSadd();
				snum  = bean.getSnum();
				rname = bean.getRname();
				radd = bean.getRadd();
				rnum = bean.getRnum();
				bbranch  = bean.getBbranch();
				weight = bean.getWeight();
				height = bean.getHeight();
				length = bean.getLength();
				width  = bean.getWidth();
				price = bean.getPrice();
				
				try {			
					//call getConnection() method
					con = ConnectionManager.getConnection();
					
					//3. create statement
					ps = con.prepareStatement("UPDATE parcel SET sname=?,sadd=?,snum=?,rname=?radd=?,rnum=?,bbranch=?,weight=?height=?,length=?,width=?,price=? WHERE id=?");
					ps.setString(1, sname);
					ps.setString(2, sadd);
					ps.setString(3, snum);
					ps.setString(4, rname);
					ps.setString(5, radd);
					ps.setString(6, rnum);
					ps.setString(7, bbranch);
					ps.setInt(8, weight);
					ps.setInt(9, height);
					ps.setInt(10, length);
					ps.setInt(11, width);
					ps.setInt(12, price);
					ps.setInt(13, id);
					
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
