package com.projectMatrix.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.projectMatrix.to.UserInfoTo;

@Component
public class ChangePasswordValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return UserInfoTo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserInfoTo userInfoTo =(UserInfoTo)target;
		if(userInfoTo.getPassword()!=null){
			errors.rejectValue("password", "required.excel");
		
	}
		
	
	
	
	}
}
