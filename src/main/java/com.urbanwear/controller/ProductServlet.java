package com.urbanwear.controller;

import com.urbanwear.dao.CategoryDao;
import com.urbanwear.dao.CategoryDaoImpl;
import com.urbanwear.dao.ProductDao;
import com.urbanwear.dao.ProductDaoImpl;
import com.urbanwear.entity.Category;
import com.urbanwear.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private final ProductDao productDao = new ProductDaoImpl();
    private final CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");

        if (search == null || search.isBlank()) {
            search = request.getParameter("keyword");
        }

        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String sort = request.getParameter("sort");

        List<Product> products =
                productDao.getFilteredProducts(search, category, price, sort);

        List<Category> categories =
                categoryDao.getAllCategories();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        request.setAttribute("search", search);
        request.setAttribute("selectedCategory", category);
        request.setAttribute("selectedPrice", price);
        request.setAttribute("selectedSort", sort);

        request.getRequestDispatcher("/WEB-INF/views/product-list.jsp")
                .forward(request, response);
    }
}