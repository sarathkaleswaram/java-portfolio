package com.projectMatrix.to;

import java.util.Date;

import com.projectMatrix.model.JobCompleted;
import com.projectMatrix.model.Project;

public class InvoiceTo {
	private Long invoiceId;
	private Project project;
	private JobCompleted jobCompleted;
	private Integer clientId;
	private String invoiceNo;
	private Date invoiceDate;
	private Date approvalJobDate;
	private Double invoiceAmount;
	private Date receivedDate;
	private Double receivedAmount;
	private Double balanceAmount;
	private String remarks;

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public JobCompleted getJobCompleted() {
		return jobCompleted;
	}

	public void setJobCompleted(JobCompleted jobCompleted) {
		this.jobCompleted = jobCompleted;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public Date getApprovalJobDate() {
		return approvalJobDate;
	}

	public void setApprovalJobDate(Date approvalJobDate) {
		this.approvalJobDate = approvalJobDate;
	}

	public Double getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(Double invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	public Double getReceivedAmount() {
		return receivedAmount;
	}

	public void setReceivedAmount(Double receivedAmount) {
		this.receivedAmount = receivedAmount;
	}

	public Double getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
