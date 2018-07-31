package com.projectMatrix.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.projectMatrix.dao.ClientDao;
import com.projectMatrix.dao.JobDao;
import com.projectMatrix.dao.JobUomDao;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.dao.ProjectUomDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.dao.TeamMembersDao;
import com.projectMatrix.dao.UomDao;
import com.projectMatrix.dao.UomStoredDao;
import com.projectMatrix.mapper.ProjectToProjectToMapper;
import com.projectMatrix.mapper.ProjectToToProjectMapper;
import com.projectMatrix.mapper.ResourceToResourceToMapper;
import com.projectMatrix.mapper.ResourceToToResourceMapper;
import com.projectMatrix.mapper.TeamMembersToTeamMembersToMapper;
import com.projectMatrix.mapper.UomToUomToMapper;
import com.projectMatrix.model.Client;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.JobUom;
import com.projectMatrix.model.Project;
import com.projectMatrix.model.ProjectUom;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.model.Uom;
import com.projectMatrix.model.UomStored;
import com.projectMatrix.to.ClientTo;
import com.projectMatrix.to.ProjectTo;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.to.TeamMembersTo;
import com.projectMatrix.to.UomTo;
import com.projectMatrix.to.UploadTo;
import com.projectMatrix.utils.DateUtil;
import com.projectMatrix.validations.UploadValidator;

@Controller
public class ProjectController {

	@Autowired
	ClientDao clientDao;

	@Autowired
	ResourceDao resourceDao;

	@Autowired
	ProjectDao projectDao;

	@Autowired
	UomDao uomDao;

	@Autowired
	TeamMembersDao teamMembersDao;

	@Autowired
	UomStoredDao uomStoredDao;

	@Autowired
	ProjectUomDao projectUomDao;
	
	@Autowired
	JobUomDao jobUomDao;

	@Autowired
	ResourceToResourceToMapper resouceToResourceToMapper;

	@Autowired
	ResourceToToResourceMapper resourceToToResourceMapper;

	@Autowired
	ProjectToProjectToMapper projectToProjectToMapper;

	@Autowired
	ProjectToToProjectMapper projectToToProjectMapper;

	@Autowired
	TeamMembersToTeamMembersToMapper teamMembersToTeamMembersToMapper;

	@Autowired
	UomToUomToMapper uomToUomToMapper;
	
	@Autowired
	JobDao jobDao;
	
	@Autowired
	UploadValidator uploadValidator;

	
	//To get the List of Projects
	@RequestMapping("projectList")
	public @ResponseBody List<ProjectTo> getProjectList() {

		List<ProjectTo> list = new ArrayList<ProjectTo>();
		List<Project> all = projectDao.getAll();
		for (Project project : all) {
			ProjectTo projectTo2 = new ProjectTo();
			projectToProjectToMapper.map(project, projectTo2);
			list.add(projectTo2);
		}
		return list;
	}

	//To get the List of Resources
	@RequestMapping("resourceList")
	public @ResponseBody List<ResourceTo> getTeamMemberList() {

		List<ResourceTo> list = new ArrayList<ResourceTo>();
		List<Resource> all = resourceDao.getAllByDesignationEmployee();
		for (Resource resource : all) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			list.add(resourceTo);
		}

