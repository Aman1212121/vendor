

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.vendor.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
     VendorDAO vdao = (VendorDAO) request.getSession().getAttribute("vdao");
     if (vdao != null) {
         request.setAttribute("vdao", vdao);    
     }
CampaignDTO cdto=new CampaignDTO();
List<CampaignDAO> campaigns= cdto.getAllCampaigns();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .carousel{
            height:70vh;
        }
        .carousel-item{
            height:70vh;
        }
        .carousel-item img{
            z-index: 0;
            height:100%;
            width:100%;
            
        }
        .card {
            transition: transform 0.3s;
        }

        .card:hover {
          transform: scale(1.05);
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn a{
            list-style: none;
            text-decoration: none;
        }


    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <%
        String search=request.getParameter("search");
        if(search!=null&&search!=""){
        cdto=new CampaignDTO();
        campaigns= cdto.searchByName(search);
            }
        %>
        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="images/mediinfo.png" class="img-fluid d-block w-100 h-auto " alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/01(3).jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/imginfo1.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
        
<%if (!campaigns.isEmpty()) {%>
<div class="row row-cols-1 row-cols-md-3 mt-5 ms-2 me-2 g-4">   
    <%for(CampaignDAO c : campaigns) {%>
    <div class="col">
    <div class="card h-100">
        <img src="images/<%=c.getImage()%>" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><%=c.getName()%></h5>
        <p class="card-text"><%=c.getCampaign_Date()%></p>
        <p class="card-text"><%=c.getAddress()%></p>
        <%if(vdao!=null){%>
        <button type="button" class="btn btn-outline-info"><a href="RemoveCampaignServlet?id=<%=vdao.getVendor_id()%>&name=<%=c.getName()%>">Remove</a></button>
        <%}%>
      </div>
      <div class="card-footer">
        <small class="text-muted"><%=c.getEmail()%></small>
      </div>
    </div>
  </div>
    <%}%>
</div>
<%}
        
       if(vdao!=null){ %>
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">User Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body">
                <h4>Your Email:<%=vdao.getEmail()%> </h4>
                <h4>Your Name:<%=vdao.getName()%> </h4>
                <h4>Your Address: <%=vdao.getAddress()%></h4>
                <h4>Your Vendor_id: <%=vdao.getVendor_id()%></h4>
                <h4>Your phone: <%=vdao.getPhone()%></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
            </div>
        </div>
    </div>
</div>
<%}%>
<script src="path/to/bootstrap.min.js"></script>

<!-- Modal -->
<% if(vdao!=null){ %>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="VendorUpdateServlet" >
      <div class="modal-body">  
          <div class="mb-3">
            <label for="Name" class="form-label">name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name="name"  value="<%=vdao.getName()%>">
          </div>
          <div class="mb-3">
            <label for="Address" class="form-label">address</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="address" value="<%=vdao.getAddress()%>">
          </div>
           <div class="mb-3">
            <label for="Email" class="form-label">Email</label>
            <input type="email" class="form-control" id="exampleInputPassword1" name="email" value="<%=vdao.getEmail()%>">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
          </div>
          <div class="mb-3">
            <label for="Contact" class="form-label">Contact</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="contact" value="<%=vdao.getPhone()%>">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#example2Modal">Change password</button>
      </div>
    </form>
    </div>
  </div>
</div>
<%}%>

<% if(vdao!=null){ %>
     <div class="modal fade" id="example2Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="VendorPasswordUpdate" >
      <div class="modal-body">  
          <div class="mb-3">
            <label for="Name" class="form-label">Enter old Password</label>
            <input type="password" class="form-control" id="exampleInputEmail1" name="oldpass"  >
          </div>
          <div class="mb-3">
            <label for="Password" class="form-label">Enter Confirm Password</label>
            <input type="password" class="form-control" id="exampleInputPassword" name="npass" >
            <div id="emailHelp" class="form-text">We'll never share your password with anyone else.</div>
          </div>
           <div class="mb-3">
            <label for="Email" class="form-label">Enter Confirm Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="cpass" >
            <div id="emailHelp" class="form-text">We'll never share your password with anyone else.</div>
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </form>
    </div>
  </div>
</div> 
<%}%>     



    </body>
</html>
