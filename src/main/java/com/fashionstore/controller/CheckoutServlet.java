package com.fashionstore.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

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

        request.getRequestDispatcher(
                "/WEB-INF/views/checkout.jsp")
                .forward(request, response);
    }
}