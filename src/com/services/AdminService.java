/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.json.JSONObject;

import com.dao.model.ProductCategory;
import com.sentence.based.AbstractDao;
import com.sentence.based.DataInterface;


/**
 *
 * @author ANGEL
 */
@Path("/AdminService")
public class AdminService {
    
	@Context HttpServletRequest request;
	/**
	 * Object Creation of the all implementaed methods how to store data in database
	 */
	AbstractDao abstractDao=new AbstractDao();
	
	/**
	 * DataModel interface using this add model as data in database
	 */
	DataInterface dataInterface;
        
        
    @POST
	@Path("/addCategory")
	@Produces({MediaType.APPLICATION_JSON})
	public String addCategory
	(
		@FormParam("categoryName") String category_name,
		@Context HttpServletResponse servletResponse
	)
	{	
                ProductCategory ProductCategory=new ProductCategory();
                //build json object by getting the parameter values from requst
                JSONObject jObject=new JSONObject();
                
                ProductCategory.setCategory(category_name);
                //Generating the Criteria parameter to authenticating the user
                
                HashMap<String , String> map=new HashMap<String , String>();
                map.put("category", category_name);
                System.out.println("category Name : "+category_name);
                
                //authenticate the user if data exist in user model, otherwise null
                //User user=(ProductCategory)abstractDao.authenticate(map, User.class);
                String status=abstractDao.addByCriteria(map, ProductCategory, ProductCategory.class);
                
                if(!status.equals("Added"))
                    status="Exist";
                //returning the json data to the Client who use this function as service
                //java.net.URI location = new java.net.URI("../AddCategory.jsp?message="+status);
                //return Response.temporaryRedirect(location).build();
                jObject.put("status", status);
                return jObject.toString();
                
            //return null;
	}
        
}
