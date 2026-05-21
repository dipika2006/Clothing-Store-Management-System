package com.urbanwear.utils;

import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    public static boolean isLoggedIn(HttpSession session) {

        return session != null
                && session.getAttribute("userId") != null;
    }

    public static boolean isAdmin(HttpSession session) {

        if (session == null) {
            return false;
        }

        String role =
                (String) session.getAttribute("role");

        return role != null
                && role.equalsIgnoreCase("admin");
    }

    public static Integer getLoggedInUserId(HttpSession session) {

        if (session == null) {
            return null;
        }

        return (Integer)
                session.getAttribute("userId");
    }

    public static String getLoggedInUserName(HttpSession session) {

        if (session == null) {
            return null;
        }

        return (String)
                session.getAttribute("userName");
    }

    public static void clearSession(HttpSession session) {

        if (session != null) {
            session.invalidate();
        }
    }
}