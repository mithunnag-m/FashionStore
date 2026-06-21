package com.fashionstore.dao;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.model.Cart;
import com.fashionstore.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.fashionstore.model.Cart;
import com.fashionstore.util.DBConnection;

public class OrderDAO {
	
	public boolean placeOrder(
	        int userId,
	        int productId,
	        int quantity){

	    boolean status = false;

	    try{

	        String query =
	        "INSERT INTO orders(user_id, product_id, quantity) VALUES(?,?,?)";

	        PreparedStatement ps =
	                con.prepareStatement(query);

	        ps.setInt(1, userId);
	        ps.setInt(2, productId);
	        ps.setInt(3, quantity);

	        int rows =
	                ps.executeUpdate();

	        if(rows > 0){

	            status = true;
	        }

	    }catch(Exception e){

	        e.printStackTrace();
	    }

	    return status;
	}

    Connection con;

    public OrderDAO(){

        con = DBConnection.getConnection();
    }

    
    public boolean placeOrder(
    		int userId,
    		List<Cart> cartList){

    		    boolean status = false;

    		    try{

    		        String orderQuery =

    		        "INSERT INTO orders(user_id) VALUES(?)";

    		        PreparedStatement orderPs =
    		        con.prepareStatement(
    		        orderQuery,
    		        Statement.RETURN_GENERATED_KEYS);

    		        orderPs.setInt(1, userId);

    		        int rows =
    		        orderPs.executeUpdate();

    		        if(rows > 0){

    		            ResultSet rs =
    		            orderPs.getGeneratedKeys();

    		            int orderId = 0;

    		            if(rs.next()){

    		                orderId = rs.getInt(1);
    		            }

    		            String itemQuery =

    		            "INSERT INTO order_items" +
    		            "(order_id, product_id, quantity)" +
    		            " VALUES(?,?,?)";

    		            PreparedStatement itemPs =
    		            con.prepareStatement(itemQuery);

    		            for(Cart cart : cartList){

    		                itemPs.setInt(1, orderId);

    		                itemPs.setInt(
    		                2,
    		                cart.getProduct().getProductId());

    		                itemPs.setInt(
    		                3,
    		                cart.getQuantity());

    		                itemPs.executeUpdate();
    		            }

    		            status = true;
    		        }

    		    }catch(Exception e){

    		        e.printStackTrace();
    		    }

    		    return status;
    		} 
          
    public List<Cart> getOrdersByUser(int userId){

        List<Cart> orderList =
        new ArrayList<>();

        try{

            String query =

            		"SELECT p.product_name, " +
            				"p.brand, " +
            				"p.price, " +
            				"p.image_url, " +
            				"oi.quantity, " +
            				"(oi.quantity * p.price) AS total_amount " +

            "FROM orders o " +

            "JOIN order_items oi " +
            "ON o.order_id = oi.order_id " +

            "JOIN products p " +
            "ON oi.product_id = p.product_id " +

            "WHERE o.user_id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()){

                Product product =
                new Product();

                product.setProductName(
                rs.getString("product_name"));

                product.setBrand(
                rs.getString("brand"));

                product.setPrice(
                rs.getDouble("price"));

                product.setImageUrl(
                rs.getString("image_url"));

                Cart cart =
                new Cart();

                cart.setProduct(product);

                cart.setQuantity(
                rs.getInt("quantity"));
                
                cart.setTotalAmount(
                rs.getDouble("total_amount"));

                orderList.add(cart);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return orderList;
    }
}