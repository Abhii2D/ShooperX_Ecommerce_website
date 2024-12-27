package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connection;
    private String query;
    private PreparedStatement pt;
    private ResultSet rSet;

    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    // Fetch all products
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            query = "SELECT * FROM product";
            pt = this.connection.prepareStatement(query);
            rSet = pt.executeQuery();

            while (rSet.next()) {
                Product rowProduct = new Product();
                rowProduct.setId(rSet.getInt("id"));
                rowProduct.setName(rSet.getString("pname"));
                rowProduct.setCategoy(rSet.getString("category"));
                rowProduct.setPrice(rSet.getDouble("price"));
                rowProduct.setImage(rSet.getString("image"));
                products.add(rowProduct);
            }
        } catch (Exception e) {
            System.out.println("Error in getAllProducts: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    // Fetch cart products
    public List<Card> getCardProducts(ArrayList<Card> cardList) {
        List<Card> products = new ArrayList<>();
        try {
            if (cardList != null && !cardList.isEmpty()) {
                for (Card itemCard : cardList) {
                    query = "SELECT * FROM product WHERE id = ?";
                    pt = this.connection.prepareStatement(query);
                    pt.setInt(1, itemCard.getId());
                    rSet = pt.executeQuery();

                    if (rSet.next()) {
                        Card row = new Card();
                        row.setId(rSet.getInt("id"));
                        row.setName(rSet.getString("pname"));
                        row.setCategoy(rSet.getString("category"));
                        row.setPrice(rSet.getDouble("price"));
                        row.setImage(rSet.getString("image"));
                        row.setQuan(itemCard.getQuan());
                        products.add(row);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error in getCardProducts: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    // Calculate total cart price
    public double getTotalCardPrice(ArrayList<Card> card_list) {
        double sum = 0;
        try {
            if (card_list != null && !card_list.isEmpty()) {
                for (Card iCard : card_list) {
                    query = "SELECT price FROM product WHERE id = ?";
                    pt = this.connection.prepareStatement(query);
                    pt.setInt(1, iCard.getId());
                    rSet = pt.executeQuery();
                    if (rSet.next()) {
                        sum += rSet.getDouble("price") * iCard.getQuan();
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error in getTotalCardPrice: " + e.getMessage());
            e.printStackTrace();
        }
        return sum;
    }

    // Fetch single product
    public Product getSingleProduct(int id) {
        Product product = null;
        try {
            query = "SELECT * FROM product WHERE id = ?";
            pt = this.connection.prepareStatement(query);
            pt.setInt(1, id);
            rSet = pt.executeQuery();

            if (rSet.next()) {
                product = new Product();
                product.setId(rSet.getInt("id"));
                product.setName(rSet.getString("pname"));
                product.setCategoy(rSet.getString("category"));
                product.setPrice(rSet.getDouble("price"));
                product.setImage(rSet.getString("image"));
            }
        } catch (Exception e) {
            System.out.println("Error in getSingleProduct: " + e.getMessage());
            e.printStackTrace();
        }
        return product;
    }
}
