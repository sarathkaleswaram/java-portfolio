package com.projectMatrix.webservices;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.dao.UserInfoDao;
import com.projectMatrix.mapper.ResourceToToResourceMapper;
import com.projectMatrix.mapper.UserInfoToUserInfoToMapper;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.to.UserInfoTo;
import com.projectMatrix.to.WsResourceTo;

@Controller
public class LoginWsController {

	@Autowired
	UserInfoDao userInfoDao;
	@Autowired
	UserInfoToUserInfoToMapper userInfoToUserInfoToMapper;
	@Autowired
	HttpSession httpSession;
	@Autowired
	ResourceDao resourceDao; 
	
	@Autowired
	ResourceToToResourceMapper resourceToToResourceMapper;
	
	@RequestMapping(value = "loginws", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> loginWS(
			 HttpServletRequest httpServletRequest,@RequestHeader("empid") final String empid,@RequestHeader("password") final String password,ModelMap map ) {

		Map<String, Object> map2 = new HashMap<String, Object>();		
		UserInfo byUserName = userInfoDao.getByUserNamews(empid);

		if (byUserName != null) { 
			if (byUserName.getPassword().equals(password)) {

				UserInfoTo infoTo = new UserInfoTo();

				userInfoToUserInfoToMapper.map(byUserName, infoTo);
				httpServletRequest.getSession().setAttribute("sessionobject",
						infoTo);
				map2.put("firstName", infoTo.getResource().getFirstName()+""+infoTo.getResource().getLastName());
				map2.put("email", infoTo.getResource().getOfficialEmail());
				map2.put("success", 1);
             
             return map2;
			}
		}
		map2.put("InvalidCredentials", 0);
		return map2;
		
	}
	@RequestMapping(value = "empListWs", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<WsResourceTo> getJobList() {
		List<Resource> ResourceList = new ArrayList<Resource>();
		ResourceList = resourceDao.getAllByrollWs();
		List<WsResourceTo> alist = new ArrayList<WsResourceTo>();
		for (Resource resources : ResourceList) {
			
			WsResourceTo to= new WsResourceTo();
			resourceToToResourceMapper.wsMap(resources, to);
			alist.add(to);
		}

		return alist;
	}
	
}
