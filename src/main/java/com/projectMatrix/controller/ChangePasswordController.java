package com.projectMatrix.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.projectMatrix.dao.UserInfoDao;
import com.projectMatrix.mapper.UserInfoToUserInfoToMapper;
import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;
import com.projectMatrix.validations.ChangePasswordValidator;

@Controller
public class ChangePasswordController {
	@Autowired
	UserInfoDao userInfoDao;
	@Autowired
	UserInfoToUserInfoToMapper userInfoToUserInfoToMapper;
	@Autowired
	BasicUserInfo basicUserInfo;
	@Autowired
	ChangePasswordValidator changePasswordValidator; 
	
	//changePassword get page
	@RequestMapping("changePassword")
	public ModelAndView changePassword(Model model) {
		model.addAttribute("changePasswordForm", new UserInfoTo());
		return new ModelAndView("login/changePassword");
	}

	//changePassword post page
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public ModelAndView changePassword1(@ModelAttribute("changePasswordForm") UserInfoTo userInfoTo, Model model,BindingResult result) {
		
		
		model.addAttribute("changePasswordForm", userInfoTo);

		UserInfo getById = userInfoDao.getById(basicUserInfo.getUser().getUserInfoId());
		
		System.out.println("coming old password======================"+userInfoTo.getOldPassword());
		 if(getById!=null){
				 
			 getById.setPassword(userInfoTo.getReEnterPassword());
			 getById.setDoc(new Date());
			 getById.setSecuriyQuestion(userInfoTo.getSecuriyQuestion());
			 getById.setAnswer(userInfoTo.getAnswer());
			 userInfoDao.saveOrUpdate(getById);
		
			 changePasswordValidator.validate(userInfoTo, result);
			 if(result.hasErrors()){
			 model.addAttribute("success", "Password Changed Successfully");
				return new ModelAndView("login/changePassword");
			 }
		 }
		 
			return new ModelAndView("redirect:/changePassword");
	}	
	
	
	@RequestMapping(value = "data", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody UserInfoTo changePassword1() {
		UserInfo getById = userInfoDao.getById(basicUserInfo.getUser().getUserInfoId());
		UserInfoTo userInfoTo = new UserInfoTo();
		userInfoToUserInfoToMapper.map2(getById, userInfoTo);
			return userInfoTo;
	}	
	
	
}
