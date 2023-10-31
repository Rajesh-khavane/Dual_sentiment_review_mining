
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
    <title> Sentiment Analysis | Home</title>

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
    function changePassword()
    {
    	
    	var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        	xmlhttp=new XMLHttpRequest();
        }
        else
        {
        	// code for IE6, IE5
        	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
        	if(xmlhttp.readyState==4 && xmlhttp.status==200)
        	{
        		var jsonData = JSON.parse(xmlhttp.responseText);
            	if(jsonData.result==='success' && jsonData.status==='updated')
            	{	
            		document.getElementById("message").innerHTML="password Updated Successfully...........";
            		document.getElementById("message").style.background="green";
            	}
            	else
            	{	
            		document.getElementById("message").innerHTML=jsonData.status;
            		document.getElementById("message").style.background="red";
            	}
            	
        	}
        } 
        
        var confirmPassword=document.getElementById("confirmPassword").value;
        var password=document.getElementById("password").value;
        if(confirmPassword===password){
    	    xmlhttp.open("POST","rest/UserService/changePassword",true);
    	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	    xmlhttp.send("password="+password);
        }
        else{
        	
        	document.getElementById("message").innerHTML="Password Not Match";
        	
        }
    }
    </script>
</head>

<body>

    <div id="wrapper">

     <jsp:include page="UserNavigation.jsp"></jsp:include>
     
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            <strong>    <a class="navbar-brand" href="Home.jsp" style="color:#ffffff"> Sentiment Analysis </a></strong>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li><a href="UserHome.jsp" style="color:#ffffff" ><i class="fa fa-home"></i> Home <b class="caret"></b></a></li>
                <li><a href="AllGraph.jsp" style="color:#ffffff"><i class="fa fa-area-chart"></i> Compare Product's<b class="caret"></b></a></li>
                <li><a href="ListCategory.jsp" style="color:#ffffff"><i class="fa fa-list"></i> List Category <b class="caret"></b></a></li>
                <li><a href="ListProducts.jsp" style="color:#ffffff"><i class="fa fa-shopping-cart"></i> List Products <b class="caret"></b></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:#ffffff"><i class="fa fa-gear"></i> Settings <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="width: 200px;">
                
                    	<li>
                            <a href="#" style="color:#8B441E"><b>Welcome : </b><%=user.getName() %> </a>
                        </li>
                        <li>
                            <a href="Profile.jsp" style="color:#8B441E"><i class="fa fa-fw fa-user"></i> Profile </a>
                        </li>
                        <li>
                            <a href="ChangePassword.jsp" style="color:#8B441E"><i class="fa fa-fw fa-key"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="UserLogin.jsp" style="color:#8B441E"><i class="fa fa-fw fa-sign-out"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                <li>
                <img src="homeassets/images/c5.png" alt="Product 1" width="200" height="150">
                </li>
                    <li class="">
                        <a href="UserHome.jsp" style="color:#ffffff"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="ListCategory.jsp" style="color:#ffffff"><i class="fa fa-fw fa-list"></i> List Category </a>
                    </li>
                    <li>
                        <a href="ListProducts.jsp" style="color:#ffffff"><i class="fa fa-fw fa-shopping-cart"></i> List Product </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

           <div class="container-fluid" style="background-image :url('images/hbg5.jpg')">

                <!-- Page Heading 
                <div class="row">
                	<div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h1 class="page-header">
                            Welcome to the User Portal<small>Dual_Sentiment_Analysis</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> User Portal
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
               <main>
		<section class="hero">
			<h1>Welcome to our store!!!</h1>
			<p>Enjoy shopping with us...</p>
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
