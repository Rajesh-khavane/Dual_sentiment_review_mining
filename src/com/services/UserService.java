 package com.services;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.hibernate.classic.Session;
import org.json.JSONObject;

import com.analysis.NLP;
import com.analysis.Sentiment;
import com.dao.model.CommentFeature;
import com.dao.model.CommentText;
import com.dao.model.Product;
import com.dao.model.User;
import com.extractOpinion.NegativeWords;
import com.extractOpinion.NounsCounting;
import com.extractOpinion.SeperateSentances;
import com.sentence.based.AbstractDao;
import com.sentence.based.DataInterface;

@Path("/UserService")
public class UserService {

	
	@Context HttpServletRequest request;
	/**
	 * Object Creation of the all implementaed methods how to store data in database
	 */
	AbstractDao abstractDao=new AbstractDao();
	
	/**
	 * DataModel interface using this add model as data in database
	 */
	DataInterface dataInterface;
	
	/**
	 * 
	 * @param input : contains the all information about the user
	 * @param servletResponse : servlet response send to the user add services
	 * @return : returns the status if added = 'added', if exist in database = 'already Exist', otherwise any exception ='error' 
	 */
	
	@POST
	@Path("/addUser")
	@Produces({MediaType.APPLICATION_JSON})
	public String addUser
	(
		@FormParam("fullName") String fullName,
		@FormParam("userName") String userName,
		@FormParam("password") String password,
		@FormParam("mobileNumber") String mobileNumber,
		@FormParam("address") String address,		
		@Context HttpServletResponse servletResponse
	)
	{	
		System.out.println("Hellol");
		
		//Creating user Object
		User user=new User();
		//setting the data to user Object
		user.setEmailid(userName);
		user.setName(fullName);
		user.setPassword(password);
		user.setMobileNumber(mobileNumber);
		user.setAddress(address);
		user.setUserType("user"); 
		
		//Generating the Criteria parameter to checking the emailid exist or not
		HashMap<String , String> map=new HashMap<String,String>();
		map.put("emailid", user.getEmailid());

		String result="failure";
		
		String status=abstractDao.addByCriteria(map, user, User.class);
		
		//create a empty json object for sending the data with response
		JSONObject jObject=new JSONObject();
		
		//check if data is added then setting the user id with success result to  the response
		if(!status.equals("error"))
		{
			result="success";
			
			User user1=(User)abstractDao.getById("emailid", user.getEmailid(), User.class);
			
			HttpSession session=request.getSession();
			session.setAttribute("user", user1);
			jObject.put("userId",""+user1.getUserid());
			jObject.put("type",""+user1.getUserType());
			
		}
		jObject.put("result", result);
		jObject.put("status", status);
		
		//returning the json data to the Client who use this function as service
		return jObject.toString();
	}
	
	
	/**
	 * 
	 * @param input  : contains the username and passswords
	 * @param servletResponse : return the json contianing the result and status : if status is invalid authentication fialed, otherwise Success
	 * @return
	 */
	@POST
	@Path("/changePassword")
	@Produces({MediaType.APPLICATION_JSON})
	public String changePassword
	(
		@FormParam("password") String password,
		@Context HttpServletResponse servletResponse
	)
	{
		//Getting the user detail from session
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");
		
		//setting the new user password
		user.setPassword(password);
		
		//create a empty json object for sending the data with response
		JSONObject jObject=new JSONObject();
		
		String result="failure";
		String status="invalid";
		
		//check is user data available then the user is authenticate, otherWise fail
		if(user!=null)
		{
			
			status=abstractDao.update(user);
			session.setAttribute("user", user);
			result="success";
			jObject.put("data",user.toJson());
			
		}
		jObject.put("result", result);
		jObject.put("status", status);
		
		//returning the json data to the Client who use this function as service
		return jObject.toString();
	}
	
	/**
	 * 
	 * @param input  : contains the username and passswords
	 * @param servletResponse : return the json contianing the result and status : if status is invalid authentication fialed, otherwise Success
	 * @return
	 */
	@POST
	@Path("/authenticate")
	@Produces({MediaType.APPLICATION_JSON})
	public String authenticate
	(
		@FormParam("userName") String userName,
		@FormParam("password") String password,
		@Context HttpServletResponse servletResponse
	)
	{
		//build json object by getting the parameter values from requst
		
		//Generating the Criteria parameter to authenticating the user
		HashMap<String , String> map=new HashMap<String,String>();
		map.put("emailid", userName);
		map.put("password", password);
		
		//authenticate the user if data exist in user model, otherwise null
		User user=(User)abstractDao.authenticate(map, User.class);
		
		//create a empty json object for sending the data with response
		JSONObject jObject=new JSONObject();
		
		String result="failure";
		String status="invalid";
		
		//check is user data available then the user is authenticate, otherWise fail
		if(user!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			
			result="success";
			status="valid";
			jObject.put("data",user.toJson());
			
		}
		jObject.put("result", result);
		jObject.put("status", status);
		
		//returning the json data to the Client who use this function as service
		return jObject.toString();
	}
	
