package response

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"server-car-rental-ecommerce-gin/pkg/exception"
)

type ResponseStruct struct {
	Code    int         `json:"code"`
	Message string      `json:"message"`
	Data    interface{} `json:"data"`
}

func SuccessResponse(c *gin.Context, code int, data interface{}) {
	c.JSON(http.StatusOK, ResponseStruct{
		Code:    code,
		Message: exception.GetMessage(code),
		Data:    data,
	})
}

func ErrorResponse(c *gin.Context, code int, message string) {
	c.JSON(http.StatusBadRequest, ResponseStruct{
		Code:    code,
		Message: exception.GetMessage(code),
		Data:    nil,
	})

}
