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
    <link href="pop.css" rel="stylesheet">
    <script src="script.js" defer></script>
  </head>
  <body>
    <div class="container">
      <aside>
        <div class="navbar">
          
          <nav>
            <ul>
              <li class="selectedLink" name="home">About Me</li>
              <li><a href="student_home.jsp">Home</a></li>
              
            </ul>
          </nav>
        </div>
      </aside>
      <main>
        <div class="card active home" data-home>
          <div class="title">About Me</div>
          <div class="content">
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/attachment" user="root" password="bmpg1998" />

<sql:query var="rs" dataSource="${db}">select phone,email,year,name from student s join stud_users using(regno) join courses using (course_id) where s.regno ='${regno }'</sql:query>
 <c:forEach items="${rs.rows}" var="row">
          Name : ${uname} <br>
          Email : <c:out value="${row.email}"></c:out> <br>
          Phone : <c:out value="${row.phone}"></c:out>  <br>
          Year : <c:out value="${row.year}"></c:out>  <br>
          Program : <c:out value="${row.name}"></c:out>  <br>
                  </c:forEach>
<sql:query var="rd" dataSource="${db}">select name,station,company from department join student s using(depid) join stud_users using(regno) where s.regno ='${regno }'</sql:query>
               <c:forEach items="${rd.rows}" var="row">   
          Department : <c:out value="${row.name}"></c:out>  <br>
          County : <c:out value="${row.station}"></c:out>  <br>
          Company : <c:out value="${row.company}"></c:out>  <br>
           </c:forEach>
           <sql:query var="rf" dataSource="${db}">select name,fname,lname,contact from staff s join staff_users on s.staff_id = staff_no join school on s.school_id = id join stud_users su on s.staff_id = su.staff where su.regno ='${regno }'</sql:query>
           <c:forEach items="${rf.rows}" var="row"> 
          School : <c:out value="${row.name}"></c:out>   <br>
          Lecturer : <c:out value="${row.fname}"></c:out>  <c:out value="${row.lname}"></c:out> <br>
          Lecturers Contact : <c:out value="${row.contact}"></c:out>  <br>
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
