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
        boolean emailExists = d.checkEmailExistsInDatabase(email);

        if (emailExists) {
            String verificationCode = generateVerificationCode();

            request.getSession().setAttribute("verificationCode", verificationCode);
            request.getSession().setAttribute("email", email);

            sendVerificationCode(email, verificationCode);

                response.sendRedirect("verification.jsp");
        } else {
            response.sendRedirect("forgot_password.jspD?error=email_not_found");
        }
    }

    private String generateVerificationCode() {
        Random rnd = new Random();
        int code = rnd.nextInt(900000);
        return String.format("%06d", code);
    }

    private void sendVerificationCode(String email, String code) {
        final String senderEmail = "ucanhnguyen70@gmail.com";
        final String password = "roty yyzb phxe mebd";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

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
            message.setSubject("Confirm password reset");
            message.setText("Your confirmation code is: " + code);
            try {
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
