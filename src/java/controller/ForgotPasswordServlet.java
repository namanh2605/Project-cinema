package controller;

import dal.AccountDAO;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ForgotPasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Process your request here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        AccountDAO d = new AccountDAO();
        // Kiểm tra email có tồn tại trong cơ sở dữ liệu không
        boolean emailExists = d.checkEmailExistsInDatabase(email);

        if (emailExists) {
            // Tạo mã xác nhận ngẫu nhiên
            String verificationCode = generateVerificationCode();

            // Lưu mã xác nhận vào session
            request.getSession().setAttribute("verificationCode", verificationCode);
            request.getSession().setAttribute("email", email);

            // Gửi mã xác nhận đến email
            sendVerificationCode(email, verificationCode);

            // Chuyển hướng người dùng đến trang xác nhận
                response.sendRedirect("verification.jsp");
        } else {
            // Nếu email không tồn tại, hiển thị thông báo lỗi
            response.sendRedirect("forgot_password.jspD?error=email_not_found");
        }
    }

    private String generateVerificationCode() {
        // Tạo một mã xác nhận ngẫu nhiên, ví dụ: 6 chữ số
        Random rnd = new Random();
        int code = rnd.nextInt(900000);
        return String.format("%06d", code);
    }

    private void sendVerificationCode(String email, String code) {
        // Địa chỉ email và mật khẩu của tài khoản gửi email
        final String senderEmail = "ucanhnguyen70@gmail.com";
        final String password = "roty yyzb phxe mebd";

        // Cài đặt thông tin cần thiết cho việc gửi email
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo một phiên làm việc để gửi email
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            // Thiết lập tiêu đề email
            message.setSubject("Confirm password reset");
            // Thiết lập nội dung email
            message.setText("Your confirmation code is: " + code);
            // Gửi email
            try {
                // Tạo đối tượng Transport và gửi email
                Transport transport = session.getTransport("smtp");
                transport.connect("smtp.gmail.com", senderEmail, password);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                System.out.println("Confirmation code sent to email address: " + email);
            } catch (MessagingException e) {
                throw new RuntimeException("Error sending email: " + e);
            }
        } catch (MessagingException e) {
            throw new RuntimeException("Error sending email: " + e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