		return list;
	}

	//To get the Project By Id
	@RequestMapping(value = "/tasks/getbyId/{projectId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<ResourceTo> getResourcebyProjectId(
			@PathVariable long projectId) throws ParseException {

		List<ResourceTo> list = new ArrayList<ResourceTo>();
		List<Resource> all = resourceDao.getAllByProjectId(projectId);
		for (Resource resource : all) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			list.add(resourceTo);
		}


		return list;
	}
	
	//To insert data in Projects
	@RequestMapping(value = "/project/insert/{projectJson}", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void insertProject(@PathVariable String projectJson)
			throws JsonParseException, JsonMappingException, IOException {

		System.out.println("insert project coming" + projectJson);
		ObjectMapper objectMapper = new ObjectMapper();
		ProjectTo projectTo = objectMapper.readValue(projectJson,
				ProjectTo.class);
		Project project = new Project();
		projectToToProjectMapper.map(projectTo, project);
		projectDao.saveOrUpdate(project);
		
		if(projectTo.getUomIdSorted().length > 0){
			for (int i = 0; i < projectTo.getUomIdSorted().length; i++) {
				Uom uom = uomDao.getById(projectTo.getUomIdSorted()[i]);
				ProjectUom projectUom = new ProjectUom();
				projectUom.setProject(project);
				projectUom.setUom(uom);
				projectUomDao.saveOrUpdate(projectUom);
			}
		}
		if(projectTo.getTmResourcesIdSorted().length > 0){
			for (int i = 0; i < projectTo.getTmResourcesIdSorted().length; i++) {
				Resource resource = resourceDao.getById(projectTo.getTmResourcesIdSorted()[i]);
				TeamMembers teamMembers = new TeamMembers();
				teamMembers.setProject(project);
				teamMembers.setResource(resource);
				teamMembers.setKeyResourceIndication((projectTo.getKeyResource() == projectTo.getTmResourcesIdSorted()[i]) ? "Y" : "N");
				teamMembersDao.saveOrUpdate(teamMembers);
			}
		}
	}
	
	//To edit the Project Data
	@RequestMapping(value="/project/edit/{projectJson}", method = RequestMethod.PUT, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void editProject(@PathVariable String projectJson) throws JsonParseException, JsonMappingException, IOException{
		System.out.println("edit project coming "+projectJson);
		ObjectMapper objectMapper = new ObjectMapper();
		ProjectTo projectTo = objectMapper.readValue(projectJson,
				ProjectTo.class);
		Project project = projectDao.getById(projectTo.getProjectId());
		projectToToProjectMapper.map(projectTo, project);
		projectDao.saveOrUpdate(project);
		
		List<ProjectUom> projectUoms = projectUomDao
				.getUomByProject(projectTo.getProjectId());
		List<JobUom> jobUom = null ;
		for (ProjectUom projectUom : projectUoms) {
			jobUom = jobUomDao.getJobUomByProjectUom(projectUom.getProjectUomId());
		}
		System.out.println("jobUOM----------------"+jobUom);
		if(jobUom == null || jobUom.isEmpty()){
			for (ProjectUom projectUom : projectUoms) {
				projectUomDao.delete(projectUom);
			}
			if(projectTo.getUomIdSorted().length > 0){
				for (int i = 0; i < projectTo.getUomIdSorted().length; i++) {
					Uom uom = uomDao.getById(projectTo.getUomIdSorted()[i]);
					ProjectUom projectUom = new ProjectUom();
					projectUom.setProject(project);
					projectUom.setUom(uom);
					projectUomDao.saveOrUpdate(projectUom);
				}
			}
		}else{
			System.out.println("Already Jobs UOM data allocated----------------"+jobUom);
		}
		
		List<TeamMembers> teamMembersDel = teamMembersDao
				.getTeamMembersByProjectId(projectTo.getProjectId());
		for (TeamMembers teamMembers : teamMembersDel) {
			teamMembersDao.delete(teamMembers);
		}
		if(projectTo.getTmResourcesIdSorted().length > 0){
			for (int i = 0; i < projectTo.getTmResourcesIdSorted().length; i++) {
				Resource resource = resourceDao.getById(projectTo.getTmResourcesIdSorted()[i]);
				TeamMembers teamMembers = new TeamMembers();
				teamMembers.setProject(project);
				teamMembers.setResource(resource);
				teamMembers.setKeyResourceIndication((projectTo.getKeyResource() == projectTo.getTmResourcesIdSorted()[i]) ? "Y" : "N");
				teamMembersDao.saveOrUpdate(teamMembers);
			}
		}
	}
	
	//To delete the Project
	@RequestMapping(value="/project/delete/{projectId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public @ResponseBody ClientTo deleteProject(@PathVariable long projectId){
		System.out.println("delete coming---------------"+projectId);
		
		ClientTo clientTo = new ClientTo();
		
		Project project = projectDao.getById(projectId);
		
		List<Job> jobsByProject = jobDao.getJobsByProject(projectId);
		System.out.println("jsfolj=================="+jobsByProject);
		
		if(jobsByProject == null || jobsByProject.isEmpty()){
			List<ProjectUom> projectUoms = projectUomDao.getUomByProject(projectId);
			for (ProjectUom projectUom : projectUoms) {
				projectUomDao.delete(projectUom);
			}
			List<TeamMembers> teamMembersDel = teamMembersDao.getTeamMembersByProjectId(projectId);
			for (TeamMembers teamMembers : teamMembersDel) {
				teamMembersDao.delete(teamMembers);
			}
			projectDao.delete(project);
			clientTo.setClientName("Deleted Successfully.");
			return clientTo;
		}
		clientTo.setClientName("Delete Jobs before deleting Project.");
		return clientTo;
	}

/*	@RequestMapping(value = "/project/insert/{client_id}/{end_customer}/{op_region}/{work_region}/{cli_pm}/{project_code}/{cent_pc}/{project_name}/{project_scope}/{cost_center}/{off_pm}/{tl}/{tm}/{key_r}/{pro_start_date}/{pro_end_date}/{uom}/{projectHoursjson}", method = RequestMethod.POST, headers = "Accept=application/json")
	public List<Project> addProject(@PathVariable int client_id,
			@PathVariable String end_customer, @PathVariable String op_region,
			@PathVariable String work_region, @PathVariable String cli_pm,
			@PathVariable String project_code, @PathVariable String cent_pc,
			@PathVariable String project_name,
			@PathVariable String project_scope,
			@PathVariable String cost_center, @PathVariable String off_pm,
			@PathVariable long tl, @PathVariable String tm,
			@PathVariable long key_r, @PathVariable String pro_start_date,
			@PathVariable String pro_end_date, @PathVariable String uom,
			@PathVariable String projectHoursjson) throws ParseException,
			JsonParseException, JsonMappingException, IOException {

		Client client = clientDao.getById(client_id);
		String[] tmSplit = tm.split(",");
		String[] uomSplit = uom.split(",");
		Resource resource = resourceDao.getById(tl);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		ObjectMapper objectMapper = new ObjectMapper();
		Project project = objectMapper.readValue(projectHoursjson,
				Project.class);

		// Project project = new Project();

		project.setResource(resource);
		project.setClient(client);
		project.setEndCustomer(end_customer);
		project.setOperationRegion(op_region);
		project.setWorkRegion(work_region);
		project.setClientPm(cli_pm);
		project.setProjectCode(project_code);
		project.setCentProjectCode(cent_pc);
		project.setProjectName(project_name);
		project.setProjectScope(project_scope);
		project.setCostCenter(cost_center);
		project.setOffshorePm(off_pm);
									 * project.setInputValidationPercentage(project1
									 * .getInputValidationPercentage());
									 * project.setProductionPercentage(project1.
									 * getProductionPercentage());
									 * project.setQcPercentage
									 * (project1.getQcPercentage());
									 * project.setQaPercentage
									 * (project1.getQaPercentage());
									 * project.setDeliveryPercentage
									 * (project1.getDeliveryPercentage());
									 * project.setFeedbackPercentage(project1.
									 * getFeedbackPercentage());
									 * project.setRedeliveryPercentage
									 * (project1.getRedeliveryPercentage());
									 
		if (pro_start_date != null) {
			project.setStartDate(formatter.parse(pro_start_date));
		}
		if (pro_end_date != null) {
			project.setEndDate(formatter.parse(pro_end_date));
		}

		projectDao.saveOrUpdate(project);
		long temp;
		int uomTemp;
		for (int i = 0; i < tmSplit.length; i++) {
			temp = Long.parseLong(tmSplit[i]);
			resource = resourceDao.getById(temp);
			TeamMembers teamMembers = new TeamMembers();
			teamMembers.setProject(project);
			teamMembers.setResource(resource);
			teamMembers.setKeyResourceIndication((key_r == temp) ? "Y" : "N");
			teamMembersDao.saveOrUpdate(teamMembers);
		}
		for (int i = 0; i < uomSplit.length; i++) {
			uomTemp = Integer.parseInt(uomSplit[i]);
			Uom uom2 = uomDao.getById(uomTemp);
			ProjectUom projectUom = new ProjectUom();
			projectUom.setProject(project);
			projectUom.setUom(uom2);
			projectUomDao.saveOrUpdate(projectUom);

			
			 * UomStored uomStored = new UomStored();
			 * uomStored.setProject(project); uomStored.setUom(uom2);
			 * uomStoredDao.saveOrUpdate(uomStored);
			 
		}

		return null;
	}
*/
	/*@RequestMapping(value = "/project/edit/{project_id}/{client_id}/{end_customer}/{op_region}/{work_region}/{cli_pm}/{project_code}/{cent_pc}/{project_name}/{project_scope}/{cost_center}/{off_pm}/{tl}/{tm}/{key_r}/{pro_start_date}/{pro_end_date}/{uom}/{projectHoursjson}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public List<Project> editProject(@PathVariable long project_id,
			@PathVariable int client_id, @PathVariable String end_customer,
			@PathVariable String op_region, @PathVariable String work_region,
			@PathVariable String cli_pm, @PathVariable String project_code,
			@PathVariable String cent_pc, @PathVariable String project_name,
			@PathVariable String project_scope,
			@PathVariable String cost_center, @PathVariable String off_pm,
			@PathVariable long tl, @PathVariable String tm,
			@PathVariable long key_r, @PathVariable String pro_start_date,
			@PathVariable String pro_end_date, @PathVariable String uom,
			@PathVariable String projectHoursjson) throws ParseException,
			JsonParseException, JsonMappingException, IOException {

		System.out.println("Edit Project**************************" + tm
				+ "Edit Project**************************" + uom);
		Client client = clientDao.getById(client_id);
		String[] tmSplit = tm.split(",");
		String[] uomSplit = uom.split(",");
		Resource resource = resourceDao.getById(tl);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		Project project = projectDao.getById(project_id);

		ObjectMapper objectMapper = new ObjectMapper();
		Project project1 = objectMapper.readValue(projectHoursjson,
				Project.class);

		project.setResource(resource);
		project.setClient(client);
		project.setEndCustomer(end_customer);
		project.setOperationRegion(op_region);
		project.setWorkRegion(work_region);
		project.setClientPm(cli_pm);
		project.setProjectCode(project_code);
		project.setCentProjectCode(cent_pc);
		project.setProjectName(project_name);
		project.setProjectScope(project_scope);
		project.setCostCenter(cost_center);
		project.setOffshorePm(off_pm);
		project.setInputValidationPercentage(project1
				.getInputValidationPercentage());
		project.setProductionPercentage(project1.getProductionPercentage());
		project.setQcPercentage(project1.getQcPercentage());
		project.setQaPercentage(project1.getQaPercentage());
		project.setDeliveryPercentage(project1.getDeliveryPercentage());
		project.setFeedbackPercentage(project1.getFeedbackPercentage());
		project.setRedeliveryPercentage(project1.getRedeliveryPercentage());
		if (pro_start_date != null) {
			project.setStartDate(formatter.parse(pro_start_date));
		}
		if (pro_end_date != null) {
			project.setEndDate(formatter.parse(pro_end_date));
		}

		projectDao.saveOrUpdate(project);

		List<ProjectUom> projectUoms = projectUomDao
				.getUomByProject(project_id);
		List<JobUom> jobUom = null ;
		for (ProjectUom projectUom : projectUoms) {
			jobUom = jobUomDao.getJobUomByProjectUom(projectUom.getProjectUomId());
		}
		if(jobUom.isEmpty()){
			for (ProjectUom projectUom : projectUoms) {
				projectUomDao.delete(projectUom);
			}
			int uomTemp;
			for (int i = 0; i < uomSplit.length; i++) {
				uomTemp = Integer.parseInt(uomSplit[i]);
				Uom uom2 = uomDao.getById(uomTemp);
				ProjectUom projectUom = new ProjectUom();
				projectUom.setProject(project);
				projectUom.setUom(uom2);
				projectUomDao.saveOrUpdate(projectUom);
			}
		}else{
			System.out.println("Already Jobs UOM data allocated----------------"+jobUom);
		}
		for (ProjectUom projectUom : projectUoms) {
			projectUomDao.delete(projectUom);
		}
		int uomTemp;
		for (int i = 0; i < uomSplit.length; i++) {
			uomTemp = Integer.parseInt(uomSplit[i]);
			Uom uom2 = uomDao.getById(uomTemp);
			ProjectUom projectUom = new ProjectUom();
			projectUom.setProject(project);
			projectUom.setUom(uom2);
			projectUomDao.saveOrUpdate(projectUom);
		}

		
		 * for (int i = 0; i < uomSplit.length; i++) { uomTemp =
		 * Integer.parseInt(uomSplit[i]); boolean projectUOMUpdated = false; for
		 * (ProjectUom projectUom : projectUoms) { projectUOMUpdated = true; if
		 * (projectUom.getUom().getUomId() == uomTemp){
		 * projectUoms.remove(projectUom); break; } else{
		 * projectUomDao.delete(projectUom);
		 * 
		 * Uom uom2 = uomDao.getById(uomTemp); ProjectUom projectUom1 = new
		 * ProjectUom(); projectUom1.setProject(project);
		 * projectUom1.setUom(uom2); projectUomDao.saveOrUpdate(projectUom1);
		 * break; } } if (!projectUOMUpdated){ Uom uom2 =
		 * uomDao.getById(uomTemp); ProjectUom projectUom2 = new ProjectUom();
		 * projectUom2.setProject(project); projectUom2.setUom(uom2);
		 * projectUomDao.saveOrUpdate(projectUom2); } }
		 
		List<TeamMembers> teamMembersDel = teamMembersDao
				.getTeamMembersByProjectId(project_id);
		for (TeamMembers teamMembers : teamMembersDel) {
			teamMembersDao.delete(teamMembers);
		}
		long temp;
		for (int i = 0; i < tmSplit.length; i++) {
			temp = Long.parseLong(tmSplit[i]);
			resource = resourceDao.getById(temp);
			TeamMembers teamMembers = new TeamMembers();
			teamMembers.setProject(project);
			teamMembers.setResource(resource);
			teamMembers.setKeyResourceIndication((key_r == temp) ? "Y" : "N");
			teamMembersDao.saveOrUpdate(teamMembers);
		}

		return null;
	}
*/
	
	//To Get the Team Members allocated by ProjectId
	@RequestMapping(value = "/teamMembersAllocatedByProjectId/{projectId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<TeamMembersTo> teamMembersAllocatedByProjectId(@PathVariable long projectId) {

		List<TeamMembersTo> teamMembersTos = new ArrayList<TeamMembersTo>(); 
		
		List<TeamMembers> teamMembers = teamMembersDao.getTeamMembersByProjectId(projectId);
		for (TeamMembers teamMembers2 : teamMembers) {
			TeamMembersTo teamMembersTo2 = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers2, teamMembersTo2);
			teamMembersTos.add(teamMembersTo2);
		}
		return teamMembersTos;
	}

	
	//To get the List of Offshore ProjectManager
	@RequestMapping("offPMList")
	public @ResponseBody List<ResourceTo> getProjectManagerByRole() {
		List<ResourceTo> list = new ArrayList<ResourceTo>();

		List<Resource> byRole = resourceDao.getAllByRoles();
		for (Resource resource : byRole) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			list.add(resourceTo);
		}
		return list;
	}


	//To get the List of Team Lead 
	@RequestMapping("teamLeadList")
	public @ResponseBody List<ResourceTo> getByDesignation() {
		List<ResourceTo> list = new ArrayList<ResourceTo>();

		List<Resource> byDesignation = resourceDao.getAllByRoleTemLead();
		for (Resource resource : byDesignation) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			list.add(resourceTo);
		}
		return list;
	}

	//To get UomList
	@RequestMapping("uomList")
	public @ResponseBody List<UomTo> getUomList() {
		List<UomTo> list = new ArrayList<UomTo>();
		List<Uom> all = uomDao.getAll();
		for (Uom uom : all) {
			UomTo to = new UomTo();
			uomToUomToMapper.map(uom, to);
			list.add(to);
		}
		return list;
	}

	@RequestMapping(value = "/projectById/{projectId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody ProjectTo projectById(@PathVariable long projectId) {

		Project byId = projectDao.getById(projectId);

		ProjectTo projectTo = new ProjectTo();
		projectToProjectToMapper.map(byId, projectTo);

		return projectTo;

	}

	/*
	 * @RequestMapping("getTeamMemberByProject") public @ResponseBody
	 * List<TeamMembersTo> getTeamMemberByProject(){ List<TeamMembersTo> list =
	 * new ArrayList<TeamMembersTo>(); List<TeamMembers> resourceByProject =
	 * projectDao.getResourceByProject((long) 56);
	 * 
	 * for (TeamMembers teamMembers : resourceByProject) { TeamMembersTo
	 * teamMembersTo = new TeamMembersTo();
	 * teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
	 * list.add(teamMembersTo); } return list;
	 * 
	 * }
	 */

	//To send the Non Team Members By Project
	@RequestMapping(value = "/getNonTeamMemberByProject/{projectId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<ResourceTo> getTeamMemberforListBox(@PathVariable long projectId) {
		List<ResourceTo> list = new ArrayList<ResourceTo>();
		List<TeamMembers> resourceByProject = teamMembersDao
				.getNonAllocatedTeamMembers(projectId);

		List<Long> longlist =new ArrayList<Long>();
		for (TeamMembers teamMembers : resourceByProject) {
			TeamMembersTo teamMembersTo = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
			longlist.add(teamMembersTo.getResourceId());
		}

		if (!longlist.isEmpty()) {
			List<Resource> resources = resourceDao.getResourceByTMId(longlist);
			for (Resource resource : resources) {
				ResourceTo resourceTo = new ResourceTo();
				resourceToToResourceMapper.map(resource, resourceTo);
				list.add(resourceTo);
			}
		} else {
			List<Resource> all = resourceDao.getAll();
			for (Resource resource : all) {
				ResourceTo resourceTo = new ResourceTo();
				resourceToToResourceMapper.map(resource, resourceTo);
				list.add(resourceTo);
			}
		}
		return list;
	}
