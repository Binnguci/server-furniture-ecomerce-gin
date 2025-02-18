package initialize

import (
	"server-car-rental-ecommerce-gin/global"
	"strconv"
)

func Run() {
	LoadConfig()
	InitLogger()
	InitPostgreSQL()
	InitRedis()
	InitRouter()

	r := InitRouter()
	port := global.Config.Server
	r.Run(":" + strconv.Itoa(port.Port))
}
