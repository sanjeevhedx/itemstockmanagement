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


<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>




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
  
  
 <div class="container mt-3 mb-3">
  
 
	<form action="add-item-form.jsp">
	<button type="submit" class="btn btn-primary">Add Item</button>
	</form>
	
	
	 <!--  add a search box -->
	</div>
	<div class="container mt-3 mb-3">
	<form action="ItemController" method="get" class="form-inline my-2 my-lg-0">
	
	<input type="hidden" name="command" value="SEARCH" />
	
      <input  class="form-control mr-sm-2" type="search" name="search" placeholder="Enter Item Name" aria-label="Search">
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
				
				<c:url var="deleteLink" value="ItemController">
				
				<c:param name="command" value="DELETE"/>
				<c:param name="itemCode" value="${tempItem.itemCode }"/>
				
				</c:url>
				
				
				<tr>
				<td> ${tempItem.itemName}</td>
				<td>${tempItem.unit}</td>
				<td> ${tempItem.quantityOnHand}</td>
				<td> ${tempItem.pricePerUnit}</td>
				<td> ${tempItem.dateOfExpiry}</td>
				<td> ${tempItem.location}</td>
				<td><a href="${updateLink}">Update</a> | <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this item'))) return false">Delete</a></td>
				</tr>	
				</c:forEach>
				</tbody>
			</table>
			</div>
			
			
			
  <!-- MODALS -->

  <!-- ADD POST MODAL -->
  <div class="modal fade" id="addPostModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">Add Post</h5>
          <button class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="title">Title</label>
              <input type="text" class="form-control">
            </div>
            <div class="form-group">
              <label for="category">Category</label>
              <select class="form-control">
                <option value="">Web Development</option>
                <option value="">Tech Gadgets</option>
                <option value="">Business</option>
                <option value="">Health & Wellness</option>
              </select>
            </div>
            <div class="form-group">
              <label for="image">Upload Image</label>
              <div class="custom-file">
                <input type="file" class="custom-file-input" id="image">
                <label for="image" class="custom-file-label">Choose File</label>
              </div>
              <small class="form-text text-muted">Max Size 3mb</small>
            </div>
            <div class="form-group">
              <label for="body">Body</label>
              <textarea name="editor1" class="form-control"></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" data-dismiss="modal">Save Changes</button>
        </div>
      </div>
    </div>
  </div>

  <!-- ADD CATEGORY MODAL -->
  <div class="modal fade" id="addCategoryModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">Add Category</h5>
          <button class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="title">Title</label>
              <input type="text" class="form-control">
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-success" data-dismiss="modal">Save Changes</button>
        </div>
      </div>
    </div>
  </div>

  <!-- ADD USER MODAL -->
  <div class="modal fade" id="addUserModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-warning text-white">
          <h5 class="modal-title">Add User</h5>
          <button class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" class="form-control">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control">
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control">
            </div>
            <div class="form-group">
              <label for="password2">Confirm Password</label>
              <input type="password" class="form-control">
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-warning" data-dismiss="modal">Save Changes</button>
        </div>
      </div>
    </div>
  </div>
			
			
			
			 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   </body>
</html>
































