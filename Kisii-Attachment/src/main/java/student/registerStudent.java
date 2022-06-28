package student;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerStudent
 */
@WebServlet("/registerStudent")
public class registerStudent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regno = request.getParameter("reg");
		String email = request.getParameter("email");
		String id =request.getParameter("idno");
		String station = request.getParameter("station");
		String phone = request.getParameter("contact");
		String pass = request.getParameter("pass");
		
		String url="jdbc:mysql://localhost:3306/attachment";
		String uname ="root";
		String password = "bmpg1998";
		
		String year = "";
		String cat = "";
		String school = "";
		String program = "";
		int active = 0;
		
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,uname,password);
			PreparedStatement validate = con.prepareStatement("select regno,year,category,school_id,active from student where regno = ?");
			validate.setString(1, regno);
			ResultSet val = validate.executeQuery();
			if(val.next()) {
				year = val.getString(2);
				cat = val.getString(3);
				school = val.getString(4);
				active = val.getInt(5);
				
				if(cat.equals("1")) {
					program = "degree";
				}else {
					program = "diploma";
				}
				
				PreparedStatement check = con.prepareStatement("select * from cohort where "+program+" = ? and "+school+" = '1'");
				check.setString(1,year);
				
				
				ResultSet ck = check.executeQuery();
				if(ck.next()) {
					PreparedStatement register = con.prepareStatement("insert into stud_users (regno,email,id,station,phone,pass) values(?,?,?,?,?,?)");
					register.setString(1, regno);
					register.setString(2, email);
					register.setString(3, id);
					register.setString(4, station);
					register.setString(5, phone);
					register.setString(6, pass);
					
					int count = register.executeUpdate();
					if (count < 0) {
						response.getWriter().println("Not allowed");
					}else {
						response.sendRedirect("student_login.jsp");
					}
				}else {
					response.getWriter().println("Not allowed v");
				}
				
				
				
				
				
				
				
				
				
				
			}else {
				response.getWriter().println("not a student allowed");
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
