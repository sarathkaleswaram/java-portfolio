package com.projectMatrix.to;

import java.util.Date;

import com.projectMatrix.model.Resource;

public class UserInfoTo {

	private Long userInfoId;
	private Resource resource;
	private String password;
	private String ReEnterPassword;
	private String oldPassword;
	private String securiyQuestion;
	private String answer;
	
	private long resourceId;
	private String designationByUser;
	
	
	public String getReEnterPassword() {
		return ReEnterPassword;
	}

	public void setReEnterPassword(String reEnterPassword) {
		ReEnterPassword = reEnterPassword;
	}

	
	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getDesignationByUser() {
		return designationByUser;
	}

	public void setDesignationByUser(String designationByUser) {
		this.designationByUser = designationByUser;
	}

	public long getResourceId() {
		return resourceId;
	}

	public void setResourceId(long resourceId) {
		this.resourceId = resourceId;
	}

	private Date doc;

	public Long getUserInfoId() {
		return userInfoId;
	}

	public void setUserInfoId(Long userInfoId) {
		this.userInfoId = userInfoId;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecuriyQuestion() {
		return securiyQuestion;
	}

	public void setSecuriyQuestion(String securiyQuestion) {
		this.securiyQuestion = securiyQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getDoc() {
		return doc;
	}

	public void setDoc(Date doc) {
		this.doc = doc;
	}

}
