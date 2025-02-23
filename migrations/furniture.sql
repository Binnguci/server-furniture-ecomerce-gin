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

INSERT INTO `suppliers`
VALUES (1, 'IKEA', 'info@ikea.com', '+46 771 123 456', 'Älmhult, Sweden', 'Thụy Điển', 'https://www.ikea.com', 1,
        '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (2, 'Wayfair', 'service@wayfair.com', '+1 877 929 3247', '4 Copley Place, Boston, MA, USA', 'Hoa Kỳ',
        'https://www.wayfair.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (3, 'Ashley Furniture', 'support@ashleyfurniture.com', '+1 800 477 2222', 'One Ashley Way, Arcadia, WI, USA',
        'Hoa Kỳ', 'https://www.ashleyfurniture.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (4, 'Herman Miller', 'info@hermanmiller.com', '+1 888 443 4357', 'Zeeland, Michigan, USA', 'Hoa Kỳ',
        'https://www.hermanmiller.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (5, 'Steelcase', 'customercare@steelcase.com', '+1 800 333 9939', 'Grand Rapids, Michigan, USA', 'Hoa Kỳ',
        'https://www.steelcase.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (6, 'Muji', 'info@muji.com', '+81 3 3989 4531', 'Tokyo, Japan', 'Japan', 'https://www.muji.com', 1,
        '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (7, 'Saint Louis', 'contact@saint-louis.com', '+33 3 87 06 40 50',
        'Rue Coëtlosquet, Saint-Louis-lès-Bitche, France', 'Pháp', 'https://www.saint-louis.com', 1,
        '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (8, 'Cire Trudon', 'info@ciretrudon.com', '+33 1 42 77 00 34', '78 Rue de Seine, Paris, France', 'Pháp',
        'https://www.ciretrudon.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (9, 'Arcahorn', 'info@arcahorn.com', '+39 0733 616030', 'Via Velluti, 41, Recanati, Italy', 'Ý',
        'https://www.arcahorn.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (10, 'Fürstenberg', 'info@fuerstenberg-porzellan.com', '+49 5271 401 0',
        'Meinbrexener Str. 2, Fürstenberg, Germany', 'Đức', 'https://www.fuerstenberg-porzellan.com', 1,
        '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (11, 'Riviere', 'info@rivieredecor.it', '+39 0322 938174', 'Via Sesiana 9, Gozzano, Italy', 'Ý',
        'https://www.rivieredecor.it', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (12, 'Ralph Lauren', 'customer.service@ralphlauren.com', '+1 888 475 7674', '650 Madison Avenue, New York, USA',
        'Hoa Kỳ', 'https://www.ralphlauren.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL),
       (13, 'Décor Walther', 'info@decor-walther.com', '+49 69 971 4700', 'Liebfrauenberg 37, Frankfurt, Germany',
        'Đức', 'https://www.decor-walther.com', 1, '2024-09-28 08:44:00', '2024-09-28 08:44:00', NULL);

create table if not exists categories
(
    id         int auto_increment primary key,
    name       varchar(100)                        not null,
    is_active  tinyint   default 1                 null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at timestamp                           null
    );
INSERT INTO `categories`
VALUES (1, 'Ghế', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (2, 'Bàn', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (3, 'Tủ', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (4, 'Chén', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (5, 'Dĩa', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (6, 'Giường', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (7, 'Kệ', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (8, 'Đèn', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (9, 'Sofa', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (10, 'Thảm', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (11, 'Gương', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (12, 'Phụ kiện trang trí', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL);


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
INSERT INTO `rooms`
VALUES (1, 'Phòng ngủ', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (2, 'Phòng khách', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (3, 'Phòng bếp', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (4, 'Phòng tắm', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (5, 'Phòng làm việc', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (6, 'Phòng ăn', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL),
       (7, 'Phòng sách', 1, '2024-09-28 08:43:59', '2024-09-28 08:43:59', NULL);

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
INSERT INTO `products` (name, description, price, stock, category_id, supplier_id)
VALUES ('Đèn Spotlight', 'Đèn chiếu sáng với thiết kế hiện đại.', 25500000, 12, 8, 1),
       ('Hộp khăn giấy', 'Hộp đựng khăn giấy sang trọng.', 10000000, 5, 12, 6),
       ('Đèn cầm tay mini vàng', 'Đèn cầm tay nhỏ gọn, dễ dàng mang theo.', 26118408, 5, 8, 4),
       ('Đĩa sứ họa tiết cánh hoa', 'Đĩa sứ tinh tế với họa tiết đẹp mắt.', 5058723, 8, 5, 3),
       ('Đĩa ăn Pasta đáy lõm', 'Đĩa ăn cho món pasta với thiết kế đáy lõm.', 1457132, 5, 5, 5),
       ('Gương trang điểm', 'Gương trang điểm với thiết kế sang trọng.', 34472846, 2, 11, 11),
       ('Đèn treo tường Flannel xám', 'Đèn treo tường với phong cách Flannel.', 33266604, 1, 8, 12),
       ('Đèn trần - Ánh sáng trắng hiện đại',
        'Đèn trần cung cấp ánh sáng trắng rực rỡ, phù hợp cho phòng khách và văn phòng.', 72836284, 23, 8, 13),
       ('Đèn spotlight - Chiếu sáng điểm nhấn',
        'Đèn spotlight mạnh mẽ, lý tưởng để chiếu sáng các khu vực cụ thể hoặc làm nổi bật các chi tiết nội thất.',
        35246273, 10, 8, 13),
       ('Đèn trần - Hiện đại', 'Đèn trần hiện đại sử dụng công nghệ LED tiết kiệm năng lượng.', 253647254, 12, 8, 13),
       ('Đèn trần và đèn tường', 'Đèn có thể lắp trên trần và tường, thích hợp cho không gian linh hoạt.', 153738463,
        13, 8, 13),
       ('Đèn trần - Cổ điển', 'Đèn trần với thiết kế cổ điển, tạo ánh sáng ấm áp.', 47283647, 16, 8, 13),
       ('Đèn trần - Tối giản', 'Đèn trần với thiết kế tối giản, phù hợp cho nội thất hiện đại.', 15263745, 5, 8, 13),
       ('Đèn trần - Sang trọng', 'Thiết kế sang trọng, hoàn hảo cho không gian cao cấp.', 15264728, 7, 8, 13),
       ('Đèn trần - Phong cách công nghiệp', 'Đèn trần phong cách công nghiệp, mạnh mẽ và độc đáo.', 15362746, 8, 8,
        13),
       ('Đèn trần - Tiết kiệm năng lượng',
        'Sử dụng công nghệ tiết kiệm năng lượng, thích hợp cho phòng khách và phòng ngủ.', 25342765, 13, 8, 13),
       ('Đèn trần - Ánh sáng vàng ấm', 'Đèn trần cung cấp ánh sáng vàng ấm, phù hợp cho không gian thư giãn.', 13443245,
        6, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13),
       ('Clip-on light for mirror', null, 23456534, 4, 8, 13);


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
INSERT INTO `images` (product_id, image_url)
VALUES (1, 'https://www.decor-walther.com/img/products/0219400/Studio-S_Perspektive-3_chrom.png'),
       (2, 'https://www.decor-walther.com/img/products/0830400/0830400_KB%2082_chrom-web.png'),
       (3, 'https://www.saint-louis.com/media/catalog/product/…ble_lamp_saint-louis_crystal_lighting_gold_or.jpg'),
       (4, 'https://www.fuerstenberg-porzellan.com/thumbnail/d…0919800/img1_fl2011325900_platzteller_600x600.png'),
       (5,'https://www.fuerstenberg-porzellan.com/thumbnail/8a/a1/ca/1710921104/img1_tf_68328weiss_gourmetteller_tief_600x600.png'),
       (6, 'https://www.decor-walther.com/img/products/0110900/0110900.png'),
       (7,'https://www.saint-louis.com/media/catalog/product/cache/e1648193c4bd079fe5e6c9e530413384/1/0/10170716-1.jpg'),
       (8, 'https://www.decor-walther.com/img/products/0213100/0213100_GLOBE%2020_Chrom_web.png'),
       (9, '	https://www.decor-walther.com/img/products/0219500/Studio-L_Perspektive-1_chrom.png'),
       (10, 'https://www.decor-walther.com/img/products/0218800/0218800_CUT%2030%20N%20LED_Chrom.png'),
       (11, 'https://www.decor-walther.com/img/products/0219300/0219300_BAUHAUS%203%20N%20LED_Chrom.png'),
       (12, 'https://www.decor-walther.com/img/products/0219100/0219100_CONECT%2026%20N%20LED_Chrom.png'),
       (13, 'https://www.decor-walther.com/img/products/0219200/0219200.png'),
       (14, 'https://www.decor-walther.com/img/products/0218700/0218700_CUT%2018%20N%20LED_Chrom.png'),
       (15, 'https://www.decor-walther.com/img/products/0219000/0216000%20GLOW%2028%20LED_1.png'),
       (16, 'https://www.decor-walther.com/img/products/0218900/0218900_CUT%2040%20N%20LED_Chrom.png'),
       (17, 'https://www.decor-walther.com/img/products/0333900/0333900_BAUHAUS%201%20N%20LED_Chrom.png'),
       (18, 'https://www.decor-walther.com/img/products/0411000/0411000_BOX%201-15_Chrom.png'),
       (19, 'https://www.decor-walther.com/img/products/0411200/0411200_BOX%201-60_Chrom.png'),
       (20, 'https://www.decor-walther.com/img/products/0413700/0413700_BOX%201-25_Chrom.png'),
       (21, 'https://www.decor-walther.com/img/products/0418700/0418700_FLAT%201%20LED_Chrom.png'),
       (22, 'https://www.decor-walther.com/img/products/0411100/0411100_BOX%201-40_Chrom.png'),
       (23, 'https://www.decor-walther.com/img/products/0409300/0409300_BOX%201-10_Chrom.png'),
       (24, 'https://www.decor-walther.com/img/products/0402200/0402200_OMEGA%201_Chrom.png'),
       (25, 'https://www.decor-walther.com/img/products/0420300/0420300_BOX%201-40%20N%20LED_Chrom.png'),
       (26, 'https://www.decor-walther.com/img/products/0420200/0420200_BOX%201-25%20N%20LED_chrome.png'),
       (27, 'https://www.decor-walther.com/img/products/0420100/0420100_BOX%201-15%20N%20LED_Chrom.png');

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

CREATE TABLE `cart_items`
(
    `id`         char(36)    NOT NULL,
    `product_id` int         NOT NULL,
    `cart_id`    varchar(12) NOT NULL,
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
    `user_id`      BIGINT    NOT NULL,
    `created_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`   timestamp NULL DEFAULT NULL,
    CONSTRAINT `fk_user_address` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


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
    `user_id`    BIGINT    NOT NULL,
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

INSERT INTO `room_products`
VALUES (1, 1, 1),
       (2, 2, 1),
       (3, 3, 1),
       (4, 4, 1),
       (5, 5, 1),
       (6, 6, 1),
       (7, 7, 1),
       (8, 1, 2),
       (9, 2, 2),
       (10, 3, 2),
       (11, 5, 2),
       (12, 6, 2),
       (13, 7, 2),
       (14, 1, 3),
       (15, 6, 4),
       (16, 3, 4),
       (17, 6, 5),
       (18, 3, 5),
       (19, 1, 6),
       (20, 1, 7),
       (21, 2, 7),
       (22, 3, 7),
       (23, 4, 7),
       (24, 5, 7),
       (25, 6, 7),
       (26, 7, 7);


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
INSERT INTO policies (title, content)
    VALUE ('Chính sách bảo hành', '{
  "warranty_policy": {
    "warranty_period": "12 tháng",
    "conditions": {
      "eligible": [
        "Sản phẩm bị lỗi kỹ thuật do nhà sản xuất",
        "Sản phẩm không có dấu hiệu sửa chữa hoặc can thiệp từ bên thứ ba",
        "Cung cấp phiếu bảo hành và hóa đơn mua hàng"
      ],
      "ineligible": [
        "Hư hỏng do sử dụng sai hướng dẫn",
        "Hư hỏng do tác động môi trường bên ngoài (nước, nhiệt độ cao)",
        "Thiên tai, hỏa hoạn, lũ lụt"
      ]
    },
    "process": [
      "Liên hệ bộ phận chăm sóc khách hàng qua hotline hoặc email",
      "Hướng dẫn gửi sản phẩm hoặc kiểm tra tận nơi",
      "Thời gian xử lý bảo hành trong vòng 7-15 ngày làm việc",
      "Trả sản phẩm và cung cấp thông tin sau bảo hành"
    ]
  }
}');
INSERT INTO policies (title, content) VALUE
    ('Chính sách đổi trả sản phẩm', '{
      "return_policy": {
        "return_period": "15 ngày",
        "conditions": {
          "eligible": [
            "Sản phẩm còn nguyên tem, bao bì và không có dấu hiệu sử dụng",
            "Có hóa đơn mua hàng và phiếu bảo hành đi kèm",
            "Lỗi kỹ thuật do nhà sản xuất hoặc hư hỏng trong quá trình vận chuyển"
          ],
          "ineligible": [
            "Sản phẩm đã qua sử dụng hoặc không còn nguyên trạng",
            "Không có hóa đơn mua hàng hoặc phiếu bảo hành",
            "Sản phẩm giảm giá hoặc khuyến mãi không áp dụng đổi trả"
          ]
        },
        "process": [
          "Liên hệ bộ phận chăm sóc khách hàng để yêu cầu đổi trả",
          "Xác nhận điều kiện sản phẩm và chuẩn bị hồ sơ cần thiết",
          "Gửi sản phẩm về trung tâm đổi trả hoặc cửa hàng gần nhất",
          "Xử lý và hoàn tất đổi trả trong 7 ngày làm việc"
        ]
      }
    }');
INSERT INTO policies (title, content)
VALUES ('Chính sách vận chuyển và giao hàng', '{
  "shipping_policy": {
    "shipping_time": {
      "standard": "3-5 ngày làm việc",
      "express": "1-2 ngày làm việc"
    },
    "costs": {
      "standard": "Miễn phí với đơn hàng trên 1 triệu VNĐ",
      "express": "Phí 50.000 VNĐ"
    },
    "process": [
      "Xác nhận đơn hàng và chuẩn bị sản phẩm trong vòng 24 giờ",
      "Thông báo thời gian giao hàng và mã vận đơn qua email",
      "Theo dõi trạng thái đơn hàng qua hệ thống hoặc trang web đối tác vận chuyển",
      "Nhận hàng và kiểm tra tình trạng sản phẩm khi giao"
    ],
    "notes": [
      "Khách hàng kiểm tra kỹ sản phẩm khi nhận hàng để tránh các trường hợp hư hỏng do vận chuyển",
      "Nếu sản phẩm có dấu hiệu hư hỏng, vui lòng từ chối nhận hàng và báo lại ngay cho chúng tôi"
    ]
  }
}');
INSERT INTO policies (title, content)
VALUES ('Chính sách thanh toán', '{
  "payment_policy": {
    "methods": [
      "Thanh toán qua thẻ tín dụng/thẻ ghi nợ",
      "Chuyển khoản ngân hàng",
      "Thanh toán khi nhận hàng (COD)"
    ],
    "guidelines": {
      "secure_payment": "Cam kết bảo mật thông tin thanh toán của khách hàng.",
      "payment_confirmation": "Xác nhận thanh toán sẽ được gửi qua email hoặc SMS."
    },
    "refund_process": [
      "Nếu khách hàng hủy đơn hàng trước khi giao, tiền sẽ được hoàn lại trong vòng 5-7 ngày làm việc.",
      "Đối với các đơn hàng đã nhận, hoàn tiền sẽ tuân theo chính sách đổi trả sản phẩm."
    ]
  }
}');
INSERT INTO policies (title, content)
VALUES ('Chính sách bảo mật thông tin', '{
  "privacy_policy": {
    "data_collection": [
      "Chúng tôi thu thập thông tin cá nhân để xử lý đơn hàng và hỗ trợ khách hàng.",
      "Thông tin bao gồm họ tên, địa chỉ, số điện thoại, và email."
    ],
    "data_usage": [
      "Thông tin của khách hàng chỉ được sử dụng trong các hoạt động liên quan đến giao dịch và chăm sóc khách hàng.",
      "Thông tin sẽ không được chia sẻ cho bên thứ ba mà không có sự đồng ý của khách hàng, trừ khi được yêu cầu bởi pháp luật."
    ],
    "data_protection": [
      "Dữ liệu của khách hàng được bảo mật bằng công nghệ mã hóa SSL.",
      "Chúng tôi tuân thủ các quy định bảo mật dữ liệu để đảm bảo an toàn cho thông tin của khách hàng."
    ]
  }
}');

CREATE TABLE faqs
(
    `id`         INT       NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question`   TEXT      NOT NULL,
    `answer`     TEXT      NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO faqs (question, answer)
VALUES ('Thời gian giao hàng là bao lâu?',
        'Thời gian giao hàng từ 3 đến 7 ngày làm việc, tùy thuộc vào địa điểm của bạn.'),
       ('Tôi có thể thay đổi địa chỉ giao hàng không?',
        'Có, bạn có thể thay đổi địa chỉ giao hàng trước khi đơn hàng được xử lý. Hãy liên hệ với chúng tôi để được hỗ trợ.'),
       ('Sản phẩm có được bảo hành không?',
        'Có, tất cả các sản phẩm đều được bảo hành theo chính sách bảo hành của chúng tôi.'),
       ('Tôi có thể trả lại sản phẩm nếu không hài lòng?',
        'Có, bạn có thể trả lại sản phẩm trong vòng 30 ngày kể từ ngày nhận hàng nếu sản phẩm còn mới và chưa sử dụng.'),
       ('Có chương trình khuyến mãi nào không?',
        'Chúng tôi thường xuyên có các chương trình khuyến mãi. Bạn hãy theo dõi trang web hoặc đăng ký nhận bản tin để nhận thông tin mới nhất.'),
       ('Có thể thanh toán bằng hình thức nào?',
        'Chúng tôi chấp nhận nhiều hình thức thanh toán, bao gồm thẻ tín dụng, thẻ ghi nợ, và chuyển khoản ngân hàng.'),
       ('Sản phẩm có thể tùy chỉnh không?',
        'Có, một số sản phẩm của chúng tôi có thể được tùy chỉnh theo yêu cầu của khách hàng. Vui lòng liên hệ với chúng tôi để biết thêm chi tiết.'),
       ('Tôi có thể nhận được hỗ trợ lắp đặt không?',
        'Chúng tôi cung cấp dịch vụ hỗ trợ lắp đặt cho một số sản phẩm. Bạn có thể chọn dịch vụ này khi đặt hàng.'),
       ('Chính sách bảo mật thông tin cá nhân của bạn như thế nào?',
        'Chúng tôi cam kết bảo mật thông tin cá nhân của khách hàng và chỉ sử dụng thông tin này cho mục đích xử lý đơn hàng và cung cấp dịch vụ.'),
       ('Tôi có thể liên hệ với bộ phận hỗ trợ khách hàng bằng cách nào?',
        'Bạn có thể liên hệ với bộ phận hỗ trợ khách hàng qua số điện thoại, email, hoặc chat trực tiếp trên website. Chúng tôi luôn sẵn sàng hỗ trợ bạn.');



CREATE TABLE `invalidated_tokens`
(
    token_id VARCHAR(255) NOT NULL PRIMARY KEY,
    expired  DATETIME
);

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