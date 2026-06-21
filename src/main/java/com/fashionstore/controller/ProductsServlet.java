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

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductDAO productDAO;

    @Override
    public void init() {

        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(
    		HttpServletRequest request,
    		HttpServletResponse response)
    		throws ServletException, IOException {

    		    String category =
    		    request.getParameter("category");

    		    String keyword =
    		    request.getParameter("keyword");

    		    List<Product> products;

    		    if(keyword != null &&
    		       !keyword.isEmpty()){

    		        products =
    		        productDAO.searchProducts(keyword);

    		    }
    		    else if(category != null &&
    		            !category.isEmpty()){

    		        products =
    		        productDAO
    		        .getProductsByCategory(category);

    		    }
    		    else{

    		        products =
    		        productDAO.getAllProducts();
    		    }

    		    request.setAttribute(
    		    "products", products);

    		    request.getRequestDispatcher(
    		    "/WEB-INF/views/products.jsp")
    		    .forward(request, response);
    		}
}