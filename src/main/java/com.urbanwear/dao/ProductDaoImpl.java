package com.urbanwear.dao;

import com.urbanwear.entity.Product;
import com.urbanwear.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    @Override
    public List<Product> getAllProducts() {

        String sql =
                "SELECT p.*, c.category_name " +
                        "FROM products p " +
                        "LEFT JOIN categories c ON p.category_id = c.category_id " +
                        "ORDER BY p.product_id DESC";

        return fetchProducts(sql);
    }

    @Override
    public Product getProductById(int productId) {

        String sql =
                "SELECT p.*, c.category_name " +
                        "FROM products p " +
                        "LEFT JOIN categories c ON p.category_id = c.category_id " +
                        "WHERE p.product_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return mapProduct(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Product> getFilteredProducts(String search,
                                             String category,
                                             String price,
                                             String sort) {

        List<Product> products = new ArrayList<>();
        List<Object> params = new ArrayList<>();

        StringBuilder sql =
                new StringBuilder(
                        "SELECT p.*, c.category_name " +
                                "FROM products p " +
                                "LEFT JOIN categories c ON p.category_id = c.category_id " +
                                "WHERE 1=1 "
                );

        if (search != null && !search.isBlank()) {
            sql.append("AND p.name LIKE ? ");
            params.add("%" + search + "%");
        }

        if (category != null && !category.isBlank()) {

            if (category.matches("\\d+")) {
                sql.append("AND p.category_id = ? ");
                params.add(Integer.parseInt(category));
            } else {
                sql.append("AND c.category_name = ? ");
                params.add(category);
            }
        }

        if (price != null && !price.isBlank()) {

            switch (price) {

                case "below-1000":
                    sql.append("AND p.price < ? ");
                    params.add(1000);
                    break;

                case "1000-3000":
                    sql.append("AND p.price BETWEEN ? AND ? ");
                    params.add(1000);
                    params.add(3000);
                    break;

                case "above-3000":
                    sql.append("AND p.price > ? ");
                    params.add(3000);
                    break;

                default:
                    break;
            }
        }

        if ("low".equalsIgnoreCase(sort)
                || "low-high".equalsIgnoreCase(sort)) {

            sql.append("ORDER BY p.price ASC");

        } else if ("high".equalsIgnoreCase(sort)
                || "high-low".equalsIgnoreCase(sort)) {

            sql.append("ORDER BY p.price DESC");

        } else {

            sql.append("ORDER BY p.product_id DESC");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    products.add(mapProduct(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public boolean addProduct(Product product) {

        String sql =
                "INSERT INTO products " +
                        "(name, description, price, category_id, discount, stock, sizes, image_url) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getCategoryId());
            ps.setDouble(5, product.getDiscount());
            ps.setInt(6, product.getStock());
            ps.setString(7, product.getSizes());
            ps.setString(8, product.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateProduct(Product product) {

        String sql =
                "UPDATE products SET " +
                        "name = ?, " +
                        "description = ?, " +
                        "price = ?, " +
                        "category_id = ?, " +
                        "discount = ?, " +
                        "stock = ?, " +
                        "sizes = ?, " +
                        "image_url = ? " +
                        "WHERE product_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getCategoryId());
            ps.setDouble(5, product.getDiscount());
            ps.setInt(6, product.getStock());
            ps.setString(7, product.getSizes());
            ps.setString(8, product.getImageUrl());
            ps.setInt(9, product.getProductId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteProduct(int productId) {

        String sql =
                "DELETE FROM products WHERE product_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(1, productId);

            return ps.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println(
                    "Cannot delete product because it is used in orders."
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private List<Product> fetchProducts(String sql) {

        List<Product> products = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products.add(mapProduct(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    private Product mapProduct(ResultSet rs)
            throws SQLException {

        Product p = new Product();

        p.setProductId(rs.getInt("product_id"));
        p.setName(rs.getString("name"));
        p.setPrice(rs.getDouble("price"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setDiscount(rs.getDouble("discount"));
        p.setStock(rs.getInt("stock"));
        p.setImageUrl(rs.getString("image_url"));
        p.setCategoryName(rs.getString("category_name"));

        if (hasColumn(rs, "description")) {
            p.setDescription(rs.getString("description"));
        } else {
            p.setDescription(
                    "Premium UrbanWear fashion product."
            );
        }

        if (hasColumn(rs, "sizes")) {
            p.setSizes(rs.getString("sizes"));
        } else {
            p.setSizes("S,M,L,XL");
        }

        return p;
    }

    private boolean hasColumn(ResultSet rs,
                              String columnName)
            throws SQLException {

        ResultSetMetaData meta =
                rs.getMetaData();

        for (int i = 1; i <= meta.getColumnCount(); i++) {

            if (columnName.equalsIgnoreCase(
                    meta.getColumnName(i)
            )) {
                return true;
            }
        }

        return false;
    }
}