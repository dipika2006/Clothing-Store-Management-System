package com.urbanwear.utils;

import java.security.MessageDigest;

public class PasswordUtil {

    public static String hashPassword(String password) {

        try {

            MessageDigest md =
                    MessageDigest.getInstance("SHA-256");

            byte[] hashedBytes =
                    md.digest(password.getBytes());

            StringBuilder sb =
                    new StringBuilder();

            for (byte b : hashedBytes) {

                sb.append(
                        String.format("%02x", b)
                );
            }

            return sb.toString();

        } catch (Exception e) {

            e.printStackTrace();

            return password;
        }
    }

    public static boolean verifyPassword(
            String inputPassword,
            String storedPassword
    ) {

        return hashPassword(inputPassword)
                .equals(storedPassword);
    }
}