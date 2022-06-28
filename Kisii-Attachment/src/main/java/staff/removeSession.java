package staff;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class removeSession
 */
@WebServlet("/removeSession")
public class removeSession extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String session = request.getParameter("session");
		
		String url = "jdbc:mysql://localhost:3306/attachment";
		String uname = "root";
		String password = "bmpg1998";
		
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,uname,password);
			PreparedStatement ps = con.prepareStatement("delete from cohort where session = ?");
			ps.setString(1, session);
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("sessions.jsp");
			}else {
				response.getWriter().println("session Delete failed");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
