<%-- 
    Document   : navbar
    Created on : 14-Nov-2023, 1:04:16 pm
    Author     : T460
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
    .navbar{
        position:relative;
    }
    .dropdown{
   
      position: relative;
         z-index: 1000;
    }    
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="font-style: italic;"><b>CAMPAIGNS</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="VendorHomePage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Services</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Vendors
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="VendorLogin.jsp">Login</a></li>
            <li><a class="dropdown-item" href="VendorRegistration.jsp">Registration</a></li>
         <%if(vdao!=null){%>
            <li><a class="dropdown-item" href="AddCampaign.jsp">Add_Campaign</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="VendorLogoutServlet">Logout</a></li>
            <%}%>
            
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="!#"  data-bs-toggle="modal" data-bs-target="#profileModal">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#" tabindex="-1" >About Us</a>
        </li>
        <li class="nav-item"><a class="nav-link" href="Cart.jsp">Campaigns<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
      </ul>
      <form class="d-flex" action="">
        <input class="form-control me-2" id="searchInput"  type="search" name="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" onclick="searchCampaigns()" type="submit">Search</button>
      </form>
    </div>
  </div>   
</nav>
