 CREATE TABLE users (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     email VARCHAR(255) NOT NULL UNIQUE,
     password_hash VARCHAR(255) NOT NULL,
     name VARCHAR(255) NOT NULL DEFAULT '',
     role VARCHAR(50) NOT NULL DEFAULT 'customer',
     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );

   CREATE TABLE products (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(255) NOT NULL,
     description TEXT NOT NULL,
     price_cents INT NOT NULL,
     stock_quantity INT NOT NULL DEFAULT 0,
     status VARCHAR(50) NOT NULL DEFAULT 'active',
     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );

   CREATE TABLE orders (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     user_id BIGINT NOT NULL,
     status VARCHAR(50) NOT NULL DEFAULT 'pending',
     total_cents INT NOT NULL DEFAULT 0,
     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

     CONSTRAINT fk_orders_user
       FOREIGN KEY (user_id) REFERENCES users(id)
       ON DELETE RESTRICT
   );

   CREATE TABLE order_items (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     order_id BIGINT NOT NULL,
     product_id BIGINT NOT NULL,
     quantity INT NOT NULL,
     unit_price_cents INT NOT NULL,
     total_price_cents INT NOT NULL,

     CONSTRAINT fk_order_items_order
       FOREIGN KEY (order_id) REFERENCES orders(id)
       ON DELETE CASCADE,

     CONSTRAINT fk_order_items_product
       FOREIGN KEY (product_id) REFERENCES products(id)
       ON DELETE RESTRICT
   );

   CREATE TABLE payments (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     order_id BIGINT NOT NULL,
     status VARCHAR(50) NOT NULL DEFAULT 'pending',
     amount_cents INT NOT NULL,
     provider VARCHAR(100) NOT NULL DEFAULT '',
     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

     CONSTRAINT fk_payments_order
       FOREIGN KEY (order_id) REFERENCES orders(id)
       ON DELETE CASCADE
   );