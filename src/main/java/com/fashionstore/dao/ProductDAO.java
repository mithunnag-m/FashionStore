package com.fashionstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class ProductDAO {

    Connection con;

    public ProductDAO() {

        con = DBConnection.getConnection();
    }

    // GET ALL PRODUCTS

    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM products";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setBrand(
                        rs.getString("brand"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setImageUrl(
                        rs.getString("image_url"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }


    // GET PRODUCTS BY CATEGORY

    public List<Product> getProductsByCategory(String category) {

        List<Product> products =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM products WHERE product_name LIKE ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    "%" + category + "%");

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setBrand(
                        rs.getString("brand"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setImageUrl(
                        rs.getString("image_url"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }
    public List<Product> searchProducts(String keyword){

        List<Product> products =
        new ArrayList<>();

        try{

            String query =
            "SELECT * FROM products WHERE product_name LIKE ?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1,
            "%" + keyword + "%");

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()){

                Product product =
                new Product();

                product.setProductId(
                rs.getInt("product_id"));

                product.setProductName(
                rs.getString("product_name"));

                product.setBrand(
                rs.getString("brand"));

                product.setPrice(
                rs.getDouble("price"));

                product.setImageUrl(
                rs.getString("image_url"));

                products.add(product);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return products;
    }
    public Product getProductById(int productId){

        Product product = null;

        try{

            String query =
            "SELECT * FROM products WHERE product_id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, productId);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()){

                product = new Product();

                product.setProductId(
                rs.getInt("product_id"));

                product.setProductName(
                rs.getString("product_name"));

                product.setBrand(
                rs.getString("brand"));

                product.setPrice(
                rs.getDouble("price"));

                product.setImageUrl(
                rs.getString("image_url"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return product;
    }
}