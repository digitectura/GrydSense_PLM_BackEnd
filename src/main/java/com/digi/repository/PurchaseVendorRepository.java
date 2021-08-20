package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.PurchaseVendors;

public interface PurchaseVendorRepository extends JpaRepository<PurchaseVendors, Integer> {

	PurchaseVendors findByPurchaseVendorId(Integer purchaseVendorId);

}
