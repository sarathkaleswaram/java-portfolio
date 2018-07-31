package com.projectMatrix.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.projectMatrix.model.Project;
import com.projectMatrix.to.UploadTo;


@Component
public class ProjectValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Project.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UploadTo uploadTo=(UploadTo)target;
		if(uploadTo.getJobsFile().isEmpty()){
		errors.rejectValue("jobsFile", "required.excel");
		}
		
		
	}
	
}
