<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Stock Management</title>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="index.jsp" class="navbar-brand">SPharma</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="index.jsp" class="nav-link active">Home</a>
          </li>
          <li class="nav-item px-2">
            <a href="#" class="nav-link">About</a>
          </li>
          <li class="nav-item px-2">
            <a href="#" class="nav-link">Contact</a>
          </li>
         </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="login.jsp" class="nav-link">
               Login
            </a>
            </li>
          <li class="nav-item">
            <a href="registration.jsp" class="nav-link">
               Sign Up
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>

<div class="container">
<header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
         <img src="images/icon.png" class="rounded float-left" alt="sanjeev"> <h1>Item Stock Management</h1>
        </div>
      </div>
    </div>
  </header>
  </div>
  
  <div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
			
				<!-- form start -->
				
				<form class="loginform" action="UserController" method="post">
				<input type="hidden" name="command" value="USER" />
				<div class="form-group"> 
				<%--  <% 
              String str=(String)request.getAttribute("msg");
            
              if(str!=null){
            	%> 
            	  <h6 style="color: green;">  <%= str %> </h6>
            	  <%
              }
              %> --%>
              <h6 style="color: green;">${msg}</h6>
				</div>
					<div class="form-group">
						<input type="text" name="userId" class="form-control" id="exampleInputEmail1"
							placeholder="User ID or Email" required="required">
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" required="required">
					</div>
					
					
					<button type="submit" class="btn btn-success btn-block">Submit</button>
				</form>

				<!-- form end -->
				
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

		</div>
	
  
  
   <!-- FOOTER -->
   <div class="container">
  <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="container">
      <div class="row">
        <div class="col">
          <p class="lead text-center">
            Copyright &copy;
            <span id="year"></span>
            SPharma
          </p>
        </div>
      </div>
    </div>
  </footer>
  </div>
  
  
  
  
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   </body>
   <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
  </script>
</html>