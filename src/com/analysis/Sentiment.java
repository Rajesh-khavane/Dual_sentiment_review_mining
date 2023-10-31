package com.analysis;

public  class Sentiment
{
	public int score;
	public String sentiment; 
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getSentiment() {
		return sentiment;
	}

	public void setSentiment(String sentiment) {
		this.sentiment = sentiment;
	}

	@Override
	public String toString() {
		return "Sentiment [score=" + score + ", sentiment=" + sentiment + "]";
	}

	public Sentiment(int score,String sentiment )//it return score & sentiment
	{
		this.score=score;
		this.sentiment=sentiment;
	}    	
}
