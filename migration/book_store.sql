DROP DATABASE IF EXISTS `bookstore`;
CREATE DATABASE IF NOT EXISTS `bookstore`;
USE `bookstore`;

drop table if exists publishers;
create table if not exists publishers
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
    created_by    varchar(255)                        null,
    updated_at    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at    timestamp                           null
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

CREATE TABLE `users`
(
    `id`              BIGINT AUTO_INCREMENT NOT NULL,
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

drop table if exists genre;
create table if not exists genre
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    is_active  TINYINT   DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP    NULL
    );
CREATE TABLE `authors`
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    nationality   VARCHAR(100),
    biography     TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at    TIMESTAMP NULL
);

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(255) NOT NULL,
    description   TEXT,
    price         DECIMAL(18, 2) DEFAULT NULL,
    stock         INT DEFAULT 0,
    genre_id   INT NOT NULL,
    author_id     INT NOT NULL,
    image        VARCHAR(255) DEFAULT NULL,
    is_active     TINYINT(1) DEFAULT 1,
    `created_at`  timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`  timestamp                                                     NULL DEFAULT NULL,
    CONSTRAINT fk_category FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE CASCADE,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `address_line` VARCHAR(255),
    `ward`         VARCHAR(100),
    `district`     VARCHAR(100),
    `province`     VARCHAR(100),
    `country`      VARCHAR(100),
    `is_default`   BOOLEAN,
    `user_id`      BIGINT    NOT NULL,
    `created_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`   timestamp NULL DEFAULT NULL,
    CONSTRAINT `fk_user_address` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);


DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`
(
    `id`         varchar(12) NOT NULL,
    `user_id`    BIGINT      NOT NULL,
    `quantity`   int              DEFAULT '0',
    `created_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`
(
    `id`         char(36)    NOT NULL,
    `book_id` int         NOT NULL,
    `cart_id`    varchar(12) NOT NULL,
    `quantity`   int              DEFAULT '1',
    `created_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`book_id`),
    KEY `cart_id` (`cart_id`),
    CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
    CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `id`           bigint                                                                  NOT NULL AUTO_INCREMENT,
    `user_id`      BIGINT                                                                  NOT NULL,
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

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`
(
    `id`         bigint    NOT NULL AUTO_INCREMENT,
    `order_id`   bigint    NOT NULL,
    `book_id` int       NOT NULL,
    `quantity`   int       NOT NULL,
    `price`      double    NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_order_item_product` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `promotions`;
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

DROP TABLE IF EXISTS `promotion_order`;
CREATE TABLE `promotion_orders`
(
    `id`           int    NOT NULL AUTO_INCREMENT,
    `promotion_id` int    NOT NULL,
    `order_id`     bigint NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `promotion_orders_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
    CONSTRAINT `promotion_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
);

DROP TABLE IF EXISTS `promotion_order_items`;
CREATE TABLE `promotion_order_items`
(
    `id`            int    NOT NULL AUTO_INCREMENT primary key,
    `promotion_id`  int    NOT NULL,
    `order_item_id` bigint NOT NULL,
    FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
    FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`)
);

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `book_id` int       NOT NULL,
    `user_id`    BIGINT    NOT NULL,
    `rating`     tinyint   NOT NULL,
    `like` int NOT NULL DEFAULT 0,
    `comment`    text,
    `reviews_parent_id` bigint not null,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`book_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
    CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `user_id`    BIGINT         DEFAULT NULL,
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

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `user_id`    BIGINT    NOT NULL,
    `product_id` int       NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_wishlist_user` (`user_id`),
    KEY `FK_wishlist_product` (`product_id`),
    CONSTRAINT `FK_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `support_customers`;
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

DROP TABLE IF EXISTS `policies`;
create table policies
(
    `id`         int auto_increment not null primary key,
    `title`      NVARCHAR(255)      not null,
    `content`    json,
    `created_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp          NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` timestamp          NULL DEFAULT NULL
);

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE faqs
(
    `id`         INT       NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question`   TEXT      NOT NULL,
    `answer`     TEXT      NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);

DROP TABLE IF EXISTS `invalidated_tokens`;
CREATE TABLE `invalidated_tokens`
(
    token_id VARCHAR(255) NOT NULL PRIMARY KEY,
    expired  DATETIME
);

DROP TABLE IF EXISTS `refresh_tokens`;
CREATE TABLE `refresh_tokens`
(
    token_id VARCHAR(50) NOT NULL PRIMARY KEY,
    expired DATETIME,
    `user_id`    BIGINT    NOT NULL,
    CONSTRAINT `FK_refresh_tokens_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER after_user_insert
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    DECLARE new_cart_id VARCHAR(12);

    SELECT IFNULL(CONCAT('CART', LPAD(SUBSTRING(MAX(id), 5) + 1, 7, '0')), 'CART0000001')
    INTO new_cart_id
    FROM carts;
    INSERT INTO carts (id, user_id, created_at, updated_at)
    VALUES (new_cart_id, NEW.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
END;
//

DELIMITER ;