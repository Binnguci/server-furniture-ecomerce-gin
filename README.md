# Xây dựng server website thương mại điện tử bán nội thất với Gin Framework

## 1. Cấu hình

### 1.1. Go
- **Phiên bản Go**: 1.23

### 1.2. MySQL
- **Driver**: [github.com/go-sql-driver/mysql](https://github.com/go-sql-driver/mysql) v1.7.0

### 1.3. Các thư viện sử dụng

Dưới đây là danh sách các thư viện và phiên bản mà dự án sử dụng:

- **Gin Framework**: [github.com/gin-gonic/gin](https://github.com/gin-gonic/gin) v1.10.0
- **GORM (ORM cho Go)**: [gorm.io/gorm](https://gorm.io) v1.25.12
- **Redis**: [github.com/redis/go-redis/v9](https://github.com/redis/go-redis) v9.7.0
- **Zap Logger**: [go.uber.org/zap](https://github.com/uber-go/zap) v1.27.0
- **Viper (Quản lý cấu hình)**: [github.com/spf13/viper](https://github.com/spf13/viper) v1.19.0
- **Validator (Kiểm tra dữ liệu đầu vào)**: [github.com/go-playground/validator/v10](https://github.com/go-playground/validator) v10.20.0
- **Sonic (JSON Encoder/Decoder)**: [github.com/bytedance/sonic](https://github.com/bytedance/sonic) v1.11.6
- **Go Protobuf**: [google.golang.org/protobuf](https://github.com/protocolbuffers/protobuf-go) v1.34.1

### 1.4. Cấu hình Redis

Để sử dụng Redis, bạn cần cấu hình Redis trên máy chủ. Đảm bảo rằng Redis đang chạy trên cổng mặc định `6379`.

**Cấu hình Redis trong `redis.conf`** (nếu cần tùy chỉnh):

```bash
bind 127.0.0.1
port 6379
