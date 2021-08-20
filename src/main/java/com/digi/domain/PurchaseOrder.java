package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "purchase_order")
public class PurchaseOrder {

	@Id
	@Column(name = "order_id")
	private String orderId;

	@Column(name = "order_date")
	@OrderBy("referenceId Desc")
	private String orderedDate;

	@ManyToOne
	@JoinColumn(name = "purchase_vendor_id")
	private PurchaseVendors purchaseVendor;

}
