package initialize

import (
	"server-book-ecommerce-gin/global"
	"server-book-ecommerce-gin/pkg/logger"
)

func InitLogger() {
	global.Logger = logger.NewLogger(global.Config.Logger)
}
