package com.projectMatrix.to;

import java.util.Date;

import com.projectMatrix.model.Resource;

public class WorkBenchTo {

	private Long workBenchId;
	private String resource;
	private String doc;
	private String workedOn;
	private String remarks;
	private String spentTime;
	private Double estimatedTime;
	private String onBench;
	private String inTraining;
	private String PM;
	private String others;
	private String total;
	
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public Long getWorkBenchId() {
		return workBenchId;
	}
	public void setWorkBenchId(Long workBenchId) {
		this.workBenchId = workBenchId;
	}

	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}



	public String getSpentTime() {
		return spentTime;
	}
	public void setSpentTime(String spentTime) {
		this.spentTime = spentTime;
	}
	public Double getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(Double estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	
	public String getInTraining() {
		return inTraining;
	}
	public void setInTraining(String inTraining) {
		this.inTraining = inTraining;
	}
	
	public String getOnBench() {
		return onBench;
	}
	public void setOnBench(String onBench) {
		this.onBench = onBench;
	}
	public String getPM() {
		return PM;
	}
	public void setPM(String pM) {
		PM = pM;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getWorkedOn() {
		return workedOn;
	}
	public void setWorkedOn(String workedOn) {
		this.workedOn = workedOn;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
	
}
