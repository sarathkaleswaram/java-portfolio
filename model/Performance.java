package com.projectMatrix.model;

// Generated Aug 22, 2017 2:42:09 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Performance generated by hbm2java
 */
@Entity
@Table(name = "performance", catalog = "project_matrix")
public class Performance implements java.io.Serializable {

	private Integer performanceId;
	private String performanceLevelName;

	public Performance() {
	}

	public Performance(String performanceLevelName) {
		this.performanceLevelName = performanceLevelName;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "performance_id", unique = true, nullable = false)
	public Integer getPerformanceId() {
		return this.performanceId;
	}

	public void setPerformanceId(Integer performanceId) {
		this.performanceId = performanceId;
	}

	@Column(name = "performance_level_name", length = 100)
	public String getPerformanceLevelName() {
		return this.performanceLevelName;
	}

	public void setPerformanceLevelName(String performanceLevelName) {
		this.performanceLevelName = performanceLevelName;
	}

}
