package com.projectMatrix.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.DeptDao;
import com.projectMatrix.dao.PerformanceDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.dao.SkillsDao;
import com.projectMatrix.dao.SubDeptDao;
import com.projectMatrix.dao.UserInfoDao;
import com.projectMatrix.mapper.DeptToDeptToMapper;
import com.projectMatrix.mapper.PerformanceToPerformanceToMapper;
import com.projectMatrix.mapper.ResourceToResourceToMapper;
import com.projectMatrix.mapper.ResourceToToResourceMapper;
import com.projectMatrix.mapper.SkillsToSkillsToMapper;
import com.projectMatrix.mapper.SkillsToToSkillsMapper;
import com.projectMatrix.mapper.SubDepartmentToSubDepartmentToMapper;
import com.projectMatrix.model.Dept;
import com.projectMatrix.model.Performance;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.Skills;
import com.projectMatrix.model.SubDept;
import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.DeptTo;
import com.projectMatrix.to.PerformanceTo;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.to.SkillsTo;
import com.projectMatrix.to.SubDeptTo;

@Controller
public class ResourceController {

	@Autowired
	SkillsDao skillsDao;

	@Autowired
	SkillsToSkillsToMapper skillsToSkillsToMapper;

	@Autowired
	SkillsToToSkillsMapper skillsToToSkillsMapper;

	@Autowired
	DeptDao deptDao;

	@Autowired
	ResourceDao resourceDao;

	@Autowired
	DeptToDeptToMapper deptToDeptToMapper;

	@Autowired
	SubDeptDao subDeptDao;

	@Autowired
	SubDepartmentToSubDepartmentToMapper subDeptTosubDeptToMapper;

	@Autowired
	PerformanceDao performanceDao;

	@Autowired
	PerformanceToPerformanceToMapper performanceToperformanceToMapper;

	@Autowired
	ResourceToResourceToMapper resourceToResourceToMapper;

	@Autowired
	ResourceToToResourceMapper resourceToToResourceMapper;

	@Autowired
	UserInfoDao userInfoDao;

	private String temp;
	
	// To get the skills from db
	@RequestMapping("skills")
	public @ResponseBody List<SkillsTo> getSkillsList() {

		List<SkillsTo> list = new ArrayList<SkillsTo>();
		List<Skills> all = skillsDao.getAll();

		for (Skills skills : all) {
			SkillsTo skillsTo = new SkillsTo();
			skillsToSkillsToMapper.map(skills, skillsTo);
			list.add(skillsTo);
		}
		return list;
	}

	// To get the dept from db
	@RequestMapping("dept")
	public @ResponseBody List<DeptTo> getDeptList() {

		List<DeptTo> list = new ArrayList<DeptTo>();
		List<Dept> all = deptDao.getAll();

		for (Dept dept : all) {
			DeptTo deptTo = new DeptTo();
			deptToDeptToMapper.map(dept, deptTo);
			list.add(deptTo);
		}
		return list;
	}

	// To get the division from db
	@RequestMapping("division")
	public @ResponseBody List<SubDeptTo> getSubDeptList() {

		List<SubDeptTo> list = new ArrayList<SubDeptTo>();

		List<SubDept> all = subDeptDao.getAll();

		for (SubDept subDept : all) {
			SubDeptTo subDeptTo = new SubDeptTo();

			subDeptTosubDeptToMapper.map(subDept, subDeptTo);
			list.add(subDeptTo);
		}
		return list;
	}

