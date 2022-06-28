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
 * Servlet implementation class updatePass
 */
@WebServlet("/updatePass")
public class updatePass extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String regno = req.getParameter("regno");
		String phone = req.getParameter("phone");
		String pass = req.getParameter("pass");
		
		String url = "jdbc:mysql://localhost:3306/attachment";
		String uname ="root";
		String password ="bmpg1998";
		String sql = "update stud_users set pass = ? where regno = ? and phone = ?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,uname,password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, pass);
			st.setString(2, regno);
			st.setString(3, phone);
			int count = st.executeUpdate();
			
			if(count > 0) {
				res.sendRedirect("student_login.jsp");
			}else {
				res.getWriter().println("Error");
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
