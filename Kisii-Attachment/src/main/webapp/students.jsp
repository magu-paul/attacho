<%
if(session.getAttribute("staffno") == null){
	response.sendRedirect("index.html");
}
%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Kisii University</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<link href="pop.css" rel="stylesheet">

</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Staff site</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="staff_home.jsp">Home</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#Name">${name}</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<div class="masthead bg-primary text-white">
	<h2>My Students</h2>
		<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/attachment" user="root" password="bmpg1998" />

<sql:query var="rs" dataSource="${db}">select s.fname,s.lname,su.regno,su.station,su.company,phone,marks from stud_users su join student s using(regno) where su.staff = '${staffno}'</sql:query>

<table style="width:auto; border: 2px solid black">
<th>Student Name</th>
<th>Student Registration Number</th>
<th>Site County</th>
<th>Work Station</th>
<th>Marks</th>
<th>Phone Number</th>

 <c:forEach items="${rs.rows}" var="row">
 <tr style="width:auto; border: 2px solid black">
 <td ><c:out value="${row.fname}"></c:out> <c:out value="${row.lname}"></c:out></td>
 <td ><c:out value="${row.regno}"></c:out></td>
 <td ><c:out value="${row.station}"></c:out></td>
 <td ><c:out value="${row.company}"></c:out></td>
 <td style="width:auto; border: 1px solid black"><c:out value="${row.marks}"></c:out></td>
 <td><c:out value="${row.phone}"></c:out></td>
 <td style="width:auto; border: 1px solid black"><form method="post" action="disAssign"><button type = submit name="student" value=${row.regno }>Remove</button></form></td>
 </tr>
 </c:forEach>
	</table>
	
	<button href="#" id="button">Assess</button>
	</div>
	
	
	<div class="popup">
        <div class="popup-content">
            <img  src="close.png" alt="user" class ="close">
            <h4>Award Marks</h4>
            <form onsubmit="return assessValidate()" action="assessStudent" method="post">
            <input type="text" placeholder="Reg No" name="regno" id="reg_no"/>
            <input type="text" placeholder="Marks" name="marks" id="marks"/>
            <button type ="submit">Submit</button>
            </form>
        </div>
    </div>
    <script>
    function assessValidate(){
    	var reg = document.getElementById("reg_no").value.trim();
    	var marks = document.getElemtById("marks").value.trim();
    	if(reg == ""){
    		alert("Empty Registration!");
    		return false;
    	}else if(marks == ""){
    		alert("Blank Marks!");
    		return false;
    	}else{
    		return false;
    	}
    }
       document.getElementById("button").addEventListener("click", function(){
           document.querySelector(".popup").style.display = "flex";
       })
       document.querySelector(".close").addEventListener("click",function(){
           document.querySelector(".popup").style.display="none";
       })
    </script>
	
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						Kisii, Kenya 
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Kisii University</h4>
					<p class="lead mb-0">
						University of the 21<sup>st</sup> Century .
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Paul Magu 2022</small>
		</div>
	</div>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>

</body>
</html>