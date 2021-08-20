package com.digi.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@JsonInclude(Include.NON_ABSENT)
public class SellOrderDetailDisplay {

	private Integer quantity;

	private String sellOrderDetailId;

	private String companyName;

	private String companyAddress;

	private String sellOrderDate;

}
