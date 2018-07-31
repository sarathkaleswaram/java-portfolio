package com.projectMatrix.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.JobDao;
import com.projectMatrix.dao.JobStageDao;
import com.projectMatrix.dao.JobUomDao;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.dao.ProjectUomDao;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.dao.TeamMembersDao;
import com.projectMatrix.dao.UomStoredDao;
import com.projectMatrix.mapper.JobToJobToMapper;
import com.projectMatrix.mapper.JobToToJobMapper;
import com.projectMatrix.mapper.JobUomToJobUomToMapper;
import com.projectMatrix.mapper.ProjectUomToProjectUomToMapper;
import com.projectMatrix.mapper.ResourceAllocationToResourceAllocationToMapper;
import com.projectMatrix.mapper.TeamMembersToTeamMembersToMapper;
import com.projectMatrix.mapper.UomStoredToUomStoredToMapper;
import com.projectMatrix.model.Client;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.JobUom;
import com.projectMatrix.model.Project;
import com.projectMatrix.model.ProjectUom;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.to.ClientTo;
import com.projectMatrix.to.JobTo;
import com.projectMatrix.to.JobUomTo;
import com.projectMatrix.to.ProjectUomTo;
import com.projectMatrix.to.ResourceAllocationTo;
import com.projectMatrix.to.TeamMembersTo;

@Controller
public class JobController {

	@Autowired
	ProjectDao projectDao;
	@Autowired
	JobDao jobDao;
	@Autowired
	TeamMembersDao teamMembersDao;
	@Autowired
	UomStoredDao uomStoredDao;
	@Autowired
	ResourceDao resourceDao;
	@Autowired
	ProjectUomDao projectUomDao;
	@Autowired
	ResourceAllocationDao resourceAllocationDao;
	@Autowired
	JobUomDao jobUomDao;
	@Autowired
	JobStageDao jobStageDao;
	@Autowired
	JobToJobToMapper jobToJobToMapper;
	@Autowired
	JobToToJobMapper jobToToJobMapper;
	@Autowired
	TeamMembersToTeamMembersToMapper teamMembersToTeamMembersToMapper;
	@Autowired
	UomStoredToUomStoredToMapper uomStoredToUomStoredToMapper;
	@Autowired
	ResourceAllocationToResourceAllocationToMapper resourceAllocationToResourceAllocationToMapper;
	@Autowired
	ProjectUomToProjectUomToMapper projectUomToProjectUomToMapper;
	@Autowired
	JobUomToJobUomToMapper jobUomToJobUomToMapper;

	//get job by id from DB for auto fill in edit mode in UI Code
	@RequestMapping(value = "/job/byJobId/{jobId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody JobTo getJobById(@PathVariable long jobId) {
		System.out.println("job id ------------------" + jobId);
		Job job = jobDao.getById(jobId);
		JobTo jobTo = new JobTo();
		jobToJobToMapper.map(job, jobTo);
		return jobTo;
	}

