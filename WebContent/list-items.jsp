<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <a href="ItemController" class="navbar-brand">SPharma</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="ItemController" class="nav-link active">Home</a>
          </li>
          
         </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="#" class="nav-link">
               Welcome: ${user.firstName }
            </a>
            </li>
          <li class="nav-item">
            <a href="UserController?command=LOGOUT" class="nav-link">
               SignOut
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
  
  
 <div class="container mt-3 mb-3">
  
 
	<form action="add-item-form.jsp">
	<button type="submit" class="btn btn-primary">Add Item</button>
	</form>
	</div>
	
	<div class="container mt-3 mb-3">
  
	<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    </div>
	
	<div class="container">
<table class="table table-hover">
<thead class="bg-primary text-white">
				<tr>
					<th>Item Name</th>
					<th>Unit</th>
					<th>Quantity On Hand</th>
					<th>Price Per Unit</th>
					<th>Date Of Expiry</th>
					<th>Location</th>
					<th>Action</th>
					</tr>
					</thead>
    <tbody>
				<c:forEach var="tempItem" items="${item_list}">
				
				<c:url var="updateLink" value="ItemController">
				
				<c:param name="command" value="LOAD"/>
				<c:param name="itemCode" value="${tempItem.itemCode }"/>
				
				</c:url>
				
				
				<tr>
				<td> ${tempItem.itemName}</td>
				<td>${tempItem.unit}</td>
				<td> ${tempItem.quantityOnHand}</td>
				<td> ${tempItem.pricePerUnit}</td>
				<td> ${tempItem.dateOfExpiry}</td>
				<td> ${tempItem.location}</td>
				<td><a href="${updateLink}">Update</a></td>
				</tr>	
				</c:forEach>
				</tbody>
			</table>
			</div>
			 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   </body>
</html>
































