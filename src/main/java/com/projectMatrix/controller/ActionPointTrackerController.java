package com.projectMatrix.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.projectMatrix.commons.MailService;
import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.ActionPointTrackerDao;
import com.projectMatrix.dao.AptRemarksDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.mapper.APTToAPTToMapper;
import com.projectMatrix.mapper.APTToToAPTMapper;
import com.projectMatrix.mapper.AptRemarksToAptRemarksToMapper;
import com.projectMatrix.mapper.ResourceToToResourceMapper;
import com.projectMatrix.model.ActionPointTracker;
import com.projectMatrix.model.AptRemarks;
import com.projectMatrix.model.Resource;
import com.projectMatrix.to.ActionPointTrackerTo;
import com.projectMatrix.to.AptRemarksTo;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.utils.DateUtil;

@Controller
public class ActionPointTrackerController {

	@Autowired
	ActionPointTrackerDao actionPointTrackerDao;
	@Autowired
	ResourceDao resourceDao;
	@Autowired
	ResourceToToResourceMapper resourceToToResourceMapper;
	@Autowired
	BasicUserInfo basicUserInfo;
	@Autowired
	APTToToAPTMapper aPTToToAPTMapper;
	@Autowired
	APTToAPTToMapper aPTToAPTToMapper;
	@Autowired
	AptRemarksDao aptRemarksDao;
	@Autowired
	AptRemarksToAptRemarksToMapper aptRemarksToAptRemarksToMapper;
@Autowired
MailService mailService;
	
	
	public String to="";
	public String Eto="";
	public String ESubject ="";
	public String Efrom="";
	public String Edescription="";
	public String EStatus="";
	public String bcc="";
	// for getting Resource Names in Compose for To drop down 
	@RequestMapping(value = "getToResource", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ResourceTo> getToResourceList()
			throws ParseException {

		List<Resource> resources = new ArrayList<Resource>();
		List<ResourceTo> alist = new ArrayList<ResourceTo>();

		if (basicUserInfo.getUser().getResource().getRole()
				.equals(Constants.SuperAdmin)) {
			resources = resourceDao.getResourceUnderSuperAdmin();
		}
		if (basicUserInfo.getUser().getResource().getRole()
				.equals(Constants.Admin)) {
			resources = resourceDao.getResourceUnderAdmin();
		}
		if (basicUserInfo.getUser().getResource().getRole()
				.equals(Constants.Manager)) {
			resources = resourceDao.getResourceUnderManager();
		}
		if (basicUserInfo.getUser().getResource().getRole()
				.equals(Constants.TeamLead)) {
			resources = resourceDao.getResourceUnderTeamLead();
		}

		for (Resource resource : resources) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			alist.add(resourceTo);
		}
		return alist;
	}

	// for getting Resource Names in compose cc dropdown
	@RequestMapping(value = "getCcResource", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ResourceTo> getCcResourceList()
			throws ParseException {
		List<Resource> resources = resourceDao.getResourceUnderSuperAdmin();
		List<ResourceTo> alist = new ArrayList<ResourceTo>();
		for (Resource resource : resources) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.ccMap(resource, resourceTo);
			alist.add(resourceTo);
		}
		return alist;
	}

