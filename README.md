# 👕 UrbanWear – Clothing Store Management System

## 📌 Project Overview

UrbanWear is a web-based Clothing Store Management System developed using Java (J2EE), JSP, Servlets, MySQL, HTML, CSS, and JavaScript following the MVC (Model-View-Controller) architecture.

The system allows customers to browse fashion products, add items to cart, place orders, and manage their profiles. Administrators can manage products, orders, users, dashboard analytics, and invoices through an admin panel.

---

# 🎯 Objectives

- Develop a dynamic full-stack web application using Java technologies
- Implement MVC architecture for better maintainability
- Apply authentication and role-based authorization
- Create a responsive and user-friendly UI using custom CSS
- Integrate MySQL database with normalized tables
- Practice object-oriented programming concepts

---

# 👥 Target Users

## 👤 Customers
- Register and login
- Browse products
- View product details
- Add items to cart
- Place orders
- View order history
- Manage profile

## 🛠️ Administrators
- Manage products
- Manage customer orders
- Update order status
- Generate reports and invoices
- Monitor dashboard statistics

## 👀 Visitors
- Browse products
- Search products
- Register new account

---

# ⚙️ Technologies Used

| Technology | Purpose |
|------------|----------|
| Java (J2EE) | Backend development |
| JSP & Servlets | Dynamic web application |
| MySQL | Database management |
| HTML5 | Page structure |
| CSS3 | Styling and responsive design |
| JavaScript | UI interaction |
| Apache Tomcat 10 | Application server |
| Maven | Dependency management |
| Git & GitHub | Version control |

---

# 🧩 Main Features

## 🔐 Authentication & Authorization
- User Registration
- User Login
- Logout
- Session Handling
- Role-based Access Control
- Authentication Filter
- Admin Filter

## 🛍️ Customer Features
- Product Listing
- Product Details
- Search & Filter
- Shopping Cart
- Checkout System
- Order History
- Profile Management

## 🛠️ Admin Features
- Dashboard Analytics
- Product CRUD Operations
- Order Management
- Invoice Generation
- Sales Report
- Customer Feedback Management

## 🎨 UI Features
- Fully Responsive Design
- Custom CSS (No Bootstrap)
- Modern Dashboard
- Professional UI/UX
- Mobile Friendly Layout

---

# 🗄️ Database Tables

The project uses the following normalized database tables:

- Users
- Categories
- Products
- Orders
- OrderItems
- Feedbacks

---

# 🧱 MVC Architecture

The project follows the MVC architecture:

## 📦 Model
Contains Entity classes and DAO classes.

Examples:
- User.java
- Product.java
- Order.java
- Category.java

## 🎨 View
Contains JSP pages inside `WEB-INF/views`.

Examples:
- home.jsp
- products.jsp
- cart.jsp
- dashboard.jsp

## 🎮 Controller
Contains Servlets that handle HTTP requests.

Examples:
- LoginServlet
- ProductServlet
- CartServlet
- AdminProductServlet

---

# 🔑 Login Credentials

## 👤 Admin Login

| Role | Email | Password |
|------|--------|-----------|
| Admin | admin@urbanwear.com | admin123 |

### Admin Features
- Dashboard Access
- Manage Products
- Manage Orders
- Generate Invoice & Reports
- View Feedbacks
- Update Order Status

---

## 🛍️ User Login

| Role | Email | Password |
|------|--------|-----------|
| User | user@urbanwear.com | user123 |

### User Features
- Browse Products
- Add To Cart
- Checkout
- View Orders
- Manage Profile

---

## 📝 Register New Account

New users can create an account from:

```text
/register

---

# 📁 Project Structure

```text
UrbanWear/
│
├── sql/
│   └── urbanwear.sql
│
├── src/main/java/com/urbanwear/
│   ├── controller/
│   ├── controller/filter/
│   ├── dao/
│   ├── entity/
│   ├── service/
│   └── utils/
│
├── src/main/webapp/
│   ├── static/
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   │
│   ├── WEB-INF/
│   │   ├── templates/
│   │   └── views/
│   │
│   └── web.xml
│
├── pom.xml
└── README.md