package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;

@Component
public class UserInfoToUserInfoToMapper {

	public void map(UserInfo userInfo, UserInfoTo userInfoTo) {

		userInfoTo.setUserInfoId(userInfo.getUserInfoId());
		userInfoTo.setResource(userInfo.getResource());
		userInfoTo.setPassword(userInfo.getPassword());
		userInfoTo.setSecuriyQuestion(userInfo.getSecuriyQuestion());
		userInfoTo.setAnswer(userInfo.getAnswer());
		userInfoTo.setResourceId(userInfo.getResource().getResourceId());
		userInfoTo.setDesignationByUser(userInfo.getResource().getDesignation());
	}

	
	public void map2(UserInfo userInfo, UserInfoTo userInfoTo) {

		userInfoTo.setUserInfoId(userInfo.getUserInfoId());
//		userInfoTo.setResource(userInfo.getResource());
		userInfoTo.setPassword(userInfo.getPassword());
		userInfoTo.setSecuriyQuestion(userInfo.getSecuriyQuestion());
		userInfoTo.setAnswer(userInfo.getAnswer());
		userInfoTo.setResourceId(userInfo.getResource().getResourceId());
		userInfoTo.setDesignationByUser(userInfo.getResource().getDesignation());
	}

	
}
