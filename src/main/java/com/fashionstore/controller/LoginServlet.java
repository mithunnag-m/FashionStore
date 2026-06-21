package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
        "/WEB-INF/views/auth/login.jsp")
        .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        UserDAO userDAO =
                new UserDAO();

        User user =
                userDAO.loginUser(email, password);

        if(user != null){

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "userId",
                    user.getUserId());

            session.setAttribute(
                    "userName",
                    user.getFullName());

            session.setMaxInactiveInterval(
                    30 * 60);

            response.sendRedirect("home");

        }else{

            request.setAttribute(
                    "error",
                    "Invalid Email or Password");

            request.getRequestDispatcher(
            "/WEB-INF/views/auth/login.jsp")
            .forward(request, response);
        }
    }
}