/*
	@RequestMapping("getTeamMemberByProject")
	public @ResponseBody List<ResourceTo> getTeamMemberforListBox() {
		List<ResourceTo> list = new ArrayList<ResourceTo>();
		List<TeamMembers> resourceByProject = teamMembersDao
				.getNonAllocatedTeamMembers(86);

		List<TeamMembersTo> teamMembersTos = new ArrayList<TeamMembersTo>();
//		Long[] longlist =new Long[1000];
		List<Long> longlist =new ArrayList<Long>();
		int i = 0;
		for (TeamMembers teamMembers : resourceByProject) {
			TeamMembersTo teamMembersTo = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
//			longlist.add(teamMembersTo.getResourceId());
			System.out.println(teamMembersTo.getResourceId());
			longlist.add(teamMembersTo.getResourceId());
			
//			i++;
		}

		List<Resource> resources = resourceDao.getResourceByTMId(longlist);
		for (Resource resource : resources) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource, resourceTo);
			list.add(resourceTo);
		}
		for(int i = 0;i<list.size();i++){
			for (TeamMembers teamMembers : resourceByProject) {
				TeamMembersTo teamMembersTo = new TeamMembersTo();
				teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
				if(teamMembersTo.getResourceId()==)
			}
			
		}
		for (TeamMembers teamMembers : resourceByProject) {
			TeamMembersTo teamMembersTo = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
			for (Resource resource1 : resources) {
				ResourceTo resourceTo = new ResourceTo();
				resourceToToResourceMapper.map(resource1, resourceTo);
				if(teamMembersTo.getResourceId()==resourceTo.getResourceId()){
					list.remove(resourceTo);
				}
			}
		}
		
		for (Resource resource1 : resources) {
			ResourceTo resourceTo = new ResourceTo();
			resourceToToResourceMapper.map(resource1, resourceTo);
			for (TeamMembers teamMembers : resourceByProject) {
				TeamMembersTo teamMembersTo = new TeamMembersTo();
				teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
				if(teamMembersTo.getResourceId()==resourceTo.getResourceId()){
					list.remove(resourceTo);
				}
			}
			
		}
		
		for(int i=0;i<list.size();i++){
			if()
		}
		long temp[] = null;
		int i=0;
		for (TeamMembers teamMembers : resourceByProject) {
			TeamMembersTo teamMembersTo = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
			temp[i]=teamMembersTo.getResourceId();
			i++;
		}
		return list;

	}*/

}
