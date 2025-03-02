drop database if exists furniture;
create database if not exists furniture;
use furniture;

create table if not exists suppliers
(
    id            int auto_increment primary key      not null,
    name          varchar(255)                        not null,
    contact_email varchar(255)                        null,
    contact_phone varchar(20)                         null,
    address       text                                null,
    country       varchar(100)                        null,
    website       varchar(255)                        null,
    is_active     tinyint   default 1                 null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    updated_at    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at    timestamp                           null
    );

create table if not exists categories
(
    id         int auto_increment primary key,
    name       varchar(100)                        not null,
    is_active  tinyint   default 1                 null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at timestamp                           null
    );

create table rooms
(
    id         int auto_increment
        primary key,
    name       varchar(100) charset utf8mb3         not null,
    is_active  tinyint(1) default 1                 null,
    created_at timestamp  default CURRENT_TIMESTAMP not null,
    updated_at timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at timestamp                            null
);

create table roles
(
    id          int auto_increment
        primary key,
    name        varchar(50)                         not null,
    description varchar(255) charset utf8mb3        null,
    created_at  timestamp default CURRENT_TIMESTAMP null,
    updated_at  timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at  timestamp                           null
);
INSERT INTO `roles` (name, description)
VALUES ('ADMIN', 'Quản trị viên hệ thống, có toàn quyền quyết định trong hệ thống'),
       ('MOD', 'Người điều hành nội dung'),
       ('USER', 'Người dùng thông thường');

CREATE TABLE `users`
(
    `id`              BINARY(16)            NOT NULL DEFAULT (UUID_TO_BIN(UUID(), 1)),
    `username`        varchar(255)          NOT NULL,
    `email`           varchar(255)          NOT NULL,
    `password`        varchar(255)                                                  DEFAULT NULL,
    `phone`           varchar(20)                                                   DEFAULT NULL,
    `full_name`       varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `oauth2_id`       varchar(255)                                                  DEFAULT NULL,
    `oauth2_provider` varchar(50)                                                   DEFAULT NULL,
    `otp`             varchar(6)                                                    DEFAULT NULL,
    `otp_expired`     timestamp             NULL                                    DEFAULT NULL,
    `role_id`         int                   NOT NULL,
    `is_active`       tinyint(1)                                                    DEFAULT '0',
    `is_locked`       tinyint(1)                                                    DEFAULT '0',
    `created_at`      timestamp             NULL                                    DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp             NULL                                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`      timestamp             NULL                                    DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `oauth2_id` (`oauth2_id`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
);

CREATE TABLE `products`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `description` text,
    `price`       decimal(18, 0)                                                     DEFAULT NULL,
    `stock`       int                                                                DEFAULT '0',
    `category_id` int                                                           NOT NULL,
    `supplier_id` int                                                           NOT NULL,
    `is_active`   tinyint(1)                                                         DEFAULT '1',
    `created_at`  timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`  timestamp                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_category` (`category_id`),
    KEY `supplier_id` (`supplier_id`),
    KEY `idx_name_price` (`name`, `price`),
    CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
);

CREATE TABLE `images`
(
    `id`         INT                                                           NOT NULL AUTO_INCREMENT,
    `product_id` INT                                                           NOT NULL,
    `image_url`  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `created_at` TIMESTAMP                                                     NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP                                                     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`  timestamp                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
);

CREATE TABLE `carts`
(
    id BINARY(16) NOT NULL,
    `user_id`    Binary(16)      NOT NULL,
    `quantity`   int              DEFAULT '0',
    `created_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `cart_items`
(
    `id`         char(36)    NOT NULL,
    `product_id` int         NOT NULL,
    cart_id BINARY(16) NOT NULL,
    `quantity`   int              DEFAULT '1',
    `created_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    KEY `cart_id` (`cart_id`),
    CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
);

CREATE TABLE `address`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `address_line` VARCHAR(255),
    `ward`         VARCHAR(100),
    `district`     VARCHAR(100),
    `province`     VARCHAR(100),
    `country`      VARCHAR(100),
    `is_default`   BOOLEAN,
    `user_id`      BINARY(16)    NOT NULL,
    `created_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`   timestamp NULL DEFAULT NULL,
    CONSTRAINT `fk_user_address` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


