package com.digi.pojo;

import java.util.LinkedList;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@JsonInclude(Include.NON_ABSENT)
public class PurchaseOrderDisplay {

	private String purchaseOrderId;

	private String productName;

	private String productVersion;

	private String orderedDate;

	private Integer purchaseCount;

	private Integer availableCount;

	private String vendorName;

	private List<SellOrderDetailDisplay> sellOrderDetailDisplayList = new LinkedList<>();

}
