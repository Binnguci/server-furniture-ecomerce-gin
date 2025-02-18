package user

import (
	"github.com/gin-gonic/gin"
	"server-car-rental-ecommerce-gin/internal/injector"
	"server-car-rental-ecommerce-gin/internal/middleware"
)

type UserRouter struct{}

func (ur *UserRouter) InitUserRouter(Router *gin.RouterGroup) {

	userController, _ := injector.InitUserControllerHandler()
	//public router
	userRouterPublic := Router.Group("/auth")
	{
		userRouterPublic.POST("/register", userController.Register)
		userRouterPublic.GET("/validate-otp")
		userRouterPublic.POST("/sign-in")
		userRouterPublic.GET("/forget-password")
		userRouterPublic.POST("/reset-password")
	}

	//private router
	userRouterPrivate := Router.Group("/auth")
	userRouterPrivate.Use(middleware.AuthenticationMiddleware())
	userRouterPrivate.Use(middleware.PermissionMiddleware())
	{
		userRouterPrivate.POST("/refresh-token")
		userRouterPrivate.POST("/logout")
		userRouterPrivate.POST("/edit-account")
		userRouterPrivate.POST("/verify-email")
		userRouterPrivate.DELETE("/delete/account")
		userRouterPrivate.GET("/profile")
		userRouterPrivate.PATCH("/change-password")
		userRouterPrivate.POST("/upload-avatar")
	}
}