	//insert job in DB code
	@RequestMapping(value = "/job/insert/{jobJson:.+}", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void addJob(@PathVariable String jobJson) throws JsonParseException,
			JsonMappingException, IOException {
		System.out.println("job Json------" + jobJson);

		ObjectMapper objectMapper = new ObjectMapper();
		JobTo jobTo = objectMapper.readValue(jobJson, JobTo.class);
		Job job = new Job();
		jobToToJobMapper.map(jobTo, job);
		jobDao.saveOrUpdate(job);

		ResourceAllocation resourceAllocation = new ResourceAllocation();
		resourceAllocation.setJob(job);
		Resource resource = resourceDao.getById(jobTo.getProductionResource());
		resourceAllocation.setResourceByProductionAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getQcResource());
		resourceAllocation.setResourceByQcAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getQaResource());
		resourceAllocation.setResourceByQaAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getDeliveryResource());
		resourceAllocation.setResourceByFeedbackAllocatedId(resource);
		resourceAllocationDao.saveOrUpdate(resourceAllocation);

		JobStage jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.Production);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(jobTo.getProductionEstimatedHours());
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.QC);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(jobTo.getQcEstimatedHours());
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.QA);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(jobTo.getQaEstimatedHours());
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.Delivery);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(jobTo.getDeliveryEstimatedHours());
		jobStageDao.saveOrUpdate(jobStage);
	}

	
	//edit existing job from DB Code
	@RequestMapping(value = "/job/edit/{jobJson:.+}", method = RequestMethod.PUT, headers = "Accept=application/json")
	@ResponseStatus(value = HttpStatus.OK)
	public void editJob(@PathVariable String jobJson)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println("edit job-----------------" + jobJson);

		ObjectMapper objectMapper = new ObjectMapper();
		JobTo jobTo = objectMapper.readValue(jobJson, JobTo.class);
		Job job = jobDao.getById(jobTo.getJobId());
		jobToToJobMapper.map(jobTo, job);

		ResourceAllocation resourceAllocation = resourceAllocationDao
				.getById(jobTo.getResourceAllocatedId());
		resourceAllocation.setJob(job);
		Resource resource = resourceDao.getById(jobTo.getProductionResource());
		resourceAllocation.setResourceByProductionAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getQcResource());
		resourceAllocation.setResourceByQcAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getQaResource());
		resourceAllocation.setResourceByQaAllocatedId(resource);
		resource = resourceDao.getById(jobTo.getDeliveryResource());
		resourceAllocation.setResourceByFeedbackAllocatedId(resource);
		resourceAllocationDao.saveOrUpdate(resourceAllocation);

		List<JobStage> jobStageList = jobStageDao.getJobStageByJobId(jobTo
				.getJobId());
		double jobHour = 0.0;
		for (JobStage jobStage : jobStageList) {
			if (jobStage.getJobStage().equalsIgnoreCase(Constants.Production)) {
				jobStage.setHoursEstimated(jobTo.getProductionEstimatedHours());
				if (jobTo.getProductionSpentHours() > 0.0) {
					jobHour = 0.0;
					if (job.getHoursSpent() != null) {
						jobHour = job.getHoursSpent();
					}
					if (jobStage.getHoursSpent() != null) {
						jobHour = jobHour - jobStage.getHoursSpent();
					}
					jobHour = jobHour + jobTo.getProductionSpentHours();
					job.setHoursSpent(jobHour);
					jobStage.setHoursSpent(jobTo.getProductionSpentHours());
				}
			}
			if (jobStage.getJobStage().equalsIgnoreCase(Constants.QC)) {
				jobStage.setHoursEstimated(jobTo.getQcEstimatedHours());
				if (jobTo.getQcSpentHours() > 0.0) {
					jobHour = 0.0;
					if (job.getHoursSpent() != null) {
						jobHour = job.getHoursSpent();
					}
					if (jobStage.getHoursSpent() != null) {
						jobHour = jobHour - jobStage.getHoursSpent();
					}
					jobHour = jobHour + jobTo.getQcSpentHours();
					job.setHoursSpent(jobHour);
					jobStage.setHoursSpent(jobTo.getQcSpentHours());
				}
			}
			if (jobStage.getJobStage().equalsIgnoreCase(Constants.QA)) {
				jobStage.setHoursEstimated(jobTo.getQaEstimatedHours());
				if (jobTo.getQaSpentHours() > 0.0) {
					jobHour = 0.0;
					if (job.getHoursSpent() != null) {
						jobHour = job.getHoursSpent();
					}
					if (jobStage.getHoursSpent() != null) {
						jobHour = jobHour - jobStage.getHoursSpent();
					}
					jobHour = jobHour + jobTo.getQaSpentHours();
					job.setHoursSpent(jobHour);
					jobStage.setHoursSpent(jobTo.getQaSpentHours());
				}
			}
			if (jobStage.getJobStage().equalsIgnoreCase(Constants.Delivery)) {
				jobStage.setHoursEstimated(jobTo.getDeliveryEstimatedHours());
				if (jobTo.getDeliverySpentHours() > 0.0) {
					jobHour = 0.0;
					if (job.getHoursSpent() != null) {
						jobHour = job.getHoursSpent();
					}
					if (jobStage.getHoursSpent() != null) {
						jobHour = jobHour - jobStage.getHoursSpent();
					}
					jobHour = jobHour + jobTo.getDeliverySpentHours();
					job.setHoursSpent(jobHour);
					jobStage.setHoursSpent(jobTo.getDeliverySpentHours());
				}
			}
			jobStageDao.saveOrUpdate(jobStage);
		}
		jobDao.saveOrUpdate(job);
	}

	
	//deleting job from DB Code
	@RequestMapping(value = "/job/delete/{jobId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public @ResponseBody ClientTo deleteJob(@PathVariable long jobId) {
		System.out.println("job delete-----------------" + jobId);

		Job job = jobDao.getById(jobId);

		ResourceAllocation resourceAllocation = resourceAllocationDao
				.getByJobId(jobId);
		resourceAllocationDao.delete(resourceAllocation);

		List<JobStage> jobStageList = jobStageDao.getJobStageByJobId(jobId);
		for (JobStage jobStage : jobStageList) {
			jobStageDao.delete(jobStage);
		}

		List<JobUom> jobUomList = jobUomDao.getUomByJob(jobId);
		for (JobUom jobUom : jobUomList) {
			jobUomDao.delete(jobUom);
		}

		jobDao.delete(job);

		ClientTo clientTo = new ClientTo();
		clientTo.setClientName("Deleted Successfully.");
		return clientTo;
	}

	//old inserting method of job
	@RequestMapping(value = "/job/insert/{project_id}/{job_no}/{job_name}/{job_hours}/{job_stage}/{job_status}/{res_pro}/{res_qc}/{res_qa}/{res_fb}/{est_pro}/{est_qc}/{est_qa}/{est_fb}/{job_recieved_date}/{job_assigned_date}/{job_expected_date}/{job_delivered_date}/{jc}/{remark}", method = RequestMethod.POST, headers = "Accept=application/json")
	public List<Client> addJob(@PathVariable long project_id,
			@PathVariable String job_no, @PathVariable String job_name,
			@PathVariable double job_hours, @PathVariable String job_stage,
			@PathVariable String job_status, @PathVariable long res_pro,
			@PathVariable long res_qc, @PathVariable long res_qa,
			@PathVariable long res_fb, @PathVariable double est_pro,
			@PathVariable double est_qc, @PathVariable double est_qa,
			@PathVariable double est_fb,
			@PathVariable String job_recieved_date,
			@PathVariable String job_assigned_date,
			@PathVariable String job_expected_date,
			@PathVariable String job_delivered_date, @PathVariable String jc,
			@PathVariable String remark

	) throws ParseException {

		Project project = projectDao.getById(project_id);
		System.out.println("project" + project.getCentProjectCode());
		Job job = new Job();
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		job.setProject(project);
		job.setJobNo(job_no);
		job.setJobName(job_name);
		job.setHoursEstimated(job_hours);
		job.setJobStage(job_stage);
		job.setJobStatus(job_status);
		job.setReceivedDate(formatter.parse(job_recieved_date));
		job.setAssignedDate(formatter.parse(job_assigned_date));
		job.setExpectedDelivery(formatter.parse(job_expected_date));
		// job.setDeliveredOn(formatter.parse(job_delivered_date));
		job.setJobCriticality(jc);
		job.setRemarks(remark);
		jobDao.saveOrUpdate(job);

		ResourceAllocation resourceAllocation = new ResourceAllocation();
		resourceAllocation.setJob(job);
		Resource resource = resourceDao.getById(res_pro);
		resourceAllocation.setResourceByProductionAllocatedId(resource);
		resource = resourceDao.getById(res_qc);
		resourceAllocation.setResourceByQcAllocatedId(resource);
		resource = resourceDao.getById(res_qa);
		resourceAllocation.setResourceByQaAllocatedId(resource);
		resource = resourceDao.getById(res_fb);
		resourceAllocation.setResourceByFeedbackAllocatedId(resource);
		resourceAllocationDao.saveOrUpdate(resourceAllocation);

		JobStage jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.Production);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(est_pro);
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.QC);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(est_qc);
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.QA);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(est_qa);
		jobStageDao.saveOrUpdate(jobStage);
		jobStage = new JobStage();
		jobStage.setJob(job);
		jobStage.setJobStage(Constants.Delivery);
		jobStage.setJobStatus(Constants.YTS);
		jobStage.setHoursEstimated(est_fb);
		jobStageDao.saveOrUpdate(jobStage);

		return null;

	}

	//old editing method 
	@RequestMapping(value = "/job/edit/{job_id}/{project_id}/{job_no}/{job_name}/{job_stage}/{job_status}/{res_allo_id}/{res_pro}/{res_qc}/{res_qa}/{res_fb}/{job_recieved_date}/{job_assigned_date}/{job_expected_date}/{job_delivered_date}/{jc}/{remark}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public List<Client> editJob(@PathVariable long job_id,
			@PathVariable long project_id, @PathVariable String job_no,
			@PathVariable String job_name, @PathVariable String job_stage,
			@PathVariable String job_status, @PathVariable long res_allo_id,
			@PathVariable long res_pro, @PathVariable long res_qc,
			@PathVariable long res_qa, @PathVariable long res_fb,
			@PathVariable String job_recieved_date,
			@PathVariable String job_assigned_date,
			@PathVariable String job_expected_date,
			@PathVariable String job_delivered_date, @PathVariable String jc,
			@PathVariable String remark) throws ParseException {

		System.out.println("Edit**********************" + res_pro);
		Project project = projectDao.getById(project_id);
		Job job = jobDao.getById(job_id);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		job.setProject(project);
		job.setJobNo(job_no);
		job.setJobName(job_name);
		job.setJobStage(job_stage);
		job.setJobStatus(job_status);
		job.setReceivedDate(formatter.parse(job_recieved_date));
		job.setAssignedDate(formatter.parse(job_assigned_date));
		job.setExpectedDelivery(formatter.parse(job_expected_date));
		// job.setDeliveredOn(formatter.parse(job_delivered_date));
		job.setJobCriticality(jc);
		job.setRemarks(remark);
		jobDao.saveOrUpdate(job);

		ResourceAllocation resourceAllocation = resourceAllocationDao
				.getById(res_allo_id);
		resourceAllocation.setJob(job);
		Resource resource = resourceDao.getById(res_pro);
		resourceAllocation.setResourceByProductionAllocatedId(resource);
		resource = resourceDao.getById(res_qc);
		resourceAllocation.setResourceByQcAllocatedId(resource);
		resource = resourceDao.getById(res_qa);
		resourceAllocation.setResourceByQaAllocatedId(resource);
		resource = resourceDao.getById(res_fb);
		resourceAllocation.setResourceByFeedbackAllocatedId(resource);
		resourceAllocationDao.saveOrUpdate(resourceAllocation);

		return null;

	}

	/*
	 * @RequestMapping(value = "/resourceAllocation/byJobId/{job_id}", method =
	 * RequestMethod.POST, headers = "Accept=application/json") public
	 * 
	 * @ResponseBody List<ResourceAllocationTo>
	 * getResourceAllocationByJobId(@PathVariable long job_id) throws
	 * ParseException {
	 * 
	 * List<ResourceAllocationTo> list = new ArrayList<ResourceAllocationTo>();
	 * List<ResourceAllocation> resourceByJob = jobDao
	 * .getResourceByJob(job_id);
	 * 
	 * for (ResourceAllocation resourceAllocation : resourceByJob) {
	 * ResourceAllocationTo resourceAllocationTo = new ResourceAllocationTo();
	 * resourceAllocationToResourceAllocationToMapper.map(resourceAllocation,
	 * resourceAllocationTo); list.add(resourceAllocationTo); } return list; }
	 */
	
	
	//getting resource according to the centillion project selected code
	@RequestMapping(value = "/teamMembers/byProjectId/{project_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<TeamMembersTo> getTmByProjectId(
			@PathVariable long project_id) throws ParseException {

		List<TeamMembersTo> list = new ArrayList<TeamMembersTo>();
		List<TeamMembers> resourceByProject = projectDao
				.getResourceByProject(project_id);

		for (TeamMembers teamMembers : resourceByProject) {
			TeamMembersTo teamMembersTo = new TeamMembersTo();
			teamMembersToTeamMembersToMapper.map(teamMembers, teamMembersTo);
			list.add(teamMembersTo);
		}
		return list;
	}

	/*
	 * @RequestMapping(value = "/uom/byProjectId/{project_id}", method =
	 * RequestMethod.POST, headers = "Accept=application/json") public
	 * 
	 * @ResponseBody List<UomStoredTo> getUomByProjectId(
	 * 
	 * @PathVariable long project_id) throws ParseException {
	 * 
	 * List<UomStoredTo> list = new ArrayList<UomStoredTo>(); List<UomStored>
	 * uomByProject = uomStoredDao .getResourceByProject(project_id);
	 * 
	 * for (UomStored uomStored : uomByProject) { UomStoredTo uomStoredTo = new
	 * UomStoredTo(); uomStoredToUomStoredToMapper.map(uomStored, uomStoredTo);
	 * list.add(uomStoredTo); } return list; }
	 */
	
	//getting uom according to centillion project code selected by user 
	@RequestMapping(value = "/projectUom/byProjectId/{project_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<ProjectUomTo> getProjectUomByProjectId(
			@PathVariable long project_id) throws ParseException {

		List<ProjectUomTo> list = new ArrayList<ProjectUomTo>();
		List<ProjectUom> uomByProject = projectUomDao
				.getUomByProject(project_id);

		for (ProjectUom projectUom : uomByProject) {
			ProjectUomTo projectUomTo = new ProjectUomTo();
			projectUomToProjectUomToMapper.map(projectUom, projectUomTo);
			list.add(projectUomTo);
		}
		return list;
	}

	
	//getting job by id code
	@RequestMapping(value = "/jobUom/byJobId/{job_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<JobUomTo> getJobUomByJobId(
			@PathVariable long job_id) throws ParseException {

		List<JobUomTo> list = new ArrayList<JobUomTo>();
		List<JobUom> uomByJob = jobUomDao.getUomByJob(job_id);

		for (JobUom jobUom : uomByJob) {
			JobUomTo jobUomTo = new JobUomTo();
			jobUomToJobUomToMapper.map(jobUom, jobUomTo);
			list.add(jobUomTo);
		}
		return list;
	}

	
	//getting resource allocated to the job code
	@RequestMapping(value = "/resourceAllocation/byJobId/{job_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody ResourceAllocationTo getResourceAllocationByJobId(
			@PathVariable long job_id) throws ParseException {

		ResourceAllocationTo resourceAllocationTo = new ResourceAllocationTo();
		ResourceAllocation resourceAllocation = resourceAllocationDao
				.getByJobId(job_id);
		resourceAllocationToResourceAllocationToMapper.map(resourceAllocation,
				resourceAllocationTo);
		return resourceAllocationTo;
	}

	
	//get all jobs list
	@RequestMapping(value = "jobsList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<JobTo> getJobList() {
		List<Job> JobList = new ArrayList<Job>();

		JobList = jobDao.getJobsList();

		List<JobTo> alist = new ArrayList<JobTo>();

		for (Job job : JobList) {
			JobTo jobTo = new JobTo();

			jobToJobToMapper.map(job, jobTo);
			alist.add(jobTo);
		}
		return alist;
	}

	
	//get all approved jobs list code
	@RequestMapping(value = "jobsApprovalList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<JobTo> getApprovalJobList() {
		List<Job> JobList = new ArrayList<Job>();

		JobList = jobDao.getApprovedJobs();

		List<JobTo> approvallist = new ArrayList<JobTo>();

		for (Job job : JobList) {
			JobTo jobTo = new JobTo();

			jobToJobToMapper.map(job, jobTo);
			approvallist.add(jobTo);
		}
		return approvallist;
	}

	
	//getting team members list
	@RequestMapping(value = "teamMembersList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TeamMembersTo> getTeamMembersList() {
		List<TeamMembers> teamMembersList = new ArrayList<TeamMembers>();

		teamMembersList = teamMembersDao.getAll();

		List<TeamMembersTo> alist = new ArrayList<TeamMembersTo>();

		for (TeamMembers teamMembers : teamMembersList) {
			TeamMembersTo teamMemberTo = new TeamMembersTo();

			teamMembersToTeamMembersToMapper.map(teamMembers, teamMemberTo);
			alist.add(teamMemberTo);
		}
		return alist;
	}

	//getting resource allocation list
	@RequestMapping(value = "resourceAllocationList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ResourceAllocationTo> getResourceAllocationList() {
		List<ResourceAllocation> resourceAllocations = new ArrayList<ResourceAllocation>();

		resourceAllocations = resourceAllocationDao.getAll();

		List<ResourceAllocationTo> alist = new ArrayList<ResourceAllocationTo>();

		for (ResourceAllocation resourceAllocation : resourceAllocations) {
			ResourceAllocationTo resourceAllocationTo = new ResourceAllocationTo();

			resourceAllocationToResourceAllocationToMapper.map(
					resourceAllocation, resourceAllocationTo);
			alist.add(resourceAllocationTo);
		}
		return alist;
	}

	/*
	 * @RequestMapping(value = "uomstoredList", method = RequestMethod.GET,
	 * produces = "application/json") public @ResponseBody List<UomStoredTo>
	 * getUomStoredList() { List<UomStored> uomStoredList = new
	 * ArrayList<UomStored>();
	 * 
	 * uomStoredList = uomStoredDao.getAll();
	 * 
	 * List<UomStoredTo> alist = new ArrayList<UomStoredTo>();
	 * 
	 * for (UomStored uomStored : uomStoredList) { UomStoredTo uomStoredTo = new
	 * UomStoredTo();
	 * 
	 * uomStoredToUomStoredToMapper.map(uomStored, uomStoredTo);
	 * alist.add(uomStoredTo); System.out.println(alist); } return alist; }
	 */
	/*
	 * @RequestMapping("jobsReport") public @ResponseBody List<JobTo>
	 * getJobsList(){ List<Job> all = jobDao.getAll();
	 * 
	 * long closeCount = all.stream() .filter(callInfo ->
	 * ((callInfo.getTypeOfCall().equals("In Coming") &&
	 * callInfo.getCallStatus().equals("Closed")))) .count(); long closeCount =
	 * all.stream().count(); long jobsInYTS = all.stream() .filter(jobs -> )
	 * .count(); System.out.println(closeCount);
	 * 
	 * // long totalPending = all.stream().filter(status ->
	 * status.getJ.equals(Constants.PENDING)).count(); return null;
	 * 
	 * }
	 */
}
