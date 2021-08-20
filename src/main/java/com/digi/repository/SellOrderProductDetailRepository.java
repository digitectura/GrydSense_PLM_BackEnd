package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.PurchaseHistory;
import com.digi.domain.SellOrderDetails;
import com.digi.domain.SellOrderProductDetails;

public interface SellOrderProductDetailRepository extends JpaRepository<SellOrderProductDetails, Integer> {

	SellOrderProductDetails findBySellOrderDetailObjAndPurchaseHistoryObj(SellOrderDetails sellOrderDetailObj,
			PurchaseHistory purchaseHistoryObj);

	List<SellOrderProductDetails> findBySellOrderDetailObj(SellOrderDetails sellOrderDetailObj);

	List<SellOrderProductDetails> findByPurchaseHistoryObj(PurchaseHistory purchaseHistoryObj);

}
