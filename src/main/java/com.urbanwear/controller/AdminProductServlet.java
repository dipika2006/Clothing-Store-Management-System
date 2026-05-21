package com.urbanwear.controller;

import com.urbanwear.dao.CategoryDao;
import com.urbanwear.dao.CategoryDaoImpl;
import com.urbanwear.dao.ProductDao;
import com.urbanwear.dao.ProductDaoImpl;
import com.urbanwear.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet({"/admin/product", "/admin/products"})
@MultipartConfig
public class AdminProductServlet extends HttpServlet {

    private final ProductDao productDao = new ProductDaoImpl();
    private final CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isBlank()) {
                int productId = Integer.parseInt(idParam);
                productDao.deleteProduct(productId);
            }

            response.sendRedirect(request.getContextPath() + "/admin/products");
            return;
        }

        if ("edit".equals(action)) {
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isBlank()) {
                int productId = Integer.parseInt(idParam);
                Product product = productDao.getProductById(productId);
                request.setAttribute("product", product);
            }
        }

        request.setAttribute("products", productDao.getAllProducts());
        request.setAttribute("categories", categoryDao.getAllCategories());

        request.getRequestDispatcher("/WEB-INF/views/product-add-edit.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String productIdParam = request.getParameter("productId");

        Product product = new Product();

        if (productIdParam != null && !productIdParam.isBlank()) {
            product.setProductId(Integer.parseInt(productIdParam));
        }

        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setDiscount(Double.parseDouble(request.getParameter("discount")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setSizes(request.getParameter("sizes"));

        Part imagePart = request.getPart("imageFile");
        String imageFileName = imagePart != null ? imagePart.getSubmittedFileName() : null;

        if (imageFileName != null && !imageFileName.isBlank()) {

            String imagePath = "static/images/products/" + imageFileName;

            String uploadPath = getServletContext().getRealPath("")
                    + File.separator
                    + imagePath;

            File uploadDir = new File(uploadPath).getParentFile();

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            imagePart.write(uploadPath);
            product.setImageUrl(imagePath);

        } else if (product.getProductId() > 0) {

            Product oldProduct = productDao.getProductById(product.getProductId());

            if (oldProduct != null) {
                product.setImageUrl(oldProduct.getImageUrl());
            }

        } else {
            product.setImageUrl("static/images/UrbanWear.png");
        }

        boolean success;

        if (product.getProductId() > 0) {
            success = productDao.updateProduct(product);
        } else {
            success = productDao.addProduct(product);
        }

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } else {
            request.setAttribute("error", "Failed to save product.");
            request.setAttribute("product", product);
            request.setAttribute("products", productDao.getAllProducts());
            request.setAttribute("categories", categoryDao.getAllCategories());

            request.getRequestDispatcher("/WEB-INF/views/product-add-edit.jsp")
                    .forward(request, response);
        }
    }
}