package send

import (
	"fmt"
	"go.uber.org/zap"
	"net/smtp"
	"server-car-rental-ecommerce-gin/global"
	"server-car-rental-ecommerce-gin/internal/constant"
	"strings"
)

type EmailAddress struct {
	Address string `json:"address"`
	Name    string `json:"name"`
}

type Mail struct {
	From    EmailAddress
	To      []string
	Subject string
	Body    string
}

const (
	SMTPHost     = "smtp"
	SMTPPort     = "587"
	SMTPUSername = "tthanhbinh2757@gmail.com"
	SMTPPassword = "ijnn asqn oedx adok"
)

func BuildMessage(mail Mail) string {
	msg := "MIME-version: 1.0;\nContent-Type: text/html; charset=\"UTF-8\";\r\n"
	msg += fmt.Sprintf("From: %s\r\n", mail.From.Address)
	msg += fmt.Sprintf("To: %s\r\n", strings.Join(mail.To, ";"))
	msg += fmt.Sprintf("Subject: %s\r\n", mail.Subject)
	msg += fmt.Sprintf("\r\n%s\r\n", mail.Body)
	return msg
}

func SendOTPToEmail(to []string, from string, otp string) error {
	contentEmail := Mail{From: EmailAddress{Address: from, Name: "test"},
		To:      to,
		Subject: constant.OTPVERIFY,
		Body:    fmt.Sprintf("Your OTP is %s. Please enter it to verify your account.", otp)}

	messageMail := BuildMessage(contentEmail)
	//send smtp
	auth := smtp.PlainAuth("", SMTPUSername, SMTPPassword, SMTPHost)
	err := smtp.SendMail(
		fmt.Sprintf("%s:%s", SMTPHost, SMTPPort),
		auth,
		from,
		to,
		[]byte(messageMail),
	)
	if err != nil {
		global.Logger.Error("Fail to send mail", zap.Error(err))
		return fmt.Errorf("failed to send email: %v", err)
	}

	return nil
}
