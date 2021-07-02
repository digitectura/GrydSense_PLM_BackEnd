package com.digi.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "product_version")
public class ProductVersions {

	@Id
	@Column(name = "product_version_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productVersionId;

	@Column(name = "version_number")
	private String versionNumber;

	@Column(name = "timestamp")
	private String timestamp;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "product_id")
	private Products product;

	@JsonIgnore
	@OrderBy("referenceId ASC")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productVersion", cascade = CascadeType.ALL)
	private List<ProductComponents> productComponents;

}
