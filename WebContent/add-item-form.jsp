<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html">
<html>
<head>
<title>Add Items</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>



<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>


<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="ItemController" class="navbar-brand">SPharma</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="ItemController" class="nav-link active">Home</a>
          </li>
             
        </ul>

        <ul class="navbar-nav ml-auto">
        
          <li class="nav-item">
            <a href="#" class="nav-link">
               <img src="data:image/jpg;base64,${user.base64Image}" class="rounded-circle" width="40" height="40"/>
            </a>
            </li>
        
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
  
  <div class="container">
		<h3>Add Item</h3>
		 <h6 style="color: red;">${msg}</h6>
		<form action="ItemController" method="post">
		
			<input type="hidden" name="command" value="ADDORUPDATE" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Item Name:</label></td>
						
						<td><input type="text" name="itemName" required="required" placeholder="Item Name"/></td>
					</tr>
					<tr>
						<td><label>Unit:</label></td>
						<td><input type="text" name="unit" required="required" placeholder="Eg 250 ml, 50 mg, 100 pcs"/></td>
					</tr>
					
					<tr>
					<td><label>Beginning Inventory:</label></td>
					<td><input type="number" name="beginningInventory" required="required" placeholder="Beginning Inventory"/></td>
					</tr>

					<tr>
					<td><label>Quantity On Hand:</label></td>
					<td><input type="number" name="quantityOnHand" required="required" placeholder="Quantity On Hand" /></td>
					</tr>
					
					<tr>
					<td><label>Price per Unit:</label></td>
					<td><input type="number" name="pricePerUnit" required="required" placeholder="Price Per Unit" min="0"/></td>
					</tr>
					
					<tr>
					<td><label>Date Of Manufacture:</label></td>
					<td><input type="date" name="dateOfManufacture" required="required" placeholder="Date Of Manufacture" /></td>
					</tr>
					
					<tr>
					<td><label>Date of Expiry:</label></td>
					<td><input type="date" name="dateOfExpiry" required="required" /></td>
					</tr>
					
					<tr>
						<td><label>Location:</label></td>
						<td>
						<select name="location">
						<option disabled selected value="">Select Location</option>
						<option>Bulk Zone</option>
						<option>Pick Zone</option>
						<option>Distribution Center</option>
						</select>
						</td>
					</tr>
					
					<tr>
						<td><label>Category:</label></td>
						<td>
						<select name="itemCategory">
						<option disabled selected value="">Select Category</option>
						<option>Pharma Drug</option>
						<option>Health and Personal Care</option>
						<option>Baby Care </option>
						<option>Medical Supplies and Equipments</option>
						</select>
						</td>
					</tr>
													
					<tr>
						<td><label></label></td>
						<td><button type="submit" class="btn btn-primary">Add Item</button></td>
					</tr>
					
  </tbody>
  
  </table>
  </form>
  
  <div style="clear: both;"></div>
		
		<p>
			<a href="ItemController">Back to List</a>
		</p>
  
  </div>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
     
</body>
</html>