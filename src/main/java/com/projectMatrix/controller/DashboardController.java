package com.projectMatrix.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectMatrix.dao.JobDao;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.mapper.JobToJobToMapper;
import com.projectMatrix.mapper.JobToToJobMapper;
import com.projectMatrix.mapper.ProjectToProjectToMapper;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.Project;
import com.projectMatrix.to.JobTo;
import com.projectMatrix.to.ProjectDashboardTo;

@Controller
public class DashboardController {

	@Autowired
	JobDao jobDao;
	@Autowired
	JobToToJobMapper jobToToJobMapper;
	@Autowired
	JobToJobToMapper jobToJobToMapper;
	@Autowired
	ProjectDao projectDao;
	@Autowired
	ProjectToProjectToMapper projectToProjectToMapper;

	//get No of Jobs for dashboard
	@RequestMapping("projectDashboard")
	public @ResponseBody List<ProjectDashboardTo> getNoOfJobs() {
		List<Project> project = projectDao.getAll();

		List<ProjectDashboardTo> list = new ArrayList<ProjectDashboardTo>();

		for (Project project2 : project) {
			ProjectDashboardTo projectDashboardTo = new ProjectDashboardTo();

			List<Job> job = jobDao.getJobByProjectWhereJobsIncomplete(project2
					.getProjectId());

//			System.out.println("coutn---------------" + job.size());
			double totalEstimatedHours = 0.0, totalSpentHours = 0.0, totalHours = 0.0;
			for (Job job2 : job) {
				JobTo jobTo = new JobTo();
				jobToJobToMapper.mapForTime(job2, jobTo);
				if (jobTo.getHoursEstimated() != null) {
					totalEstimatedHours += jobTo.getHoursEstimated();
				}
				if (jobTo.getHoursSpent() != null) {
					totalSpentHours += jobTo.getHoursSpent();
				}
			}
			DecimalFormat numberFormat = new DecimalFormat("#.0");
			totalHours = totalEstimatedHours - totalSpentHours;
			if(totalHours < 0){
				totalHours = 0; 
			}
			totalHours = Double.parseDouble(numberFormat.format(totalHours));
//			System.out.println("Total Hours __________-" + totalHours);

			double days = 0;
			days = totalHours / 8;
			
			days = Double.parseDouble(numberFormat.format(days));
//			System.out.println("days=----------------" + days);

			projectDashboardTo.setNoOfJobs(job.size());
			projectDashboardTo.setRemainingHours(totalHours);
			projectDashboardTo.setRequiredMenDays(days);
			projectDashboardTo.setProjectId(project2.getProjectId());
			projectDashboardTo.setProjectName(project2.getProjectName());
			
			
			list.add(projectDashboardTo);    

		}
		return list;

	}

}