CREATE TABLE `orders`
(
    `id`           bigint                                                                  NOT NULL AUTO_INCREMENT,
    `user_id`      BINARY(16)                                                                  NOT NULL,
    `total_amount` double                                                                  NOT NULL,
    `status`       enum ('Chờ xác nhận','Đã duyệt','Đang giao hàng','Hoàn thành','Đã hủy') NOT NULL DEFAULT 'Chờ xác nhận',
    `payment`      varchar(100)                                                            NOT NULL,
    `address_id`   int                                                                     NOT NULL,
    `created_at`   timestamp                                                               NULL     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp                                                               NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`   timestamp                                                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
);

CREATE TABLE `order_items`
(
    `id`         bigint    NOT NULL AUTO_INCREMENT,
    `order_id`   bigint    NOT NULL,
    `product_id` int       NOT NULL,
    `quantity`   int       NOT NULL,
    `price`      double    NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
);



CREATE TABLE `promotions`
(
    `id`                  int         NOT NULL AUTO_INCREMENT,
    `code`                varchar(50) NOT NULL,
    `description`         text,
    `discount_percent`    double           DEFAULT '0',
    `max_discount_amount` double           DEFAULT '0',
    `start_date`          timestamp   NOT NULL,
    `end_date`            timestamp   NOT NULL,
    `usage_limit`         int              DEFAULT NULL,
    `is_active`           tinyint(1)       DEFAULT '1',
    `created_at`          timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`          timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
);

CREATE TABLE `promotion_orders`
(
    `id`           int    NOT NULL AUTO_INCREMENT,
    `promotion_id` int    NOT NULL,
    `order_id`     bigint NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `promotion_orders_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
    CONSTRAINT `promotion_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
);

CREATE TABLE `promotion_order_items`
(
    `id`            int    NOT NULL AUTO_INCREMENT primary key,
    `promotion_id`  int    NOT NULL,
    `order_item_id` bigint NOT NULL,
    FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
    FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`)
);



CREATE TABLE `reviews`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `product_id` int       NOT NULL,
    `user_id`    BINARY(16)    NOT NULL,
    `rating`     tinyint   NOT NULL,
    `like` int NOT NULL DEFAULT 0,
    `comment`    text,
    `reviews_parent_id` bigint not null,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `room_products`
(
    `id`         INT NOT NULL AUTO_INCREMENT,
    `room_id`    INT NOT NULL,
    `product_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_room` (`room_id`),
    KEY `fk_product_id` (`product_id`), -- Đổi tên chỉ mục nếu cần
    CONSTRAINT `fk_room_product_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_room_product_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
);
CREATE TABLE `user_logs`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `user_id`    BINARY(16)         DEFAULT NULL,
    `action`     varchar(255)   DEFAULT NULL,
    `message`    text,
    `log_level`  varchar(50)    DEFAULT NULL,
    `ip_address` varchar(50)    DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `wishlists`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `user_id`    BINARY(16)    NOT NULL,
    `product_id` int       NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_wishlist_user` (`user_id`),
    KEY `FK_wishlist_product` (`product_id`),
    CONSTRAINT `FK_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

create table support_customers
(
    `id`         int auto_increment not null primary key,
    `email`      varchar(100)       not null,
    `title`      text               not null,
    `message`    text,
    `feedback`   text,
    `is_solve`   bool                    default false,
    `created_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp          NULL DEFAULT NULL
);

create table policies
(
    `id`         int auto_increment not null primary key,
    `title`      NVARCHAR(255)      not null,
    `content`    json,
    `created_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp          NULL DEFAULT NULL
);

CREATE TABLE faqs
(
    `id`         INT       NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question`   TEXT      NOT NULL,
    `answer`     TEXT      NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);


CREATE TABLE `invalidated_tokens`
(
    token_id VARCHAR(255) NOT NULL PRIMARY KEY,
    expired  DATETIME
);

CREATE TABLE `refresh_tokens`
(
    token_id VARCHAR(50) NOT NULL PRIMARY KEY,
    expired DATETIME,
    `user_id`    BiNARY(16)    NOT NULL,
    CONSTRAINT `FK_refresh_tokens_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER after_user_insert
    AFTER INSERT ON users
    FOR EACH ROW
BEGIN
    INSERT INTO carts (id, user_id, created_at, updated_at)
    VALUES (NEW.id, NEW.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
END;
//

DELIMITER ;
