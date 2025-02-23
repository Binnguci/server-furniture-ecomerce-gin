package constant

const (
	TEMPLATE_VERIFY_ACCOUNT = `
		<div style="font-family: Arial, sans-serif; color: #333;">
            <p style="font-size: 16px;">Chào bạn,</p>
            <p style="font-size: 16px;">
                Cảm ơn bạn đã đăng ký tài khoản với chúng tôi! Để xác thực tài khoản của bạn,
                vui lòng nhấn vào nút dưới đây:
            </p>
            <div style="text-align: center; margin: 20px 0;">
                <a href="http://localhost:8085/api/auth/confirm-account?otp=%s"
                   style="padding: 10px 20px; color: white; background-color: #28a745; 
                          text-decoration: none; border-radius: 5px; display: inline-block;">
                    Xác thực tài khoản
                </a>
            </div>
            <p style="font-size: 16px;">
                Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.
            </p>
            <p style="font-size: 16px;">Trân trọng,</p>
            <p style="font-size: 16px; font-style: italic;">Đội ngũ hỗ trợ</p>
        </div>
	`
)
