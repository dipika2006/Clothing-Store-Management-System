package com.urbanwear.dao;

import com.urbanwear.entity.Feedback;
import com.urbanwear.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDaoImpl implements FeedbackDao {

    @Override
    public boolean addFeedback(Feedback feedback) {

        String sql = "INSERT INTO feedbacks(user_id, name, email, message, rating) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, feedback.getUserId());
            ps.setString(2, feedback.getName());
            ps.setString(3, feedback.getEmail());
            ps.setString(4, feedback.getMessage());
            ps.setInt(5, feedback.getRating());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Feedback> getAllFeedbacks() {

        List<Feedback> feedbacks = new ArrayList<>();

        String sql = "SELECT * FROM feedbacks ORDER BY feedback_id DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Feedback f = new Feedback();

                f.setFeedbackId(rs.getInt("feedback_id"));
                f.setUserId(rs.getInt("user_id"));
                f.setName(rs.getString("name"));
                f.setEmail(rs.getString("email"));
                f.setMessage(rs.getString("message"));
                f.setRating(rs.getInt("rating"));
                f.setCreatedAt(rs.getString("created_at"));

                feedbacks.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbacks;
    }
}