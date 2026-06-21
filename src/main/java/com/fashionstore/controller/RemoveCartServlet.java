package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.CartDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove-cart")
public class RemoveCartServlet extends HttpServlet {

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

        int cartId =
                Integer.parseInt(
                request.getParameter("cartId"));

        CartDAO cartDAO =
                new CartDAO();

        cartDAO.removeCartItem(cartId);

        response.sendRedirect("cart");
    }
}