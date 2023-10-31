package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.model.Product;
import com.sentence.based.AbstractDao;

/**
 * Servlet implementation class CompareProducts
 */
@WebServlet("/CompareProducts")
public class CompareProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompareProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		long productId1 = Long.parseLong(request.getParameter("productId1").toString());
		 long productId2 = Long.parseLong(request.getParameter("productId2").toString());
    	 	        
	        AbstractDao abstractDao=new AbstractDao(); 
	        Product product1=(Product)abstractDao.getById("id",productId1, Product.class);
	        Product product2=(Product)abstractDao.getById("id",productId2, Product.class);
	        request.setAttribute("product1", product1);
	        request.setAttribute("product2", product2);
	        
	        String compare = "compare.jsp";
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher(compare);
	        dispatcher.forward(request, response);
	}

}
