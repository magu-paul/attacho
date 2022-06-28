<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Kisii University</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function validateRegister(){
	var regno = document.getElementById('regno').value.trim();
	var email = document.getElementById('email').value.trim();
	var id = document.getElementById('id').value.trim();
	var county = document.getElementById('county').value.trim();
	
	var contact = document.getElementById('contact').value.trim();
	var pass = document.getElementById('pass').value.trim();
	var re_pass = document.getElementById('re_pass').value.trim();
	
	if(regno == "" || email == ""){
		alert("Empty Registration or Email field not allowed!");
		return false;
	}else if(id =="" || county == ""){
		alert("Empty ID or County field not allowed!");
		return false;
		
	}else if(contact == ""){
		alert("Empty Company or Contact field not allowed!");
		return false;
	}else if(pass == "" || re_pass == ""){
		alert("Empty Password field not allowed!");
		return false;
	}else if(pass != re_pass){
		alert("Passwords do not match!");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<input type="hidden" id="status" value="${status}">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form onsubmit="return validateRegister()" method="post" action="registerStudent" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="reg" id="regno" placeholder="Registration No" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="idno" id="id" placeholder="ID NO" />
							</div> 
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="station" id="county" placeholder="County" />
							</div>
							
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					
						
						<a href="student_login.jsp" class="signup-image-link">I am already
							member</a>
					
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
    
	<script src="https://unpkg.com/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("congrats","Account created successfully","success")
	}</script>
    
    
    
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>