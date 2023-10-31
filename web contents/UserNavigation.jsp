
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sentiment Analysis</title>
</head>
<body>
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
                    <li>
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

</body>
</html>