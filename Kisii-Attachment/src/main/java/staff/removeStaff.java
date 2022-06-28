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
 * Servlet implementation class removeStaff
 */
@WebServlet("/removeStaff")
public class removeStaff extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String staff = request.getParameter("staff");
		String url = "jdbc:mysql://localhost:3306/attachment";
		String uname = "root";
		String password = "bmpg1998";
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,uname,password);
			PreparedStatement ps = con.prepareStatement("delete from staff_users where staff_no = ?");
			PreparedStatement rem =con.prepareStatement("update stud_users set staff = null where staff = ?");
			ps.setString(1, staff);
			rem.setString(1, staff);
			int count = ps.executeUpdate();
			if(count > 0) {
				rem.executeUpdate();
				response.sendRedirect("lecturers_report.jsp");
			}else {
				response.getWriter().println("Staff Delete failed");
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
