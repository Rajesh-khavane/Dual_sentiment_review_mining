
<%@page import="com.dao.model.ProductCategory"%>
<%@page import="com.sentence.based.DataInterface"%>
<%@page import="com.sentence.based.AbstractDao"%>
<%@page import="com.dao.model.Product"%>
<%@page import="com.dao.model.User"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	User user=null;
    	if(session.getAttribute("user")!=null)
    		user=(User)session.getAttribute("user");
    	else
    		response.sendRedirect("UserLogin.jsp");
    %>
     <%
  String productId = request.getParameter("productId");
  if (productId != null && !productId.isEmpty()) {
    String[] productIds = (String[]) session.getAttribute("compareProducts");
    if (productIds == null) {
      productIds = new String[0];
    }
    productIds = Arrays.copyOf(productIds, productIds.length + 1);
    productIds[productIds.length - 1] = productId;
    session.setAttribute("compareProducts", productIds);
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Dual_Sentiment_Analysis</title>

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
                            Product<small> Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>List Categories
                            </li>
                            <% 
                                        AbstractDao abstractDao=new AbstractDao();
                                        List<DataInterface>  lists=abstractDao.listByQuery("from ProductCategory");
                                        int i=1;
                                        for(DataInterface di:lists)
                                        {
                                            ProductCategory bc=(ProductCategory)di;
                                        
                                        %>
                                         <li>
                                            <a href="ListProducts.jsp?categoryId=<%=bc.getId()%>"><%=bc.getCategory() %></a>
                                         </li>
                                        <%
                                        }
                                        %>
                            
                            
                            
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-1 col-md-12">
                
                </div>
                    <div class="col-lg-10 col-md-12" >
                    <!--   <div class="panel panel-primary">  --> 
                         <section class="hero">
			<h1>Let's Shop the Products!</h1>
			<p>here are your products, let's shop...</p>
				<% if(user.getUserType().equals("admin")) {%>
			<a href="AddProducts.jsp" class="button" style="color:#ffffff">Add Product</a> <%}else{ %>
											     	
											     	<%} %>	
		</section>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-1"> 
  		                        	
  		                        
  		                        </div>
  		                     <section class="featured">
			<h2>Products</h2>
			<div class="product-grid">
               						<div class="row">
                                  	<% 
                                        
                                  	 	List<DataInterface> lists1=null;
                                  		if(request.getParameter("categoryId")!=null)
                                  		{
                                  			int id=Integer.parseInt(request.getParameter("categoryId"));
                                  			lists1=abstractDao.listByQuery("from Product where productCategory="+id);
                                  		}
                                  		else
                                  		{
                                  			lists1=abstractDao.listByQuery("from Product");
                                  		}
                                       
                                        if(lists1.size()!=0)
                                        {
                                        for(DataInterface di1:lists1)
                                        {
                                            Product pc=(Product)di1;
                                             
                                        %>
                            		<div class="col-md-6">            
                                    <div class="panel panel-primary">
                                     <div class="panel-heading"><center>   <h4>
                                            <%=pc.getProductName()  %></h4></center>
                                        </div>
                                        <div class="panel-body" style="background-color:#E8DED0">
                                             <center><img src="Uploads/<%=pc.getProductPath() %>"  alt="Cinque Terre" width="250" height="320"></center>
                                                     <hr>
                                            <b>Product Name: </b> <%=pc.getProductName()  %>  
                                            <br>
                                           <b>Category :</b>  <%=pc.getProductCategory().getCategory() %>
                                            <br>
                                           <b>Price :</b> &#8377 <%=pc.getProductPrice() %>
                                            <br>
                                          <b>Color :</b> <%=pc.getColor() %>
                                            <br>
                                          <b>Weight :</b><%=pc.getWeight() %>
                                         	<br>
                                             <b>Features :</b> <%=pc.getFeatures() %>
                                        </div>
                                        <div class="panel-footer clearfix">
                                            <div class="pull-left">
                                             <a class="btn btn-primary" href="Comment.jsp?productId=<%=pc.getId()%>">View Comments <span class = "badge"><%=pc.getComments().size() %></span></a>
                                             <a class="btn btn-primary" href="Graph.jsp?productId=<%=pc.getId()%>"> Graph </a>
                                             <a class="btn btn-primary" href="FeatureGraph.jsp?productId=<%=pc.getId()%>"> Feature Graph </a>
                                           		    
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
                                        <section class="hero" style="padding-top:30px;padding-bottom:30px">
			<h1>Let's Compare the Products!</h1>
			<p>here just select product to compare, let's shop...</p>
			
		</section>
    <center>  <form action="CompareProducts" method="post">
       <div class="form-group">
            <label for="productId1">Product 1:</label>
            <select name="productId1" class="form-control" required>
            <option value="">Select a product</option>
            <% for(DataInterface di1:lists1)
            {
                Product pc2=(Product)di1;  %>
                <option value="<%= pc2.getId() %>"><%= pc2.getProductName() %></option>
            <% } %>
        </select>
    </div>
    <div class="form-group">
        <label for="productId2">Product 2:</label>
        <select name="productId2" class="form-control" required>
            <option value="">Select a product</option>
            <% for(DataInterface di1:lists1)
            {
                Product pc1=(Product)di1; %>
                <option value="<%= pc1.getId() %>"><%= pc1.getProductName() %></option>
         <%}%>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Compare</button>
</form></center>
                    </div>  </section>          
								</div>
                                </div>
                            </div>
                             <div class="panel-footer" style="background-image :url('images/hbg5.jpg')">
                        
                           	<!--   <div class="row">
  		                        	<div class="col-md-4"></div>
  		                        		<div class="col-sm-8">
  		                        					
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- JavaScript code to handle checkbox click event -->
<script>
  $(document).ready(function() {
    $('input[type=checkbox]').click(function() {
      var productId = $(this).val();
      if ($(this).is(':checked')) {
        $.ajax({
          type: 'POST',
          url: 'compare.jsp',
          data: {productId: productId},
          success: function() {
            console.log('Product added to compare list');
          },
          error: function() {
            console.log('Failed to add product to compare list');
          }
        });
      }
    });
  });
</script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</body>

</html>
