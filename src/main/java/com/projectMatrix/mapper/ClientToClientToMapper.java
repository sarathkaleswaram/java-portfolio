package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Client;
import com.projectMatrix.to.ClientTo;

@Component
public class ClientToClientToMapper {

	public void map(Client client, ClientTo clientTo) {
		clientTo.setClientId(client.getClientId());
		clientTo.setClientName(client.getClientName());
		clientTo.setClientVertical(client.getClientVertical().getVerticalName());
//		clientTo.setProjects(client.getProjects());
	}
}
