
package com.chart;

import java.awt.BasicStroke;
import java.awt.*;
import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.dao.model.CommentText;
import com.dao.model.Product;
import com.sentence.based.AbstractDao;

/**
 * Servlet implementation class CrimeChart
 */
@WebServlet("/SentimentChart")
public class SentimentChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	

	AbstractDao abstractDao=new AbstractDao();
	public SentimentChart() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//DefaultCategoryDataset dataset=new DefaultCategoryDataset(); 

		
		String id=request.getParameter("productId").toString();
    	//Product pc=(Product)abstractDao.getById("id",Long.parseLong("1"), Product.class);
		System.out.println("id_id::::"+id);
    	Product pc=(Product)abstractDao.getById("id",Long.parseLong(id), Product.class);
    	//Product pc=(Product)abstractDao.getById("id",Product.getId1(), Product.class);
    			
    	//System.out.println("id_id::::"+pc.getId());
		JFreeChart chart = ChartFactory.createBarChart(pc.getProductName()+" Analysis Report", "Sentiment", "Score",  createDataset(pc),PlotOrientation.VERTICAL,           
		         true, true, false);
		
		chart.setBorderPaint(new Color(245, 245, 220));
		Font titleFont = new Font("Poppins", Font.BOLD, 20);
		chart.getPlot().setBackgroundPaint(new Color(245, 245, 220));
		CategoryPlot plot = (CategoryPlot) chart.getPlot();
		ValueAxis rangeAxis = plot.getRangeAxis();
		double max = rangeAxis.getUpperBound();
		System.out.println("The highest bar value is: " + max);
		chart.getTitle().setFont(titleFont);
		chart.getTitle().setPaint(new Color(150, 75, 0));
		chart.setBorderStroke(new BasicStroke(1.0f));
		chart.setBorderVisible(true);
		
		System.out.println("in servlet   ");
		if (chart != null) 
		{
			System.out.println("in not null   ");
			int width = 500;
			int height = 350;
			//final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			final ChartRenderingInfo info=new ChartRenderingInfo();
			response.setContentType("image/png");
			
			OutputStream out=response.getOutputStream();
			
			ChartUtilities.writeChartAsPNG(out, chart, width, height,info);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private CategoryDataset createDataset(Product pc)
	{	
    	System.out.println(pc.getComments().size());
		
		double nutralPoints=0.0;
		double negativePoints=0.0;
		double positivePoints=0.0;
		
		for(CommentText cmt:pc.getComments())
		{
			if(cmt.getSentiment().equals("Negative"))
			{
				negativePoints+=cmt.getScore();
				System.out.println("negative="+negativePoints);
			}	
			if(cmt.getSentiment().equals("Positive"))
			{	
					positivePoints+=cmt.getScore();

					
					System.out.println("positive="+positivePoints);
			}
			if(cmt.getSentiment().equals("Neutral"))
				nutralPoints+=cmt.getScore();

			System.out.println("neutral="+nutralPoints);
		}
		
		final String nutral = "Nutral";        
		final String nagative = "Negative";        
		final String positive = "Positive";        
		
		
		final DefaultCategoryDataset dataset = 
				new DefaultCategoryDataset( );  

		dataset.addValue( nutralPoints , nutral , nutral );        
		dataset.addValue( negativePoints , nagative , nagative );
		dataset.addValue(  positivePoints, positive , positive );
		
		return dataset; 
	}
}
