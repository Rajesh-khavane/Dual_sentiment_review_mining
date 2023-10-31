package com.dao.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sentence.based.DataInterface;

@Entity
@Table(name="commentFeatures")
public class CommentFeature implements DataInterface {

	
	@Id
	@GeneratedValue
	@Column(name="comment_feature")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="comment")
	private CommentText commentText;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public long getId() {
		return id;
	}

	@Override
	public String toString() {
		return "CommentFeature [id=" + id + ", features=" + features
				+ ", commentText=" + commentText + ", sentiment=" + sentiment
				+ ", score=" + score + ", opinion=" + opinion + ", targets="
				+ targets + "]";
	}

	public void setId(long id) {
		this.id = id;
	}

	public CommentText getCommentText() {
		return commentText;
	}

	public void setCommentText(CommentText commentText) {
		this.commentText = commentText;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}
	
	
	public String getSentiment() {
		return sentiment;
	}

	public void setSentiment(String sentiment) {
		this.sentiment = sentiment;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getTargets() {
		return targets;
	}

	public void setTargets(String targets) {
		this.targets = targets;
	}
	
	private String sentiment;
	private int score;
	private String opinion;
	private String targets;
	private String features;
}
