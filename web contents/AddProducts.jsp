<%@page import="com.sentence.based.DataInterface"%>
<%@page import="com.sentence.based.AbstractDao"%>
<%@page import="com.dao.model.ProductCategory"%>
<%@page import="com.dao.model.User"%>>
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
   <style type="text/css">
	   .btn-file {
	  position: relative;
	  overflow: hidden;
	}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  background: red;
  cursor: inherit;
  display: block;
}
   </style>
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
             <strong>    <a class="navbar-brand" href="Home.jsp" style="color:#ffffff"> Sentiment Analysis </a></strong>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li><a href="AdminHome.jsp" style="color:#ffffff" ><i class="fa fa-home"></i> Home <b class="caret"></b></a></li>
                 <li><a href="AddCategory.jsp" style="color:#ffffff" ><i class="fa fa-plus"></i> Add Category <b class="caret"></b></a></li>
                  <li><a href="AddProducts.jsp" style="color:#ffffff" ><i class="fa fa-plus-square-o"></i> Add Product <b class="caret"></b></a></li>
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
                        <a href="AdminHome.jsp" style="color:#ffffff"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="AddCategory.jsp" style="color:#ffffff"><i class="fa fa-fw fa-plus"></i> Add Category </a>
                    </li>
                    <li>
                        <a href="AddProducts.jsp" style="color:#ffffff"><i class="fa fa-fw fa-plus-square-o"></i> Add Product </a>
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
                            Category<small> Dual_Sentiment_Analysis </small>
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
                    <form class="form-horizontal" role="form" action="UploadFile" method="post" enctype="multipart/form-data">
                        <section class="hero">
			<h1>Let's Add new Products!</h1>
			<p>Add more products to enhance store...</p>
			<br>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-12">
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-1"></div>
  		                        <div class="col-sm-8"> 
								  <div class="form-group">
								    <label class="control-label col-sm-4" for="email">Product Name</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required="required">
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="control-label col-sm-4" for="email">Select Category</label>
								    <div class="col-sm-8">
								     <select class="form-control" name="categoryName" required="required"> 
								     <option value="">--- Select ---</option>
									    <% AbstractDao abstractDao=new AbstractDao();
                                        List<DataInterface>  lists=abstractDao.listByQuery("from ProductCategory");
                                        int i=0;
                                        for(DataInterface di:lists)
                                        {
                                            ProductCategory bc=(ProductCategory)di;
                                        
                                        %>
                                           	<option value="<%=bc.getId() %>"><%=bc.getCategory() %></option>
                                        <%
                                        }
                                        %>    
											</select>
										    </div>
										  </div>
										  <div class="form-group">
										    <label class="control-label col-sm-4" for="email">Product Price</label>
										    <div class="col-sm-8">
										      <input type="text" class="form-control" name="price" placeholder="Enter Price" required="required">
										    </div>
										  </div>
										  
										  <div class="form-group">
										    <label class="control-label col-sm-4" for="email"> Color </label>
										    <div class="col-sm-8">
										      <input type="text" class="form-control" name="color" placeholder="Enter Color" required="required">
										    </div>
										  </div>
										  <div class="form-group">
										    <label class="control-label col-sm-4" for="email"> Weight </label>
										    <div class="col-sm-8">
										      <input type="text" class="form-control" name="weight" placeholder="Enter Weight" required="required">
										    </div>
										  </div>
										 <div class="form-group">
										    <label class="control-label col-sm-4" for="email"> Features </label>
										    <div class="col-sm-8">
										      <textarea class="form-control" name="features" placeholder="Enter Features" required="required"></textarea>
										    </div>
										  </div> 
										  <div class="form-group">
										    <label class="control-label col-sm-4" for="email"> Select Image File </label>
										    <div class="col-sm-8">
										       	<span class="file-input btn btn-primary btn-file">
                									Browse&hellip; <input type="file" name="image">
           										 </span>
										    </div>
										  </div> 
										  <div class="form-group"> 
										    <div class="col-sm-offset-4 col-sm-8">
										      <div class="checkbox">
										        <label id="message">&nbsp;</label>
										      </div>
										    </div>
									  </div>
									
								</div>
                                </div>
                            </div>
                            <button type="submit" class="button" ><span class="pull-right"> Add the new Product</span></button>
                            <!--  <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					
                                				<div class="clearfix"></div>
                                		</div>
                                	</div>
                            </div>-->
                       
                       </form>
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
