package com.projectMatrix.to;


public class ProjectTo {
	private long projectId;
	private String resource;
	private long tlId;
	private String client;
	private int clientId;
	private String endCustomer;
	private String operationRegion;
	private String workRegion;
	private String clientPm;
	private String projectCode;
	private String centProjectCode;
	private String projectName;
	private String projectScope;
	private String costCenter;
	private String offshorePm;
	private long keyResource;
	private String startDate;
	private String endDate;
	/*private String CFT1;
	private String CFT2;
	private String CFT3;
	private String CFT4;
	private String CFT5;
	private String CFD1;
	private String CFD2;
	private String CFD3;
	private String CFD4;
	private String CFD5;*/
	private Integer inputValidationPercentage;
	private Integer productionPercentage;
	private Integer qcPercentage;
	private Integer qaPercentage;
	private Integer deliveryPercentage;
	private Integer feedbackPercentage;
	private Integer redeliveryPercentage;
	private Integer[] uomIdSorted;
	private Long[] tmResourcesIdSorted;

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public Long[] getTmResourcesIdSorted() {
		return tmResourcesIdSorted;
	}

	public void setTmResourcesIdSorted(Long[] tmResourcesIdSorted) {
		this.tmResourcesIdSorted = tmResourcesIdSorted;
	}

	public Integer[] getUomIdSorted() {
		return uomIdSorted;
	}

	public void setUomIdSorted(Integer[] uomIdSorted) {
		this.uomIdSorted = uomIdSorted;
	}

	public long getKeyResource() {
		return keyResource;
	}

	public void setKeyResource(long keyResource) {
		this.keyResource = keyResource;
	}

	public long getTlId() {
		return tlId;
	}

	public void setTlId(long tlId) {
		this.tlId = tlId;
	}

	public String getResource() {
		return resource;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getEndCustomer() {
		return endCustomer;
	}

	public void setEndCustomer(String endCustomer) {
		this.endCustomer = endCustomer;
	}

	public String getOperationRegion() {
		return operationRegion;
	}

	public void setOperationRegion(String operationRegion) {
		this.operationRegion = operationRegion;
	}

	public String getWorkRegion() {
		return workRegion;
	}

	public void setWorkRegion(String workRegion) {
		this.workRegion = workRegion;
	}

	public String getClientPm() {
		return clientPm;
	}

	public void setClientPm(String clientPm) {
		this.clientPm = clientPm;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getCentProjectCode() {
		return centProjectCode;
	}

	public void setCentProjectCode(String centProjectCode) {
		this.centProjectCode = centProjectCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectScope() {
		return projectScope;
	}

	public void setProjectScope(String projectScope) {
		this.projectScope = projectScope;
	}

	public String getCostCenter() {
		return costCenter;
	}

	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter;
	}

	public String getOffshorePm() {
		return offshorePm;
	}

	public void setOffshorePm(String offshorePm) {
		this.offshorePm = offshorePm;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

/*	public String getCFT1() {
		return CFT1;
	}

	public void setCFT1(String cFT1) {
		CFT1 = cFT1;
	}

	public String getCFT2() {
		return CFT2;
	}

	public void setCFT2(String cFT2) {
		CFT2 = cFT2;
	}

	public String getCFT3() {
		return CFT3;
	}

	public void setCFT3(String cFT3) {
		CFT3 = cFT3;
	}

	public String getCFT4() {
		return CFT4;
	}

	public void setCFT4(String cFT4) {
		CFT4 = cFT4;
	}

	public String getCFT5() {
		return CFT5;
	}

	public void setCFT5(String cFT5) {
		CFT5 = cFT5;
	}

	public String getCFD1() {
		return CFD1;
	}

	public void setCFD1(String cFD1) {
		CFD1 = cFD1;
	}

	public String getCFD2() {
		return CFD2;
	}

	public void setCFD2(String cFD2) {
		CFD2 = cFD2;
	}

	public String getCFD3() {
		return CFD3;
	}

	public void setCFD3(String cFD3) {
		CFD3 = cFD3;
	}

	public String getCFD4() {
		return CFD4;
	}

	public void setCFD4(String cFD4) {
		CFD4 = cFD4;
	}

	public String getCFD5() {
		return CFD5;
	}

	public void setCFD5(String cFD5) {
		CFD5 = cFD5;
	}
*/
	public Integer getInputValidationPercentage() {
		return inputValidationPercentage;
	}

	public void setInputValidationPercentage(Integer inputValidationPercentage) {
		this.inputValidationPercentage = inputValidationPercentage;
	}

	public Integer getProductionPercentage() {
		return productionPercentage;
	}

	public void setProductionPercentage(Integer productionPercentage) {
		this.productionPercentage = productionPercentage;
	}

	public Integer getQcPercentage() {
		return qcPercentage;
	}

	public void setQcPercentage(Integer qcPercentage) {
		this.qcPercentage = qcPercentage;
	}

	public Integer getQaPercentage() {
		return qaPercentage;
	}

	public void setQaPercentage(Integer qaPercentage) {
		this.qaPercentage = qaPercentage;
	}

	public Integer getDeliveryPercentage() {
		return deliveryPercentage;
	}

	public void setDeliveryPercentage(Integer deliveryPercentage) {
		this.deliveryPercentage = deliveryPercentage;
	}

	public Integer getFeedbackPercentage() {
		return feedbackPercentage;
	}

	public void setFeedbackPercentage(Integer feedbackPercentage) {
		this.feedbackPercentage = feedbackPercentage;
	}

	public Integer getRedeliveryPercentage() {
		return redeliveryPercentage;
	}

	public void setRedeliveryPercentage(Integer redeliveryPercentage) {
		this.redeliveryPercentage = redeliveryPercentage;
	}
}
