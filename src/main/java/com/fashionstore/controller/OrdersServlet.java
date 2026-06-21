package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet
extends HttpServlet {

    protected void doGet(
    HttpServletRequest request,
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

        OrderDAO orderDAO =
        new OrderDAO();

        List<Cart> orderList =
        orderDAO.getOrdersByUser(userId);

        request.setAttribute(
        "orderList", orderList);

        request.getRequestDispatcher(
        "/WEB-INF/views/orders.jsp")
        .forward(request, response);
    }
}