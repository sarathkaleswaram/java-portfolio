package com.projectMatrix.model;

// Generated Nov 16, 2017 1:21:18 PM by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Uom generated by hbm2java
 */
@Entity
@Table(name = "uom", catalog = "project_matrix")
public class Uom implements java.io.Serializable {

	private Integer uomId;
	private String uomName;
	private Set<UomStored> uomStoreds = new HashSet<UomStored>(0);
	private Set<ProjectUom> projectUoms = new HashSet<ProjectUom>(0);

	public Uom() {
	}

	public Uom(String uomName, Set<UomStored> uomStoreds,
			Set<ProjectUom> projectUoms) {
		this.uomName = uomName;
		this.uomStoreds = uomStoreds;
		this.projectUoms = projectUoms;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "uom_id", unique = true, nullable = false)
	public Integer getUomId() {
		return this.uomId;
	}

	public void setUomId(Integer uomId) {
		this.uomId = uomId;
	}

	@Column(name = "uom_name", length = 100)
	public String getUomName() {
		return this.uomName;
	}

	public void setUomName(String uomName) {
		this.uomName = uomName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "uom")
	public Set<UomStored> getUomStoreds() {
		return this.uomStoreds;
	}

	public void setUomStoreds(Set<UomStored> uomStoreds) {
		this.uomStoreds = uomStoreds;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "uom")
	public Set<ProjectUom> getProjectUoms() {
		return this.projectUoms;
	}

	public void setProjectUoms(Set<ProjectUom> projectUoms) {
		this.projectUoms = projectUoms;
	}

}
