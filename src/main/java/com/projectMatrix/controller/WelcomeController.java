package com.projectMatrix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@RequestMapping("dashboard.htm")
	public ModelAndView welcome(Model model){
		return new ModelAndView("dashboard/dashboard");
	}
	@RequestMapping("centillion")
	public ModelAndView login(Model model){
		return new ModelAndView("landingpage");
	}
	@RequestMapping("jobs.htm")
	public ModelAndView emp(Model model){
		return new ModelAndView("jobs/jobs");
	}
	
	@RequestMapping("client.htm")
	public ModelAndView client(Model model){
		return new ModelAndView("client/client");
	}
	
	@RequestMapping("invoice.htm")
	public ModelAndView invoice(Model model){
		return new ModelAndView("invoice/invoice");
	}
	@RequestMapping("allocatedtask.htm")
	public ModelAndView allocatedtask(Model model){
		return new ModelAndView("mytask/allocatedtask");
	}
	@RequestMapping("mytask.htm")
	public ModelAndView mytask(Model model){
		return new ModelAndView("mytask/mytask");
	}
	@RequestMapping("project.htm")
	public ModelAndView project(Model model){
		return new ModelAndView("project/project");
	}
	@RequestMapping("report.htm")
	public ModelAndView upload(Model model){
		return new ModelAndView("reports/projectStatusReport");
	}
	@RequestMapping("deliveryStatus.htm")
	public ModelAndView delivery(Model model){
		return new ModelAndView("reports/projectDeliveryStatusReport");
	}
	@RequestMapping("dual")
	public ModelAndView dual(Model model){
		return new ModelAndView("dual/dual");
	}
	@RequestMapping("employee")
	public ModelAndView employee(Model model){
		return new ModelAndView("employee/employee");
	}
	
	@RequestMapping("efficiencyStatus.htm")
	public ModelAndView jobEfficiency(Model model){
		return new ModelAndView("reports/projectEfficiencyReport");
	}
	@RequestMapping("workedOnReport.htm")
	public ModelAndView workedOnReport(Model model){
		return new ModelAndView("reports/workedOnReport");
	}
	@RequestMapping("delivered.htm")
	public ModelAndView DeliverCompleted(Model model){
		return new ModelAndView("jobs/deliveryCompleted");
	}
	
	@RequestMapping("/")
	public ModelAndView landingPage(Model model){
		return new ModelAndView("redirect:/centillion");
	}
	/*
	@RequestMapping("inbox.htm")
	public ModelAndView inboxAPT(Model model){
		return new ModelAndView("apt/inbox");
	}*/
	@RequestMapping("test")
	public ModelAndView test(Model model){
		return new ModelAndView("employeeScreen/emp");
	}
	
/*	@RequestMapping("compose.htm")
	public ModelAndView sentAPT(Model model){
		return new ModelAndView("apt/compose");
	}*/
	
	
/*	@RequestMapping("change.htm")
	public ModelAndView change(Model model){
		return new ModelAndView("login/changePassword");
	}*/
}
