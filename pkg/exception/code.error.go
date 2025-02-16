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
	UserExistsCode          = 1001
	ErrorInvalidOTP         = 1002
	ErrorSendEmail          = 1003
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
	UserExistsCode:          "User already exists",
	ErrorInvalidOTP:         "Invalid OTP",
	ErrorSendEmail:          "Error when send email",
}

func GetMessage(code int) string {
	return message[code]
}
