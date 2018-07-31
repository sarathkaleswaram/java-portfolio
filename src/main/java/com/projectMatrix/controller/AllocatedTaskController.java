package com.projectMatrix.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import com.projectMatrix.dao.PerformanceDao;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.dao.ProjectUomDao;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.dao.UomDao;
import com.projectMatrix.dao.UomStoredDao;
import com.projectMatrix.dao.WorkBenchDao;
import com.projectMatrix.dao.WorkbenchJobDao;
import com.projectMatrix.mapper.JobStageToJobStageToMapper;
import com.projectMatrix.mapper.JobToJobToMapper;
import com.projectMatrix.mapper.JobToToJobMapper;
import com.projectMatrix.mapper.PerformanceToPerformanceToMapper;
import com.projectMatrix.mapper.ResourceAllocationToResourceAllocationToMapper;
import com.projectMatrix.mapper.WorkBenchJobToWorkBenchJobTo;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.JobUom;
import com.projectMatrix.model.ProjectUom;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.model.WorkBench;
import com.projectMatrix.model.WorkbenchJob;
import com.projectMatrix.to.JobStageTo;
import com.projectMatrix.to.JobTo;
import com.projectMatrix.to.ResourceAllocationTo;
import com.projectMatrix.to.WorkBenchJobTo;

@Controller
public class AllocatedTaskController {

	@Autowired
	JobStageDao jobStageDao;
	@Autowired
	ProjectDao projectDao;
	@Autowired
	JobDao jobDao;
	@Autowired
	UomDao uomDao;
	@Autowired
	UomStoredDao uomStoredDao;
	@Autowired
	ProjectUomDao projectUomDao;
	@Autowired
	JobUomDao jobUomDao;
	@Autowired
	BasicUserInfo basicUserInfo;
	@Autowired
	ResourceAllocationDao resourceAllocationDao;
	@Autowired
	JobStageToJobStageToMapper jobStageToJobStageToMapper;
	@Autowired
	ResourceAllocationToResourceAllocationToMapper resourceAllocationToResourceAllocationToMapper;
	@Autowired
	JobToJobToMapper jobToJobToMapper;
	@Autowired
	PerformanceDao performanceDao;
	@Autowired
	PerformanceToPerformanceToMapper performanceToPerformanceToMapper;
	@Autowired
	JobToToJobMapper jobToToJobMapper;
	@Autowired
	WorkBenchDao workBenchDao;
	@Autowired
	WorkbenchJobDao workbenchJobDao;
	@Autowired
	WorkBenchJobToWorkBenchJobTo workBenchJobToWorkBenchJobTo;

	//for getting jobStage list
	@RequestMapping(value = "getJobStage", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<JobStageTo> getJobStageList() {

		List<JobStage> all = jobStageDao.getAll();
		List<JobStageTo> alist = new ArrayList<JobStageTo>();

		for (JobStage jobStage : all) {
			JobStageTo jobStageTo = new JobStageTo();
			jobStageToJobStageToMapper.map(jobStage, jobStageTo);
			alist.add(jobStageTo);
		}
		return alist;
	}

	//getJobStageListByJobId
	@RequestMapping(value = "getJobStageByJobId/{job_id}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<JobStageTo> getJobStageListByJobId(
			@PathVariable long job_id) {

		List<JobStage> all = jobStageDao.getJobStageByJobId(job_id);
		List<JobStageTo> alist = new ArrayList<JobStageTo>();

		for (JobStage jobStage : all) {
			JobStageTo jobStageTo = new JobStageTo();
			jobStageToJobStageToMapper.map(jobStage, jobStageTo);
			alist.add(jobStageTo);
		}
		return alist;
	}

	//calculating time difference between start & end date
	public String getTimeDiff(Date dateOne, Date dateTwo) {
		String diff = "";
		long timeDiff = Math.abs(dateOne.getTime() - dateTwo.getTime());
		diff = String.format(
				"%d:%d:00",
				TimeUnit.MILLISECONDS.toHours(timeDiff),
				TimeUnit.MILLISECONDS.toMinutes(timeDiff)
						- TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS
								.toHours(timeDiff)));
		return diff;
	}
 
