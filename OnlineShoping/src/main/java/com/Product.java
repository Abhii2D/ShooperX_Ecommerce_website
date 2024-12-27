package com;

public class Product {
private int id;
@Override
public String toString() {
	return "Product [id=" + id + ", name=" + name + ", categoy=" + categoy + ", price=" + price + ", image=" + image
			+ "]";
}
public Product(int id, String name, String categoy, double price, String image) {
	super();
	this.id = id;
	this.name = name;
	this.categoy = categoy;
	this.price = price;
	this.image = image;
}
private String name;
private String categoy;
private double price;
private String image;
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
public String getCategoy() {
	return categoy;
}
public void setCategoy(String categoy) {
	this.categoy = categoy;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public Product() {
	
}
}
