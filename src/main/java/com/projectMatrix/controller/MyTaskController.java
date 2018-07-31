package com.projectMatrix.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.projectMatrix.dao.WorkBenchDao;
import com.projectMatrix.mapper.WorkBenchToWorkBenchToMapper;
import com.projectMatrix.model.Client;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.WorkBench;
import com.projectMatrix.to.ClientTo;
import com.projectMatrix.to.WorkBenchTo;
import com.projectMatrix.utils.DateUtil;

@Controller
public class MyTaskController {

	@Autowired
	WorkBenchDao workBenchDao;

	@Autowired
	BasicUserInfo basicUserInfo;

	@Autowired
	WorkBenchToWorkBenchToMapper workBenchToWorkBenchToMapper;


	//To  getJobsList according to the employee Login
	@RequestMapping(value = "/myTaskjson/{myTaskjson:.+}", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public @ResponseBody void getJobsList(@PathVariable String myTaskjson)
			throws JsonParseException, JsonMappingException, IOException {

		WorkBench byResourceIdAndDate = workBenchDao.getByResourceIdAndDate(
				basicUserInfo.getUser().getResource().getResourceId(),
				new Date());
		
		ObjectMapper objectMapper = new ObjectMapper();
		
//		System.out.println("my task json==========================="+myTaskjson);
		if (byResourceIdAndDate == null) {

			WorkBench workBench = objectMapper.readValue(myTaskjson,
					WorkBench.class);
			
//			System.out.println("on bench==========================="+workBench.getOnBench());

			workBench.setDoc(new Date());
			workBench.setResource(basicUserInfo.getUser().getResource());
			workBenchDao.saveOrUpdate(workBench);

		} else {
//			System.out.println("id========================================="+byResourceIdAndDate.getWorkBenchId());
			
			WorkBench workBench = objectMapper.readValue(myTaskjson,
					WorkBench.class);
			
			byResourceIdAndDate.setInTraining(workBench.getInTraining());
			byResourceIdAndDate.setOnBench(workBench.getOnBench());
			byResourceIdAndDate.setPM(workBench.getPM());
			byResourceIdAndDate.setOthers(workBench.getOthers());
			byResourceIdAndDate.setWorkedOn(workBench.getWorkedOn());
			byResourceIdAndDate.setRemarks(workBench.getRemarks());
			
		/*	if(byResourceIdAndDate.getInTraining()!=null){
			byResourceIdAndDate.setInTraining(workBench.getInTraining());
			}
			if(byResourceIdAndDate.getOnBench()!=null){
			byResourceIdAndDate.setOnBench(workBench.getOnBench());
			}
			if(byResourceIdAndDate.getPM()!=null){
			byResourceIdAndDate.setPM(workBench.getPM());
			}
			if(byResourceIdAndDate.getOthers()!=null){
			byResourceIdAndDate.setOthers(workBench.getOthers());
			}
			if(byResourceIdAndDate.getWorkedOn()!=null){
			byResourceIdAndDate.setWorkedOn(workBench.getWorkedOn());
			}
			if(byResourceIdAndDate.getRemarks()!=null){
			byResourceIdAndDate.setRemarks(workBench.getRemarks());
			}*/
			
			 
			workBenchDao.saveOrUpdate(byResourceIdAndDate);
		}
	}

	//To get My Task List according to the user
	@RequestMapping(value = "myTaskListByUser", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<WorkBenchTo> getTaskListByUser() {
		List<WorkBenchTo> alist = new ArrayList<WorkBenchTo>();

		List<WorkBench> byUser = workBenchDao.getByUser(basicUserInfo.getUser()
				.getResourceId());

		for (WorkBench workBench : byUser) {
			WorkBenchTo benchTo = new WorkBenchTo();
			workBenchToWorkBenchToMapper.map(workBench, benchTo);
			if(benchTo.getInTraining()!=null||benchTo.getOnBench()!=null||benchTo.getPM()!=null||benchTo.getOthers()!=null||benchTo.getWorkedOn()!=null){
			alist.add(benchTo);
			}
		}
		
		return alist;
	}



}
