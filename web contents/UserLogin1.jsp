<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Dual_Sentiment_Analysis |  User Login</title>

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
function login()
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
        	if(jsonData.result==='success' && jsonData.status==='valid')
        	{
        		if(jsonData.type==="user")
        			window.location="UserHome.jsp";
        		else
        			window.location="AdminHome.jsp";
        	}
        	else
        	{
        		document.getElementById("message").innerHTML=jsonData.status;
        	}
    	}
    }
    var userName=document.getElementById("userName").value;
    var password=document.getElementById("password").value;
   	
    if(userName!=="" && password!=="")
    {   
    	document.getElementById("message").innerHTML="Processing.....";
	    xmlhttp.open("POST","rest/UserService/authenticate",true);
	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xmlhttp.send("userName="+userName+"&password="+password);
    }
    else
    {
    	document.getElementById("message").innerHTML="Enter the Credentials";	
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
                <a class="navbar-brand" href="index.html"> Dual_Sentiment_Analysis </a>
            </div>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="UserLogin.jsp"><i class="fa fa-fw fa-dashboard"></i>User Login</a>
                    </li>
                    <li>
                        <a href="NewUser.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> New User Registration</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper" >

            <div class="container-fluid" style="background-image :url('images/images.jpg')">

                <!-- Page Heading -->
                <div class="row">
                	<div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <h1 class="page-header">
                            User Login <small> Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Sign in
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-3 col-md-12"></div>
                    <div class="col-lg-6 col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div>Enter Credential</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-2"></div>
  		                        <div class="col-sm-8">
                                     <form class="form-horizontal" role="form">
									  <div class="form-group">
									    <label class="control-label col-sm-4" for="email">username:</label>
									    <div class="col-sm-8">
									      <input type="email" class="form-control" id="userName" placeholder="Enter email">
									    </div>
									  </div>
									  <div class="form-group">
									    <label class="control-label col-sm-4" for="pwd">Password:</label>
									    <div class="col-sm-8"> 
									      <input type="password" class="form-control" id="password" placeholder="Enter password">
									    </div>
									  </div>
									  <div class="form-group"> 
									    <div class="col-sm-offset-4 col-sm-8">
									      <div class="checkbox">
									        <label id="message" class="txt txt-error">&nbsp;</label>
									      </div>
									    </div>
									  </div>
									</form>
									</div>
                                </div>
                            </div>
                            <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					<a class="btn btn-primary" href="Javascript:login()"><span class="pull-right">Login <i class="fa fa-arrow-circle-right"></i></span></a>
                               					<a class="btn btn-link" href="NewUser.jsp"><span class="pull-right">Register New User <i class="fa fa-arrow-circle-right"></i></span></a>
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
