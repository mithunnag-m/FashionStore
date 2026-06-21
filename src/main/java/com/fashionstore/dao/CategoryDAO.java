package com.fashionstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fashionstore.model.Category;
import com.fashionstore.util.DBConnection;

public class CategoryDAO {

    // Get All Categories
    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> categoryList = new ArrayList<>();

        String query = "SELECT * FROM categories";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Category category = new Category();

                category.setCategoryId(
                        resultSet.getInt("category_id"));

                category.setCategoryName(
                        resultSet.getString("category_name"));

                categoryList.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryList;
    }
}