<%-- 
    Document   : VendorRegistration.jsp
    Created on : 30-Nov-2023, 4:29:44 pm
    Author     : T460
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.vendor.model.*"%>
<%
VendorDAO vdao = (VendorDAO) request.getSession().getAttribute("vdao");
   if (vdao != null) {
         request.setAttribute("vdao", vdao);    
     }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple registration form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
/*      html, body {
      display: flex;
      justify-content: center;
      height: 100%;
      }
      body, div, h1, form, input, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: #666;
      }
      h1 {
      padding: 10px 0;
      font-size: 32px;
      font-weight: 300;
      text-align: center;
      }
      p {
      font-size: 12px;
      }
      hr {
      color: #a9a9a9;
      opacity: 0.3;
      }
      .main-block {
      max-width: 340px; 
      min-height: 460px; 
      padding: 10px 0;
      margin: auto;
      border-radius: 5px; 
      border: solid 1px #ccc;
      box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
      background: #ebebeb; 
      }
      form {
      margin: 0 30px;
      }
      .account-type, .gender {
      margin: 15px 0;
      }
      input[type=radio] {
      display: none;
      }
      label#icon {
      margin: 0;
      border-radius: 5px 0 0 5px;
      }
      label.radio {
      position: relative;
      display: inline-block;
      padding-top: 4px;
      margin-right: 20px;
      text-indent: 30px;
      overflow: visible;
      cursor: pointer;
      }
      label.radio:before {
      content: "";
      position: absolute;
      top: 2px;
      left: 0;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: #1c87c9;
      }
      label.radio:after {
      content: "";
      position: absolute;
      width: 9px;
      height: 4px;
      top: 8px;
      left: 4px;
      border: 3px solid #fff;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      input[type=text],input[type=number], input[type=password] {
      width: calc(100% - 57px);
      height: 36px;
      margin: 13px 0 0 -5px;
      padding-left: 10px; 
      border-radius: 0 5px 5px 0;
      border: solid 1px #cbc9c9; 
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #fff; 
      }
      input[type=password] {
      margin-bottom: 15px;
      }
      #icon {
      display: inline-block;
      padding: 9.3px 15px;
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #1c87c9;
      color: #fff;
      text-align: center;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      button {
      width: 100%;
      padding: 10px 0;
      margin: 10px auto;
      border-radius: 5px; 
      border: none;
      background: #1c87c9; 
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      }
      button:hover {
      background: #26a9e0;
      }*/
    </style>
    <script>
            function validateForm() {
                var email = validateEmail();
                var name = validateName();
                var password = validatePassword();
                var cpassword = validateConfirmPass();
                var phone = validatePhone();
                var address = validateAddress();
                var vendorid = validateVendorId();
                var photo=validatePhoto();

                var edisplay = document.getElementById("edisplay");
                var ndisplay = document.getElementById("ndisplay");
                var pdisplay = document.getElementById("pdisplay");
                var cpassdisplay = document.getElementById("cpassdisplay");
                var cpdisplay = document.getElementById("cpdisplay");
                var phonedisplay = document.getElementById("phonedisplay");
                var addrdisplay = document.getElementById("addrdisplay");
                var viddisplay = document.getElementById("viddisplay");
                var photodisplay = document.getElementById("photodisplay");
                if (email == false || name == false || password == false || cpassword == false || phone == false || address == false || vendorid==false || photo==false) {
                    return false;
                }

                return true;
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
            function validateName() {
                var nameInput = document.getElementById("name");
                var nameDisplay = document.getElementById("ndisplay");
                var reg = /^[A-Za-z]+$/;

                if (nameInput.value.trim() === "") {
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
            function validateAddress() {
                var fnameInput = document.getElementById("address");
                var fnameDisplay = document.getElementById("addrdisplay");
                

                if (fnameInput.value.trim() === "") {
                    fnameDisplay.innerHTML = "Address is required";
                    fnameDisplay.style.color = "red";
                    fnameInput.focus();
                    return false;
                }  else {
                    fnameDisplay.innerHTML = "";
                    return true;
                }
            }
            
            function validateAddress() {
                var fnameInput = document.getElementById("address");
                var fnameDisplay = document.getElementById("addrdisplay");
                

                if (fnameInput.value.trim() === "") {
                    fnameDisplay.innerHTML = "Address is required";
                    fnameDisplay.style.color = "red";
                    fnameInput.focus();
                    return false;
                }  else {
                    fnameDisplay.innerHTML = "";
                    return true;
                }
            }
            
            function validateVendorId(){
                var fnameInput = document.getElementById("vendorid");
                var fnameDisplay = document.getElementById(" viddisplay");
                

                if (fnameInput.value.trim() === "") {
                    fnameDisplay.innerHTML = "vendorid is required";
                    fnameDisplay.style.color = "red";
                    fnameInput.focus();
                    return false;
                }  else {
                    fnameDisplay.innerHTML = "";
                    return true;
                }
            }
            
            
            
            
      //        function validatePass() {
      //            var passInput = document.getElementById("pass");
      //            var passDisplay = document.getElementById("pdisplay");
      //           
      //
      //            if (passInput.value.trim() === "") {
      //                passDisplay.innerHTML = "pass is required";
      //                passDisplay.style.color = "red";
      //                return false;
      //            }else {
      //                passDisplay.innerHTML = "";
      //                return true;
      //            }
      //        }
      //        function validatecPass() {
      //            var passInput = document.getElementById("cpass");
      //            var passDisplay = document.getElementById("cpdisplay");
      //           
      //
      //            if (passInput.value.trim() === "") {
      //                passDisplay.innerHTML = "cpass is required";
      //                passDisplay.style.color = "red";
      //                return false;
      //            }else {
      //                passDisplay.innerHTML = "";
      //                return true;
      //            }
      //        }
            function validatePassword() {
                var passInput = document.getElementById("password");
                var passDisplay = document.getElementById("pdisplay");
                var passValue = passInput.value;

                if (passValue.trim() === "") {
                    passDisplay.innerHTML = "Password is required";
                    passDisplay.style.color = "red";
                    return false;
                } else if (passValue.length < 8) {
                    passDisplay.innerHTML = "Password must be at least 8 characters long";
                    passDisplay.style.color = "red";
                    return false;
                } else if (!/[A-Z]/.test(passValue)) {
                    passDisplay.innerHTML = "Password must contain at least one uppercase letter";
                    passDisplay.style.color = "red";
                    return false;
                } else if (!/[a-z]/.test(passValue)) {
                    passDisplay.innerHTML = "Password must contain at least one lowercase letter";
                    passDisplay.style.color = "red";
                    return false;
                } else if (!/\d/.test(passValue)) {
                    passDisplay.innerHTML = "Password must contain at least one digit";
                    passDisplay.style.color = "red";
                    return false;
                } else if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(passValue)) {
                    passDisplay.innerHTML = "Password must contain at least one special character";
                    passDisplay.style.color = "red";
                    return false;
                } else {
                    passDisplay.innerHTML = "";
                    return true;
                }
            }

            function validateConfirmPass() {
                var passInput = document.getElementById("confirm_password");
                var passDisplay = document.getElementById("cpassdisplay");
                var passValue = passInput.value;

                if (passValue.trim() === "") {
                    passDisplay.innerHTML = "Confirm password is required";
                    passDisplay.style.color = "red";
                    return false;
                } else if (passValue !== document.getElementById("password").value) {
                    passDisplay.innerHTML = "Passwords do not match";
                    passDisplay.style.color = "red";
                    return false;
                } else {
                    passDisplay.innerHTML = "";
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
            
        </script>
  </head>
  

  <body>
    <%@include file="navbar.jsp" %>  
    <br><br><br>
    <div class="wrapper">
        <div class="title">
            Vendor Register
        </div>
        <form action="VendorRegistrationTask" onsubmit="return validateForm()" >
            <div class="field">
                <input type="email" name="email" onkeyup="validateEmail()" id="email" required>
                <span id="edisplay"></span>
                <label>Email</label>
            </div>  
            <div class="field">
                <input type="text"  name="name" onkeyup="validateName()" id="name" required>
                <span id="ndisplay"></span>
                <label>Name</label>
            </div>
            <div class="field">
                <input type="password" name="password" onkeyup="validatePassword()" id="password" required>
                <span id="pdisplay"></span>
                <label>Password</label>
            </div>
            <div class="field">
                <input type="password"  name="confirm_password" onkeyup="validateConfirmPass()" id="confirm_password" required>
                <span id="cpassdisplay"></span>
                <label>Confirm Password</label>
            </div>
            <div class="field">
                <input type="text"  name="phone" onkeyup="validatePhone()" id="phone" required>
                <span id="phonedisplay"></span>
                <label>Contact</label>
            </div>
            <div class="field">
                <input type="text"  name="address" onkeyup="validateAddress()" id="address" required>
                <span id="addrdisplay"></span>
                <label>Address</label>
            </div>
            <div class="field">
                <input type="number"  min="0" name="vendorid" onkeyup="validateVendorId()" id="vendorid" required>
                <span id="viddisplay"></span>
                <label>Vendor ID</label>
            </div>
            <div class="field">
                <input type="text"  name="photo" onkeyup="validatePhoto()" id="photo" required>
                <span id="photodisplay"></span>
                <label>Description</label>
            </div>
            <div class="content">
                <div class="checkbox">
                    <input type="checkbox" id="remember-me">
                    <label for="remember-me">Remember me </label>
                </div>
            </div>
            <div class="field">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>  
  </body>
</html>