	//allocated task updating code starts 
	@RequestMapping(value = "/mytask/update/{projectId}/{jobId}/{jobs}/{jobStageId}/{jobUomId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<Job> addTask(@PathVariable Long projectId,
			@PathVariable Long jobId, @PathVariable String jobs,
			@PathVariable long jobStageId, @PathVariable long jobUomId)
			throws ParseException, JsonParseException, JsonMappingException,
			IOException {

		System.out.println("Update*******************************");
		// Project project = projectDao.getById(projectId);

		JobStage jobStage = jobStageDao.getById(jobStageId);

		ObjectMapper objectMapper = new ObjectMapper();

		JobTo jobTo1 = objectMapper.readValue(jobs, JobTo.class);
		// JobTo jobTo = new JobTo();
		Job job = jobDao.getById(jobId);
		ResourceAllocation resourceAllocation = resourceAllocationDao
				.getByJobId(jobId);

		/* calculating time start here with WIP */
		WorkBench workbenchByIdAndDate = workBenchDao.getByResourceIdAndDate(
				basicUserInfo.getUser().getResource().getResourceId(),
				new Date());

		if (jobTo1.getJobStatus().equalsIgnoreCase(Constants.WIP)) {
			Date date = new Date();
			jobStage.setWipTime(date);

			if (workbenchByIdAndDate == null) {
				WorkBench workBench = new WorkBench();

				workBench.setDoc(date);
				workBench.setResource(basicUserInfo.getUser().getResource());

				// workBench.setEstimatedTime(jobStage.getHoursEstimated());

				workBenchDao.saveOrUpdate(workBench);
			}
			jobStageDao.saveOrUpdate(jobStage);
		}

		job.setRemarks(jobTo1.getRemarks());
		if (jobTo1.getJobStatus().equalsIgnoreCase(Constants.Pause)
				|| jobTo1.getJobStatus().equalsIgnoreCase(Constants.Query)
				|| jobTo1.getJobStatus().equalsIgnoreCase(Constants.Hold)
				|| jobTo1.getJobStatus().equalsIgnoreCase(Constants.Completed)) {

			Date date = new Date();

			Date start = jobStage.getWipTime();
			Date pause = date;

			jobStage.setPauseTime(date);

			// calculating diffrence b/w times
			long diff = pause.getTime() - start.getTime();
			Long l = new Long(diff);
			double formattedTime = l.doubleValue() / (60 * 60 * 1000);

			double timeInJobStage = 0.0;
			DecimalFormat numberFormat = new DecimalFormat("#.00");
			formattedTime = Double.parseDouble(numberFormat
					.format(formattedTime));

			if (jobStage.getHoursSpent() == null) {
				timeInJobStage = formattedTime;
			} else {
				timeInJobStage = Math.abs(jobStage.getHoursSpent()
						+ formattedTime);
				timeInJobStage = Double.parseDouble(numberFormat
						.format(timeInJobStage));
			}
			jobStage.setHoursSpent(timeInJobStage);
			double hour = 0.0;

			if (job.getHoursSpent() != null) {
				hour = job.getHoursSpent();
			}
			job.setHoursSpent(hour + formattedTime);

			if (workbenchByIdAndDate != null) {
				if (workbenchByIdAndDate.getSpentTime() != null) {
					workbenchByIdAndDate.setSpentTime(workbenchByIdAndDate
							.getSpentTime() + formattedTime);
				} else {
					workbenchByIdAndDate.setSpentTime(formattedTime);
				}
				workBenchDao.saveOrUpdate(workbenchByIdAndDate);
			} else {
				WorkBench workBench = new WorkBench();
				workBench.setDoc(date);
				workBench.setResource(basicUserInfo.getUser().getResource());
				workBenchDao.saveOrUpdate(workBench);
			}

			jobDao.saveOrUpdate(job);

			workbenchByIdAndDate = workBenchDao.getByResourceIdAndDate(
					basicUserInfo.getUser().getResource().getResourceId(),
					new Date());

			WorkbenchJob workbenchJobByJobIdAndWorkbenchId = workbenchJobDao
					.getByJobIdandWorkBenchId(job.getJobId(),
							workbenchByIdAndDate.getWorkBenchId(), jobTo1.getJobStage());
			

			if (workbenchJobByJobIdAndWorkbenchId == null) {
				WorkbenchJob workbenchJob = new WorkbenchJob();
				workbenchJob.setJobStage(job.getJobStage());
				workbenchJob.setJob(job);
				workbenchJob.setWorkBench(workbenchByIdAndDate);
				if (formattedTime >= 0.0) {
					workbenchJob.setSpentTime(formattedTime);
				}
				workbenchJobDao.saveOrUpdate(workbenchJob);
			} else {
				if (formattedTime >= 0.0) {
					workbenchJobByJobIdAndWorkbenchId.setSpentTime(Double
							.parseDouble(numberFormat
									.format(workbenchJobByJobIdAndWorkbenchId
											.getSpentTime() + formattedTime)));
					workbenchJobDao
							.saveOrUpdate(workbenchJobByJobIdAndWorkbenchId);
				}
			}

			jobStageDao.saveOrUpdate(jobStage);

		}

		job.setJobStatus(jobTo1.getJobStatus());

		if (jobTo1.getJobStatus() != null) {
			jobStage.setJobStatus(jobTo1.getJobStatus());
		}
		/*
		 * double hours = 0; if (jobTo1.getHoursSpent() != null) { if
		 * (job.getHoursSpent() != null) { hours = job.getHoursSpent(); }
		 * jobStage.setHoursSpent((double) jobTo1.getHoursSpent());
		 * jobStageDao.saveOrUpdate(jobStage); } if (jobTo1.getHoursSpent() !=
		 * null) { job.setHoursSpent(hours + jobTo1.getHoursSpent()); }
		 */

		if (jobTo1.getJobStatus() != null) {
			if (job.getJobStage().equalsIgnoreCase(Constants.Production)
					&& jobTo1.getJobStatus().equalsIgnoreCase(
							Constants.Completed)) {
				jobStage.setJobStage(Constants.Production);
				jobStage.setJobStatus(Constants.Completed);
				job.setJobStage(Constants.QC);
				job.setJobStatus(Constants.YTS);
				if (resourceAllocation.getResourceByQcAllocatedId() != null) {
					job.setResource(resourceAllocation
							.getResourceByQcAllocatedId());
				} else {
					job.setResource(null);
				}
			} else if (job.getJobStage().equalsIgnoreCase(Constants.QC)
					&& jobTo1.getJobStatus().equalsIgnoreCase(
							Constants.Completed)) {
				jobStage.setJobStage(Constants.QC);
				jobStage.setJobStatus(Constants.Completed);
				job.setJobStage(Constants.QA);
				job.setJobStatus(Constants.YTS);
				if (resourceAllocation.getResourceByQaAllocatedId() != null) {
					job.setResource(resourceAllocation
							.getResourceByQaAllocatedId());
				} else {
					job.setResource(null);
				}
			} else if (job.getJobStage().equalsIgnoreCase(Constants.QA)
					&& jobTo1.getJobStatus().equalsIgnoreCase(
							Constants.Completed)) {

				jobStage.setJobStage(Constants.QA);
				jobStage.setJobStatus(Constants.Completed);
				job.setJobStage(Constants.Delivery);
				job.setJobStatus(Constants.YTS);
				if (resourceAllocation.getResourceByFeedbackAllocatedId() != null) {
					job.setResource(resourceAllocation
							.getResourceByFeedbackAllocatedId());
				} else {
					job.setResource(null);
				}
			} else if (job.getJobStage().equalsIgnoreCase(Constants.Delivery)
					&& jobTo1.getJobStatus().equalsIgnoreCase(
							Constants.Completed)) {

				job.setDeliveredOn(new Date());
				jobStage.setJobStage(Constants.Delivery);
				jobStage.setJobStatus(Constants.Completed);
				job.setJobStage(Constants.Approval);
				job.setJobStatus(Constants.Pending);
			}
			jobDao.saveOrUpdate(job);
			jobStageDao.saveOrUpdate(jobStage);
		}

		/*
		 * List<JobUom> jobUom1 = jobUomDao.getUomByJob(jobId); for (JobUom
		 * jobUom2 : jobUom1) { jobUomDao.delete(jobUom2); }
		 */
		List<ProjectUom> projectUom = projectUomDao
				.getProjectUomIdByProjectId(projectId);
		int i = 0;
		Integer[] uom = jobTo1.getValue();
		/*
		 * System.out.println("UOM--------"+uom[0]);
		 * System.out.println("UOM--------"+uom[1]);
		 * System.out.println("UOM--------"+uom[2]);
		 */
		if (jobUomId == 0) {
			if (jobTo1.getValue() != null) {
				for (ProjectUom projectUom2 : projectUom) {
					JobUom jobUom = new JobUom();
					jobUom.setJob(job);
					jobUom.setProjectUom(projectUom2);
					jobUom.setValue(uom[i]);
					jobUomDao.saveOrUpdate(jobUom);
					i++;
				}
			}

		} else {
			if (jobTo1.getValue() != null) {
				for (ProjectUom projectUom2 : projectUom) {
					JobUom jobUom = jobUomDao.getById(jobUomId + i);
					jobUom.setJob(job);
					jobUom.setProjectUom(projectUom2);
					jobUom.setValue(uom[i]);
					jobUomDao.saveOrUpdate(jobUom);
					i++;
				}
			}
		}

		return null;

	}

	
	//for getJobByUser
	@RequestMapping(value = "getJobsByUser", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<JobTo> getJobsByUser() {
		System.out.println(basicUserInfo.getUser());
		List<JobTo> jobTo = new ArrayList<JobTo>();
		// List<ResourceAllocationTo> resoList = new
		// ArrayList<ResourceAllocationTo>();
		List<ResourceAllocation> jobsByUser = resourceAllocationDao
				.getJobsByJobStage(basicUserInfo.getUser().getResourceId());
		for (ResourceAllocation resourceAllocation : jobsByUser) {
			ResourceAllocationTo allocationTo = new ResourceAllocationTo();
			resourceAllocationToResourceAllocationToMapper.map(
					resourceAllocation, allocationTo);
			Job byJobs = jobDao.getById((allocationTo.getJob()));
			JobTo jobTo2 = new JobTo();
			jobToJobToMapper.map(byJobs, jobTo2);
			jobTo2.getJobStage();
			// resoList.add(allocationTo);
			jobTo.add(jobTo2);
		}
		return jobTo;
	}

	
	//for getting WorkBenchJobsBySpentTime by Id
	@RequestMapping(value = "/workBenchjob/{workBenchId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<WorkBenchJobTo> WorkBenchJobsBySpentTime(
			@PathVariable Long workBenchId) throws ParseException,
			JsonParseException, JsonMappingException, IOException {
		List<WorkbenchJob> allByworkBenchId = workbenchJobDao
				.getAllByworkBenchId(workBenchId);

		List<WorkBenchJobTo> list = new ArrayList<WorkBenchJobTo>();
		for (WorkbenchJob workbenchJob : allByworkBenchId) {
			WorkBenchJobTo workBenchJobTo = new WorkBenchJobTo();
			workBenchJobToWorkBenchJobTo.map(workbenchJob, workBenchJobTo);
            list.add(workBenchJobTo);
		}
		return list;

	}

	//decimal to String Time Converter 
	public String decimalToTimeConverter(double hours) {
		double d = hours * 60 * 60;
		int h = (int) d / 3600;
		int m = (int) d % 3600 / 60;
		int s = (int) d % 3600 % 60;
		String hh = h <= 9 ? "0" + h : Integer.toString(h);
		String mm = m <= 9 ? "0" + m : Integer.toString(m);
		String ss = s <= 9 ? "0" + s : Integer.toString(s);
		return hh + ":" + mm + ":" + ss;

	}

}
