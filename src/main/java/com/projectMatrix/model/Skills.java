package com.projectMatrix.model;

// Generated Nov 16, 2017 1:21:18 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Skills generated by hbm2java
 */
@Entity
@Table(name = "skills", catalog = "project_matrix")
public class Skills implements java.io.Serializable {

	private Integer skillsId;
	private String skillsName;

	public Skills() {
	}

	public Skills(String skillsName) {
		this.skillsName = skillsName;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "skills_id", unique = true, nullable = false)
	public Integer getSkillsId() {
		return this.skillsId;
	}

	public void setSkillsId(Integer skillsId) {
		this.skillsId = skillsId;
	}

	@Column(name = "skills_name", length = 100)
	public String getSkillsName() {
		return this.skillsName;
	}

	public void setSkillsName(String skillsName) {
		this.skillsName = skillsName;
	}

}
