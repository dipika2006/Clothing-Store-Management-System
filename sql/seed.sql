USE urbanwear;

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM feedbacks;
DELETE FROM orderitems;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM categories;
DELETE FROM users;

ALTER TABLE users AUTO_INCREMENT = 1;
ALTER TABLE categories AUTO_INCREMENT = 1;
ALTER TABLE products AUTO_INCREMENT = 1;
ALTER TABLE orders AUTO_INCREMENT = 1;
ALTER TABLE orderitems AUTO_INCREMENT = 1;
ALTER TABLE feedbacks AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO users
(name, email, password, phone, address, profile_image, role)
VALUES
    ('Admin','admin@urbanwear.com',SHA2('admin123',256),'9800000000','Pokhara, Nepal','static/images/users/default-user.png','admin'),
    ('Dipika','user@urbanwear.com',SHA2('user123',256),'9811111111','Baglung, Nepal','static/images/users/default-user.png','customer');

INSERT INTO categories (category_name)
VALUES
    ('Men'),
    ('Women'),
    ('Kids'),
    ('Unisex');

INSERT INTO products
(name, description, price, category_id, discount, stock, sizes, image_url)
VALUES

    ('Men Graphic T-Shirt',
     'Premium oversized black graphic t-shirt inspired by modern streetwear fashion. It is made from soft breathable cotton fabric with a relaxed fit, stylish graphic print, durable stitching, and comfortable finishing. Perfect for daily casual wear, college outfits, and urban fashion styling.',
     1500,1,10,20,'S,M,L,XL','static/images/men/men1.png'),

    ('Men Denim Jeans',
     'Modern slim-fit blue denim jeans designed with stretchable premium denim material. The jeans provide comfort, flexibility, and durability while maintaining a clean stylish look. Suitable for casual outings, streetwear outfits, and everyday urban styling.',
     2500,1,5,15,'30,32,34,36','static/images/men/men2.png'),

    ('Men Black Jacket',
     'Stylish black winter jacket made with warm inner lining and premium outer fabric. It provides comfort during cold weather while keeping a modern fashionable appearance. Ideal for winter layering, casual travel, and smart urban outfits.',
     4000,1,15,10,'M,L,XL','static/images/men/men3.png'),

    ('Men Hoodie',
     'Comfortable oversized hoodie crafted from soft fleece fabric with a relaxed and cozy fit. It offers warmth, comfort, and a clean streetwear look. Perfect for casual wear, winter fashion, and daily outdoor styling.',
     3000,1,0,12,'M,L,XL','static/images/men/men4.png'),

    ('Men Casual Shirt',
     'Premium casual shirt designed with lightweight breathable fabric and a neat modern fit. It gives a smart yet relaxed appearance, making it suitable for college, office casual days, and everyday fashionable styling.',
     1990,1,8,18,'M,L,XL','static/images/men/men5.png'),

    ('Men Casual Shorts',
     'Relaxed fit casual shorts made with durable and breathable cotton fabric. Designed for comfort and easy movement, these shorts are suitable for summer wear, home comfort, outdoor walks, and casual everyday fashion.',
     1849,1,5,20,'30,32,34','static/images/men/men6.png'),

    ('Men Grey Sweater',
     'Warm knitted grey sweater with a soft texture and elegant winter look. It provides comfortable warmth without feeling heavy and pairs well with jeans, trousers, and jackets for a clean seasonal outfit.',
     2200,1,10,14,'M,L,XL','static/images/men/men7.png'),

    ('Men Formal Outfit',
     'Modern formal outfit designed for a polished and professional appearance. It features comfortable fabric, neat fitting, and premium finishing suitable for office wear, presentations, meetings, and formal occasions.',
     2100,1,5,16,'M,L,XL','static/images/men/men8.png'),

    ('Men Black Cargo Pants',
     'Trendy black cargo pants inspired by streetwear fashion. Designed with utility pockets, comfortable fitting, and durable fabric, these pants are perfect for casual styling, travel outfits, and modern urban looks.',
     2199,1,12,11,'30,32,34,36','static/images/men/men9.png'),

    ('Men Printed Long Shirt',
     'Stylish printed long shirt crafted using lightweight breathable material. It has a relaxed fit and modern printed design that gives a fashionable streetwear appearance suitable for casual and creative outfits.',
     1200,1,0,25,'M,L,XL','static/images/men/men10.png'),

    ('Women Bodycon Dress',
     'Elegant bodycon dress designed with premium stretchable fabric that provides a stylish and comfortable fit. The dress highlights a modern silhouette and is suitable for parties, events, evening outings, and fashionable occasions.',
     3000,2,10,20,'S,M,L','static/images/women/women1.png'),

    ('Women Wrap Top',
     'Fashionable wrap top with a stylish striped design and soft lightweight fabric. It gives a feminine and modern look while remaining comfortable for daily wear, casual meetings, and smart fashion styling.',
     1500,2,5,25,'S,M,L','static/images/women/women2.png'),

    ('Women Black Dress',
     'Luxury black dress crafted with premium fabric and elegant finishing. The timeless design makes it suitable for formal gatherings, evening parties, dinner events, and stylish modern fashion looks.',
     3500,2,15,10,'S,M,L','static/images/women/women3.png'),

    ('Women Formal Pants',
     'Premium wide-leg formal pants designed with classy office-ready styling. They offer a comfortable fit, smooth fabric, and elegant appearance suitable for work, business meetings, presentations, and smart casual outfits.',
     5000,2,20,8,'28,30,32,34','static/images/women/women4.png'),

    ('Women Jacket Outfit',
     'Stylish women jacket outfit with layered fashion design and premium comfort. It provides a modern seasonal look and is suitable for casual winter styling, outings, and fashionable everyday wear.',
     2200,2,8,14,'S,M,L','static/images/women/women5.png'),

    ('Women Saree',
     'Beautiful traditional saree designed with elegant patterns and comfortable lightweight fabric. It combines cultural style with modern grace, making it suitable for festivals, family events, and special occasions.',
     1700,2,5,18,'Free Size','static/images/women/women6.png'),

    ('Women Green Long Dress',
     'Graceful green long dress with flowing design and soft premium fabric. It provides an elegant feminine look and is perfect for parties, celebrations, photoshoots, and formal events.',
     2600,2,10,12,'S,M,L','static/images/women/women7.png'),

    ('Women Designer Top',
     'Modern designer top featuring stylish patterns, breathable fabric, and a comfortable fit. It is suitable for everyday fashion, casual outings, college wear, and smart urban styling.',
     2400,2,8,15,'S,M,L','static/images/women/women8.png'),

    ('Women Beige Blazer',
     'Elegant beige blazer designed for professional and smart casual outfits. It features premium tailoring, soft fabric, and a sophisticated look suitable for office wear, meetings, and formal styling.',
     1600,2,5,20,'S,M,L','static/images/women/women9.png'),

    ('Women High-Waist Shorts',
     'Premium high-waist shorts with trendy modern cut and comfortable fitting. Made with soft fabric, these shorts are suitable for summer styling, casual outings, vacations, and everyday fashion looks.',
     4200,2,15,9,'S,M,L','static/images/women/women10.png'),

    ('Kids Graphic T-Shirt',
     'Cute kids graphic t-shirt made from soft breathable cotton fabric. It features a colorful modern print, comfortable fitting, and skin-friendly texture suitable for school, playtime, and daily casual wear.',
     800,3,5,30,'2Y,4Y,6Y,8Y','static/images/kids/kids1.png'),

    ('Kids Printed Shorts',
     'Comfortable printed shorts designed for active kids. Made with lightweight durable fabric, these shorts allow easy movement and are suitable for playing, summer wear, and everyday comfort.',
     2000,3,12,10,'2Y,4Y,6Y,8Y','static/images/kids/kids2.png'),

    ('Kids Denim Dress',
     'Stylish denim dress for kids featuring adorable modern design and soft comfortable fabric. It gives a cute fashionable look while allowing easy movement for casual days and outings.',
     1800,3,8,12,'2Y,4Y,6Y,8Y','static/images/kids/kids3.png'),

    ('Kids Puffer Jacket',
     'Warm kids puffer jacket designed for winter comfort and protection. It features insulated material, soft lining, and stylish appearance suitable for cold weather, travel, and outdoor activities.',
     1600,3,5,15,'2Y,4Y,6Y,8Y','static/images/kids/kids4.png'),

    ('Kids Animal Hoodie',
     'Adorable animal-themed hoodie made with soft fleece fabric. It provides warmth, comfort, and a playful design that kids will love for winter wear, casual outings, and daily comfort.',
     2200,3,10,9,'2Y,4Y,6Y,8Y','static/images/kids/kids5.png'),

    ('Kids Denim Pants',
     'Comfortable kids denim pants made with soft stretchable fabric. Designed for easy movement and durability, these pants are perfect for casual wear, playtime, and everyday styling.',
     900,3,0,25,'2Y,4Y,6Y,8Y','static/images/kids/kids6.png'),

    ('Kids Pink Sweater',
     'Soft pink winter sweater with adorable knitted texture and warm comfortable feel. It is designed for stylish seasonal wear and keeps children cozy during cold weather.',
     1400,3,5,18,'2Y,4Y,6Y,8Y','static/images/kids/kids7.png'),

    ('Kids Green Shirt',
     'Lightweight green shirt made with breathable soft fabric and simple stylish design. It is suitable for school events, casual outings, family gatherings, and everyday comfort.',
     500,3,0,40,'2Y,4Y,6Y,8Y','static/images/kids/kids8.png'),

    ('Kids Jacket Set',
     'Stylish kids jacket set crafted with premium winter material. It provides warmth, comfort, and a matching fashionable look suitable for winter outings and special occasions.',
     2500,3,10,20,'2Y,4Y,6Y,8Y','static/images/kids/kids9.png'),

    ('Kids Pink Outfit Set',
     'Cute pink matching outfit set made from soft premium fabric. It offers comfort, style, and an adorable look suitable for daily wear, family events, and casual outings.',
     3000,3,12,10,'2Y,4Y,6Y,8Y','static/images/kids/kids10.png'),

    ('Unisex Black Hoodie',
     'Premium oversized black hoodie inspired by modern streetwear fashion. Made with soft fleece fabric, it offers warmth, comfort, relaxed fitting, and a clean minimal look suitable for everyone.',
     3000,4,10,21,'S,M,L,XL','static/images/unisex/unisex1.png'),

    ('Unisex Washed T-Shirt',
     'Vintage washed oversized t-shirt crafted using premium breathable cotton fabric. It features a relaxed streetwear-inspired look, soft texture, and comfortable fitting for daily casual styling.',
     1400,4,5,24,'S,M,L,XL','static/images/unisex/unisex2.png'),

    ('Unisex Graphic Jacket',
     'Premium graphic jacket featuring bold modern streetwear design and durable stitching. It offers warm comfort, stylish appearance, and versatile pairing for urban fashion outfits.',
     3499,4,15,10,'M,L,XL','static/images/unisex/unisex3.png'),

    ('Unisex Knit Sweater',
     'Warm knitted sweater made with premium soft winter fabric. It features elegant texture, relaxed fit, and comfortable warmth suitable for both men and women during cold seasons.',
     1899,4,8,18,'M,L,XL','static/images/unisex/unisex4.png'),

    ('Unisex Red Track Pants',
     'Comfortable red track pants designed for sports and casual fashion. Made with breathable lightweight fabric, they provide easy movement, flexible comfort, and modern sporty styling.',
     1250,4,0,40,'S,M,L,XL','static/images/unisex/unisex5.png'),

    ('Unisex Cap',
     'Modern adjustable fashion cap with premium stitching and minimalist streetwear design. It is lightweight, comfortable, and suitable for casual outfits, travel, and outdoor styling.',
     899,4,10,15,'Free Size','static/images/unisex/unisex6.png'),

    ('Unisex Denim Shorts',
     'Trendy denim shorts featuring relaxed fit and breathable material. Designed for casual comfort, these shorts are suitable for summer wear, streetwear outfits, and everyday styling.',
     1250,4,5,20,'30,32,34','static/images/unisex/unisex7.png'),

    ('Unisex Formal Blazer',
     'Elegant formal blazer crafted with premium tailoring and sophisticated fitting. It provides a polished modern look suitable for formal events, office wear, and smart styling.',
     3499,4,15,10,'M,L,XL','static/images/unisex/unisex8.png'),

    ('Unisex Jogger Pants',
     'Comfortable modern jogger pants featuring sporty design, soft fabric, and stylish urban appearance. Perfect for casual wear, travel, workouts, and relaxed daily fashion.',
     1799,4,8,18,'S,M,L,XL','static/images/unisex/unisex9.png'),

    ('Unisex Printed Sweatshirt',
     'Premium oversized printed sweatshirt made with soft winter fabric and trendy graphic design. It provides warmth, comfort, and stylish streetwear appearance for everyday fashion.',
     2549,4,10,12,'S,M,L,XL','static/images/unisex/unisex10.png');

INSERT INTO orders
(user_id, total_amount, status, return_reason, returned_at)
VALUES
    (2, 2700.00, 'Delivered', NULL, NULL),
    (2, 3500.00, 'Pending', NULL, NULL),
    (2, 1799.00, 'Cancelled', NULL, NULL),
    (2, 3000.00, 'Returned', 'Size did not fit properly.', NOW());

INSERT INTO orderitems
(order_id, product_id, quantity, price, size, color)
VALUES
    (1, 1, 2, 1350.00, 'M', 'Default'),
    (2, 13, 1, 2975.00, 'S', 'Default'),
    (3, 39, 1, 1655.08, 'M', 'Default'),
    (4, 31, 1, 2700.00, 'L', 'Default');

INSERT INTO feedbacks
(user_id, name, email, message, rating)
VALUES
    (2, 'Dipika', 'user@urbanwear.com', 'UrbanWear has a clean shopping experience and the products look modern, stylish, and easy to browse.', 5),
    (2, 'Dipika', 'user@urbanwear.com', 'The checkout process was simple and the product pages were clear and attractive.', 4);