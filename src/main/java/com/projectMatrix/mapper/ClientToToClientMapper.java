package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Client;
import com.projectMatrix.to.ClientTo;

@Component
public class ClientToToClientMapper {

	public void map(ClientTo clientTo,Client client){
         client.setClientId(clientTo.getClientId());
         client.setClientName(clientTo.getClientName());
//         client.setClientVertical(clientTo.getC);
//        client.setProjects(clientTo.getProjects());
	}
} 
