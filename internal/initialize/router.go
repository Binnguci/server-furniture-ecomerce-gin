package initialize

import (
	helmet "github.com/danielkov/gin-helmet"
	"github.com/gin-gonic/gin"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/middleware"
	"server-furniture-ecommerce-gin/internal/router"
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
	r.Use(middleware.CorsMiddleware())
	r.Use(helmet.Default())
	r.Use(middleware.RateLimitMiddleware())

	userRouter := router.RouterGroupApp.User
	//adminRouter := router.RouterGroupApp.Admin

	MainGroup := r.Group("/api")
	{
		MainGroup.GET("/check-status") // tracking monitor
	}
	{
		userRouter.InitUserRouter(MainGroup)
	}
	//{
	//	adminRouter.InitUserRouter(MainGroup)
	//	adminRouter.InitProductRouter(MainGroup)
	//}
	return r
}
