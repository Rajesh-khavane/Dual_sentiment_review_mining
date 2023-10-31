package com.extractOpinion;

import edu.smu.tspell.wordnet.Synset;
import edu.smu.tspell.wordnet.WordNetDatabase;
import edu.smu.tspell.wordnet.WordSense;


public class NegativeWords {

	String negationWords[]={"not","no","never","neither","nobody",
			"none","nor","nothing","nowhere",
			"dont","doesnt","didnt","wasnt","werent",
			"havent","hasnt",
			"hadnt","couldnt","shouldnt","wouldnt",
			"may","might","must","shallnt",
			"cant","willnt",
			"don't","doesn't","didn't","wasn't","weren't",
			"haven't","hasn't",
			"hadn't","couldn't","shouldn't","wouldn't",
			"shalln't","cann't","willn't"};
	
	public static void main(String [] args)
	{
			NegativeWords negativeWords=new NegativeWords();
			String sentence="DeskTop Computer is heavy but we cant move anywhere";
			System.out.println(negativeWords.removeNegation(sentence));
	}
	
	public String removeNegation(String sentence)
	{
		String rsNegation="";
		String tokens[]=sentence.split(" ");
		for(int j=0;j<tokens.length;j++)
		{
			int flag=0;
			for(int i=0;i<negationWords.length;i++)
			{
				if(tokens[j].contains(negationWords[i]) )
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{	
				rsNegation+=tokens[j]+" ";
			}
			else
			{
				tokens[j+1]=getAntonyms(tokens[j+1]);
			}	
		}
		return rsNegation;
	}
	
	/**
	 * 
	 * @param word that you want to get the antinomy of the words
	 * @return
	 */
	public String getAntonyms(String word)
	{
		
		System.setProperty("wordnet.database.dir","C:\\Program Files (x86)\\WordNet\\2.1\\dict");
		WordNetDatabase database = WordNetDatabase.getFileInstance();
		Synset[] synsets = database.getSynsets(word);
		for(Synset synset : synsets){
		    WordSense[] wordsenses = synset.getAntonyms(word);
		    for(WordSense wordsense : wordsenses) {
		            return wordsense.getWordForm();
		        }
		}
		return word;
	}
}
