package com.digi.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "purchase_vendors")
public class PurchaseVendors {

	@Id
	@Column(name = "purchase_vendor_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer purchaseVendorId;

	@Column(name = "vendor_name", nullable = false, unique = true)
	private String vendorName;

	@Transient
	public List<PurchaseHistory> purchaseHistory;

}
