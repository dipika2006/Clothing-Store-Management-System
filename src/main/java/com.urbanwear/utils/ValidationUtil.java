package com.urbanwear.utils;

import java.util.regex.Pattern;

public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile(
                    "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"
            );

    private static final Pattern PHONE_PATTERN =
            Pattern.compile(
                    "^[0-9]{10}$"
            );

    public static boolean isNullOrEmpty(String value) {

        return value == null
                || value.trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {

        if (isNullOrEmpty(email)) {
            return false;
        }

        return EMAIL_PATTERN
                .matcher(email)
                .matches();
    }

    public static boolean isValidPhone(String phone) {

        if (isNullOrEmpty(phone)) {
            return false;
        }

        return PHONE_PATTERN
                .matcher(phone)
                .matches();
    }

    public static boolean isPositiveNumber(double value) {

        return value >= 0;
    }

    public static boolean isPositiveInteger(int value) {

        return value >= 0;
    }

    public static boolean isStrongPassword(String password) {

        if (isNullOrEmpty(password)) {
            return false;
        }

        return password.length() >= 4;
    }
}