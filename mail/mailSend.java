package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class mailSend {
	
	
	
	public mailSend() {
		super();
		System.out.println("mailSend 생성자 생성!");
	}

	public void MailExam() throws Exception{   //추후에 파라메터값 추가해서 인증번호 및 아이디 비밀번호(임시비밀번호 발급 가능)
		
		 // 발신, 수신 정보
        final String fromEmail = "아이디";	//@gmail.com 입력할 필요없음. 아이디만쓰기
        final String password = "비밀번호";
        final String toEmail = "kdw4458@naver.com";
         
        // 메일 내용
        String subject="메일 발송 테스트";
        String body="내용 무";
         
        Properties props = new Properties();
        // SSL 사용하는 경우
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        props.put("mail.smtp.port", "465"); //SMTP Port
         
        // TLS 사용하는 경우
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
         
        // 인증
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
         
        // 메일 세션
        Session session = Session.getInstance(props, auth);
         
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");
         
        msg.setFrom(new InternetAddress(fromEmail, "관리자"));
        msg.setReplyTo(InternetAddress.parse("no_reply@goodcodes.co.kr", false));
 
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        msg.setSentDate(new Date());
 
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg); 




    }
	
	public void sendEmail(){
        try{
            MailExam();
        }catch(Exception e){
        	e.printStackTrace();
            System.out.println("Error");
        }
    }
   
	

	
}
