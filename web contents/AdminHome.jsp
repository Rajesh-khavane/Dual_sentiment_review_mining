
<%@page import="com.dao.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	User user=null;
    	if(session.getAttribute("user")!=null)
    		user=(User)session.getAttribute("user");
    	else
    		response.sendRedirect("UserLogin.jsp");
    %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Sentiment Analysis |  Admin Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/MAin.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script type="text/javascript">
    
    </script>
</head>

<body>

    <div id="wrapper">
    
    	<% if(user.getUserType().equals("admin")) {%>
 		<jsp:include page="AdminNavigation.jsp"></jsp:include>
     <%}else{ %>
     	<jsp:include page="UserNavigation.jsp"></jsp:include>
     	<%} %>
     
        <div id="page-wrapper">

          <div class="container-fluid" style="background-image :url('images/hbg5.jpg')">

                <!-- Page Heading 
                <div class="row">
                	<div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h1 class="page-header">
                        <% if(user.getUserType().equals("admin")) {%>
 		                      Welcome to the Admin Portal<small>Dual_Sentiment_Analysis </small>
     					<%}else{ %>
     	                      Welcome to the User Portal<small>Dual_Sentiment_Analysis </small>
     					<%} %>
     
      
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                 <main>
		<section class="hero">
			<h1>Welcome!!!</h1>
			<p>Enjoy your shopping with us...</p>
			<a href="#featured" class="button" style="color:#ffffff">Shop Now</a>
		</section>
		<section class="featured">
			<div style="color:#8B441E"><h2>Shop By Categores!</h2></div>
			<div class="product-grid">
				<div class="product">
					<img src="images/catn1.jpg" alt="Product 1">
					<h3>Clothing</h3>
					<p>Men Clothing,Women Clothing</p>
					<a href="ListProducts.jsp?categoryId=2" class="button">Let's Shoppp!</a>
				</div>
				<div class="product">
					<img src="images/catn2.jpg" alt="Product 2">
					<h3>Kiddies</h3>
					<p>Kids Clotihng,Toys</p>
					<a href="ListProducts.jsp?categoryId=3" class="button">Let's Shoppp!</a>
				</div>
				<div class="product">
					<img src="images/catn3.jpg" alt="Product 3">
					<h3>Tech Accessories</h3>
					<p>Computers,Watches,Mobile phones,Cameras</p>
					<a href="ListProducts.jsp?categoryId=1" class="button">Let's Shoppp!</a>
				</div>
				<div class="product">
					<img src="images/cat44.jpg" alt="Product 3">
					<h3>Home Appliances</h3>
					<p>Refridgerator,TV's,AC,Washing Machine</p>
					<a href="ListProducts.jsp?categoryId=4" class="button">Let's Shoppp!</a>
				</div>
				<div class="product">
					<img src="images/cat55.jpg" alt="Product 3">
					<h3>Decor</h3>
					<p>Decorative Items, Photos, Wall hangings</p>
					<a href="ListProducts.jsp?categoryId=5" class="button">Let's Shoppp!</a>
				</div>
				<div class="product">
					<img src="images/cat66.jpeg" alt="Product 3">
					<h3>Gifting</h3>
					<p>Gift hampers,Customized gifts</p>
					<a href="ListProducts.jsp?categoryId=6" class="button">Let's Shoppp!</a>
				</div>
			</div>
		</section>
	</main>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
	
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
