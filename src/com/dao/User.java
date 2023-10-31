package com.dao.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.json.JSONObject;

import com.sentence.based.DataInterface;



@Entity
@Table(name="user")
public class User implements DataInterface  {

	@Override
	public String toString() {
		return "User [userid=" + userid + ", name=" + name + ", emailid="
				+ emailid + ", password=" + password + ", mobileNumber="
				+ mobileNumber + ", address=" + address + ", userType="
				+ userType + "]";
	}
	@Id
	@GeneratedValue
	private long userid;
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	@Column(name="user_name")
	private String name;
	
	@Column(name="email_id")
	private String emailid;
	
	@Column(name="password")
	private String password;
	
	@Column(name="mobile_number")
	private String mobileNumber;
	
	@Column(name="address")
	private String address;
	
	@Column(name="user_type")
	private String userType;
	
	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	public JSONObject toJson()
	{
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("userid",this.userid );
		jsonObject.put("name",this.name );
		jsonObject.put("emailid",this.emailid );
		jsonObject.put("gender",this.password );
		return jsonObject;
		
	}
	
	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}

}
