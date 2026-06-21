package com.fashionstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fashionstore.model.User;
import com.fashionstore.util.DBConnection;

public class UserDAO {

    // Register User
    public boolean registerUser(User user) {

        boolean isRegistered = false;

        String query = "INSERT INTO users "
                + "(full_name, email, phone, password, address) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getAddress());

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                isRegistered = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isRegistered;
    }

    // Login User
    public User loginUser(String email, String password) {

        User user = null;

        String query = "SELECT * FROM users "
                + "WHERE email = ? AND password = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                user = new User();

                user.setUserId(resultSet.getInt("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setPassword(resultSet.getString("password"));
                user.setAddress(resultSet.getString("address"));
                user.setCreatedAt(resultSet.getTimestamp("created_at"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}