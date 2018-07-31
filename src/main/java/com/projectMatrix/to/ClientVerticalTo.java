package com.projectMatrix.to;

import java.util.HashSet;
import java.util.Set;

import com.projectMatrix.model.Client;

public class ClientVerticalTo {
	
	private Integer verticalId;
	private String verticalName;
	private Set<Client> clients = new HashSet<Client>(0);
	public Integer getVerticalId() {
		return verticalId;
	}
	public void setVerticalId(Integer verticalId) {
		this.verticalId = verticalId;
	}
	public String getVerticalName() {
		return verticalName;
	}
	public void setVerticalName(String verticalName) {
		this.verticalName = verticalName;
	}
	public Set<Client> getClients() {
		return clients;
	}
	public void setClients(Set<Client> clients) {
		this.clients = clients;
	}
}
