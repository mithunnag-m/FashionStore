package com.fashionstore.dao;
import java.sql.PreparedStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.model.Cart;
import com.fashionstore.util.DBConnection;

public class CartDAO {

    Connection con;

    public CartDAO(){

        con = DBConnection.getConnection();
    }

    public boolean addToCart(Cart cart){

        boolean status = false;

        try{

            String query =
                    "INSERT INTO cart(user_id,product_id,quantity) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, cart.getUserId());
            ps.setInt(2, cart.getProductId());
            ps.setInt(3, cart.getQuantity());

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

    public List<Cart> getCartItemsByUser(int userId){

        List<Cart> cartList =
                new ArrayList<>();

        try{

            String query =
                    "SELECT * FROM cart WHERE user_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Cart cart =
                        new Cart();

                cart.setCartId(
                        rs.getInt("cart_id"));

                cart.setUserId(
                        rs.getInt("user_id"));

                cart.setProductId(
                        rs.getInt("product_id"));

                cart.setQuantity(
                        rs.getInt("quantity"));

                cartList.add(cart);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return cartList;
    }

    public boolean removeCartItem(int cartId){

        boolean status = false;

        try{

            String query =
                    "DELETE FROM cart WHERE cart_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, cartId);

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

    public void clearCart(int userId){

        try{

            String query =
                    "DELETE FROM cart WHERE user_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, userId);

            ps.executeUpdate();

        }catch(Exception e){

            e.printStackTrace();
        }
    }
    public boolean increaseQuantity(int cartId){

        boolean status = false;

        try{

            String query =
            "UPDATE cart SET quantity = quantity + 1 WHERE cart_id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, cartId);

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

    public boolean decreaseQuantity(int cartId){

        boolean status = false;

        try{

            String query =
            "UPDATE cart SET quantity = quantity - 1 WHERE cart_id=? AND quantity > 1";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, cartId);

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
}