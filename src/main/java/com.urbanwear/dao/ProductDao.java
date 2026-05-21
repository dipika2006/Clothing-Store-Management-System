package com.urbanwear.dao;

import com.urbanwear.entity.Product;

import java.util.List;

public interface ProductDao {

    List<Product> getAllProducts();

    Product getProductById(int productId);

    List<Product> getFilteredProducts(String search,
                                      String category,
                                      String price,
                                      String sort);

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean deleteProduct(int productId);
}