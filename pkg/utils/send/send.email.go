package send

import (
	"fmt"
	"go.uber.org/zap"
	"net/smtp"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/constant"
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

func BuildMessage(mail Mail) string {
	msg := fmt.Sprintf("From: %s <%s>\r\n", mail.From.Name, mail.From.Address)
	msg += fmt.Sprintf("To: %s\r\n", strings.Join(mail.To, ", "))
	msg += fmt.Sprintf("Subject: %s\r\n", mail.Subject)
	msg += "MIME-Version: 1.0\r\n"
	msg += "Content-Type: text/html; charset=UTF-8\r\n\r\n"
	msg += fmt.Sprintf("%s\r\n", mail.Body)
	return msg
}

func SendOTPToEmail(to []string, from string, otp string) error {
	contentEmail := Mail{
		From:    EmailAddress{Address: from, Name: "test"},
		To:      to,
		Subject: constant.OTPVERIFY,
		Body:    fmt.Sprintf("Your OTP is %s. Please enter it to verify your account.", otp),
	}

	messageMail := BuildMessage(contentEmail)
	mail := global.Config.Mail
	auth := smtp.PlainAuth("", mail.Username, mail.Password, mail.Host)
	err := smtp.SendMail(
		mail.Host+":"+mail.Port,
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
