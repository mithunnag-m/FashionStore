package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class HomeServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDAO =
                new ProductDAO();

        List<Product> products =
                productDAO.getAllProducts();

        request.setAttribute(
                "products",
                products);

        request.getRequestDispatcher(
                "/WEB-INF/views/home.jsp")
                .forward(request, response);
    }
}