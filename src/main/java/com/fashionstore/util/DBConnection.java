package com.fashionstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Database URL
    private static final String URL =
            "jdbc:mysql://localhost:3306/fashion_store";

    // Database Username
    private static final String USERNAME = "root";

    // Database Password
    private static final String PASSWORD = "Mithun@123";

    // Connection Method
    public static Connection getConnection() {

        Connection connection = null;

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create Connection
            connection = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

            System.out.println("Database Connected Successfully");

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL JDBC Driver Not Found");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }

        return connection;
    }
}