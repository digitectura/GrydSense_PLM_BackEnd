package com.digi.restservices;

import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.digi.domain.ProductVersions;
import com.digi.domain.PurchaseHistory;
import com.digi.domain.PurchaseOrder;
import com.digi.domain.PurchaseVendors;
import com.digi.domain.SellOrderDetails;
import com.digi.domain.SellOrderProductDetails;
import com.digi.pojo.PurchaseOrderDisplay;
import com.digi.pojo.SellOrderDetailDisplay;
import com.digi.repository.ProductVersionsRepository;
import com.digi.repository.PurchaseHistoryRepository;
import com.digi.repository.PurchaseOrderRepository;
import com.digi.repository.PurchaseVendorRepository;
import com.digi.repository.SellOrderDetailRepository;
import com.digi.repository.SellOrderProductDetailRepository;

@RestController
@RequestMapping("inventory-management")
public class InventoryManagement {

	@Autowired
	private SellOrderDetailRepository sellOrderDetailRepository;

	@Autowired
	private PurchaseOrderRepository purchaseOrderRepository;

	@Autowired
	private SellOrderProductDetailRepository sellOrderProductDetailRepository;

	@Autowired
	private PurchaseVendorRepository purchaseVendorRepository;

	@Autowired
	private PurchaseHistoryRepository purchaseHistoryRepository;

	@Autowired
	private ProductVersionsRepository productVersionsRepository;

	@GetMapping("/purchaseOrders")
	private ResponseEntity<?> getAllPurchaseOrders() {
		return ResponseEntity.status(HttpStatus.OK).body(purchaseOrderRepository.findAll());
	}

