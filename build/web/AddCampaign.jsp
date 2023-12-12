<%-- 
    Document   : AddCampaign
    Created on : 02-Dec-2023, 3:10:21 pm
    Author     : T460
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.vendor.model.*"%>
<% 
     VendorDAO vdao = (VendorDAO) request.getSession().getAttribute("vdao");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            html,body{
                height: 100%;
                width: 100%;
                place-items: center;

            }
            .navbar{
                width:100%;
            }

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            html,body{
                display: grid;
                height: 100%;
                width: 100%;
                place-items: center;
               
            }
            .navbar{
                width:100%;
            }
            ::selection{
                background: #4158d0;
                color: #fff;
            }
            .wrapper{
                width: 380px;
                background: #fff;
                border-radius: 15px;
                box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
            }
            .wrapper .title{
                font-size: 35px;
                font-weight: 600;
                text-align: center;
                line-height: 100px;
                color: #fff;
                user-select: none;
                border-radius: 15px 15px 0 0;
                background: linear-gradient(-135deg, #00ffbf, #00bfff);
            }
            .wrapper form{
                padding: 10px 30px 50px 30px;
            }
            .wrapper form .field{
                height: 50px;
                width: 100%;
                margin-top: 20px;
                position: relative;
            }
            .wrapper form .field input{
                height: 100%;
                width: 100%;
                outline: none;
                font-size: 17px;
                padding-left: 20px;
                border: 1px solid lightgrey;
                border-radius: 25px;
                transition: all 0.3s ease;
            }
            .wrapper form .field input:focus,
            form .field input:valid{
                border-color: #4158d0;
            }
            .wrapper form .field label{
                position: absolute;
                top: 50%;
                left: 20px;
                color: #999999;
                font-weight: 400;
                font-size: 17px;
                pointer-events: none;
                transform: translateY(-50%);
                transition: all 0.3s ease;
            }
            form .field input:focus ~ label,
            form .field input:valid ~ label{
                top: 0%;
                font-size: 16px;
                color: #4158d0;
                background: #fff;
                transform: translateY(-50%);
            }
            form .content{
                display: flex;
                width: 100%;
                height: 50px;
                font-size: 16px;
                align-items: center;
                justify-content: space-around;
            }
            form .content .checkbox{
                display: flex;
                align-items: center;
                justify-content: center;
            }
            form .content input{
                width: 15px;
                height: 15px;
                background: red;
            }
            form .content label{
                color: #262626;
                user-select: none;
                padding-left: 5px;
            }
            form .content .pass-link{
                color: "";
            }
            form .field input[type="submit"]{
                color: #fff;
                border: none;
                padding-left: 0;
                margin-top: -10px;
                font-size: 20px;
                font-weight: 500;
                cursor: pointer;
                background: linear-gradient(-135deg, #00ffbf, #00bfff);
                transition: all 0.3s ease;
            }
            form .field input[type="submit"]:active{
                transform: scale(0.95);
            }
            
            form .signup-link{
                color: #262626;
                margin-top: 20px;
                text-align: center;
            }
            form .pass-link a,
            form .signup-link a{
                color: #4158d0;
                text-decoration: none;
            }
            form .pass-link a:hover,
            form .signup-link a:hover{
                text-decoration: underline;
            }
        </style>
        <script>
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
            
//            function validateForm(){
//               var date=validateDateAdded();
//               var name =validateName();
//               var email=validateEmail();
//               var vendorId=validatevendorId();
//               var address=validateAddress();
//               var image=validateImage();
//               var appointments= validateAppointments();
//               if(date==false||name==false||email==false||appointments==false||vendorId==false||address==false||image==false){
//                   return false;
//               }
//               return true;
//            }
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
                var mobInput = document.getElementById("phone");
                var numDisplay = document.getElementById("phonedisplay");
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
            
            function validateForm(){
            var validateName= validateName();
            var validateEmail=validateEmail();
            var validateAppointments=validateAppointments();
            var validateDateAdded=validateDateAdded();
            var validateAddress=validateAddress();
            var validatevendorId=validatevendorId();
            var validateImage=validateImage();
            
            if(validateName==false||validateEmail==false||validateAppointments==false||validateDateAdded==false||validateAddress==false||validatevendorId==false||validateImage==false){
                return false;
                
            }
            return true;
            
        }
          
         
    </script>
                                    
    </head>
    <body>

        <%@include file="navbar.jsp" %>
            <% if(vdao!=null){ %>
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
        
    <br><br><br>
    <script>
        function validateForm(){
            var validateName= validateName();
            var validateEmail=validateEmail();
            var validateAppointments=validateAppointments();
            var validateDateAdded=validateDateAdded();
            var validateAddress=validateAddress();
            var validatevendorId=validatevendorId();
            var validateImage=validateImage();
            
            if(validateName==false||validateEmail==false||validateAppointments==false||validateDateAdded==false||validateAddress==false||validatevendorId==false||validateImage==false){
                return false;
                
            }
            return true;
            
        }
    </script>
    <% if(vdao!=null){ %>
    <div class="wrapper">
        <div class="title">
            Add Campaign
        </div>
        <form action="InsertCampaignTask"  onsubmit="return validateForm()" >
            <div class="field">
                <input type="text"  id="name" onkeyup="validateName()" name="name" required>
                <span id="ndisplay"></span>
                <label>Campaign Name</label>
            </div>  
            <div class="field">
                <input type="email"  id="email" onkeyup="validateEmail()" name="email" required>
                <span id="edisplay"></span>
                <label>Campaign email</label> 
            </div>
            <div class="field">
                <input type="number"  id="appoint" min="0" onkeyup="validateAppointments()" name="max_appointments" required>
                <span id="adisplay"></span>
                <label>maximum_appointment</label>
            </div>
            <div class="field">
                <input type="date"  id="date_added" onkeyup="validateDateAdded()"  name="Campaign_Date" required>
                <span id="date_added_warn"></span>
                <label>Campaign_Date</label>
            </div>
            <div class="field">
                <input type="text"   id="address"  name="Address" onkeyup="validateAddress()" required>
                <span id="adddisplay"></span>
                <label>Address</label>
            </div> 
            <div class="field">
                <input type="number"  id="vendorId" onkeyup="validatevendorId()" name="VendorId" required>
                <span id="vdisplay"></span>
                <label>Vendor Id</label>
            </div>
            <div class="field">
                <input type="file"  id="image" onkeyup="validateImage()" name="image" accept="image/*" required>
                <span id="imdisplay"></span>
                <label>Image</label>
            </div>
            <div class="content">
                <div class="checkbox">
                    <input type="checkbox" id="remember-me">
                    <label for="remember-me">know your details </label>
                </div>
            </div>
            <div class="field">
                <input type="submit" value="ADD">
            </div>
            
        </form>
    </div>
   <%}%>