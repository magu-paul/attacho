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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Kisii University</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        <link href="pop.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>

   
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Control Panel</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
           
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                           
                            
                            
                            <div class="sb-sidenav-menu-heading"> my profile </div>
                             
                            
                            
                             <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ${name}
                            </a>



                
                            <div class="sb-sidenav-menu-heading">Tools </div>
                            <a class="nav-link" href="lecturers_report.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Lecturers
                            </a>
                              <a class="nav-link" href="students_report.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Students
                            </a>
                            <a class="nav-link" href="sessions.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Sessions
                            </a>
                            <a class="nav-link" href="admin_set_session.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Set Session
                            </a>
                           <a class="nav-link" id="assign">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Assign Lecturers
                            </a>
                            <a class="nav-link" id="genLetters">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Generate Letters
                            </a>
                           
                           
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Kisii University</div>
                        2022
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Admin Dashboard</h1>
                       
                        
                        <div class="card mb-4">
                            
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Students Report
                                    
                                </div>
                                <div class="card-body">
       
    
  	<div class="popup">
        <div class="popup-content">
            <img  src="close.png" alt="user" class ="close">
            
            <form action="assignLecturers" method="post">
            <p>Enter School id and department id below.</p>
            <input type="text" placeholder="School ID" name="school"/>
            <input type="text" placeholder="Department ID" name="dep"/>
            
            <button type ="submit">Assign</button>
            </form>
        </div>
    </div>
    <script>
       document.getElementById("assign").addEventListener("click", function(){
           document.querySelector(".popup").style.display = "flex";
       })
       document.querySelector(".close").addEventListener("click",function(){
           document.querySelector(".popup").style.display="none";
       })
    </script> 

<div class="popup-gen">
    <div class="popup-content-gen">
            <img  src="close.png" alt="user" class ="close-gen">
            
            <form action="genLetter" method="post">
           <p>Confirm Generation of letters of introduction to all active students.</p>
            
            <button type ="submit">Generate Letters</button>
            </form>
        </div>
    </div>
    <script>
       document.getElementById("genLetters").addEventListener("click", function(){
           document.querySelector(".popup-gen").style.display = "flex";
       })
       document.querySelector(".close-gen").addEventListener("click",function(){
           document.querySelector(".popup-gen").style.display="none";
       })
    </script>
                                   <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/attachment" user="root" password="bmpg1998" />

<sql:query var="rs" dataSource="${db}">select s.fname,s.lname,su.regno,su.station,su.company,phone from stud_users su join student s using(regno) where staff is NULL</sql:query>

<table style="width:auto; border: 2px solid black">
<th style="width:auto; border: 1px solid black">Name </th>
<th style="width:auto; border: 1px solid black">Registration Number</th>
<th style="width:auto; border: 1px solid black">County Name</th>
<th style="width:auto; border: 1px solid black">Station of Work</th>
<th style="width:auto; border: 1px solid black">Phone Number</th>
<th style="width:auto; border: 1px solid black">Assign Lecturer</th>
 <c:forEach items="${rs.rows}" var="row">
 <tr style="width:auto; border: 1px solid black">
 <td ><c:out value="${row.fname}"></c:out> <c:out value="${row.lname}"></c:out></td>
 <td ><c:out value="${row.regno}"></c:out></td>
 <td ><c:out value="${row.station}"></c:out></td>
 <td><c:out value="${row.company}"></c:out></td>
 <td ><c:out value="${row.phone}"></c:out></td>
 <td style="width:auto; border: 1px solid black"><form onsubmit="return validateAssign()" method="post" action="reAssign"><input type="text" name ="staff_no" placeholder="Staff NO"><button type = submit name="regno" value=${row.regno }>Assign</button></form></td>
 <td style="width:auto; border: 1px solid black"><form method="post" action="removeStudent"><button type = submit name="student" value=${row.regno }>Remove</button></form></td>
 </tr>
 </c:forEach>
	</table>
                                </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Kisii University 2022</div>
                            
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
