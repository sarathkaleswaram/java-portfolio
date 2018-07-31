package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;

@Component
public class UserInfoToToUserInfoMapper {

	
	public void map(UserInfoTo userInfoTo,UserInfo userInfo ){

     userInfo.setUserInfoId(userInfoTo.getUserInfoId());
     userInfo.setResource(userInfoTo.getResource());
     userInfo.setPassword(userInfoTo.getPassword());
     userInfo.setSecuriyQuestion(userInfoTo.getSecuriyQuestion());
     userInfo.setAnswer(userInfo.getAnswer());
		
	}
	
	
}
