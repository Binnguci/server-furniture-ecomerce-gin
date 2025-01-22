package initialize

import "server-book-ecommerce-gin/global"

func Run() {
	LoadConfig()
	InitLogger()
	global.Logger.Info("Logger init success")
	InitMySQL()
	InitRedis()
	InitRouter()

	r := InitRouter()
	r.Run(":8082")
}
