package com.urbanwear.entity;

public class Order {

    private int orderId;
    private int userId;
    private String orderDate;
    private double totalAmount;
    private String status;
    private String address;
    private String paymentMethod;
    private String returnReason;
    private String returnedAt;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status == null ? "Pending" : status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address == null ? "" : address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentMethod() {
        return paymentMethod == null ? "" : paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getReturnReason() {
        return returnReason == null ? "" : returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    public String getReturnedAt() {
        return returnedAt == null ? "" : returnedAt;
    }

    public void setReturnedAt(String returnedAt) {
        this.returnedAt = returnedAt;
    }
}