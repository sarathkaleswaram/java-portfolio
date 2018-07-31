package com.projectMatrix.to;

import java.util.Date;

public class ActionPointTrackerTo {

	private Long aptId;
	private Long resourceByAssignedFromId;
	private String resourceByAssignedFrom;
	private String resourceByAssignedTo;
	private Long resourceByAssignedToId;
	private String createdDate;
	private String startDate;
	private String endDate;
	private String subject;
	private String description;
	private String priority;
	private String status;
	private int[] stackHolders;
	private String stackHoldersNames;
	
	public Long getAptId() {
		return aptId;
	}
	public void setAptId(Long aptId) {
		this.aptId = aptId;
	}
	public String getResourceByAssignedFrom() {
		return resourceByAssignedFrom;
	}
	public Long getResourceByAssignedFromId() {
		return resourceByAssignedFromId;
	}
	public String getStackHoldersNames() {
		return stackHoldersNames;
	}
	public void setStackHoldersNames(String stackHoldersNames) {
		this.stackHoldersNames = stackHoldersNames;
	}
	public void setResourceByAssignedFromId(Long resourceByAssignedFromId) {
		this.resourceByAssignedFromId = resourceByAssignedFromId;
	}
	public Long getResourceByAssignedToId() {
		return resourceByAssignedToId;
	}
	public void setResourceByAssignedToId(Long resourceByAssignedToId) {
		this.resourceByAssignedToId = resourceByAssignedToId;
	}
	public void setResourceByAssignedFrom(String resourceByAssignedFrom) {
		this.resourceByAssignedFrom = resourceByAssignedFrom;
	}
	public String getResourceByAssignedTo() {
		return resourceByAssignedTo;
	}
	public void setResourceByAssignedTo(String resourceByAssignedTo) {
		this.resourceByAssignedTo = resourceByAssignedTo;
	}
	
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int[] getStackHolders() {
		return stackHolders;
	}
	public void setStackHolders(int[] stackHolders) {
		this.stackHolders = stackHolders;
	}
	
	
	
}
