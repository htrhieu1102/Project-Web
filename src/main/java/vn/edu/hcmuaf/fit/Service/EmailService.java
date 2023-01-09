package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Model.ForgotPassword;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailService {
    public void sendMail(ForgotPassword to) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.name", "Hạc Key");
        String subject = "Đặt lại mật khẩu tài khoản Hạc Key shop";
        String text = "<h1 style=\"padding: 0; font-size: 25px;color: #2dd100;font-family:sans-serif\">Đặt lại mật khẩu tài khoản Hạc Key shop</h1>" +
                "<p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Để đặt lại mật khẩu cho tài khoản, hãy nhập OTP: <strong style=\"font-size: 18px; color: #2dd100; font-family:sans-serif\">" + to.getCode() + "</strong></p>" +
                "<p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Cảm ơn bạn,</p><p style=\"padding: 0;font-size: 14px;color: #2dd100;font-family:sans-serif\">Hạc Key shop.</p>";

        String account = "20130260@st.hcmuaf.edu.vn";
        String pass = "askoaxjyhmtjjfkf";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(account,pass);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to.getEmail()));
            message.setHeader("Content-Type", "text/html; charset=UTF-8");
            message.setSubject(subject);
            message.setContent(text, "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Random random = new Random();
        System.out.println(random.nextInt(100000,999999));
    }
}
