
<%@page import="com.sentence.based.AbstractDao"%>
<%@page import="com.sentence.based.DataInterface"%>
<%@page import="com.dao.model.Product"%>
<%@page import="com.dao.model.User"%>
<%@page import="java.util.List"%>

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
    <title> Dual_Sentiment_Analysis | Change Password</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

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
    function addCategory()
    {	
        var categoryName=document.getElementById("categoryName").value;
        if(categoryName!==""){
    	    document.getElementById("submitCategory").submit();
        }
        else{
        	document.getElementById("message").innerHTML="Category should not be empty";
        }
    }
    </script>
</head>

<body>
    <div id="wrapper">
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
                <a class="navbar-brand" href="Home.jsp"> Dual_Sentiment_Analysis </a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li><a href="AdminHome.jsp"><i class="fa fa-user"></i> Home <b class="caret"></b></a></li>
                <li><a href="AllGraph.jsp" style="color:#ffffff"><i class="fa fa-area-chart"></i> Compare Product's<b class="caret"></b></a></li>
                <li><a href="AddCategory.jsp"><i class="fa fa-user"></i> Category <b class="caret"></b></a></li>
                <li><a href="AddProducts.jsp"><i class="fa fa-user"></i> Product <b class="caret"></b></a></li>
                <li><a href="ListCategory.jsp" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> List Category <b class="caret"></b></a></li>
                <li><a href="ListProducts.jsp"><i class="fa fa-user"></i> List Products <b class="caret"></b></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Settings <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="width: 200px;">
                    	<li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Welcome : <%=user.getName() %> </a>
                        </li>
                        <li>
                            <a href="Profile.jsp"><i class="fa fa-fw fa-user"></i> Profile </a>
                        </li>
                        <li>
                            <a href="ChangePassword.jsp"><i class="fa fa-fw fa-gear"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="UserLogin.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="AdminHome.jsp"><i class="fa fa-fw fa-dashboard"></i> Home</a>
                    </li>
                    <li>
                        <a href="AddCategory.jsp"><i class="fa fa-fw fa-dashboard"></i> Category </a>
                    </li>
                    <li>
                        <a href="AddProducts.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Product </a>
                    </li>
                    <li >
                        <a href="ListCategory.jsp"><i class="fa fa-fw fa-dashboard"></i> List Category </a>
                    </li>
                    <li class="active">
                        <a href="ListProducts.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> List Product </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        
        <div id="page-wrapper">

           <div class="container-fluid" style="background-image :url('images/images.jpg')">
                <!-- Page Heading -->
                <div class="row">
                	<div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h1 class="page-header">
                            Products<small> Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Add Categories
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-1 col-md-12"></div>
                    <div class="col-lg-10 col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div>Products</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-1"></div>
  		                        <div class="col-sm-10">
               						<div class="row"><h3>Product List</h3> </div>
               						<div class="row">
                                  	<% 
                                        AbstractDao abstractDao=new AbstractDao(); 
                                        List<DataInterface> lists1=abstractDao.listByQuery("from Product");
                                       
                                        if(lists1.size()!=0)
                                        {
                                        for(DataInterface di1:lists1)
                                        {
                                            Product pc=(Product)di1;
                                             
                                        %>
                            		<div class="col-md-6">            
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <%=pc.getProductName()  %>
                                        </div>
                                        <div class="panel-body">
                                             <img src="Uploads/<%=pc.getProductPath() %>"  alt="Cinque Terre" width="75" height="75">
                                                     <hr>
                                            Category : <%=pc.getProductCategory().getCategory() %>
                                            <br>
                                            Price  : &#8377 <%=pc.getProductPrice() %>
                                            <br>
                                            Color  : <%=pc.getColor() %>
                                            <br>
                                            Weight  : <%=pc.getWeight() %>
                                         	<br>
                                            Features  : <%=pc.getFeatures() %>
                                        </div>
                                        <div class="panel-footer clearfix">
                                            <div class="pull-left">
                                             <a class="btn btn-primary" href="Comment.jsp?productId=<%=pc.getId()%>">Veiw Comments <span class = "badge"><%=pc.getComments().size() %></span></a> 
                                            </div>
                                        </div>
                                    </div>
                            </div>
                                    <%
                                        }
                                        }
                                        else
                                        {
                                        %>
                                        <h2>No Products Available</h2>
                                        <%
                                                }
                                        %>
                            </div>  
                            <div class="clear">
                            </div>
                    </div>            
								</div>
                                </div>
                            </div>
                            <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					<a class="btn btn-primary" href="AddProducts.jsp"><span class="pull-right"> Add <i class="fa fa-arrow-circle-right"></i></span></a>
                                				<div class="clearfix"></div>
                                		</div>
                                	</div>
                            </div>
                        </div>
                    </div>
                </div>
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
