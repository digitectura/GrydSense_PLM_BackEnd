package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@Entity
@Table(name = "sell_order_product_details")
public class SellOrderProductDetails {

	@Id
	@Column(name = "sell_order_product_detail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sellOrderProductDetailId;

	@Column(name = "quantity")
	private Integer quantity;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "sell_order_detail_id")
	private SellOrderDetails sellOrderDetailObj;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "purchase_history_id")
	private PurchaseHistory purchaseHistoryObj;

}
