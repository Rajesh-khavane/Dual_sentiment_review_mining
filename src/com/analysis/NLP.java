package com.analysis;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Properties;


import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import edu.stanford.nlp.rnn.RNNCoreAnnotations;
import edu.stanford.nlp.sentiment.SentimentCoreAnnotations;
import edu.stanford.nlp.trees.Tree;
import edu.stanford.nlp.util.CoreMap;

public class NLP {
    
	static StanfordCoreNLP pipeline;
	

    public NLP() {//it is for sentiment analysis code ,used StanfordCoreNLP available in net
		super();
		// TODO Auto-generated constructor stub
		init();
	}

	public void init() {        
    	Properties props = new Properties();
    	props.setProperty("annotators", "tokenize, ssplit, parse, sentiment");
    	pipeline = new StanfordCoreNLP(props);    }

    public Sentiment findSentiment(String tweet) {//pass sentence here it return score and sentiment i.e. positive negative etc
    	
    	int mainSentiment = 0;
        int longest = 0;
        Annotation annotation = pipeline.process(tweet);
        String[] sentimentText = { "Very Negative","Negative", "Neutral", "Positive", "Very Positive"};
        NumberFormat NF = new DecimalFormat("0.0000");
        for (CoreMap sentence :  annotation
        					.get(CoreAnnotations.SentencesAnnotation.class)) {
            Tree tree = sentence.get(SentimentCoreAnnotations.AnnotatedTree.class);
            int sentiment = RNNCoreAnnotations.getPredictedClass(tree);

            String partText = sentence.toString();
           // System.out.println("Sentence: '" + partText + "' is rather " + sentimentText[sentiment]);

            if (partText.length() > longest) {
                mainSentiment = sentiment;
                longest = partText.length();
            }
        }  	
        
        return	new Sentiment(mainSentiment,sentimentText[mainSentiment]);
    	//return mainSentiment;    	
    }  
}
   