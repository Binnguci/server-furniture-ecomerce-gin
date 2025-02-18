package user

import "github.com/gin-gonic/gin"

type ProductRouter struct{}

func (pr *ProductRouter) InitProductRouter(Router *gin.RouterGroup) {
	//public router
	carRouterPublic := Router.Group("/cars")
	{
		carRouterPublic.GET("")
		carRouterPublic.GET("/search")
		carRouterPublic.GET("/:id")
		carRouterPublic.GET("/reviews/:id")
		carRouterPublic.GET("/filter")
		carRouterPublic.GET("/locations")
	}

	//private router
	carRouterPrivate := Router.Group("/cars")
	{
		carRouterPrivate.POST("/wishlist")
		carRouterPrivate.DELETE("/wishlist")
		carRouterPrivate.GET("/register")
		carRouterPrivate.GET("/add-into-wishlist")
		carRouterPrivate.DELETE("/remove-into-wishlist")
		carRouterPrivate.POST("/book")
	}
}
