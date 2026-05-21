package com.urbanwear.dao;

import com.urbanwear.entity.Feedback;
import java.util.List;

public interface FeedbackDao {

    boolean addFeedback(Feedback feedback);

    List<Feedback> getAllFeedbacks();
}