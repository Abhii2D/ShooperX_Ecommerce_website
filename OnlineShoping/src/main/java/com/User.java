package com;

public class User {
private int id;
private String name;
private String email;
private String password;
private String contact;
private String address;
public String getContact() {
	return contact;
}



public void setContact(String contact) {
	this.contact = contact;
}



public String getAddress() {
	return address;
}



public void setAddress(String address) {
	this.address = address;
}


public int getId() {
	return id;
}



public void setId(int id) {
	this.id = id;
}



public String getName() {
	return name;
}



public void setName(String name) {
	this.name = name;
}



public String getEmail() {
	return email;
}



public void setEmail(String email) {
	this.email = email;
}



public String getPassword() {
	return password;
}



public void setPassword(String password) {
	this.password = password;
}


@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + "]";
}



public  User() {

}

public User(int id, String name, String email, String password ,String contact,String address) {

	this.id = id;
	this.name = name;
	this.email = email;
	this.password = password;
	this.address = address;
	this.contact = contact;
}


}
