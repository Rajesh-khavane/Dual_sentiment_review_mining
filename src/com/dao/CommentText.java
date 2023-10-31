package com.dao.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.sentence.based.DataInterface;


@Entity
@Table(name="comment")
public class CommentText implements DataInterface{

	@Id
	@GeneratedValue
	private long id;


	
	public CommentText(long id, String commentText, Product product, User user,
			Date date) {
		super();
		this.id = id;
		this.commentText = commentText;
		this.product = product;
		this.user = user;
		this.date = date;
	}

	public CommentText() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", commentText=" + commentText
				+ ", product=" + product + ", user=" + user + ", date=" + date
				+ "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	
	
	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name="comment_text")
	private String commentText;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="comment_Date")
	private Date date;
	
	@Column(name="opinion")
	private String opinion;
	
	@Column(name="targets")
	private String targets;
	
	@Column(name="sentences")
	private String sentences;
	
	@Column(name="value")
	private String value;
	
	private String sentiment;
	
	private int score;

	@OneToMany(mappedBy="commentText")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<CommentFeature> comments = new ArrayList<CommentFeature>();
	
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

	
	
}
