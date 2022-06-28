package student;

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
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String regno = req.getParameter("regno");
		String phone = req.getParameter("phone");
		String station = req.getParameter("station");
		String company = req.getParameter("company");
		String url ="jdbc:mysql://localhost:3306/attachment";
		String uname ="root";
		String pass ="bmpg1998";
		String sql = "update stud_users set station = ?, company = ?, phone =? where regno = ?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,uname,pass);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, station);
			st.setString(2, company);
			st.setString(3, phone);
			st.setString(4, regno);
			int count = st.executeUpdate();
			if (count > 0) {
				res.sendRedirect("student_home.jsp");
			}else {
				res.getWriter().println("Error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
