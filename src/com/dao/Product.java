/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.model;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.sentence.based.DataInterface;



/**
 *
 * @author ANGEL
 */
@SuppressWarnings("serial")
@Entity
@Table(name="product")
public class Product implements Serializable,DataInterface {
    
    @Id
    @GeneratedValue
    private long id;
    private static long id1;
    
    @ManyToOne
    private ProductCategory productCategory;
    
    @OneToMany(mappedBy="product")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<CommentText> comments = new ArrayList<CommentText>();
    
    private String productName;
    private String productPath;
    public List<CommentText> getComments() {
		return comments;
	}
	public void setComments(List<CommentText> comments) {
		this.comments = comments;
	}
	private String productPrice;
    private String features;
    private String color;
    private String weight;
	public long getId() {
		return id;
	}
	public static long getId1() {
		return id1;
	}
	public void setId(long id) {
		this.id = id;
		id1=id;
	}
	public ProductCategory getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPath() {
		return productPath;
	}
	public void setProductPath(String productPath) {
		this.productPath = productPath;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", ProductCategory=" + productCategory
				+ ", productName=" + productName + ", productPath="
				+ productPath + ", productPrice=" + productPrice
				+ ", features=" + features + ", color=" + color + ", weight="
				+ weight + "]";
	}
	public Product(long id, com.dao.model.ProductCategory productCategory,
			String productName, String productPath, String productPrice,
			String features, String color, String weight) {
		super();
		this.id = id;
		id1=id;
		this.productCategory = productCategory;
		this.productName = productName;
		this.productPath = productPath;
		this.productPrice = productPrice;
		this.features = features;
		this.color = color;
		this.weight = weight;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