	//for getting Resource Names in compose cc dropdown
	@ModelAttribute("getCcAttributeList")
	public List<ResourceTo> getCcResourceListAttribute() throws ParseException {
		List<Resource> resources = resourceDao.getResourceUnderSuperAdmin();
		List<ResourceTo> alist = new ArrayList<ResourceTo>();
		for (Resource resource : resources) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			alist.add(resourceTo);
		}
		return alist;
	}

	//to open compose.htm page
	@RequestMapping("compose.htm")
	public ModelAndView compose(Model model) {
		model.addAttribute("composeDescription", new ActionPointTrackerTo());
		model.addAttribute("composeRemarks", new AptRemarksTo());
		return new ModelAndView("apt/compose");
	}

	private String str = "";

	//to get description and remarks of compose page through @ModelAttribute
	@RequestMapping(value = "compose.htm", method = RequestMethod.POST)
	public ModelAndView compose(
			@ModelAttribute("composeDescription") ActionPointTrackerTo actionPointTrackerTo,
			Model model,
			@ModelAttribute("composeRemarks") AptRemarksTo aptRemarksTo,
			HttpServletRequest httpServletRequest) {
		model.addAttribute("composeDescription", actionPointTrackerTo);
		model.addAttribute("composeRemarks", aptRemarksTo);
		str = actionPointTrackerTo.getDescription();

		ActionPointTracker actionPointTracker = actionPointTrackerDao
				.getById(aptRemarksTo.getActionPointTracker());

		AptRemarks aptRemarks = new AptRemarks();
		aptRemarks.setActionPointTracker(actionPointTracker);
		aptRemarks.setCreatedDate(new Date());
		aptRemarks.setResource(basicUserInfo.getUser().getResource());
		aptRemarks.setRemarks(aptRemarksTo.getRemarks());
		aptRemarksDao.saveOrUpdate(aptRemarks);
		return new ModelAndView("apt/compose");
	}

	/*
	 * @RequestMapping(value = {"/apt/insert/{part1}",
	 * "/apt/insert/{part1}/{part2}"}, method = RequestMethod.POST, headers =
	 * "Accept=application/json") public String handleReqShow(
	 * 
	 * @PathVariable Map<String, String> pathVariables,
	 * 
	 * @RequestParam(required = false) String name,
	 * 
	 * @RequestParam(required = false) String family, Model model) {
	 * 
	 * System.out.println("lksdfjlks===========================================")
	 * ; String yourValue = ""; if (pathVariables.containsKey("part1")) { String
	 * part = pathVariables.get("part1"); yourValue += " " + part; } if
	 * (pathVariables.containsKey("part2")) { String part =
	 * pathVariables.get("part2"); yourValue += " /" + part; }
	 * System.out.println(yourValue); return yourValue;
	 * 
	 * }
	 */

	//to get by single apt id for auto filling in Edit mode
	@RequestMapping(value = "/apt/getById/{aptId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody ActionPointTrackerTo getAPTById(
			@PathVariable long aptId) throws JSONException {
		ActionPointTracker actionPointTracker = actionPointTrackerDao
				.getById(aptId);
		ActionPointTrackerTo actionPointTrackerTo = new ActionPointTrackerTo();
		aPTToAPTToMapper.map(actionPointTracker, actionPointTrackerTo);
		return actionPointTrackerTo;
	}

	 public StringBuilder setMail(final String ESubject,final String Efrom,final String Edescription,final String Eto,final String EStatus ) {
		 
			
	        StringBuilder mailBody = new StringBuilder();
	        //<style type='text/css'>table {border:1px solid black;padding: 2px;}
	        mailBody.append("<html><head><style type='text/css'> .bodyclass table, th, td {border:1px solid black;padding: 2px;}</style></head><body>");
	        mailBody.append(" Dear ");
	        mailBody.append("Team");
	        mailBody.append(",");
	       
	        /*mailBody.append("Date : ");
	        mailBody.append(DateUtil.formatDateAsString(new Date()));*/
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>Please Find the Below details of Action Alert :</strong>");
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>From : </strong>");
	        mailBody.append(Efrom);
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>To : </strong>");
	        mailBody.append(Eto);
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>Subject : </strong>");
	        mailBody.append(ESubject);
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>Description: </strong>");
	        mailBody.append(Edescription);
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<strong>Status : </strong>");
	        mailBody.append(EStatus);
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("<br />\n");
	        mailBody.append("Thanking you, ");
	        mailBody.append("<br />\n");
	        mailBody.append("Centillion Support Team");
	        mailBody.append("</body></html>");
	        mailBody.append("<br />\n");
	        	        return mailBody;
	    }
	
	
	//to insert into database 
	@SuppressWarnings({ "unused", "null" })
	@RequestMapping(value = "/apt/insert/{aptJson:.+}", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void insertAPT(@PathVariable String aptJson)
			throws JsonParseException, JsonMappingException, IOException, JSONException {
		
		System.out.println("coming============" + aptJson);
		
		ActionPointTracker actionPointTracker = new ActionPointTracker();
		ObjectMapper objectMapper = new ObjectMapper();
		ActionPointTrackerTo actionPointTrackerTo = objectMapper.readValue(
				aptJson, ActionPointTrackerTo.class);
		aPTToToAPTMapper.map(actionPointTrackerTo, actionPointTracker);
		
		
		actionPointTracker.setResourceByAssignedFrom(basicUserInfo.getUser()
				.getResource());
		actionPointTracker.setCreatedDate(new Date());
		actionPointTracker.setDescription(str);
		actionPointTracker.setStatus(Constants.YTS);
		
		if (actionPointTrackerTo.getStackHolders() != null) {
			actionPointTracker.setStackHolders(Arrays
					.toString(actionPointTrackerTo.getStackHolders()));
		}
	
		
		
		actionPointTrackerDao.saveOrUpdate(actionPointTracker);

//E-mail start
		 String[] adresses = null;
		  
		 long emp= actionPointTrackerTo.getResourceByAssignedToId();
		 Resource byId = resourceDao.getById(emp);
	
		to=byId.getOfficialEmail();
		Eto=byId.getFirstName()+" "+byId.getLastName();
	
		 Resource byIdFrom = resourceDao.getById(basicUserInfo.getUser().getResourceId());
		 
		 Efrom =basicUserInfo.getUser().getResource().getFirstName()+" "+basicUserInfo.getUser().getResource().getLastName();
		
		ActionPointTracker byIdForCc = actionPointTrackerDao.getById(actionPointTracker.getAptId());
		
		Edescription=byIdForCc.getDescription();		
		ESubject =byIdForCc.getSubject();
		EStatus=byIdForCc.getStatus();
		String stackHolders = byIdForCc.getStackHolders();
		if(stackHolders!=null){
		 JSONArray jsonArray = (JSONArray) new JSONObject(new JSONTokener("{data:"+byIdForCc.getStackHolders()+"}")).get("data");
		    int[] outArr = new int[jsonArray.length()]; 
		
		    long emailCount=jsonArray.length();
		    		
		    adresses = new String[(int) emailCount];
		    
		    int count = 0;
		    for(int i=0; i<jsonArray.length(); i++) {
		        outArr[i] = jsonArray.getInt(i);
		        Resource resource = resourceDao.getById(outArr[i]);
	       adresses[count++] = resource.getOfficialEmail();
		    }
		
		}else{
			System.out.println("with out CCCCCCC");
			StringBuilder setMail = setMail( ESubject ,Efrom, Edescription,Eto,EStatus);
            mailService.sendMailWithOutCc(setMail.toString(),"Action Alert Assigned",to);
		}
		
		  if(to!=null&&adresses!=null){
		    System.out.println("cominggggg");
                StringBuilder setMail = setMail( ESubject ,Efrom, Edescription,Eto,EStatus);
                mailService.sendMail(setMail.toString(),"Action Alert Assigned",adresses ,to);
		  }
		    
		  //E-mail Ending
	}
	
	
	//for editing the existing record
	@RequestMapping(value = "/apt/edit/{aptJson:.+}", method = RequestMethod.PUT, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void editAPT(@PathVariable String aptJson)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		ActionPointTrackerTo actionPointTrackerTo = objectMapper.readValue(
				aptJson, ActionPointTrackerTo.class);
		ActionPointTracker actionPointTracker = actionPointTrackerDao
				.getById(actionPointTrackerTo.getAptId());
		aPTToToAPTMapper.map(actionPointTrackerTo, actionPointTracker);
		actionPointTracker.setDescription(str);
		actionPointTracker.setStackHolders(Arrays.toString(actionPointTrackerTo
				.getStackHolders()));
		actionPointTrackerDao.saveOrUpdate(actionPointTracker);
		
		
		
	
		
		
		
	}

	//getting all sent list according to the user logged in
	@RequestMapping(value = "getAPTList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ActionPointTrackerTo> getAPTList()
			throws ParseException, JSONException {
		List<ActionPointTracker> list = actionPointTrackerDao
				.getByFromId(basicUserInfo.getUser().getResource()
						.getResourceId());
		List<ActionPointTrackerTo> alist = new ArrayList<ActionPointTrackerTo>();
		for (ActionPointTracker actionPointTracker : list) {
			ActionPointTrackerTo actionPointTrackerTo = new ActionPointTrackerTo();
			aPTToAPTToMapper.map(actionPointTracker, actionPointTrackerTo);
			alist.add(actionPointTrackerTo);
		}
		return alist;
	}

	//to get inbox list according to the user logged of To & Cc
	@RequestMapping(value = "getAPTInboxList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ActionPointTrackerTo> getAPTInboxListList()
			throws ParseException, JSONException {
		List<ActionPointTrackerTo> alist = new ArrayList<ActionPointTrackerTo>();

		List<ActionPointTracker> tolist = actionPointTrackerDao
				.getAptListByCcAndTo(basicUserInfo.getUser().getResourceId());
		for (ActionPointTracker actionPointTracker1 : tolist) {
			ActionPointTrackerTo trackerTo = new ActionPointTrackerTo();
			aPTToAPTToMapper.map(actionPointTracker1, trackerTo);
			alist.add(trackerTo);
		}
		List<ActionPointTracker> list = actionPointTrackerDao.getAll();
		for (ActionPointTracker actionPointTracker : list) {
			if (actionPointTracker.getStackHolders() != null) {
				JSONArray jsonArray = (JSONArray) new JSONObject(
						new JSONTokener("{data:"
								+ actionPointTracker.getStackHolders() + "}"))
						.get("data");
				int[] outArr = new int[jsonArray.length()];
				for (int i = 0; i < jsonArray.length(); i++) {
					outArr[i] = jsonArray.getInt(i);
					if (basicUserInfo.getUser().getResourceId() == outArr[i]) {
						ActionPointTrackerTo actionPointTrackerTo = new ActionPointTrackerTo();
						aPTToAPTToMapper.map(actionPointTracker,
								actionPointTrackerTo);
						alist.add(actionPointTrackerTo);
					}
				}

			}
		}
		return alist;
	}

	/* inbox coding starts */

	@RequestMapping("inbox.htm")
	public ModelAndView inbox(Model model) {
		model.addAttribute("inboxremarks", new AptRemarksTo());

		return new ModelAndView("apt/inbox");
	}

	@RequestMapping(value = "inbox.htm", method = RequestMethod.POST)
	public ModelAndView inbox(
			@ModelAttribute("inboxremarks") AptRemarksTo aptRemarksTo,
			Model model, HttpServletRequest httpServletRequest) {
		model.addAttribute("inboxremarks", aptRemarksTo);
		ActionPointTracker actionPointTracker = actionPointTrackerDao
				.getById(aptRemarksTo.getActionPointTracker());

		AptRemarks aptRemarks = new AptRemarks();
		aptRemarks.setActionPointTracker(actionPointTracker);
		aptRemarks.setCreatedDate(new Date());
		aptRemarks.setResource(basicUserInfo.getUser().getResource());
		aptRemarks.setRemarks(aptRemarksTo.getRemarks());
		aptRemarksDao.saveOrUpdate(aptRemarks);

		return new ModelAndView("apt/inbox");
	}

	@RequestMapping(value = "getAptRemarksList/{aptId}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<AptRemarksTo> getAptRemarksList(
			@PathVariable long aptId) throws ParseException, JSONException {
		List<AptRemarks> aptRemarksList = aptRemarksDao.getByAptId(aptId);
		List<AptRemarksTo> alist = new ArrayList<AptRemarksTo>();
		for (AptRemarks aptRemarks : aptRemarksList) {
			AptRemarksTo aptRemarksTo = new AptRemarksTo();
			aptRemarksToAptRemarksToMapper.map(aptRemarks, aptRemarksTo);
			alist.add(aptRemarksTo);
		}
		return alist;
	}

	@RequestMapping(value = "/aptStatus/edit/{aptId}/{aptStatus}", method = RequestMethod.PUT, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void editAPTStatus(@PathVariable long aptId,
			@PathVariable String aptStatus) throws JsonParseException,
			JsonMappingException, IOException, JSONException {
		System.out.println("cinubg----------------" + aptStatus);
		ActionPointTracker actionPointTracker = actionPointTrackerDao
				.getById(aptId);
		actionPointTracker.setStatus(aptStatus);
		actionPointTrackerDao.saveOrUpdate(actionPointTracker);
		
		// E-mail start
		if(aptStatus.equals(Constants.Completed)){
		
		 String[] adresses = null;
		 ActionPointTrackerTo actionPointTrackerTo = new ActionPointTrackerTo();
		 aPTToAPTToMapper.map(actionPointTracker, actionPointTrackerTo);
	/*	 
		 System.out.println("=====================================================>>>>"+actionPointTrackerTo.getResourceByAssignedToId());
		 System.out.println("=====================================================>>>>"+actionPointTrackerTo.getResourceByAssignedFromId());
		 */
		Resource byIdTo = resourceDao.getById(actionPointTrackerTo.getResourceByAssignedToId());
		Resource byIdFrom = resourceDao.getById(actionPointTrackerTo.getResourceByAssignedFromId());
		Eto=byIdTo.getFirstName()+" "+byIdTo.getLastName();
		Efrom=byIdFrom.getFirstName()+" "+byIdFrom.getLastName();
		ESubject=actionPointTrackerTo.getSubject();
		EStatus=actionPointTrackerTo.getStatus();
		Edescription=actionPointTrackerTo.getDescription();
		to=byIdTo.getOfficialEmail();
		bcc=byIdFrom.getOfficialEmail();
	
		String stackHolders = actionPointTracker.getStackHolders();
		
		if(stackHolders!=null){
		 JSONArray jsonArray = (JSONArray) new JSONObject(new JSONTokener("{data:"+actionPointTracker.getStackHolders()+"}")).get("data");
		    int[] outArr = new int[jsonArray.length()]; 
		
		    long emailCount=jsonArray.length();
		    		
		    adresses = new String[(int) emailCount];
		    int count = 0;
		    for(int i=0; i<jsonArray.length(); i++) {
		        outArr[i] = jsonArray.getInt(i);
		        Resource resource = resourceDao.getById(outArr[i]);
	       adresses[count++] = resource.getOfficialEmail();
		    }
		
		}else{
			System.out.println("with out CCCCCCC");
			StringBuilder setMail = setMail( ESubject ,Efrom, Edescription,Eto,EStatus);
            mailService.sendMailWithOutCc(setMail.toString(),"Action Alert Completed",to);
		}
		if(to!=null&&adresses!=null){
		    System.out.println("cominggggg");
                StringBuilder setMail = setMail( ESubject ,Efrom, Edescription,Eto,EStatus);
                mailService.sendMailWithBcc(setMail.toString(),"Action Alert Completed",adresses ,to,bcc);
		  }
		
	}
	}
	/* inbox coding ends */
}