	@PostMapping("/purchaseOrders")
	private ResponseEntity<?> addPurchaseOrder(@RequestBody PurchaseOrder purchaseOrderObj) {
		try {
			PurchaseVendors purchaseVendor = purchaseVendorRepository
					.findByPurchaseVendorId(purchaseOrderObj.getPurchaseVendor().getPurchaseVendorId());
			if (purchaseVendor != null) {
				purchaseOrderObj.setPurchaseVendor(purchaseVendor);
				purchaseOrderRepository.saveAndFlush(purchaseOrderObj);
			}
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@GetMapping("/vendors")
	private ResponseEntity<?> getAllAvailableVendors() {
		return ResponseEntity.status(HttpStatus.OK).body(purchaseVendorRepository.findAll());
	}

	@PostMapping("/vendors")
	private ResponseEntity<?> addVendor(@RequestBody PurchaseVendors purchaseVendorObj) {
		try {
			purchaseVendorObj = purchaseVendorRepository.saveAndFlush(purchaseVendorObj);
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@GetMapping("/sellOrder")
	private ResponseEntity<?> getAllsellOrder() {
		return ResponseEntity.status(HttpStatus.OK).body(sellOrderDetailRepository.findAll());
	}

	@PostMapping("/sellOrder")
	private ResponseEntity<?> addAllsellOrder(@RequestBody SellOrderDetails sellOrderDetailObj) {
		sellOrderDetailObj = sellOrderDetailRepository.save(sellOrderDetailObj);
		return ResponseEntity.status(HttpStatus.OK).body("save");
	}

	@GetMapping("/purchase")
	private ResponseEntity<?> getPurchaseOrder(@RequestParam(name = "orderId") String orderId) {
		List<PurchaseOrderDisplay> purchaseOrderDisplayList = new LinkedList<PurchaseOrderDisplay>();
		PurchaseOrder purchaseOrderObj = purchaseOrderRepository.findByOrderId(orderId);
		if (purchaseOrderObj != null) {
			List<PurchaseHistory> purchaseHistoryList = purchaseHistoryRepository.findByPurchaseOrder(purchaseOrderObj);
			for (PurchaseHistory purchaseHistory : purchaseHistoryList) {
				PurchaseOrderDisplay purchaseOrderDisplay = new PurchaseOrderDisplay();
				purchaseOrderDisplay
						.setProductName(purchaseHistory.getProductVersionObj().getProduct().getProductName());
				purchaseOrderDisplay.setProductVersion(purchaseHistory.getProductVersionObj().getVersionNumber());
				purchaseOrderDisplay.setOrderedDate(purchaseHistory.getPurchaseOrder().getOrderedDate());
				purchaseOrderDisplay.setAvailableCount(purchaseHistory.getAvailableCount());
				purchaseOrderDisplay.setPurchaseCount(purchaseHistory.getPurchaseCount());
				List<SellOrderDetailDisplay> sellOrderDetailDisplayList = new LinkedList<>();
				List<SellOrderProductDetails> sellOrderProductDetails = sellOrderProductDetailRepository
						.findByPurchaseHistoryObj(purchaseHistory);
				for (SellOrderProductDetails sellOrderProductDetailObj : sellOrderProductDetails) {
					SellOrderDetailDisplay sellOrderDetailDisplay = new SellOrderDetailDisplay();
					sellOrderDetailDisplay.setQuantity(sellOrderProductDetailObj.getQuantity());
					sellOrderDetailDisplay
							.setCompanyAddress(sellOrderProductDetailObj.getSellOrderDetailObj().getCompanyAddress());
					sellOrderDetailDisplay
							.setCompanyName(sellOrderProductDetailObj.getSellOrderDetailObj().getCompanyName());
					sellOrderDetailDisplay
							.setSellOrderDate(sellOrderProductDetailObj.getSellOrderDetailObj().getSellOrderDate());
					sellOrderDetailDisplay.setSellOrderDetailId(
							sellOrderProductDetailObj.getSellOrderDetailObj().getSellOrderDetailId());
					sellOrderDetailDisplayList.add(sellOrderDetailDisplay);
				}
				purchaseOrderDisplay.setSellOrderDetailDisplayList(sellOrderDetailDisplayList);
				purchaseOrderDisplayList.add(purchaseOrderDisplay);
			}
		}
		return ResponseEntity.status(HttpStatus.OK).body(purchaseOrderDisplayList);
	}

	@PostMapping("/purchase")
	private ResponseEntity<?> addInventoryPurchase(@RequestBody PurchaseHistory purchaseHistoryObj) {
		try {
			purchaseHistoryObj.setAvailableCount(purchaseHistoryObj.getPurchaseCount());
			purchaseHistoryObj.setProductVersionObj(productVersionsRepository
					.findByProductVersionId(purchaseHistoryObj.getProductVersionObj().getProductVersionId()));
			purchaseHistoryObj.setPurchaseOrder(
					purchaseOrderRepository.findByOrderId(purchaseHistoryObj.getPurchaseOrder().getOrderId()));
			purchaseHistoryObj = purchaseHistoryRepository.saveAndFlush(purchaseHistoryObj);
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@GetMapping("/purchase/{productVersionId}")
	private ResponseEntity<?> getInventoryPurchase(@PathVariable Integer productVersionId,
			@RequestParam(name = "completed", required = false) Boolean completed) {
		List<PurchaseVendors> purchaseVendors = new LinkedList<PurchaseVendors>();
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			try {
				List<PurchaseVendors> purchaseVendorList = purchaseVendorRepository.findAll();
				for (PurchaseVendors purchVendorObj : purchaseVendorList) {
					List<PurchaseOrder> purchaseOrders = purchaseOrderRepository.findByPurchaseVendor(purchVendorObj);
					for (PurchaseOrder purchaseOrder : purchaseOrders) {
						if (completed == null) {
							List<PurchaseHistory> purchaseHistoryList = purchaseHistoryRepository
									.findByPurchaseOrderAndProductVersionObjAndAvailableCountGreaterThan(purchaseOrder,
											productVersionObj, 0);
							if (purchaseHistoryList.size() > 0) {
								purchVendorObj.setPurchaseHistory(purchaseHistoryList);
								purchaseVendors.add(purchVendorObj);
							}
						} else {
							List<PurchaseHistory> purchaseHistoryList = purchaseHistoryRepository
									.findByPurchaseOrderAndProductVersionObjAndAvailableCount(purchaseOrder,
											productVersionObj, 0);
							if (purchaseHistoryList.size() > 0) {
								purchVendorObj.setPurchaseHistory(purchaseHistoryList);
								purchaseVendors.add(purchVendorObj);
							}
						}
					}
				}
			} catch (Exception e) {
			}
		}
		return ResponseEntity.status(HttpStatus.OK).body(purchaseVendors);
	}

	@PostMapping("/sell")
	private ResponseEntity<?> changeInventoryDetailsForSellOrder(@RequestBody PurchaseHistory purchaseHistoryObj) {
		try {
			SellOrderDetails sellOrderDetailObj = sellOrderDetailRepository
					.findBySellOrderDetailId(purchaseHistoryObj.getSellOrderDetailObj().getSellOrderDetailId());
			if (sellOrderDetailObj != null) {
				PurchaseHistory purchaseHistory = purchaseHistoryRepository
						.findByPurchaseHistoryId(purchaseHistoryObj.getPurchaseHistoryId());
				if (purchaseHistory != null) {
					if (!purchaseHistory.getAvailableCount().equals(0)
							&& purchaseHistory.getAvailableCount() >= purchaseHistoryObj.getCount()) {
						purchaseHistory
								.setAvailableCount(purchaseHistory.getAvailableCount() - purchaseHistoryObj.getCount());
						purchaseHistory = purchaseHistoryRepository.save(purchaseHistory);
						SellOrderProductDetails sellOrderProductDetailObj = sellOrderProductDetailRepository
								.findBySellOrderDetailObjAndPurchaseHistoryObj(sellOrderDetailObj, purchaseHistoryObj);
						if (sellOrderProductDetailObj == null) {
							sellOrderProductDetailObj = new SellOrderProductDetails();
							sellOrderProductDetailObj.setSellOrderDetailObj(sellOrderDetailObj);
							sellOrderProductDetailObj.setPurchaseHistoryObj(purchaseHistory);
							sellOrderProductDetailObj.setQuantity(purchaseHistoryObj.getCount());
						} else {
							sellOrderProductDetailObj.setQuantity(
									purchaseHistoryObj.getCount() + sellOrderProductDetailObj.getQuantity());
						}
						sellOrderProductDetailObj = sellOrderProductDetailRepository
								.saveAndFlush(sellOrderProductDetailObj);
					}
				}
			}
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@GetMapping("/sell")
	private ResponseEntity<?> getInventoryDetailsForSellOrder(@RequestParam(name = "orderId") String orderId) {
		List<PurchaseOrderDisplay> purchaseOrderDisplayList = new LinkedList<PurchaseOrderDisplay>();
		List<SellOrderProductDetails> sellOrderProductDetails = new LinkedList<SellOrderProductDetails>();
		SellOrderDetails sellOrderDetailObj = sellOrderDetailRepository.findBySellOrderDetailId(orderId);
		if (sellOrderDetailObj != null) {
			sellOrderProductDetails = sellOrderProductDetailRepository.findBySellOrderDetailObj(sellOrderDetailObj);
		}
		for (SellOrderProductDetails sellOrderProductDetailObj : sellOrderProductDetails) {
			PurchaseOrderDisplay purchaseOrderDisplayObj = new PurchaseOrderDisplay();
			purchaseOrderDisplayObj.setPurchaseCount(sellOrderProductDetailObj.getQuantity());
			purchaseOrderDisplayObj.setProductName(sellOrderProductDetailObj.getPurchaseHistoryObj()
					.getProductVersionObj().getProduct().getProductName());
			purchaseOrderDisplayObj.setPurchaseOrderId(
					sellOrderProductDetailObj.getPurchaseHistoryObj().getPurchaseOrder().getOrderId());
			purchaseOrderDisplayObj.setVendorName(sellOrderProductDetailObj.getPurchaseHistoryObj().getPurchaseOrder()
					.getPurchaseVendor().getVendorName());
			purchaseOrderDisplayObj.setProductVersion(
					sellOrderProductDetailObj.getPurchaseHistoryObj().getProductVersionObj().getVersionNumber());
			purchaseOrderDisplayList.add(purchaseOrderDisplayObj);
		}
		return ResponseEntity.status(HttpStatus.OK).body(purchaseOrderDisplayList);
	}

}
