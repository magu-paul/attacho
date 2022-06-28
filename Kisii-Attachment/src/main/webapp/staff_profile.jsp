<%
if(session.getAttribute("staffno") == null){
	response.sendRedirect("index.html");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style.css" />
    <script src="script.js" defer></script>
  </head>
  <body>
    <div class="container">
      <aside>
        <div class="navbar">
          
          <nav>
            <ul>
              <li class="selectedLink" name="home">About Me</li>
              <li><a href="staff_home.jsp">Home</a></li>
              
            </ul>
          </nav>
        </div>
      </aside>
      <main>
        <div class="card active home" data-home>
          <div class="title">About Me</div>
          <div class="content">
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/attachment" user="root" password="bmpg1998" />

<sql:query var="rs" dataSource="${db}">select staff_id, name, contact from staff s join staff_users su on s.staff_id = su.staff_no join department using(depid) where s.staff_id = '${staffno }'</sql:query>
 <c:forEach items="${rs.rows}" var="row">
          Name : ${name} <br>
          Staff No : <c:out value="${row.staff_id}"></c:out> <br>
          Phone : <c:out value="${row.contact}"></c:out>  <br>
          
          Department : <c:out value="${row.name}"></c:out>  <br>
                  </c:forEach>
<sql:query var="rd" dataSource="${db}">select name from school join staff on id = school_id where staff_id ='${staffno }'</sql:query>
               <c:forEach items="${rd.rows}" var="row">   
          School : <c:out value="${row.name}"></c:out>  <br>
           </c:forEach>
           
          </div>
        </div>
        
        
      </main>
    </div>
    <script>
      const showMessage = () => {
        alert("Hello JavaScript");
      };
    </script>
  </body>
</html>
