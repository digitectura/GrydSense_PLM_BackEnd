package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "product_components")
public class ProductComponents {

	@Id
	@Column(name = "product_component_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productComponentId;

	@Column(name = "reference_id")
	private String referenceId;

	@ManyToOne
	@JsonProperty(access = Access.WRITE_ONLY)
	@JoinColumn(name = "product_version_id")
	private ProductVersions productVersion;

	@ManyToOne
//	@JsonProperty(access = Access.WRITE_ONLY)
	@JoinColumn(name = "componet_id")
	private Components components;

}
