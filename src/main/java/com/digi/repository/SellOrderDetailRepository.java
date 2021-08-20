package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.SellOrderDetails;

public interface SellOrderDetailRepository extends JpaRepository<SellOrderDetails, String> {

	SellOrderDetails findBySellOrderDetailId(String sellOrderDetailId);

}
