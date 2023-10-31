package com.extractOpinion;

import java.util.ArrayList;
import java.util.List;

public class SeperateSentances {

	ArrayList<String> list = new ArrayList<String>();
	
	// Separate a string by checking all constants 
	//if found then replace a string 
	private String[] con = { " For ", ", And ", " Nor ", ", But ", " Or ",
			" Yet ", ", So ", " for ", ", and ", " nor ", ", but ", " or ",
			" yet ", ", so ", ", ", ". " };

	//this method separate string by checking the all contents of the 'con' constants  
	public List<String> getSeperateSentances(String opinion) {
		for(int i = 0; i<con.length;i++) {
			//if string contains constants values then replace the string with default value;
			opinion = opinion.replace(con[i], " sssssssss ");
		}

		//Splite the string by default value;
		//Get the result as a String array.
		String[] splite = opinion.split("sssssssss");
		for(String str : splite) {
			if(!str.equals(" ")) {
				list.add(str.trim());
			}
		}
		return list;
	}

	public static void main(String[] args) {
		
		NegativeWords negativeWords=new NegativeWords();
		SeperateSentances obj = new SeperateSentances();
		List<String> list = obj.getSeperateSentances("This phone has a colorful and big screen , but phone LCD resolution is not perfect");
		for(String str : list) {
			System.out.println(negativeWords.removeNegation(str));
		}
	}
}
