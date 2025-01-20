package response

import (
	"_server-furniture-ecommerce-gin/pkg/exception"
	"github.com/gin-gonic/gin"
	"net/http"
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
