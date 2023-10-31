
<%@page import="com.sentence.based.AbstractDao"%>
<%@page import="com.sentence.based.DataInterface"%>
<%@page import="com.dao.model.ProductCategory"%>
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
    <title>Dual_Sentiment_Analysis | Change Password</title>

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
                            Category<small>Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Categories List
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-1 col-md-12"></div>
                    <div class="col-lg-10 col-md-12">
                       <section class="hero">
			<h1>Explore the wide categories!</h1>
			<p>See categories provided by us...</p>
			<% if(user.getUserType().equals("admin")) {%>
			<a href="AddCategory.jsp" class="button" style="color:#ffffff">Add Category</a><%}else{ %>
											     	
											     	<%} %>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-1"></div>
  		                        <div class="col-sm-8">
	                                  <table class="table table-bordered" style="border:2px solid #8B4459">
                                        <tr>
                                            <td style="border:1px solid #8B4459">ID</td>
                                            <td style="border:1px solid #8B4459">Category Name</td>
                                        </tr>
                                        <% AbstractDao abstractDao=new AbstractDao();
                                        List<DataInterface>  lists=abstractDao.listByQuery("from ProductCategory");
                                        int i=1;
                                        for(DataInterface di:lists)
                                        {
                                            ProductCategory bc=(ProductCategory)di;
                                        
                                        %>
                                        <tr>
                                            <td style="border:1px solid #8B4459"><%=i++ %></td>
                                            <td style="border:1px solid #8B4459"><%=bc.getCategory() %></td>
                                        </tr>
                                        <%
                                        }
                                        %>
                                    </table> 
								</div>
                                </div>
                            </div>
                            <!--  <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					<% if(user.getUserType().equals("admin")) {%>
                               						<a class="btn btn-primary" href="AddCategory.jsp"><span class="pull-right"> Add <i class="fa fa-arrow-circle-right"></i></span></a>
											     <%}else{ %>
											     	
											     	<%} %>
                                				<div class="clearfix"></div>
                                		</div>
                                	</div>
                            </div>-->
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
