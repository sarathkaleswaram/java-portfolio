package com.projectMatrix.to;


public class TeamMembersTo {
	private long tmId;
	private long project;
	private long resourceId;
	private String firstName;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	private String keyResourceIndication;
	
	public long getTmId() {
		return tmId;
	}
	public void setTmId(long tmId) {
		this.tmId = tmId;
	}
	public void setTmId(Integer tmId) {
		this.tmId = tmId;
	}

	public long getProject() {
		return project;
	}
	public void setProject(long project) {
		this.project = project;
	}
	
	public long getResourceId() {
		return resourceId;
	}
	public void setResourceId(long resourceId) {
		this.resourceId = resourceId;
	}
	public String getKeyResourceIndication() {
		return keyResourceIndication;
	}
	public void setKeyResourceIndication(String keyResourceIndication) {
		this.keyResourceIndication = keyResourceIndication;
	}
	

}
