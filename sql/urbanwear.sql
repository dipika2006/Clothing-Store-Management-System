DROP DATABASE IF EXISTS urbanwear;
CREATE DATABASE urbanwear;
USE urbanwear;

CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       phone VARCHAR(20),
                       address TEXT,
                       profile_image VARCHAR(255),
                       role VARCHAR(20) NOT NULL DEFAULT 'user',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
                            category_id INT AUTO_INCREMENT PRIMARY KEY,
                            category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(150) NOT NULL,
                          description TEXT NOT NULL,
                          price DECIMAL(10,2) NOT NULL,
                          category_id INT,
                          discount DECIMAL(5,2) DEFAULT 0,
                          stock INT DEFAULT 10,
                          sizes VARCHAR(100),
                          image_url VARCHAR(255),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                          FOREIGN KEY (category_id)
                              REFERENCES categories(category_id)
                              ON DELETE SET NULL
);

CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT NOT NULL,
                        order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        total_amount DECIMAL(10,2) NOT NULL,
                        address TEXT,
                        payment_method VARCHAR(50),
                        status VARCHAR(50) DEFAULT 'Pending',
                        return_reason TEXT,
                        returned_at TIMESTAMP NULL,

                        FOREIGN KEY (user_id)
                            REFERENCES users(user_id)
                            ON DELETE CASCADE
);

CREATE TABLE orderitems (
                            order_item_id INT AUTO_INCREMENT PRIMARY KEY,
                            order_id INT NOT NULL,
                            product_id INT NOT NULL,
                            quantity INT NOT NULL,
                            price DECIMAL(10,2) NOT NULL,
                            size VARCHAR(50),
                            color VARCHAR(50),

                            FOREIGN KEY (order_id)
                                REFERENCES orders(order_id)
                                ON DELETE CASCADE,

                            FOREIGN KEY (product_id)
                                REFERENCES products(product_id)
                                ON DELETE CASCADE
);

CREATE TABLE feedbacks (
                           feedback_id INT AUTO_INCREMENT PRIMARY KEY,
                           user_id INT,
                           name VARCHAR(100) NOT NULL,
                           email VARCHAR(120) NOT NULL,
                           message TEXT NOT NULL,
                           rating INT DEFAULT 5,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                           FOREIGN KEY (user_id)
                               REFERENCES users(user_id)
                               ON DELETE SET NULL
);