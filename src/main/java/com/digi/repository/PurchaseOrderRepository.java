package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.PurchaseOrder;
import com.digi.domain.PurchaseVendors;

public interface PurchaseOrderRepository extends JpaRepository<PurchaseOrder, String> {

	PurchaseOrder findByOrderId(String orderId);

	List<PurchaseOrder> findByPurchaseVendor(PurchaseVendors purchaseVendor);

}
