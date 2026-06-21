package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Cart;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
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

        request.setAttribute(
                "cartList",
                cartList);

        request.getRequestDispatcher(
                "/WEB-INF/views/cart.jsp")
                .forward(request, response);
    }
}