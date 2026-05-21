package com.urbanwear.dao;

import com.urbanwear.entity.User;

public interface UserDao {

    User getUserByEmail(String email);

    boolean emailExists(String email);

    boolean registerUser(User user);

    int countUsers();

    User getUserById(int userId);

    boolean updateProfile(User user);
}