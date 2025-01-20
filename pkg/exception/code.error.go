package exception

const (
	SuccessCode             = 200
	CreateSuccessCode       = 201
	AcceptedCode            = 202
	BadRequestCode          = 400
	UnauthorizedCode        = 401
	ForbiddenCode           = 403
	NotFoundCode            = 404
	ConflictCode            = 409
	UnprocessableEntity     = 422
	InternalServerErrorCode = 500
	ServiceUnavailableCode  = 503
	GatewayTimeoutCode      = 504
)

var message = map[int]string{
	SuccessCode:             "Success",
	CreateSuccessCode:       "Create Success",
	AcceptedCode:            "Request accepted for processing",
	BadRequestCode:          "Bad request: Please check the input",
	UnauthorizedCode:        "Unauthorized: Invalid credentials",
	ForbiddenCode:           "Forbidden: Access denied",
	NotFoundCode:            "Resource not found",
	ConflictCode:            "Conflict: Resource already exists",
	UnprocessableEntity:     "Unprocessable entity: Validation failed",
	InternalServerErrorCode: "Internal server error: Something went wrong",
	ServiceUnavailableCode:  "Service unavailable: Please try again later",
	GatewayTimeoutCode:      "Gateway timeout: Request timed out",
}

func GetMessage(code int) string {
	return message[code]
}
