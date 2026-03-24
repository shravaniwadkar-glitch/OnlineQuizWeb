package dao;
import java.sql.*;

public class AttemptDAO 
{

	    public boolean hasAttempted(String name) {
	        boolean exists = false;

	        try {
	            Connection con = DBconnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "SELECT * FROM attempts WHERE name=?");
	            ps.setString(1, name);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) exists = true;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return exists;
	    }

	    public void saveAttempt(String name) {
	        try {
	            Connection con = DBconnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "INSERT INTO attempts(name) VALUES (?)");
	            ps.setString(1, name);
	            ps.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
