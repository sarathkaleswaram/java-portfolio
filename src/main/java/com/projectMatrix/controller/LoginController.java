package com.projectMatrix.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.projectMatrix.dao.UserInfoDao;
import com.projectMatrix.mapper.UserInfoToUserInfoToMapper;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;

@Controller
public class LoginController {

	@Autowired
	UserInfoDao userInfoDao;
	@Autowired
	UserInfoToUserInfoToMapper userInfoToUserInfoToMapper;
	@Autowired
	HttpSession httpSession;

	private String question = "";
	private Resource resource;

	/*
	 * @RequestMapping("login") public ModelAndView login(Model model) {
	 * model.addAttribute("loginForm", new UserInfoTo()); return new
	 * ModelAndView("login/login"); }
	 * 
	 * @RequestMapping(value = "login", method = RequestMethod.POST) public
	 * ModelAndView login(
	 * 
	 * @ModelAttribute("loginForm") UserInfoTo userInfoTo, Model model,
	 * HttpServletRequest httpServletRequest) { model.addAttribute("loginForm",
	 * userInfoTo); // System.out.println(userInfoTo); UserInfo byUserName =
	 * userInfoDao.getByUserName(userInfoTo .getResource());
	 * 
	 * if (byUserName != null) { System.out.println("not null"); if
	 * (byUserName.getPassword().equals(userInfoTo.getPassword())) {
	 * 
	 * UserInfoTo infoTo = new UserInfoTo();
	 * 
	 * userInfoToUserInfoToMapper.map(byUserName, infoTo); //
	 * System.out.println(infoTo.getPassword()); //
	 * System.out.println(infoTo.getResource().getResourceId());
	 * httpServletRequest.getSession().setAttribute("sessionobject", infoTo);
	 * 
	 * // System.out.println("login"+httpSession.getAttribute("sessionobject"));
	 * 
	 * return new ModelAndView("redirect:/dashboard.htm"); } } //
	 * System.out.println("null is coming"); model.addAttribute("message",
	 * "Incorrect Credentials"); return new ModelAndView("login/login"); }
	 */

	// logout code
	@RequestMapping("logout")
	public ModelAndView logout(final HttpServletRequest httpServletRequest) {
		System.out
				.println("logout" + httpSession.getAttribute("sessionobject"));
		httpServletRequest.getSession().invalidate();
		return new ModelAndView("redirect:/centillion");
	}

	// login get code
	@RequestMapping("login")
	public ModelAndView login(Model model) {
		model.addAttribute("loginForms", new UserInfoTo());
		return new ModelAndView("login/newLogin");
	}

	// login post code
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(
			@ModelAttribute("loginForms") UserInfoTo userInfoTo, Model model,
			HttpServletRequest httpServletRequest) {
		model.addAttribute("loginForms", userInfoTo);
		// System.out.println(userInfoTo);
		UserInfo byUserName = userInfoDao.getByUserName(userInfoTo
				.getResource());

		if (byUserName != null) {
			System.out.println("not null");
			if (byUserName.getPassword().equals(userInfoTo.getPassword())) {

				UserInfoTo infoTo = new UserInfoTo();

				userInfoToUserInfoToMapper.map(byUserName, infoTo);
				// System.out.println(infoTo.getPassword());
				// System.out.println(infoTo.getResource().getResourceId());
				httpServletRequest.getSession().setAttribute("sessionobject",
						infoTo);

				// System.out.println("login"+httpSession.getAttribute("sessionobject"));

				return new ModelAndView("redirect:/dashboard.htm");
			}
		}
		// System.out.println("null is coming");
		model.addAttribute("message", "Incorrect Credentials");
		return new ModelAndView("login/newLogin");
	}

	// forgotPassword get code
	@RequestMapping("forgotPassword")
	public ModelAndView forgotPassword(Model model) {
		model.addAttribute("forgotPassword", new UserInfoTo());
		return new ModelAndView("login/forgotPassword");
	}

	// forgotPassword post code
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public ModelAndView forgotPassword(
			@ModelAttribute("forgotPassword") UserInfoTo userInfoTo,
			Model model, HttpServletRequest httpServletRequest) {

		model.addAttribute("forgotPassword", userInfoTo);
		UserInfo byUserName = userInfoDao.getByUserName(userInfoTo
				.getResource());
		resource = userInfoTo.getResource();

		if (byUserName == null) {
			model.addAttribute("message", "Employee ID does not Exist");
			return new ModelAndView("login/forgotPassword");
		} else {
			if (byUserName.getSecuriyQuestion() == null) {
				model.addAttribute("message",
						"Use your Default Password to Login. You will be redirected to the Login page Shortly.");
				return new ModelAndView("login/forgotPassword");
			} else {
				question = byUserName.getSecuriyQuestion();
				return new ModelAndView("redirect:/confirmSecurityQuestion");
			}
		}
	}

	// confirmSecurityQuestion get code
	@RequestMapping("confirmSecurityQuestion")
	public ModelAndView confirmSecurityQuestion(Model model) {
		model.addAttribute("confirmSecurityQuestion", new UserInfoTo());
		return new ModelAndView("login/confirmSecurityQuestion");
	}

	// confirmSecurityQuestion post code
	@RequestMapping(value = "confirmSecurityQuestion", method = RequestMethod.POST)
	public ModelAndView confirmSecurityQuestion(
			@ModelAttribute("confirmSecurityQuestion") UserInfoTo userInfoTo,
			Model model, HttpServletRequest httpServletRequest) {

		model.addAttribute("confirmSecurityQuestion", userInfoTo);
		UserInfo byUserName = userInfoDao.getByUserName(resource);
		if (byUserName.getAnswer().equalsIgnoreCase(userInfoTo.getAnswer())) {
			return new ModelAndView("redirect:/confirmPassword");
		} else {
			model.addAttribute("message", "Incorrect Answer");
			return new ModelAndView("login/confirmSecurityQuestion");
		}

	}

	// get job by id
	@RequestMapping(value = "/getSecurityQuestionByUserId", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody UserInfoTo getJobById() {
		UserInfoTo userInfoTo = new UserInfoTo();
		userInfoTo.setSecuriyQuestion(question);
		return userInfoTo;
	}

	// confirmPassword get code
	@RequestMapping("confirmPassword")
	public ModelAndView confirmPassword(Model model) {
		model.addAttribute("confirmPassword", new UserInfoTo());
		return new ModelAndView("login/confirmPassword");
	}

	// confirmPassword post code
	@RequestMapping(value = "confirmPassword", method = RequestMethod.POST)
	public ModelAndView confirmPassword(
			@ModelAttribute("confirmPassword") UserInfoTo userInfoTo,
			Model model, HttpServletRequest httpServletRequest) {

		model.addAttribute("confirmPassword", userInfoTo);
		if (resource == null) {
			model.addAttribute("error", "Invalid Request.");
			return new ModelAndView("login/confirmPassword");
		}
		UserInfo byUserName = userInfoDao.getByUserName(resource);
		byUserName.setPassword(userInfoTo.getPassword());
		userInfoDao.saveOrUpdate(byUserName);
		model.addAttribute("success", "Password Changed Successfully");
		return new ModelAndView("login/confirmPassword");

	}



}
