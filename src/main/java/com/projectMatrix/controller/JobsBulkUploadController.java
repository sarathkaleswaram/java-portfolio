package com.projectMatrix.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.JobDao;
import com.projectMatrix.dao.JobStageDao;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.mapper.JobToJobToMapper;
import com.projectMatrix.mapper.JobToToJobMapper;
import com.projectMatrix.model.Job;
import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.Project;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.to.UploadTo;
import com.projectMatrix.validations.UploadValidator;

@Controller
public class JobsBulkUploadController {

	@Autowired
	JobDao jobDao;
	@Autowired
	ProjectDao projectDao;
	@Autowired
	ResourceAllocationDao resourceAllocationDao;
	@Autowired
	JobStageDao jobStageDao;
	@Autowired
	JobToJobToMapper jobToJobToMapper;
	@Autowired
	JobToToJobMapper jobToToJobMapper;
	@Autowired
	ResourceDao resourceDao;
	@Autowired
	UploadValidator uploadValidator;
	

	public static boolean isRowEmpty(final Row row) {
		for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
			Cell cell = row.getCell(c);
			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
				return false;
			}
		}
		return true;
	}

	//code for uploading to excel sheet to DataBase
	@RequestMapping(value = "upload.htm", method = RequestMethod.GET)
	public ModelAndView getUploadPage() {
		ModelMap modelMap = new ModelMap();
		modelMap.put("jobsUploadForm", new UploadTo());
		// SmodelMap.put("dates", new MasterDataTo());
		return new ModelAndView("jobs/upload", modelMap);
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView upLoad(
			@ModelAttribute("jobsUploadForm") final UploadTo filebeans,final BindingResult result)
			throws IOException {

	    	uploadValidator.validate(filebeans, result);
		if (result.hasErrors()) {
			return new ModelAndView("jobs/upload");

		}
		
		ByteArrayInputStream bis = new ByteArrayInputStream(filebeans
				.getJobsFile().getBytes());
		Workbook workbook;
		try {

			if (filebeans.getJobsFile().getOriginalFilename().endsWith("xls")) {
				workbook = new HSSFWorkbook(bis);
			} else if (filebeans.getJobsFile().getOriginalFilename()
					.endsWith("xlsx")) {
				workbook = new XSSFWorkbook(bis);
			} else {
				throw new IllegalArgumentException(
						"Received file does not have a standard excel extension.");
			}

//			JobStage jobStage = new JobStage();
//			Job job = new Job();
			
			
			Sheet sheetAt = workbook.getSheetAt(0);
			Iterator<Row> iterator = sheetAt.iterator();
			while (iterator.hasNext()) {
				Job job = new Job();
				ResourceAllocation resourceAllocation = new ResourceAllocation();
				Row row = iterator.next();
				if (isRowEmpty(row)) {
					sheetAt.removeRow(row);
				}
				if (row.getRowNum() == 0) {
					continue; // just skip the rows if row number is 0 or 1
				}
				 int productionPercentage = 0,qcPercentage = 0,qaPercentage = 0,feedbackPercentage = 0;
				 Double hoursEstimated = 0.0;

				Cell cell = null;
				cell = row.getCell(1);
				if(cell!=null){
				Project project = projectDao.getByCentillionProjectCode(cell.getStringCellValue().trim());
				System.out.println(project);
				if(project!=null){
				 job.setProject(project);
				 
				 productionPercentage = project.getProductionPercentage();
				 qcPercentage = project.getQcPercentage();
				 qaPercentage = project.getQaPercentage();
				 feedbackPercentage = project.getFeedbackPercentage();
				}else{
					break;
				}
				}
				cell = row.getCell(2);
				if (cell != null) {
					job.setJobNo(cell.getStringCellValue());
				}
				cell = row.getCell(3);
				if (cell != null) {
					job.setJobName(cell.getStringCellValue());
				}
				cell = row.getCell(4);
				if (cell != null) {
					hoursEstimated = cell.getNumericCellValue();
					job.setHoursEstimated(hoursEstimated);
					
				} else {
					System.out.println("Hours Manditory to produce Job Stage Table");
					break;
				}

				cell = row.getCell(5);
				if (cell != null) {
					job.setJobStage(Constants.Production);
					
				}
				cell = row.getCell(6);
				if (cell != null) {
					job.setJobStatus(Constants.YTS);
				}
				cell = row.getCell(7);
				
				if (cell != null) {
				Resource byResourceName = resourceDao.getByResourceName(cell.getStringCellValue());
					if(byResourceName!=null){
						resourceAllocation.setResourceByProductionAllocatedId(byResourceName);
						job.setResource(byResourceName);
//                         resourceAllocationDao.saveOrUpdate(resourceAllocation);						
					}
				}
				cell = row.getCell(8);
				if (cell != null) {
					Resource byResourceName = resourceDao.getByResourceName(cell.getStringCellValue());
					if(byResourceName!=null){
					resourceAllocation.setResourceByQcAllocatedId(byResourceName);
//					 resourceAllocationDao.saveOrUpdate(resourceAllocation);
					}
				}
				
				cell = row.getCell(9);
				if (cell != null) {
					Resource byResourceName = resourceDao.getByResourceName(cell.getStringCellValue());
					if(byResourceName!=null){
					resourceAllocation.setResourceByQaAllocatedId(byResourceName);
//					 resourceAllocationDao.saveOrUpdate(resourceAllocation);
					}
				}
				cell = row.getCell(10);
				if (cell != null) {
					Resource byResourceName = resourceDao.getByResourceName(cell.getStringCellValue());
					if(byResourceName!=null){
					resourceAllocation.setResourceByFeedbackAllocatedId(byResourceName);
//					 resourceAllocationDao.saveOrUpdate(resourceAllocation);
					}
				}
				cell = row.getCell(11);
				if (cell != null) {
					job.setReceivedDate(cell.getDateCellValue());
				}
				cell = row.getCell(12);
				if (cell != null) {
					job.setAssignedDate(cell.getDateCellValue());
				}
				cell = row.getCell(13);
				if (cell != null) {
					job.setExpectedDelivery(cell.getDateCellValue());
				}
				cell = row.getCell(14);
				if (cell != null) {
					job.setDeliveredOn(cell.getDateCellValue());
				}
				cell = row.getCell(15);
				if (cell != null) {
					job.setJobCriticality(cell.getStringCellValue().trim());
				}
				cell = row.getCell(16);
				if (cell != null) {
					job.setRemarks(cell.getStringCellValue());
				}
				
				
				jobDao.saveOrUpdate(job);
				resourceAllocation.setJob(job);
				JobStage jobStage = new JobStage();
				jobStage.setJob(job);
				jobStage.setJobStage(Constants.Production);
				jobStage.setJobStatus(Constants.YTS);
				jobStage.setHoursEstimated(hoursCalculation(hoursEstimated,productionPercentage));
				jobStageDao.saveOrUpdate(jobStage);
				jobStage = new JobStage();
				jobStage.setJob(job);
				jobStage.setJobStage(Constants.QC);
				jobStage.setJobStatus(Constants.YTS);
				jobStage.setHoursEstimated(hoursCalculation(hoursEstimated,qcPercentage));
				jobStageDao.saveOrUpdate(jobStage);
				jobStage = new JobStage();
				jobStage.setJob(job);
				jobStage.setJobStage(Constants.QA);
				jobStage.setJobStatus(Constants.YTS);
				jobStage.setHoursEstimated(hoursCalculation(hoursEstimated,qaPercentage));
				jobStageDao.saveOrUpdate(jobStage);
				jobStage = new JobStage();
				jobStage.setJob(job);
				jobStage.setJobStage(Constants.Delivery);
				jobStage.setJobStatus(Constants.YTS);
				jobStage.setHoursEstimated(hoursCalculation(hoursEstimated,feedbackPercentage));
				jobStageDao.saveOrUpdate(jobStage);
				resourceAllocationDao.saveOrUpdate(resourceAllocation);
//				jobStageDao.saveOrUpdate(jobStage);
			}
			
			
			
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/jobs.htm");

	}
	
	public Double hoursCalculation(Double hours, int percentage){
		
		Double cal = hours * percentage / 100;
		return cal;
		
	}
	
	

}
