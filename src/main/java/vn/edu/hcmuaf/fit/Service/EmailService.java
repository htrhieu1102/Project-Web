package vn.edu.hcmuaf.fit.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailService {
    public static void sendMail() {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.name", "Hạc Key");

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
            message.setRecipient(Message.RecipientType.TO, new InternetAddress("hoanghieu0098@gmail.com"));
            message.setSubject("Mật khẩu mới tài khoản của Hạc Key");
            message.setContent("Mật khẩu mới của bạn là: ", "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        sendMail();
    }
}
