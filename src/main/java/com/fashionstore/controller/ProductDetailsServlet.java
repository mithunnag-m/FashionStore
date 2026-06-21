package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product-details")
public class ProductDetailsServlet
extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductDAO productDAO;

    @Override
    public void init(){

        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException, IOException {

        int productId =
        Integer.parseInt(
        request.getParameter("id"));

        Product product =
        productDAO
        .getProductById(productId);

        request.setAttribute(
        "product", product);

        request.getRequestDispatcher(
        "/WEB-INF/views/product-details.jsp")
        .forward(request, response);
    }
}