	// To edit the data according to the resource
	@RequestMapping(value = "/resource/edit/{resource_id}/{employeeJson}/{address}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public List<Resource> editResource(@PathVariable long resource_id,
			@PathVariable String employeeJson, @PathVariable String address)
			throws ParseException, JsonParseException, JsonMappingException,
			IOException {

		Resource resource = resourceDao.getById(resource_id);

		System.out.println("edit---------------------------" + address);
		// System.out.println("============"+address);

		ObjectMapper objectMapper = new ObjectMapper();
		ResourceTo resourceTo = objectMapper.readValue(employeeJson,
				ResourceTo.class);
		String json = resourceTo.getSkillsList().toString();
		String json1 = resourceTo.getPerformanceList().toString();

		System.out.println(json);
		resourceTo.setSkills(json);
		resourceTo.setPerformanceLevel(json1);
		
		
		/*if (resourceTo.getLoginpermson() != null) {
			temp=Constants.NO;
		}

		if (resourceTo.getLoginpermson() != null) {
			if (resourceTo.getLoginpermson().equals(Constants.YES)) {
				Resource empId = resourceDao.getById(resource_id);
				
				UserInfo byResourcrId = userInfoDao.getByResourcrId(empId.getResourceId());
				System.out.println("12345==================================="+byResourcrId);
				
				if(byResourcrId==null){
				UserInfo userInfo = new UserInfo();
				userInfo.setDoc(new Date());
				userInfo.setResource(empId);
				userInfo.setPassword(Constants.defaultPassword);
System.out.println("comeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");				
				userInfoDao.saveOrUpdate(userInfo);
				}
			}
		
			if(temp.equals(Constants.NO)||resourceTo.getLoginpermson().equals(Constants.NO)){
				
				
				UserInfo byResourcrId = userInfoDao.getByResourcrId(resource_id);
				
				if(byResourcrId!=null){
				
					
					
					userInfoDao.delete(byResourcrId);
					byResourcrId.setAnswer(null);
				byResourcrId.setPassword(null);
				byResourcrId.setSecuriyQuestion(null);
				userInfoDao.saveOrUpdate(byResourcrId);
				
				}
				
			}
			
		}*/
		
		resourceToResourceToMapper.map(resourceTo, resource);
		resource.setCurntAdress(address);
		resourceDao.saveOrUpdate(resource);

		
	

		return null;
	}

	@RequestMapping(value = "/resourceId/byEmployeeId/{resource_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody ResourceTo getResByResourceId(
			@PathVariable long resource_id) throws ParseException {
		Resource resource = resourceDao.getById(resource_id);
		ResourceTo resourceTo = new ResourceTo();
		resourceToToResourceMapper.map(resource, resourceTo);
		if(resourceTo!=null){
		UserInfo byResourcrId = userInfoDao.getByResourcrId(resource_id);
	if(byResourcrId!=null){
		resourceTo.setLoginpermson(Constants.YES);
		}else{
			resourceTo.setLoginpermson(Constants.NO);
		}
		}
		return resourceTo;

	}

	// To insert the data
	@RequestMapping(value = "/employee/insert/{employeeJson}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<Resource> addEmployee(
			@PathVariable String employeeJson) throws ParseException,
			JsonParseException, JsonMappingException, IOException {

		System.out.println("slkdfjlskdfj-------------" + employeeJson);
		ObjectMapper objectMapper = new ObjectMapper();
		ResourceTo resourceTo = objectMapper.readValue(employeeJson,
				ResourceTo.class);
		String json = resourceTo.getSkillsList().toString();
		String json1 = resourceTo.getPerformanceList().toString();

		System.out.println(json);
		Resource resource = new Resource();
		resourceTo.setSkills(json);
		resourceTo.setPerformanceLevel(json1);
		resourceToResourceToMapper.map(resourceTo, resource);

		resourceDao.saveOrUpdate(resource);

		if (resourceTo.getLoginpermson() != null) {

			if (resourceTo.getLoginpermson().equals(Constants.YES)) {
				Resource empId = resourceDao.getByEmpId(resourceTo.getEmpId());
				UserInfo userInfo = new UserInfo();
				userInfo.setDoc(new Date());
				userInfo.setResource(empId);
				userInfo.setPassword("cent123");
				userInfoDao.saveOrUpdate(userInfo);

			}

		}

		return null;

	}

	// To get the performance data from db
	@RequestMapping("performance")
	public @ResponseBody List<PerformanceTo> getPerformanceList() {

		List<PerformanceTo> list = new ArrayList<PerformanceTo>();

		List<Performance> all = performanceDao.getAll();

		for (Performance performance : all) {
			PerformanceTo performanceTo = new PerformanceTo();

			performanceToperformanceToMapper.map(performance, performanceTo);
			list.add(performanceTo);
		}
		return list;
	}

	// To get all the resources from db
	@RequestMapping(value = "employeeView", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ResourceTo> getJobList() {
		List<Resource> ResourceList = new ArrayList<Resource>();

		ResourceList = resourceDao.getAll();

		System.out.println(ResourceList.size());

		List<ResourceTo> alist = new ArrayList<ResourceTo>();

		for (Resource resources : ResourceList) {
			ResourceTo resourceTo = new ResourceTo();

			resourceToToResourceMapper.map(resources, resourceTo);
			alist.add(resourceTo);
		}

		return alist;
	}
}
