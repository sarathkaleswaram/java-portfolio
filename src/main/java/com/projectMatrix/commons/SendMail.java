package com.projectMatrix.commons;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	
	
	 public static void main(final String[] args) {
	        Properties props = new Properties();
	        props.put("mail.smtp.host", "smtpout.secureserver.net");
	        props.put("mail.smtp.socketFactory.port", "25");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "25");

	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("varun.madala@centillionnetworks.com", "yoga.666");
	            }
	        });

	        try {

	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("varun.madala@centillionnetworks.com"));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("balachandar.reddy@centillionnetworks.com"));
	            message.setSubject("Testing Subject");
	            message.setText("Dear Mail Crawler," + "\n\n No spam to my email, please!"+"\n\n be patient --testing , please!");

	            Transport.send(message);
	            System.out.println("comingggg");
	        }
	        catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
	    }
	
	
	
	
	
	
	
	
	
}
