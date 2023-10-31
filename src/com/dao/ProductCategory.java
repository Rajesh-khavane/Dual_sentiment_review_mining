/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.json.JSONObject;

import com.sentence.based.DataInterface;


/**
 *
 * @author ANGEL
 */
@SuppressWarnings("serial")
@Entity
@Table(name="product_category")
public class ProductCategory implements DataInterface {
    
    @Id
    @GeneratedValue
    private long id;
    
    private String category;

    public long getId() {
        return id;
    }

    public ProductCategory() {
    }

    public void setId(long id) {
        this.id = id;
    }

    public ProductCategory(long id, String category) {
        this.id = id;
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public JSONObject toJson()
    {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("id",""+this.id );
        jsonObject.put("category",this.category );
        return jsonObject;
		
    }
}
