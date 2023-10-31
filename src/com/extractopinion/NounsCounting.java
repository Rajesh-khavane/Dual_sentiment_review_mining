package com.extractOpinion;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import opennlp.tools.cmdline.parser.ParserTool;
import opennlp.tools.parser.Parse;
import opennlp.tools.parser.Parser;
import opennlp.tools.parser.ParserFactory;
import opennlp.tools.parser.ParserModel;

public class NounsCounting {

	// target is nothing but nouns.
	private Set<String> target = new HashSet<String>();
	
	// opinion is feedback of user.
	private Set<String> opiniounWords = new HashSet<String>();
	private List<String> sentanceList = new ArrayList<String>();

	private static String line;//= ;
	
	public NounsCounting() {
		
	}
	public Set<String> getTarget() {
		return target;
	}
	public void setTarget(Set<String> target) {
		this.target = target;
	}
	public Set<String> getOpiniounWords() {
		return opiniounWords;
	}
	public void setOpiniounWords(Set<String> opiniounWords) {
		this.opiniounWords = opiniounWords;
	}
	public List<String> getSentanceList() {
		return sentanceList;
	}
	public void setSentanceList(List<String> sentanceList) {
		this.sentanceList = sentanceList;
	}
	public static String getLine() {
		return line;
	}
	public static void setLine(String line) {
		NounsCounting.line = line;
	}
	// here is recursion which is used to calculate the opinion and target of any string/feedback/
	public void getNounPhrases(Parse p) {
		if (p.getType().equals("NN") || p.getType().equals("NNS")
				|| p.getType().equals("NNP") || p.getType().equals("NNPS")) {
			//save all the targets to the target list
			target.add(p.getCoveredText());
		}
		if (p.getType().equals("JJ") || p.getType().equals("JJR")
				|| p.getType().equals("JJS")) {
			//save all opinion to the opinion.
			opiniounWords.add(p.getCoveredText());
		}		
		
		// pass the extracted words to the recursion to find out the mining of the data
		for (Parse child : p.getChildren()) {
			getNounPhrases(child);
		}
	}
	
	public void parserAction(String str,String fileName) throws Exception {
		line = str;
		
		//open the file which contains all nouns, verbs and so on 
		//InputStream is = new FileInputStream("en-parser-chunking.bin");
		InputStream is = new FileInputStream(fileName);
		
		//pass the input stream to ParseModel for reading/checking the containts in the file
		ParserModel model = new ParserModel(is);
		
		//create a parser to save the input file 
		Parser parser = ParserFactory.create(model);
		
		// parse all the words and store in parse array
		Parse topParses[] = ParserTool.parseLine(line, parser, 1);
		for (Parse p : topParses) {
			getNounPhrases(p);
		}
	}

	public static void main(String[] args) throws Exception {
		NounsCounting obj = new NounsCounting();
		obj.parserAction("This phone colorful and big screen , but phone LCD resolution is very disappointing","en-parser-chunking.bin");
		//obj.parserAction("hello");
		System.out.println("List of Target : " + obj.target);
		System.out.println("List of Opinioun : " + obj.opiniounWords);
	}
}