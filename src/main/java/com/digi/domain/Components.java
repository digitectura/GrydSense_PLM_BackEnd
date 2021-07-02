package com.digi.domain;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "components")
public class Components {

	@Id
	@Column(name = "componet_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer componetId;

	@Column(name = "component_value", nullable = false)
	private String componentValue;

	@Column(name = "component_description")
	private String componentDescription;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "components", cascade = CascadeType.ALL)
	private List<ComponentVendorDetails> componentVendorDetails;

}
