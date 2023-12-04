<%-- 
    Document   : CampaignList
    Created on : 02-Dec-2023, 8:39:56 pm
    Author     : T460
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.vendor.model.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>

<%
   DecimalFormat dcf = new DecimalFormat("#.##");
   request.setAttribute("dcf", dcf);
VendorDAO vdao = (VendorDAO) request.getSession().getAttribute("vdao");
if (vdao != null) {
    request.setAttribute("vdao", vdao);    
}
//ProductDTO pdto=new ProductDTO();
//List <ProductDAO> products= pdto.getAllProducts();
ArrayList<CountDAO> count_list = (ArrayList<CountDAO>) session.getAttribute("count-list");
List<CountDAO> countCampaign=null;
if (count_list != null) {
        CampaignDTO cdto=new CampaignDTO();
        countCampaign = pdto.getCountCampaigns(count_list);
//        double total = pdto.getTotalCartPrice(cart_list);
//        request.setAttribute("total", total);
	request.setAttribute("count_list", count_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

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
            background: #f2f2f2;
            background: linear-gradient(-135deg, #c850c0, #4158d0);
        }
        .navbar{
            width:100%;
        
        .table tbody td{
             vertical-align: middle;
        }
        .btn-incre, .btn-decre{
             box-shadow: none;
             font-size: 25px;
        }
        }
    </style>
</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container my-3">
<!--		<div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>-->
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (count_list != null) {
					for (CountDAO c : countCampaign) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
<!--					<td><%= dcf.format(c.getPrice())%></td>-->
					<td>
						<form action="OrderNow" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="QuantityIncDec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="QuantityIncDec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="RemoveFromCart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
