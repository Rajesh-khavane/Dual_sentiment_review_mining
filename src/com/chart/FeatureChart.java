package com.chart;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.dao.model.CommentFeature;
import com.dao.model.Product;
import com.sentence.based.AbstractDao;
import com.sentence.based.DataInterface;

/**
 * Servlet implementation class FeatureChart
 */
@WebServlet("/FeatureChart")
public class FeatureChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	AbstractDao abstractDao=new AbstractDao();
	
    public FeatureChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		id=request.getParameter("productId").toString();
    	Product pc=(Product)abstractDao.getById("id", Long.parseLong(id), Product.class); 
		
		JFreeChart chart = ChartFactory.createBarChart(pc.getProductName()+" Analysis Report", "Sentiment", "Score",  createFeatureDataset(pc),PlotOrientation.VERTICAL,           
		         true, true, false);
		
		chart.setBorderPaint(new Color(245, 245, 220));
		Font titleFont = new Font("Poppins", Font.BOLD, 20);
		chart.getPlot().setBackgroundPaint(new Color(245, 245, 220));
		
		chart.getTitle().setFont(titleFont);
		chart.getTitle().setPaint(new Color(150, 75, 0));
		chart.setBorderStroke(new BasicStroke(1.0f));
		chart.setBorderVisible(true);
		System.out.println("in servlet   ");
		if (chart != null) 
		{
			System.out.println("in not null   ");
			int width = 700;
			int height = 500;
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
	
	private CategoryDataset createFeatureDataset(Product pc)
	{	
		AbstractDao abstractDao=new AbstractDao();
		
		double nutralPoints=0.1;
		double negativePoints=0.1;
		double positivePoints=0.1;
		
			
		final String nutral = "Neutral";        
		final String nagative = "Negative";        
		final String positive = "Positive";        
		
		
		DefaultCategoryDataset dataset = 
				new DefaultCategoryDataset( );
		
		System.out.println(pc.getComments().size());
    	List<DataInterface> lists=abstractDao.listByQuery("from CommentFeature where product.id= "+id);
    	System.out.println(lists.size());
		HashSet<String> features=new HashSet<String>();
		for(DataInterface di:lists)
		{
			CommentFeature cFeature=(CommentFeature)di;
			String feature[]=cFeature.getTargets().split(",");
			for(String f:feature)
			{
				features.add(f.trim().toLowerCase());
				System.out.println("features bgraph="+f);
				
				CommentFeature cmt=(CommentFeature)di;
				
				if(cmt.getTargets().contains(f))
				{
					System.out.println("target="+cmt.getTargets());
					System.out.println("features="+f);
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
				if(!f.trim().equals(""))
				{
					dataset.addValue( nutralPoints ,  nutral , f);        
					dataset.addValue( negativePoints , nagative , f );
					dataset.addValue( positivePoints, positive ,f); 
				}
				
			}
			nutralPoints=0.1;
			negativePoints=0.1;
			positivePoints=0.1;
		}
		
		 
		
		/*for(String f:features)
		{	
			for(DataInterface di:lists)
			{
				CommentFeature cmt=(CommentFeature)di;
				
				if(cmt.getTargets().contains(f))
				{
					System.out.println("target="+cmt.getTargets());
					System.out.println("features="+f);
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
			}
			if(!f.trim().equals(""))
			{
				dataset.addValue( nutralPoints ,  nutral , f);        
				dataset.addValue( negativePoints , nagative , f );
				dataset.addValue( positivePoints, positive ,f); 
			}
			nutralPoints=0.1;
			negativePoints=0.1;
			positivePoints=0.1;
		}*/
		return dataset; 
	}
}
