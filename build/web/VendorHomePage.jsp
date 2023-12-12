

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
     <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
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
        <img src="imediinfo.png" class="img-fluid d-block w-100 h-auto " alt="...">
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
        <form action="VendorUpdateServlet" onkeyup="return ValidateForm2()" >
      <div class="modal-body">  
          <div class="mb-3">
            <label for="Name" class="form-label">name</label>
            <input type="text" class="form-control" id="name" onkeyup="validateName()" name="name"  value="<%=vdao.getName()%>">
            <span id="ndisplay"></span>
          </div>
          <div class="mb-3">
            <label for="Address" class="form-label">address</label>
            <input type="text" class="form-control" id="address" onkeyup="validateAddress()" name="address" value="<%=vdao.getAddress()%>">
            <span id="adddisplay"></span>
          </div>
           <div class="mb-3">
            <label for="Email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" onkeyup="validateEmail()" name="email" value="<%=vdao.getEmail()%>">
            <span id="edisplay"></span>
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
          </div>
          <div class="mb-3">
            <label for="Contact" class="form-label">Contact</label>
            <input type="text" class="form-control" id="contact" onkeyup="validatePhone()" name="contact" value="<%=vdao.getPhone()%>">
            <span id="condisplay"></span>
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
      <form action="VendorPasswordUpdate" onsubmit="return ValidateForm1()" >
      <div class="modal-body">  
          <div class="mb-3">
            <label for="Name" class="form-label">Enter old Password</label>
            <input type="password" id="oldpass" onkeyup="validateOldPass()" class="form-control" id="exampleInputEmail1" name="oldpass"  >
            <span id="oldpasswarn"></span>
          </div>
          <div class="mb-3">
            <label for="Password" class="form-label">Enter New Password</label>
            <input type="password" id="newpass" onkeyup="validateNewPass()" class="form-control" id="exampleInputPassword" name="npass" >
            <span id="newpasswarn"></span>
            <div id="emailHelp" class="form-text">We'll never share your password with anyone else.</div>
          </div>
           <div class="mb-3">
            <label for="Email"  class="form-label">Enter Confirm Password</label>
            <input type="password" id="cpass" onkeyup="validateCPass()" class="form-control" id="exampleInputPassword1" name="cpass" >
            <span id="cpasswarn"></span>
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

        <script>
         $('.remove-btn').click(function () {
        var vendorId = $(this).data('id');
        var campaignName = $(this).data('name');
        $('#campaignName').text(campaignName);
        $('#confirmDeleteBtn').off('click').on('click', function () {
            // AJAX request to your servlet for campaign removal
            $.ajax({
                type: 'POST',
                data: {
                    vendorId: vendorId,
                    campaignName: campaignName
                },
                url: 'RemoveCampaignServlet', // Update the URL accordingly
                success: function (result) {
                    // Handle success, e.g., refresh the page or update UI
                    location.reload(); // Example: reload the page
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                }
            });
            $('#confirmationModal').modal('hide');
        });
    });
    
     function ValidateForm1(){
                var oldPassword=validateOldPass();
                var newPassword=validateNewPass();
                var CPassword=validateCPass();
                if(oldPassword==false||newPassword==false||CPassword==false){
                    return false;
                    
                }
                return true;
            }
            function validateCPass() {
                var passInput = document.getElementById("cpass");
                var passDisplay = document.getElementById("cpasswarn");
                var passValue = passInput.value;

                if (passValue.trim() === "") {
                    passDisplay.innerHTML = "Confirm password is required";
                    passDisplay.style.color = "red";
                    return false;
                } else if (passValue !== document.getElementById("newpass").value) {
                    passDisplay.innerHTML = "Passwords do not match";
                    passDisplay.style.color = "red";
                    return false;
                } else {
                    passDisplay.innerHTML = "";
                    return true;
                }
            }
            function validateNewPass(){
                const oldpass=document.getElementById("newpass").value.trim();
                const oldpasswarn=document.getElementById("newpasswarn");
                if(oldpass.length===0){
                    oldpasswarn.innerHTML="New pass is empty";
                    oldpasswarn.style.color="red";
                    return false;
                } else if (oldpass.length < 8) {
                    oldpasswarn.innerHTML = "Password must be at least 8 characters long";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[A-Z]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one uppercase letter";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[a-z]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one lowercase letter";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/\d/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one digit";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one special character";
                    oldpasswarn.style.color = "red";
                    return false;
                } else {
                    oldpasswarn.innerHTML = "";
                    return true;
                }
                    
                    
                
            }
            function validateOldPass(){
                const oldpass=document.getElementById("oldpass").value.trim();
                const oldpasswarn=document.getElementById("oldpasswarn");
                if(oldpass.length===0){
                    oldpasswarn.innerHTML="Old pass is empty";
                    oldpasswarn.style.color="red";
                    return false;
                } else if (oldpass.length < 8) {
                    oldpasswarn.innerHTML = "Password must be at least 8 characters long";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[A-Z]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one uppercase letter";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[a-z]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one lowercase letter";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/\d/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one digit";
                    oldpasswarn.style.color = "red";
                    return false;
                } else if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(oldpass)) {
                    oldpasswarn.innerHTML = "Password must contain at least one special character";
                    oldpasswarn.style.color = "red";
                    return false;
                } else {
                    oldpasswarn.innerHTML = "";
                    return true;
                }
                    
                    
                
            }
            
            function validateForm(){
               var date=validateDateAdded();
               var name =validateName();
               var email=validateEmail();
               var vendorId=validatevendorId();
               var address=validateAddress();
               var image=validateImage();
               var appointments= validateAppointments();
               if(date==false||name==false||email==false||appointments==false||vendorId==false||address==false||image==false){
                   return false;
               }
               return true;
            }
          function validateDateAdded() {
                                        const dateAddedInput = document.getElementById("date_added").value.trim();
                                        const dateAddedWarning = document.getElementById("date_added_warn");

                                        if (dateAddedInput.length === 0) {
                                            dateAddedWarning.innerHTML = "Date Added field is empty";
                                            dateAddedWarning.style.color="red";
                                            return false;
                                        } else {
                                            // You can add additional checks here, such as ensuring the date is within a specific range.
                                            // For example, if you want to ensure the date is not in the future, you can compare it with the current date.
                                            const currentDate = new Date().toISOString().split('T')[0];

                                            if (dateAddedInput < currentDate) {
                                                dateAddedWarning.innerHTML = "Date Added cannot be in the past";
                                                dateAddedWarning.style.color="red";
                                                return false;
                                            }

                                            dateAddedWarning.innerHTML = "";
                                            return true;
                                            // The date is valid; you can proceed with further actions or form submission.
                                        }
                                    }
          function validateName() {
                var nameInput = document.getElementById("name");
                var nameDisplay = document.getElementById("ndisplay");
                var reg = /^[A-Za-z]+$/;

                if (nameInput.value === "") {
                    nameDisplay.innerHTML = "Name is required";
                    nameDisplay.style.color = "red";
                    nameInput.focus();
                    return false;
                } else if (!reg.test(nameInput.value)) {
                    nameDisplay.innerHTML = "Only letters are allowed";
                    nameDisplay.style.color = "red";
                    nameInput.focus();
                    return false;
                } else {
                    nameDisplay.innerHTML = "";
                    return true;
                }
            }
          function validateEmail() {
                var emailInput = document.getElementById("email");
                var emailDisplay = document.getElementById("edisplay");
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (emailInput.value.trim() === "") {
                    emailDisplay.innerHTML = "Email is required";
                    emailDisplay.style.color = "red";
                    return false;
                } else if (!emailPattern.test(emailInput.value)) {
                    emailDisplay.innerHTML = "Invalid email format";
                    emailDisplay.style.color = "red";
                    return false;
                } else {
                    emailDisplay.innerHTML = "";
                    return true;
                }
            }
            function validateAppointments(){
                var appointInput = document.getElementById("appoint");
                var adisplay=document.getElementById("adisplay");
                if(appointInput.value.trim()===""){
                    adisplay.innerHTML="Appointments are required";
                    adisplay.style.color = "red";
                    return false;
                }else{
                    adisplay.innerHTML="";
                    return true;
                    
                }
            }
            function validateAddress(){
                var addressInput = document.getElementById("address");
                var adddisplay=document.getElementById("adddisplay");
                if(addressInput.value.trim()===""){
                    adddisplay.innerHTML="Address are required";
                    adddisplay.style.color = "red";
                    return false;
                }else{
                    adddisplay.innerHTML="";  
                    return true;
                    
                }
                
            }
            function validatevendorId(){
                var vendorInput = document.getElementById("vendorId");
                var vdisplay=document.getElementById("vdisplay");
                if(vendorInput.value.trim()===""){
                    vdisplay.innerHTML="vendorId are required";
                    vdisplay.style.color = "red";
                    return false;
                }else{
                    vdisplay.innerHTML="";  
                    return true;
                }
            }
            function validateImage(){
                var vendorImage = document.getElementById("image");
                var imdisplay=document.getElementById("imdisplay");
                if(vendorImage.value.trim()===""){
                    imdisplay.innerHTML="image are required";
                    imdisplay.style.color = "red";
                    return false;
                }else{
                    imdisplay.innerHTML="";  
                    return true;
                    
                }
            }
            function validatePhone() {
                var mobInput = document.getElementById("contact");
                var numDisplay = document.getElementById("condisplay");
                var r = /^[6789][0-9]{9}$/;

                if (mobInput.value.trim() === "") {
                    numDisplay.innerHTML = "Mobile number is required";
                    numDisplay.style.color = "red";
                    return false;
                } else if (!r.test(mobInput.value)) {
                    numDisplay.innerHTML = " 6, 7, 8, 9 and have 10 digits";
                    numDisplay.style.color = "red";
                    mobInput.focus();
                    return false;
                } else {
                    numDisplay.innerHTML = "";
                    return true;
                }
            }
            
            function ValidateForm2(){
                var name=validateName();
            }
            
          
    </script>



    </body>
</html>
