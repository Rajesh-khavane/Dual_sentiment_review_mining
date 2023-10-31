<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>LOGIN</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/css/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/css/style.css" />
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body style="margin-top:0px">
	<div id="booking" class="section" style="background-color: #B59263">
		<div class="section-center">
			<div class="container">
			
				<div class="row">
				
					<div class="col-md-7 col-md-push-5">
					
						<div class="booking-cta">
						
							<h1>Login to your account for Shopping!</h1>
							<p>just login to your account and enjoy the reviews classification with sentiment analysis....</p>
							 <ul style="color:white">
              <li><i class="ri-check-double-line"></i>Enter your credentials.</li>
               <li><i class="ri-check-double-line"></i>click on login.</li>
            </ul></p>


						</div>
					</div>
					<div class="col-md-4 col-md-pull-7">
						<div class="booking-form">
							<form action="Login" method="post">
							<span><strong><center><h2>Login</h2></center></strong></span><br><br>
							
								<div class="form-group">
								<span class="form-label"> Email:</span>
								      <input type="email" class="form-control" id="userName" placeholder="Enter email">
								</div>
							
								<div class="form-group">
								<span class="form-label"> Password:</span>
							     <input type="password" class="form-control" id="password" placeholder="Enter password">
									 	</div>
								<div class="form-group"> 
									    <div class="col-sm-offset-4 col-sm-8">
									      <div class="checkbox">
									        <label id="message" class="txt txt-error">&nbsp;</label>
									      </div>
									    </div>
									  </div>
									 <div class="panel-footer">
                           	 <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
                               					<a class="btn btn-primary" href="Javascript:login()"><span class="pull-right">Login</span></a>
                               					<a class="btn btn-link" href="reg.html" style="color:#8B4439"><strong>Register </strong></a>
                                				<div class="clearfix"></div>
                                		</div>
                                	</div>
                            </div>  
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
<script>
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
        			window.location="Home.jsp";
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
</html>