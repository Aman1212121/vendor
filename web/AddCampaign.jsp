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
        
    <br><br><br>
    <% if(vdao!=null){ %>
    <div class="wrapper">
        <div class="title">
            Add Campaign
        </div>
        <form action="InsertCampaignTask" >
            <div class="field">
                <input type="text"  id="name" name="name" required>
                <span id="ndisplay"></span>
                <label>Campaign Name</label>
            </div>  
            <div class="field">
                <input type="email"  id="email" name="email" required>
                <span id="edisplay"></span>
                <label>Campaign email</label>
            </div>
            <div class="field">
                <input type="number"  id="pass" name="max_appointments" required>
                <span id="pdisplay"></span>
                <label>maximum_appointment</label>
            </div>
            
            <div class="field">
                <input type="date"  id="pass" name="Campaign_Date" required>
                <span id="pdisplay"></span>
                <label>Campaign_Date</label>
            </div>
            <div class="field">
                <input type="text"   id="cpass"  name="Address" required>
                <span id="cpdisplay"></span>
                <label>Address</label>
            </div> 
            <div class="field">
                <input type="number"  id="pass" name="VendorId" required>
                <span id="pdisplay"></span>
                <label>Vendor Id</label>
            </div>
            <div class="field">
                <input type="file"  id="pass" name="image" accept="image/*" required>
                <span id="pdisplay"></span>
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