package com.digi.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "sell_order_details")
public class SellOrderDetails {

	@Id
	@Column(name = "sell_order_detail_id")
	private String sellOrderDetailId;

	@Column(name = "company_name")
	private String companyName;

	@Column(name = "company_address")
	private String companyAddress;

	@Column(name = "sell_order_date")
	@OrderBy("referenceId Desc")
	private String sellOrderDate;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sellOrderDetailObj", cascade = CascadeType.ALL)
	private List<SellOrderProductDetails> sellOrderProductDetailList;

}
