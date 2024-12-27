package UserAuth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User;

public class UserDao {
private Connection con;
private String query ;
private PreparedStatement ps;
private ResultSet rs;
public UserDao(Connection con) {
	
	this.con = con;

}


public User userlogin(String email,String password) {
	User user = null;
	try {
		query = "select * from login where email = ? and password = ? ";
		ps = con.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);
		rs=ps.executeQuery();
		if(rs.next()) {
			user = new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setContact(rs.getString("Contact"));
			user.setAddress(rs.getString("Address"));
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return user;
}

public boolean userlogin(String name,String email,String pass) {
	try {
		query = "insert into login(name,email,password) values(?,?,?)";
		ps = con.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, pass);
		int rs=ps.executeUpdate();
		if(rs > 0) {
			return true;
		}
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
return false;
}

public boolean userProfile(String name,String email ,String contact,String address) {
	try {
		 query = "UPDATE login SET name = ?, contact = ?, address = ? WHERE email = ?";

	        ps = con.prepareStatement(query);
	        ps.setString(1, name);
	        ps.setString(2, contact);
	        ps.setString(3, address);
	        ps.setString(4, email); 
	        int rs = ps.executeUpdate();
	       
	        if(rs > 0) {
			return true;
		}
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
return false;
}



}
