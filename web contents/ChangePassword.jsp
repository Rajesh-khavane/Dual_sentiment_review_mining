
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

       <% if(user.getUserType().equals("admin")) {%>
 		<jsp:include page="AdminNavigation.jsp"></jsp:include>
     <%}else{ %>
     	<jsp:include page="UserNavigation.jsp"></jsp:include>
     	<%} %>

        <div id="page-wrapper">

           <div class="container-fluid" style="background-image :url('images/hbg5.jpg')">

                <!-- Page Heading 
                <div class="row">
                	<div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <h1 class="page-header">
                            Change Password <small> Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Change Password
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-3 col-md-12"></div>
                    <div class="col-lg-6 col-md-12">
                       <section class="hero" style="padding:50px">
			<h1>Welcome <%=user.getName() %>!</h1>
			<p>Here you can change your password...</p>
			
		</section>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-2"></div>
  		                        <div class="col-sm-8">
                                     <form class="form-horizontal" role="form">
									   <div class="form-group">
									    <label class="control-label col-sm-4" for="pwd">Password : </label>
									    <div class="col-sm-8"> 
									      <input type="password" class="form-control" id="password" placeholder="Enter password">
									    </div>
									  </div>
									  <div class="form-group">
									    <label class="control-label col-sm-4" for="pwd">Confirm Password : </label>
									    <div class="col-sm-8"> 
									      <input type="password" class="form-control" id="confirmPassword" placeholder="Enter password">
									    </div>
									  </div>
									  <div class="form-group"> 
									    <div class="col-sm-offset-4 col-sm-8">
									      <div class="checkbox">
									        <label id="message"></label>
									      </div>
									    </div>
									  </div>
									</form>
									</div>
                                </div>
                            </div>
                            <a href="Javascript:changePassword()" class="button" style="color:#ffffff">Change Password</a>
                          <!--   <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					<a class="btn btn-primary" href="Javascript:changePassword()"><span class="pull-right"> Change Password <i class="fa fa-arrow-circle-right"></i></span></a>
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
