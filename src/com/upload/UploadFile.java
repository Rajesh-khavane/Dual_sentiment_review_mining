package com.upload;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.model.Product;
import com.dao.model.ProductCategory;
import com.sentence.based.AbstractDao;


/**
 * Servlet implementation class UploadFile1
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response); 	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String logos = "/Uploads/";		
        String LOGO_UPLOAD_DIRECTORY = getServletContext().getRealPath(logos);
        Product product=new Product();

        AbstractDao abstractDao=new AbstractDao();
        try 
        {
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for(FileItem file : multiparts) {
                String str = file.getFieldName();
                if(str.equalsIgnoreCase("productName")) {
                    product.setProductName(file.getString());
                }
                if(str.equalsIgnoreCase("price")) {
                    product.setProductPrice(file.getString());
                }
                if(str.equalsIgnoreCase("color")) {
                    product.setColor(file.getString());
                }
                if(str.equalsIgnoreCase("weight")) {
                    product.setWeight(file.getString());
                }
                if(str.equalsIgnoreCase("features")) {
                    product.setFeatures(file.getString());
                }
                if(str.equalsIgnoreCase("categoryName")) {
                    product.setProductCategory((ProductCategory)abstractDao.getById("id", Long.parseLong(file.getString()), ProductCategory.class));
                }
                if(!file.isFormField()){
                    String path = new File(file.getName()).getName();
                    try{
                        file.write(new File(LOGO_UPLOAD_DIRECTORY + File.separator + path));
                        product.setProductPath(path);
                    } 
                    catch (Exception e) {							
                        e.printStackTrace();
                    }
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        //out.println(Product.toString());
        System.out.println("Product : "+product.toString());
        String status=abstractDao.add(product);
        System.out.println("Product is : "+status);
        response.sendRedirect("ListProducts.jsp");
	}

}
