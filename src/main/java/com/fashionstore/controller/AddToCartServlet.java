package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId =
                Integer.parseInt(
                        request.getParameter(
                                "productId"));

        HttpSession session =
                request.getSession();

        Integer userId =
                (Integer) session.getAttribute(
                        "userId");

        if(userId == null){

            response.sendRedirect("login");

            return;
        }

        Cart cart = new Cart();

        cart.setUserId(userId);

        cart.setProductId(productId);

        cart.setQuantity(1);

        CartDAO cartDAO =
                new CartDAO();

        boolean status =
                cartDAO.addToCart(cart);

        if(status){

            response.sendRedirect("cart");

        }else{

            response.getWriter()
            .println("Add To Cart Failed");
        }
    }
}