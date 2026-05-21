package com.urbanwear.entity;

public class Product {

    private int productId;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private String categoryName;
    private double discount;
    private int stock;
    private String sizes;
    private String imageUrl;

    public Product() {
    }

    public Product(int productId,
                   String name,
                   String description,
                   double price,
                   int categoryId,
                   String categoryName,
                   double discount,
                   int stock,
                   String sizes,
                   String imageUrl) {

        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.discount = discount;
        this.stock = stock;
        this.sizes = sizes;
        this.imageUrl = imageUrl;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {

        if (description == null || description.isBlank()) {
            return "Premium UrbanWear fashion product.";
        }

        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getFinalPrice() {
        return price - (price * discount / 100);
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {

        if (categoryName == null || categoryName.isBlank()) {
            return "Fashion";
        }

        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getSizes() {

        if (sizes == null || sizes.isBlank()) {
            return "S,M,L,XL";
        }

        return sizes;
    }

    public void setSizes(String sizes) {
        this.sizes = sizes;
    }

    public String getImageUrl() {

        if (imageUrl == null || imageUrl.isBlank()) {
            return "static/images/UrbanWear.png";
        }

        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}