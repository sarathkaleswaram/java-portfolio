package com.projectMatrix.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.dao.UserInfoDao;
import com.projectMatrix.mapper.ResourceAllocationToResourceAllocationToMapper;
import com.projectMatrix.mapper.UserInfoToToUserInfoMapper;
import com.projectMatrix.mapper.UserInfoToUserInfoToMapper;
import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;

@Component
@Controller
public class BasicUserInfo {
	@Autowired
	HttpSession httpSession;
	@Autowired
	UserInfoDao userInfoDao;
	@Autowired
	ResourceAllocationDao resourceAllocationDao;
	@Autowired
	UserInfoToToUserInfoMapper userInfoToToUserInfoMapper;
	@Autowired
	UserInfoToUserInfoToMapper userInfoToUserInfoToMapper;
	@Autowired
	ResourceAllocationToResourceAllocationToMapper resourceAllocationToResourceAllocationToMapper;

	//get User Session
	@RequestMapping("getuser")
	public @ResponseBody UserInfoTo getUser() {

		UserInfoTo userInfoto =  (UserInfoTo) httpSession
				
				.getAttribute("sessionobject");
		
		return userInfoto;
	
	} 

	//get user session by login
	@RequestMapping("user")
	public @ResponseBody UserInfoTo getUserByLogin() {
		UserInfo userInfo = (UserInfo) httpSession.getAttribute("session");
		if (userInfo != null) {
			UserInfo byUserName = userInfoDao.getByUserName(userInfo
					.getResource());

			UserInfoTo userInfoTo = new UserInfoTo();
			userInfoToUserInfoToMapper.map(byUserName, userInfoTo);
			System.out.println(userInfoTo.getResource().getEmpId());
			return userInfoTo;
		}
		System.out.println("null is coming");
		return null;
	}
	

}
