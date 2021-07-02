package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "component_vendor_details")
public class ComponentVendorDetails {

	@Id
	@Column(name = "component_vendor_detail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer componentVendorDetailId;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "componet_id")
	private Components components;

	@Column(name = "manufacturer_part_number")
	private String manufacturerPartNumber;

	private String manufacturer;

	@Column(name = "vendor_part_number")
	private String vendorPartNumber;

	private String vendor;

	@Column(name = "cost_per_unit")
	private String costPerUnit;

	@Column(name = "cost_per_hundred_units")
	private String costPerHundredUnits;

	@Column(name = "cost_per_thousand_units")
	private String costPerThousandUnits;

}
