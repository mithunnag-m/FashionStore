package com.fashionstore.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Cart;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        if(userId == null){

            response.sendRedirect("login");
            return;
        }

        String address =
                request.getParameter("address");

        String city =
                request.getParameter("city");

        String pincode =
                request.getParameter("pincode");

        String paymentMethod =
                request.getParameter("paymentMethod");

        String fullAddress =
                address + ", " + city + " - " + pincode;

        try {

            CartDAO cartDAO =
                    new CartDAO();

            List<Cart> cartList =
                    cartDAO.getCartItemsByUser(userId);

            ProductDAO productDAO =
                    new ProductDAO();

            for(Cart cart : cartList){

                Product product =
                        productDAO.getProductById(
                                cart.getProductId());

                cart.setProduct(product);
            }

            double total = 0;

            for(Cart cart : cartList){

                total +=
                        cart.getQuantity()
                        * cart.getProduct().getPrice();
            }

            Connection con =
                    DBConnection.getConnection();

            String orderQuery =
                    "INSERT INTO orders(user_id,total_amount,order_status,payment_method,shipping_address) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(
                            orderQuery,
                            PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);
            ps.setDouble(2, total);
            ps.setString(3, "Ordered");
            ps.setString(4, paymentMethod);
            ps.setString(5, fullAddress);

            int rows =
                    ps.executeUpdate();

            if(rows > 0){

                ResultSet rs =
                        ps.getGeneratedKeys();

                int orderId = 0;

                if(rs.next()){

                    orderId =
                            rs.getInt(1);
                }

                String itemQuery =
                        "INSERT INTO order_items(order_id,product_id,quantity,price) VALUES(?,?,?,?)";

                PreparedStatement itemPs =
                        con.prepareStatement(itemQuery);

                for(Cart cart : cartList){

                    itemPs.setInt(1, orderId);
                    itemPs.setInt(2, cart.getProductId());
                    itemPs.setInt(3, cart.getQuantity());

                    double itemTotal =
                            cart.getProduct().getPrice()
                            * cart.getQuantity();

                    itemPs.setDouble(4, itemTotal);

                    itemPs.executeUpdate();
                }

                cartDAO.clearCart(userId);

                response.sendRedirect(
                        "orders?success=1");

            }else{

                response.sendRedirect(
                        "checkout?error=1");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error : " + e.getMessage());
        }
    }
}