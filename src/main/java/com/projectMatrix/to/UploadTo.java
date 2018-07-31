package com.projectMatrix.to;

import org.springframework.web.multipart.MultipartFile;

public class UploadTo {

	private MultipartFile jobsFile;

	public MultipartFile getJobsFile() {
		return jobsFile;
	}

	public void setJobsFile(MultipartFile jobsFile) {
		this.jobsFile = jobsFile;
	}
	
}