	@POST
	@Path("/comment")
	@Produces({MediaType.APPLICATION_JSON})
	public Response comment
	(
		@FormParam("userId") String userId,
		@FormParam("productId") String productId,
		@FormParam("comment") String comment,
		@Context HttpServletResponse servletResponse
	)
	{
		
		String filename="D:/dual.txt";
		BufferedWriter bw = null;
		FileWriter fw = null;

		try {

			String data = " UserID \t"+ userId + "\t ProductID \t" + productId + "\t Comment \t"+comment+"\n";

			File file = new File(filename);

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			// true = append file
			fw = new FileWriter(file.getAbsoluteFile(), true);
			bw = new BufferedWriter(fw);

			bw.write(data);

			System.out.println("Done");
			
			
			
			

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();
				
				 /*String command = "hadoop fs -put " + filename + " /DualSentiment";
				 try {
					util.CreateTable.main1((String)command);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
				 System.out.println("file dumped in hadoop");
				 
			} catch (IOException ex) {

				ex.printStackTrace();

			}
		}
		
		try {
			//Creating the Comment Object and passing the values to comment Object
			NounsCounting obj = new NounsCounting();
			//traning dataset path
			//String str=request.getServletContext().getRealPath("datasets")+File.separator+"en-parser-chunking.bin";
			String str=new File("datasets/en-parser-chunking.bin").getCanonicalPath();
			System.out.println("path : "+str);
			
			NegativeWords negativeWords=new NegativeWords();
			
			//clearing the garbage collection of objects
			long minRunningMemory = (1024*1024);
			Runtime runtime = Runtime.getRuntime();
			if(runtime.freeMemory()<minRunningMemory)
				 System.gc();
			
			//Get the jvm heap size.
	        long heapSize = Runtime.getRuntime().totalMemory();
	         
	        //Print the jvm heap size.
	        System.out.println("Heap Size = " + ((heapSize / 1024)/1024));
			
	        //Retrieve
			obj.parserAction(negativeWords.removeNegation(comment),str);
			
			System.out.println("List of Target : " + obj.getTarget());
			System.out.println("List of Opinioun : " + obj.getOpiniounWords());
			
			String sentences="";
			NLP nlp=new NLP();
			
			//sentiment after removing the negation word
			Sentiment sentiment=nlp.findSentiment(comment);
			
			//setting the comment object attribute
			CommentText comment2=new CommentText();
			comment2.setCommentText(comment);
			//comment2.setDate(new Date());
			
			
			
			String sDate1="2023-03-21 17:42:00";  
		    Date date=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(sDate1);  
		    System.out.println(sDate1+"\t"+date);  
			comment2.setDate(date);
			comment2.setUser((User)abstractDao.getById("id", Long.parseLong(userId), User.class));
			comment2.setProduct((Product)abstractDao.getById("id", Long.parseLong(productId), Product.class));
			comment2.setTargets(obj.getTarget().toString());
			comment2.setOpinion(obj.getOpiniounWords().toString());
			comment2.setScore(sentiment.getScore());
			comment2.setSentiment(sentiment.getSentiment());
			SeperateSentances obj1 = new SeperateSentances();
			List<String> list = obj1.getSeperateSentances(comment);
			
			ArrayList<CommentFeature> commentFeatures=new ArrayList<>();
			
			for(String str1 : list) {
				NounsCounting obj11 = new NounsCounting();
				obj11.parserAction(str1,str);
				sentiment=nlp.findSentiment(str1);
				sentences+=negativeWords.removeNegation(str1)+";";
				
				CommentFeature commentFeature=new CommentFeature();
				
				commentFeature.setOpinion(obj11.getOpiniounWords().toString());
				commentFeature.setTargets(obj11.getTarget().toString().substring(1,obj11.getTarget().toString().length()-1));
				commentFeature.setScore(sentiment.getScore());
				commentFeature.setSentiment(sentiment.getSentiment());
				commentFeature.setProduct((Product)abstractDao.getById("id", Long.parseLong(productId), Product.class));
				
				if(obj11.getOpiniounWords().size()!=0 && obj11.getTarget().size()!=0)
					commentFeatures.add(commentFeature);
				
			}
			comment2.setCommentText(comment+"---"+sentences );
			
			//adding the comment into the database
			if(abstractDao.add(comment2).equals("Added")){
				CommentText commentText=(CommentText)abstractDao.getMaxId("id",CommentText.class);
				for(CommentFeature cFeature:commentFeatures)
				{
					cFeature.setCommentText(commentText);
					abstractDao.add(cFeature);
				}
			}
			
			//returning the Control to the Comment Page
			java.net.URI location = new java.net.URI("../Comment.jsp?productId="+productId);
			return Response.temporaryRedirect(location).build();
			
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
