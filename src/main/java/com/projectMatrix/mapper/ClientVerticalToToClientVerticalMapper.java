package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.ClientVertical;
import com.projectMatrix.to.ClientVerticalTo;

@Component
public class ClientVerticalToToClientVerticalMapper {
	
	public void map(ClientVerticalTo clientVerticalTo,ClientVertical clientVertical){
		
	clientVertical.setVerticalId(clientVerticalTo.getVerticalId());
	clientVertical.setVerticalName(clientVerticalTo.getVerticalName());
//	clientVertical.setClients(clientVerticalTo.getClients());;
	}

}
