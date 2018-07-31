package com.projectMatrix.commons;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class MailService {

	
	
	
	 public void sendMail(final String mailBody, final String subject, final String[] addresses,final String EmailTo) {
	        Properties props = new Properties();
	        props.put("mail.smtp.host", "smtpout.secureserver.net");
	        props.put("mail.smtp.socketFactory.port", "25");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "25");

	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("smarttracker@centillionnetworks.com", "solutions123");
	            }
	        });

	        Address[] addressArr = new Address[addresses.length];

	        if(addresses!=null){
	        int count = 0;
	        for (String addressStr : addresses) {
	            try {
	                addressArr[count] = new InternetAddress(addressStr);
	                count++;
	            }
	            catch (AddressException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        }
	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(EmailTo));
	            message.setRecipients(Message.RecipientType.CC, addressArr);
	            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.setSubject(subject);
	            
	            message.setContent(mailBody, "text/html");
	            
	            System.out.println("cominggggggggggggggsssssssssssssssssssssssssss");
	            Transport.send(message);
	        }
	        catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	
	

		
	 public void sendMailWithOutCc(final String mailBody, final String subject, final String EmailTo) {
	        Properties props = new Properties();
	        props.put("mail.smtp.host", "smtpout.secureserver.net");
	        props.put("mail.smtp.socketFactory.port", "25");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "25");

	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("smarttracker@centillionnetworks.com", "solutions123");
	            }
	        });
	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(EmailTo));
	            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.setSubject(subject);
	            message.setContent(mailBody, "text/html");
	            System.out.println("cominggggggggggggggsssssssssssssssssssssssssss");
	            Transport.send(message);
	        }
	        catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	 public void sendMailWithBcc(final String mailBody, final String subject, final String[] addresses,final String EmailTo,final String bcc) {
		  Properties props = new Properties();
	        props.put("mail.smtp.host", "smtpout.secureserver.net");
	        props.put("mail.smtp.socketFactory.port", "25");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "25");

	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("smarttracker@centillionnetworks.com", "solutions123");
	            }
	        });

	        Address[] addressArr = new Address[addresses.length];

	        if(addresses!=null){
	        int count = 0;
	        for (String addressStr : addresses) {
	            try {
	                addressArr[count] = new InternetAddress(addressStr);
	                count++;
	            }
	            catch (AddressException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        }
	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(EmailTo));
	            message.setRecipients(Message.RecipientType.CC, addressArr);
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(bcc));
	            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("smarttracker@centillionnetworks.com"));
	            message.setSubject(subject);
	            
	            message.setContent(mailBody, "text/html");
	            
	            System.out.println("cominggggggggggggggsssssssssssssssssssssssssss");
	            Transport.send(message);
	        }
	        catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	
	
	
}
