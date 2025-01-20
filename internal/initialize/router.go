package initialize

import (
	"_server-furniture-ecommerce-gin/global"
	"_server-furniture-ecommerce-gin/internal/middleware"
	"_server-furniture-ecommerce-gin/internal/router"
	"github.com/gin-gonic/gin"
)

func InitRouter() *gin.Engine {
	var r *gin.Engine
	if global.Config.Server.Mode == "dev" {
		gin.SetMode(gin.DebugMode)
		gin.ForceConsoleColor()
		r = gin.Default()
	} else {
		gin.SetMode(gin.ReleaseMode)
		gin.New()
	}
	//middleware
	r.Use(middleware.AuthenticationMiddleware())
	// .. các middleware khác
	userRouter := router.RouterGroupApp.User
	//adminRouter := router.RouterGroupApp.Admin

	MainGroup := r.Group("/v1/api")
	{
		MainGroup.GET("/check-status") // tracking monitor
	}
	{
		userRouter.InitUserRouter(MainGroup)
		userRouter.InitProductRouter(MainGroup)
	}
	//{
	//	adminRouter.InitUserRouter(MainGroup)
	//	adminRouter.InitProductRouter(MainGroup)
	//}
	return r
}
