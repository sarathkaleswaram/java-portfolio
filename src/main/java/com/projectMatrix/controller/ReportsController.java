package com.projectMatrix.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.JobDao;
import com.projectMatrix.dao.JobStageDao;
import com.projectMatrix.dao.JobUomDao;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.dao.WorkBenchDao;
import com.projectMatrix.mapper.JobToJobToMapper;
import com.projectMatrix.mapper.WorkBenchToWorkBenchToMapper;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.JobUom;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.model.WorkBench;
import com.projectMatrix.to.EmployeeEfficiencyTo;
import com.projectMatrix.to.JobEfficiencyByDatesTo;
import com.projectMatrix.to.JobTo;
import com.projectMatrix.to.WorkBenchTo;
import com.projectMatrix.utils.DateUtil;

@Controller
public class ReportsController {

	@Autowired
	JobDao jobDao;
	@Autowired
	JobToJobToMapper jobToJobToMapper;
	@Autowired
	JobUomDao jobUomDao;
	@Autowired
	ResourceAllocationDao resourceAllocationDao;
	@Autowired
	JobStageDao jobStageDao;
	@Autowired
	ResourceDao resourceDao;	
	@Autowired
	WorkBenchToWorkBenchToMapper workBenchToWorkBenchToMapper;	
	@Autowired
	WorkBenchDao workBenchDao;


//To get the status of each project
	@RequestMapping(value = "/jobsReport/{project_id}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody JobTo getJobsList(@PathVariable long project_id) {

		long jobProductionInYts = 0, totalJobs = 0, productionWIPJobs = 0, productionCmpltdJobs = 0, qcWIPJobs = 0, qcCmpltdJobs = 0, qaWIPJobs = 0, qaCmpltdJobs = 0, DeliveryWIPJobs = 0, DeliveryCmpltdJobs = 0, JobsInQuery = 0, jobsOnHold = 0;

		JobTo jobTo = new JobTo();
		// JobTo list = new ArrayList<JobTo>();
		// ModelMap map = new ModelMap();
		List<Job> jobsByProject = jobDao.getJobsByProject(project_id);

		totalJobs = jobsByProject.stream().count();
		jobProductionInYts = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Production) && status.getJobStatus().equals(
						Constants.YTS))).count();

		productionWIPJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Production) && status.getJobStatus().equals(
						Constants.WIP))).count();
		productionWIPJobs += jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Production) && status.getJobStatus().equals(
						Constants.Pause))).count();

		productionCmpltdJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QC) && status
						.getJobStatus().equals(Constants.YTS))).count();

		qcWIPJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QC) && status
						.getJobStatus().equals(Constants.WIP))).count();

		qcWIPJobs += jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QC) && status
						.getJobStatus().equals(Constants.Pause))).count();

		qcCmpltdJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QA) && status
						.getJobStatus().equals(Constants.YTS))).count();

		qaWIPJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QA) && status
						.getJobStatus().equals(Constants.WIP))).count();
		qaWIPJobs += jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(Constants.QA) && status
						.getJobStatus().equals(Constants.Pause))).count();

		qaCmpltdJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Delivery) && status.getJobStatus().equals(
						Constants.YTS))).count();

		DeliveryWIPJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Delivery) && status.getJobStatus().equals(
						Constants.WIP))).count();
		DeliveryWIPJobs += jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Delivery) && status.getJobStatus().equals(
						Constants.Pause))).count();

		DeliveryCmpltdJobs = jobsByProject
				.stream()
				.filter(status -> (status.getJobStage().equals(
						Constants.Approval) && status.getJobStatus().equals(
						Constants.Pending))).count();

		JobsInQuery = jobsByProject
				.stream()
				.filter(status -> status.getJobStatus().equals(Constants.Query))
				.count();

		jobsOnHold = jobsByProject.stream()
				.filter(status -> status.getJobStatus().equals(Constants.Hold))
				.count();

		jobTo.setTotalJobs(totalJobs);
		jobTo.setProductionWIPJobs(productionWIPJobs);
		jobTo.setProductionCmpltdJobs(productionCmpltdJobs);
		jobTo.setJobsInYts(jobProductionInYts);
		jobTo.setQaWIPJobs(qaWIPJobs);
		jobTo.setQaCmpltdJobs(qaCmpltdJobs);
		jobTo.setQcWIPJobs(qcWIPJobs);
		jobTo.setQcCmpltdJobs(qcCmpltdJobs);
		jobTo.setDeliveryWIPJobs(DeliveryWIPJobs);
		jobTo.setDeliveryCmpltdJobs(DeliveryCmpltdJobs);
		jobTo.setJobsInQuery(JobsInQuery);
		jobTo.setJobsOnHold(jobsOnHold);

		// list.add(jobTo);

		return jobTo;
	}

	@RequestMapping(value = "/jobsCountReport/{reportJson}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody JobTo getJobsListCountByDates(
			@PathVariable String reportJson) throws JsonParseException,
			JsonMappingException, IOException, ParseException {

		long jobProductionInYts = 0, totalJobs = 0, productionWIPJobs = 0, productionCmpltdJobs = 0, qcWIPJobs = 0, qcCmpltdJobs = 0, qaWIPJobs = 0, qaCmpltdJobs = 0, DeliveryWIPJobs = 0, DeliveryCmpltdJobs = 0, JobsInQuery = 0, jobsOnHold = 0;

		ObjectMapper objectMapper = new ObjectMapper();

		JobTo readValue = objectMapper.readValue(reportJson, JobTo.class);

		JobTo jobTo = new JobTo();
		// JobTo list = new ArrayList<JobTo>();
		// ModelMap map = new ModelMap();

		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		if (!readValue.getReceivedDate().isEmpty()
				&& !readValue.getToDate().isEmpty()) {

			Date from = formatter.parse(readValue.getReceivedDate());
			Date to = formatter.parse(readValue.getToDate());
			List<Job> jobsByProject = jobDao.getJobsByProjectandDates(
					readValue.getProjectId(), from, to);

			totalJobs = jobsByProject.stream().count();

			jobProductionInYts = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Production) && status.getJobStatus()
							.equals(Constants.YTS))).count();

			productionWIPJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Production) && status.getJobStatus()
							.equals(Constants.WIP))).count();
			productionWIPJobs += jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Production) && status.getJobStatus()
							.equals(Constants.Pause))).count();

			productionCmpltdJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QC) && status.getJobStatus()
							.equals(Constants.YTS))).count();

			qcWIPJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QC) && status.getJobStatus()
							.equals(Constants.WIP))).count();

			qcWIPJobs += jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QC) && status.getJobStatus()
							.equals(Constants.Pause))).count();

			qcCmpltdJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QA) && status.getJobStatus()
							.equals(Constants.YTS))).count();

			qaWIPJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QA) && status.getJobStatus()
							.equals(Constants.WIP))).count();
			qaWIPJobs += jobsByProject
					.stream()
					.filter(status -> (status.getJobStage()
							.equals(Constants.QA) && status.getJobStatus()
							.equals(Constants.Pause))).count();

			qaCmpltdJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Delivery) && status.getJobStatus()
							.equals(Constants.YTS))).count();

			DeliveryWIPJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Delivery) && status.getJobStatus()
							.equals(Constants.WIP))).count();
			DeliveryWIPJobs += jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Delivery) && status.getJobStatus()
							.equals(Constants.Pause))).count();

			DeliveryCmpltdJobs = jobsByProject
					.stream()
					.filter(status -> (status.getJobStage().equals(
							Constants.Approval) && status.getJobStatus()
							.equals(Constants.Pending))).count();

			JobsInQuery = jobsByProject
					.stream()
					.filter(status -> status.getJobStatus().equals(
							Constants.Query)).count();

			jobsOnHold = jobsByProject
					.stream()
					.filter(status -> status.getJobStatus().equals(
							Constants.Hold)).count();

			jobTo.setTotalJobs(totalJobs);
			jobTo.setProductionWIPJobs(productionWIPJobs);
			jobTo.setProductionCmpltdJobs(productionCmpltdJobs);
			jobTo.setJobsInYts(jobProductionInYts);
			jobTo.setQaWIPJobs(qaWIPJobs);
			jobTo.setQaCmpltdJobs(qaCmpltdJobs);
			jobTo.setQcWIPJobs(qcWIPJobs);
			jobTo.setQcCmpltdJobs(qcCmpltdJobs);
			jobTo.setDeliveryWIPJobs(DeliveryWIPJobs);
			jobTo.setDeliveryCmpltdJobs(DeliveryCmpltdJobs);
			jobTo.setJobsInQuery(JobsInQuery);
			jobTo.setJobsOnHold(jobsOnHold);

			// list.add(jobTo);

		} else if (readValue.getProjectId() > 0) {
			JobTo jobsList = getJobsList(readValue.getProjectId());
			return jobsList;
		}
		return jobTo;
	}

	//To get the Jobs Reports ByDate
	@RequestMapping(value = "/jobsReportByDates/{reportJson}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<JobTo> getJobsListByDates(
			@PathVariable String reportJson) throws ParseException,
			JsonParseException, JsonMappingException, IOException {

		ObjectMapper objectMapper = new ObjectMapper();

		JobTo readValue = objectMapper.readValue(reportJson, JobTo.class);

		List<JobTo> list = new ArrayList<JobTo>();

		String Fdate = readValue.getReceivedDate();
		String Tdate = readValue.getToDate();

		if (!Fdate.isEmpty() && !Tdate.isEmpty()) {

			DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date from = formatter.parse(readValue.getReceivedDate());
			Date to = formatter.parse(readValue.getToDate());
			List<Job> jobsByProjectandDates = jobDao.getJobsByProjectandDates(
					readValue.getProjectId(), from, to);

			for (Job job : jobsByProjectandDates) {
				JobTo jobTo = new JobTo();
				jobToJobToMapper.map(job, jobTo);
				list.add(jobTo);
			}

		} else if (readValue.getProjectId() > 0) {
			List<Job> jobsByProject = jobDao.getJobsByProject(readValue
					.getProjectId());
			for (Job job : jobsByProject) {
				JobTo jobTo = new JobTo();
				jobToJobToMapper.map(job, jobTo);
				list.add(jobTo);
			}

		} /*
		 * else {
		 * 
		 * List<Job> jobsByProject = jobDao.getAll();
		 * 
		 * for (Job job : jobsByProject) { JobTo jobTo = new JobTo();
		 * jobToJobToMapper.map(job, jobTo); list.add(jobTo); }
		 * 
		 * }
		 */

		return list;
	}

	//To count no of jobs by Date
	@RequestMapping(value = "jobsCountByDates/{reportJson}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<JobEfficiencyByDatesTo> jobCountByDates(
			@PathVariable String reportJson) throws ParseException,
			JsonParseException, JsonMappingException, IOException {

		ObjectMapper objectMapper = new ObjectMapper();

		JobTo readValue = objectMapper.readValue(reportJson, JobTo.class);

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

		String fromdate = readValue.getReceivedDate();

		// System.out.println("recived date============================="+readValue.getReceivedDate());

		String toDate = readValue.getToDate();

		// System.out.println("recived date============================="+readValue.getToDate());

		// System.out.println("dateeeeeeeeeeeeeeeeeee" +
		// dateFormat.parse(toDate));

		List<Job> jobsCountByDates = jobDao.getJobsCountByDates(
				readValue.getProjectId(), dateFormat.parse(fromdate),
				dateFormat.parse(toDate));

		List<JobTo> jobTos = new ArrayList<JobTo>();
		List<String> uniqueDates = new ArrayList<String>();

		for (Job job : jobsCountByDates) {
			JobTo jobTo = new JobTo();
			jobToJobToMapper.map(job, jobTo);
			jobTos.add(jobTo);
			uniqueDates.add(jobTo.getDeliveredOn());
		}

		Set<String> dates = new HashSet<String>(uniqueDates);

		List<JobEfficiencyByDatesTo> list = new ArrayList<JobEfficiencyByDatesTo>();
		for (String date : dates) {
			JobEfficiencyByDatesTo jobEfficiencyByDates = new JobEfficiencyByDatesTo();
			jobEfficiencyByDates.setDeliveredDate(date);
			// System.out.println("uniqueDates" + dateFormat.parse(date));
			/*
			 * int countByDeliveryDate =
			 * jobDao.getCountByDeliveryDate(88,dateFormat.parse(date));
			 * System.out
			 * .println("critiria---------------"+countByDeliveryDate);
			 */
			int count = 0, jobUom = 0;
			double estimate = 0.0, spent = 0.0;
			for (JobTo jobTo : jobTos) {
				if (jobTo.getDeliveredOn().contains(date)) {
					count++;
				}
				if (jobTo.getDeliveredOn().equals(date)) {
					List<JobUom> uomByJob = jobUomDao.getUomByJobAndDate(jobTo
							.getJobId());
					for (JobUom jobUom2 : uomByJob) {
						jobUom += jobUom2.getValue();
					}
					if (jobTo.getHoursEstimated() != null) {
						estimate += jobTo.getHoursEstimated();
					}
					if (jobTo.getHoursSpent() != null) {
						spent += jobTo.getHoursSpent();
					}
				}
			}

			// System.out.println("estimate============================="+estimate);
			// System.out.println("spent=========="+spent);
			DecimalFormat percentFormat = new DecimalFormat("0.0%");

			// System.out.println("String=================="+percentFormat.format(estimate
			// / spent));
			jobEfficiencyByDates.setCount(count);
			jobEfficiencyByDates.setUomTotal(jobUom);
			// jobEfficiencyByDates.setEfficiency(calEfficiency(estimate,spent));
			jobEfficiencyByDates.setEfficiency(percentFormat.format(estimate
					/ spent));
			list.add(jobEfficiencyByDates);

		}
		// System.out.println("list------------"+list);

		// System.out.println("unique=========================================="
		// + dates);

		return list;

	}

	//To Get the Employee efficiency list
	@RequestMapping("empEfficiencyList")
	public @ResponseBody List<EmployeeEfficiencyTo> empEfficiency() {

		Date from = DateUtil.formatDate_DB("2017-09-10");
		Date to = DateUtil.formatDate_DB("2017-09-20");

		List<JobTo> jobs = new ArrayList<JobTo>();
		List<Job> allJobsByDates = jobDao.getAllJobsByDates(from, to);
		List<EmployeeEfficiencyTo> efficiencyTos = new ArrayList<EmployeeEfficiencyTo>();

		// System.out.println("allJobsByDates========================="+allJobsByDates);
		for (Job job : allJobsByDates) {
			ResourceAllocation resourceAllocation = resourceAllocationDao
					.getByJobId(job.getJobId());

			List<JobStage> jobStageByJobId = jobStageDao.getJobStageByJobId(job
					.getJobId());
			
			
			
			double estimate = 0.0, spent = 0.0;

			EmployeeEfficiencyTo employeeEfficiencyTo = new EmployeeEfficiencyTo();
			if (resourceAllocation.getResourceByProductionAllocatedId() != null)
				employeeEfficiencyTo.setEmployeeName(resourceAllocation
						.getResourceByProductionAllocatedId().getFirstName());
			if (jobStageByJobId.get(0).getHoursSpent() != null) {
				estimate = jobStageByJobId.get(0).getHoursEstimated();
				spent = jobStageByJobId.get(0).getHoursSpent();
			}
			employeeEfficiencyTo.setEfficiency((estimate / spent) * 100);
			efficiencyTos.add(employeeEfficiencyTo);

			
			
			estimate = 0.0;
			spent = 0.0;
			employeeEfficiencyTo = new EmployeeEfficiencyTo();
			if (resourceAllocation.getResourceByQcAllocatedId() != null)
				employeeEfficiencyTo.setEmployeeName(resourceAllocation
						.getResourceByQcAllocatedId().getFirstName());
			if (jobStageByJobId.get(0).getHoursSpent() != null) {
				estimate = jobStageByJobId.get(0).getHoursEstimated();
				spent = jobStageByJobId.get(0).getHoursSpent();
			}
			employeeEfficiencyTo.setEfficiency((estimate / spent) * 100);
			efficiencyTos.add(employeeEfficiencyTo);

			
			
			estimate = 0.0;
			spent = 0.0;
			employeeEfficiencyTo = new EmployeeEfficiencyTo();
			if (resourceAllocation.getResourceByQaAllocatedId() != null)
				employeeEfficiencyTo.setEmployeeName(resourceAllocation
						.getResourceByQaAllocatedId().getFirstName());
			if (jobStageByJobId.get(0).getHoursSpent() != null) {
				estimate = jobStageByJobId.get(0).getHoursEstimated();
				spent = jobStageByJobId.get(0).getHoursSpent();
			}
			employeeEfficiencyTo.setEfficiency((estimate / spent) * 100);
			efficiencyTos.add(employeeEfficiencyTo);

			
			
			estimate = 0.0;
			spent = 0.0;
			employeeEfficiencyTo = new EmployeeEfficiencyTo();
			if (resourceAllocation.getResourceByFeedbackAllocatedId() != null)
			employeeEfficiencyTo.setEmployeeName(resourceAllocation
					.getResourceByFeedbackAllocatedId().getFirstName());
			if (jobStageByJobId.get(0).getHoursSpent() != null) {
				estimate = jobStageByJobId.get(0).getHoursEstimated();
				spent = jobStageByJobId.get(0).getHoursSpent();
			}
			employeeEfficiencyTo.setEfficiency((estimate / spent) * 100);
			System.out.println(employeeEfficiencyTo.getEfficiency());
			efficiencyTos.add(employeeEfficiencyTo);

		}
		
		
		List<EmployeeEfficiencyTo> list = new ArrayList<EmployeeEfficiencyTo>();

		int count = 0;
		double efficiency = 0.0;
		List<Resource> resources = resourceDao.getAll();
		String infinityCheck = "";
		for (Resource resource : resources) {
			EmployeeEfficiencyTo efficiencyTo = new EmployeeEfficiencyTo();
			efficiencyTo.setEmployeeName(resource.getFirstName());
			count = 0;
			for (EmployeeEfficiencyTo employeeEfficiencyTo : efficiencyTos) {
				if (resource.getFirstName().equals(employeeEfficiencyTo.getEmployeeName())) {
					efficiencyTo.setJobsDone(count++);
					infinityCheck = Double.toString(employeeEfficiencyTo.getEfficiency());
					if(!infinityCheck.equals("Infinity")){
						efficiency += employeeEfficiencyTo.getEfficiency();
						System.out.println("effi--------"+employeeEfficiencyTo.getEfficiency());
					}
					efficiencyTo.setEfficiency(efficiency);
				}
			}
			list.add(efficiencyTo);
		}
			
		return list;

	}
	
	//To get the Reort of worked by dates and worked on
	@RequestMapping(value = "getByDatesAndWorkedOn/{from}/{to}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<WorkBenchTo> getByDatesAndWorkedOn(@PathVariable String from,
			@PathVariable String to) {

		System.out.println("coming-------------------------");
		List<WorkBenchTo> alist = new ArrayList<WorkBenchTo>();

		Date fromDate = DateUtil.formatDate(from);
		Date toDate = DateUtil.formatDate(to);

		List<WorkBench> byDatesAndWorkedOn;
		
		byDatesAndWorkedOn = workBenchDao.getAllByDates(fromDate, toDate);

		/*if (workedOn.equals("All")) {
			byDatesAndWorkedOn = workBenchDao.getAllByDates(fromDate, toDate);
		} else if (workedOn.equals("Others")) {
			byDatesAndWorkedOn = workBenchDao.getByDatesAndWorkedOnWhenOthers(
					fromDate, toDate, workedOn);
		} else {
			byDatesAndWorkedOn = workBenchDao.getByDatesAndWorkedOn(fromDate,
					toDate, workedOn);
		}*/

		// List<String> uniqueNames = new ArrayList<String>();

		for (WorkBench workBench : byDatesAndWorkedOn) {
			WorkBenchTo benchTo = new WorkBenchTo();
			workBenchToWorkBenchToMapper.map(workBench, benchTo);
			// uniqueNames.add(benchTo.getResource());
			alist.add(benchTo);
		}

		/*
		 * List<WorkBenchTo> workBenchToList = new ArrayList<WorkBenchTo>();
		 * Set<String> names = new HashSet<String>(uniqueNames); for (String
		 * name : names) { WorkBenchTo benchTo = new WorkBenchTo(); double
		 * spentTotal = 0.0; for (WorkBenchTo workBenchTo : alist) { if
		 * (workBenchTo.getResource().equals(name)) { spentTotal +=
		 * workBenchTo.getSpentTime(); } } benchTo.setSpentTime(spentTotal);
		 * benchTo.setResource(name); workBenchToList.add(benchTo); }
		 */
		return alist;
	}

}
