-- bảng roles
DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(50) NOT NULL UNIQUE,
                       description TEXT DEFAULT '',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO roles (name, description) VALUES
                                          ('admin', 'Quản trị viên, có toàn quyền trong hệ thống'),
                                          ('client', 'Khách hàng, có thể mua hàng, đặt dịch vụ'),
                                          ('staff', 'Nhân viên, có quyền truy cập hạn chế theo nhiệm vụ');

-- bảng permissions
DROP TABLE IF EXISTS permissions CASCADE;
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT DEFAULT '',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO permissions (name) VALUES
                                   ('client'),
                                   ('owner'),
                                   ('admin'),
                                   ('accountant'),
                                   ('customer-care'),
                                   ('HR');

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
--bảng users
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(100) NOT NULL,
    gender SMALLINT CHECK (gender IN (1, 2)),
    password VARCHAR(255) NOT NULL,
    phone char(10) CHECK (phone ~ '^[0-9]+$'),
    birthday DATE,
    avatar VARCHAR(255),
    oauth_id VARCHAR(255),
    oauth_provider VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    introduce_code char(6) UNIQUE,
    role_id INT REFERENCES roles(id) ON DELETE SET NULL,
    permission_id INT REFERENCES permissions(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng giấy phép lái xe
DROP TABLE IF EXISTS driving_license CASCADE;
CREATE TABLE driving_license (
    id SERIAL PRIMARY KEY,
    front_image VARCHAR(255) NOT NULL,
    back_image VARCHAR(255) NOT NULL,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    license_number VARCHAR(50) NOT NULL,
    license_type VARCHAR(50) NOT NULL,
    issue_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng hãng xe
DROP TABLE IF EXISTS car_brands CASCADE;
CREATE TABLE car_brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng mẫu xe
DROP TABLE IF EXISTS car_models CASCADE;
CREATE TABLE car_models (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    brand_id INT REFERENCES car_brands(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- bảng tính năng xe
DROP TABLE IF EXISTS car_features CASCADE;
CREATE TABLE car_features (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO car_features (name) VALUES
                                    ('Bản đồ'),
                                    ('Bluetooth'),
                                    ('Camera 360'),
                                    ('Camera cập lề'),
                                    ('Camera hành trình'),
                                    ('Camera lùi'),
                                    ('Cảm biến lốp'),
                                    ('Cảm biến va chạm'),
                                    ('Cảnh báo tốc độ'),
                                    ('Cửa sổ trời'),
                                    ('Định vị GPS'),
                                    ('Ghế trẻ em'),
                                    ('Khe cắm USB'),
                                    ('Lốp dự phòng'),
                                    ('Màn hình DVD'),
                                    ('Nắp thùng xe bán tải'),
                                    ('ETC'),
                                    ('Túi khí an toàn');


-- bảng nhiên liệu
DROP TABLE IF EXISTS car_fuels CASCADE;
CREATE TABLE car_fuels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO car_fuels (name) VALUES ('Xăng'), ('Dầu diesel'), ('Điện'), ('Hydrogen'), ('Xăng hỗn hợp'), ('Dầu hỗn hợp');
-- bảng tuyền động
DROP TABLE IF EXISTS car_drives CASCADE;
CREATE TABLE car_drives (
   id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL UNIQUE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO car_drives (name) VALUES ('manual'), ('automatic');


-- bảng xe
DROP TABLE IF EXISTS cars CASCADE;
CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    model_id INT REFERENCES car_models(id) ON DELETE CASCADE,
    brand_id INT REFERENCES car_brands(id) ON DELETE CASCADE,
    fuel_id INT REFERENCES car_fuels(id) ON DELETE CASCADE,
    car_drive_id INT REFERENCES car_drives(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng trung gian tính năng xe
DROP TABLE IF EXISTS car_feature_mapping CASCADE;
CREATE TABLE car_feature_mapping (
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
    feature_id INT REFERENCES car_features(id) ON DELETE CASCADE,
    PRIMARY KEY (car_id, feature_id)
);


-- bảng hình ảnh xe
DROP TABLE IF EXISTS car_images CASCADE;
CREATE TABLE car_images (
   id SERIAL PRIMARY KEY,
   car_id INT REFERENCES cars(id) ON DELETE CASCADE,
   image VARCHAR(255) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng địa chỉ giao nhận xe
DROP TABLE IF EXISTS car_locations CASCADE;
CREATE TABLE car_locations (
   id SERIAL PRIMARY KEY,
   specific_address VARCHAR(255) NOT NULL,
   ward VARCHAR(50) NOT NULL,
   district VARCHAR(50) NOT NULL,
   province VARCHAR(50) NOT NULL,
   car_id INT REFERENCES cars(id) ON DELETE CASCADE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng nhu cầu
DROP TABLE IF EXISTS demands CASCADE;
CREATE TABLE demands (
   id SERIAL PRIMARY KEY,
   car_id INT REFERENCES cars(id) ON DELETE CASCADE,
   demand_type VARCHAR(50) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   deleted_at TIMESTAMP
);

-- bảng xu hướng
DROP TABLE IF EXISTS trends CASCADE;
CREATE TABLE trends (
   id SERIAL PRIMARY KEY,
   car_id INT REFERENCES cars(id) ON DELETE CASCADE,
   trend_type VARCHAR(50) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   deleted_at TIMESTAMP
);

-- bảng hình trình chuyến xe
DROP TABLE IF EXISTS trip_orders CASCADE;
CREATE TABLE trip_orders (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
    start_point VARCHAR(255) NOT NULL,
    end_point VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    price INT NOT NULL,
    status SMALLINT CHECK (status IN (0, 1, 2, 3)),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng thuê xe dài hạn
DROP TABLE IF EXISTS long_term_orders CASCADE;
CREATE TABLE long_term_orders (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    price INT NOT NULL,
    status SMALLINT CHECK (status IN (0, 1, 2, 3)),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng quà tặng
DROP TABLE IF EXISTS gifts CASCADE;
CREATE TABLE gifts (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT DEFAULT '',
    image VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng đánh giá
DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    rating SMALLINT CHECK (rating IN (1, 2, 3, 4, 5)),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- bảng invalid token
DROP TABLE IF EXISTS invalid_tokens CASCADE;
CREATE TABLE invalid_tokens (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng refresh token
DROP TABLE IF EXISTS refresh_tokens CASCADE;
CREATE TABLE refresh_tokens (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng xe yêu thích
DROP TABLE IF EXISTS wishlists CASCADE;
CREATE TABLE wishlists (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, car_id)
);

-- trigger để update trường updated_at
CREATE OR REPLACE FUNCTION update_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_roles
    BEFORE UPDATE ON "roles"
    FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER trigger_update_users
    BEFORE UPDATE ON users
    FOR EACH ROW
EXECUTE FUNCTION update_timestamp();