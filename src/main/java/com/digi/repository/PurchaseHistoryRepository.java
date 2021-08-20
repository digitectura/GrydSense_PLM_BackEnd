package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.ProductVersions;
import com.digi.domain.PurchaseHistory;
import com.digi.domain.PurchaseOrder;

public interface PurchaseHistoryRepository extends JpaRepository<PurchaseHistory, Integer> {

	PurchaseHistory findByPurchaseHistoryId(Integer purchaseHistoryId);

	List<PurchaseHistory> findByPurchaseOrder(PurchaseOrder purchaseOrder);

	List<PurchaseHistory> findByPurchaseOrderAndProductVersionObjAndAvailableCountGreaterThan(
			PurchaseOrder purchaseOrder, ProductVersions productVersionObj, Integer availableCount);

	List<PurchaseHistory> findByPurchaseOrderAndProductVersionObjAndAvailableCount(PurchaseOrder purchaseOrder,
			ProductVersions productVersionObj, Integer availableCount);

}
