package com.projectMatrix.model;

// Generated Nov 16, 2017 1:21:18 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TeamMembers generated by hbm2java
 */
@Entity
@Table(name = "team_members", catalog = "project_matrix")
public class TeamMembers implements java.io.Serializable {

	private Long tmId;
	private Project project;
	private Resource resource;
	private String keyResourceIndication;

	public TeamMembers() {
	}

	public TeamMembers(Project project, Resource resource,
			String keyResourceIndication) {
		this.project = project;
		this.resource = resource;
		this.keyResourceIndication = keyResourceIndication;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "tm_id", unique = true, nullable = false)
	public Long getTmId() {
		return this.tmId;
	}

	public void setTmId(Long tmId) {
		this.tmId = tmId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tm_assigned_id")
	public Resource getResource() {
		return this.resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	@Column(name = "key_resource_indication", length = 10)
	public String getKeyResourceIndication() {
		return this.keyResourceIndication;
	}

	public void setKeyResourceIndication(String keyResourceIndication) {
		this.keyResourceIndication = keyResourceIndication;
	}

}
