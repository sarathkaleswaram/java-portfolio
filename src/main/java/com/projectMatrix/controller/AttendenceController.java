package com.projectMatrix.controller;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendenceController {
	Socket requestSocket;
	ObjectOutputStream out;
	ObjectInputStream in;
	String message;

	void run() throws IOException {
    try {
    	
    	
        // 1. creating a socket to connect to the server
        requestSocket = new Socket("192.168.1.251", 4370);
        System.out.println("Connected to given host in port 4370");
        // 2. get Input and Output streams
        System.out.println("server:==============="+requestSocket.getInputStream());
       
//        ObjectOutputStream outputStream  = new ObjectOutputStream();
        
        ObjectInputStream in = new ObjectInputStream(requestSocket.getInputStream());
        
//        PrintWriter writer = new PrintWriter(requestSocket.getOutputStream(), true);
        
     System.out.println(in.readLine());
            
        // 3: Communicating with the server
        String line;
        while (true) {
            line = in.readLine();
            if (line != null) {
                System.out.println(line);
            }
        }
    } catch (UnknownHostException unknownHost) {
        System.err.println("You are trying to connect to an unknown host!");

    } catch (IOException ioException) {
    	System.out.println("ioexe");
        ioException.printStackTrace();

    } catch (Exception Exception) {
    	System.out.println("pst");
        Exception.printStackTrace();

    } finally {
        in.close();
        requestSocket.close();
    }
}

void sendMessage(String msg) {
    try {
        out.writeObject(msg);
        out.flush();
        System.out.println("client: " + msg);

    } catch (IOException ioException) {
        ioException.printStackTrace();
    }
}
	
	@RequestMapping("attendence")
	 void biometric() throws IOException{
		
		
		AttendenceController client = new AttendenceController();
		    client.run();
	
	}
	
	
	
	
	
	
	
	
	
}
