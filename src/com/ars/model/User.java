package com.ars.model;

public class User {

	
	private String userId;
	private String password;
	private String name;
	private String address;
	private String email;
	private String contact;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public User(String userId, String password, String name, String address, String email, String contact) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.contact = contact;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", email=" + email + ", contact=" + contact + "]";
	}
	
	
	

	
	
}
