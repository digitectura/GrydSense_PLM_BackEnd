package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "purchase_history")
public class PurchaseHistory {

	@Id
	@Column(name = "purchase_history_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer purchaseHistoryId;

	@Column(name = "purchase_count")
	private Integer purchaseCount;

	@Column(name = "available_count")
	private Integer availableCount;

	@ManyToOne
	@JsonProperty(access = Access.WRITE_ONLY)
	@JoinColumn(name = "order_id")
	private PurchaseOrder purchaseOrder;

	@ManyToOne
	@JsonProperty(access = Access.WRITE_ONLY)
	@JoinColumn(name = "product_version_id")
	private ProductVersions productVersionObj;

	@Transient
	private Integer count;

	@Transient
	private SellOrderDetails sellOrderDetailObj;

}
