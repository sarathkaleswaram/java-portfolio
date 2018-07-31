package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.ClientVertical;
import com.projectMatrix.to.ClientVerticalTo;

@Component
public class ClientVerticalToClientVerticalToMapper {

	public void map(ClientVertical clientVertical,ClientVerticalTo clientVerticalTo){
		
	clientVerticalTo.setVerticalId(clientVertical.getVerticalId());
		clientVerticalTo.setVerticalName(clientVertical.getVerticalName());
//		clientVerticalTo.setClients(clientVertical.getClients());
	}
	
	
}
