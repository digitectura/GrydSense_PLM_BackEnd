package com.digi.restservices;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.io.ByteArrayInputStream;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.digi.domain.ComponentVendorDetails;
import com.digi.domain.Components;
import com.digi.domain.ProductComponents;
import com.digi.domain.ProductVersions;
import com.digi.domain.Products;
import com.digi.pojo.ExportData;
import com.digi.repository.ComponentsRepository;
import com.digi.repository.ProductComponentsRepository;
import com.digi.repository.ProductVersionsRepository;
import com.digi.repository.ProductsRepository;
import java.io.ByteArrayOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

@RestController
@RequestMapping("products-management")
public class ProductsManagement {

	@Autowired
	private ProductsRepository productsRepository;

	@Autowired
	private ProductComponentsRepository productComponentsRepository;

	@Autowired
	private ProductVersionsRepository productVersionsRepository;

	@Autowired
	private ComponentsRepository componentsRepository;

	@GetMapping("/")
	private ResponseEntity<?> getAllAvailableProducts() {
		List<Products> products = productsRepository.findAll();
		return ResponseEntity.status(HttpStatus.OK).body(products);
	}

	@PostMapping("/")
	private ResponseEntity<?> addAllProduct(@RequestBody Products productObj) {
		productsRepository.saveAndFlush(productObj);
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@DeleteMapping("/{productId}")
	private ResponseEntity<?> deleteProduct(@PathVariable Integer productId) {
		Products productObj = productsRepository.findByProductId(productId);
		if (productObj != null) {
			productsRepository.delete(productObj);
			productsRepository.flush();
		}
		return ResponseEntity.status(HttpStatus.OK).body("delted");
	}

	@GetMapping("/product-version/{productId}")
	private ResponseEntity<?> getAllProductVersions(@PathVariable Integer productId) {
		Products prouctProductObj = productsRepository.findByProductId(productId);
		if (prouctProductObj != null) {
			return ResponseEntity.status(HttpStatus.OK).body(prouctProductObj.getProductVersions());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@PostMapping("/product-version/{productId}")
	private ResponseEntity<?> addAllProductVersion(@PathVariable Integer productId,
			@RequestBody ProductVersions productVersions) {
		Products prouctProductObj = productsRepository.findByProductId(productId);
		if (prouctProductObj != null) {
			productVersions.setProduct(prouctProductObj);
			productVersionsRepository.saveAndFlush(productVersions);
			return ResponseEntity.status(HttpStatus.OK).body("saved");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@DeleteMapping("/product-version/{productVersionId}")
	private ResponseEntity<?> deleteProductVersion(@PathVariable Integer productVersionId) {
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			productVersionsRepository.delete(productVersionObj);
		}
		return ResponseEntity.status(HttpStatus.OK).body("deleted");
	}

	@GetMapping("/product-version-components/{productVersionId}")
	private ResponseEntity<?> getAllProductVersionComponent(@PathVariable Integer productVersionId) {
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			return ResponseEntity.status(HttpStatus.OK).body(productVersionObj.getProductComponents());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@DeleteMapping("/product-version-components/{productComponentId}")
	private ResponseEntity<?> deleteProductVersionComponent(@PathVariable Integer productComponentId) {
		ProductComponents productComponentObj = productComponentsRepository
				.findByProductComponentId(productComponentId);
		if (productComponentObj != null) {
			productComponentsRepository.delete(productComponentObj);
		}
		return ResponseEntity.status(HttpStatus.OK).body("deleted");
	}

	@PostMapping("/product-version-components/{productVersionId}")
	private ResponseEntity<?> addProductVersionComponent(@PathVariable Integer productVersionId,
			@RequestBody ProductComponents productComponentObj) {
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			ProductComponents productComponents = productComponentsRepository
					.findByReferenceIdAndProductVersion(productComponentObj.getReferenceId(), productVersionObj);
			if (productComponents == null) {
				productComponentObj.setProductVersion(productVersionObj);
				Components componentObj = componentsRepository
						.findByComponetId(productComponentObj.getComponents().getComponetId());
				if (componentObj != null) {
					productComponentObj.setComponents(componentObj);
					productComponentsRepository.saveAndFlush(productComponentObj);
					return ResponseEntity.status(HttpStatus.OK).body("saved");
				}
			} else {
				productComponents.setProductVersion(productVersionObj);
				Components componentObj = componentsRepository
						.findByComponetId(productComponentObj.getComponents().getComponetId());
				if (componentObj != null) {
					productComponents.setComponents(componentObj);
					productComponentsRepository.saveAndFlush(productComponents);
					return ResponseEntity.status(HttpStatus.OK).body("saved");
				}
			}
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
	}

	@GetMapping("/export")
	private ResponseEntity<InputStreamResource> export(@RequestParam(name = "projects") Integer projectIds)
			throws IOException {
		ByteArrayInputStream byteArrayInputStream = null;
		byteArrayInputStream = exportFile(projectIds);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=data.xlsx");
		return ResponseEntity.ok().headers(headers).body(new InputStreamResource(byteArrayInputStream));
	}

	@GetMapping("/export-data")
	private ResponseEntity<InputStreamResource> exportData(@RequestParam(name = "projects") Integer[] projectIds,
			@RequestParam(name = "orderBom") Boolean orderBom) throws IOException {
		ByteArrayInputStream byteArrayInputStream = null;
		byteArrayInputStream = exportFile(projectIds, orderBom);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=data.xlsx");
		return ResponseEntity.ok().headers(headers).body(new InputStreamResource(byteArrayInputStream));
	}

	public ByteArrayInputStream exportFile(Integer[] projectIds, boolean orderBom) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int max = 0;
		List<Components> componentList = componentsRepository.findAll();
		Map<Components, List<ExportData>> listMap = new HashMap<Components, List<ExportData>>();
		for (Components componentObj : componentList) {
			List<ExportData> exportDataList = new ArrayList<ExportData>();
			max = Integer.max(max, componentObj.getComponentVendorDetails().size());
			for (Integer projectId : projectIds) {
				ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(projectId);
				if (productVersionObj != null) {
					List<ProductComponents> productComponentList = productComponentsRepository
							.findByComponentsAndProductVersion(componentObj, productVersionObj);
					if (productComponentList.size() > 0) {
						String productName = productVersionObj.getProduct().getProductName();
						String productVersion = productVersionObj.getVersionNumber();
						Integer quantity = productComponentList.size();
						ExportData exportData = new ExportData(productName, productVersion, quantity);
						exportDataList.add(exportData);
					}
				}
			}
			if (exportDataList.size() > 0) {
				listMap.put(componentObj, exportDataList);
			}
		}
		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Records");
		Font headerFont = workbook.createFont();
		headerFont.setBold(true);
		headerFont.setColor(IndexedColors.BLUE.getIndex());
		CellStyle headerCellStyle = workbook.createCellStyle();
		headerCellStyle.setFont(headerFont);
		LinkedList<String> list = getColumnsForMultipleProducts(max);
		if (orderBom) {
			list = getColumnsForMultipleProductsOrderBom(max);
		}
		int rowIdx = 0;
		Row row = sheet.createRow(rowIdx++);
		for (int col = 0; col < list.size(); col++) {
			Cell cell = row.createCell(col);
			cell.setCellValue(list.get(col));
			cell.setCellStyle(headerCellStyle);
		}
		for (Map.Entry<Components, List<ExportData>> entry : listMap.entrySet()) {
			List<ExportData> exportDataList = entry.getValue();
			Components components = entry.getKey();
			String componentName = components.getComponentValue();
			String componentDescription = components.getComponentDescription();
			if (orderBom) {
				int count = 0;
				row = sheet.createRow(rowIdx++);
				row.createCell(count++).setCellValue(componentName);
				row.createCell(count++).setCellValue(componentDescription);
				row.createCell(count++).setCellValue(exportDataList.size());
				List<ComponentVendorDetails> componentVendorDetails = components.getComponentVendorDetails();
				for (ComponentVendorDetails componentVendorDetailObj : componentVendorDetails) {
					row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturer());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturerPartNumber());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getVendor());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getVendorPartNumber());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerUnit());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerHundredUnits());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerThousandUnits());
				}
			} else {
				for (ExportData exportData : exportDataList) {
					int count = 0;
					row = sheet.createRow(rowIdx++);
					row.createCell(count++).setCellValue(componentName);
					row.createCell(count++).setCellValue(componentDescription);
					row.createCell(count++).setCellValue(exportData.getProductName());
					row.createCell(count++).setCellValue(exportData.getProductVersion());
					row.createCell(count++).setCellValue(exportData.getQuantity());
					List<ComponentVendorDetails> componentVendorDetails = components.getComponentVendorDetails();
					for (ComponentVendorDetails componentVendorDetailObj : componentVendorDetails) {
						row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturer());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturerPartNumber());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getVendor());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getVendorPartNumber());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerUnit());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerHundredUnits());
						row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerThousandUnits());
					}
				}
			}
		}
		workbook.write(out);
		workbook.close();
		return new ByteArrayInputStream(out.toByteArray());
	}

	public LinkedList<String> getColumnsForMultipleProducts(int count) {
		LinkedList<String> list = new LinkedList<>();
		list.add("Component Name");
		list.add("Component Description");
		list.add("Product Name");
		list.add("Product Version");
		list.add("Quantity");
		for (int i = 0; i < count; i++) {
			list.add("Manufacturer" + i);
			list.add("Manufacturer Part Number" + i);
			list.add("Vendor" + i);
			list.add("Vendor Part Number" + i);
			list.add("CostPerUnit" + i);
			list.add("CostPerHundredUnits" + i);
			list.add("CostPerThousandUnits" + i);
		}
		return list;
	}

	public LinkedList<String> getColumnsForMultipleProductsOrderBom(int count) {
		LinkedList<String> list = new LinkedList<>();
		list.add("Component Name");
		list.add("Component Description");
		list.add("Quantity");
		for (int i = 0; i < count; i++) {
			list.add("Manufacturer" + i);
			list.add("Manufacturer Part Number" + i);
			list.add("Vendor" + i);
			list.add("Vendor Part Number" + i);
			list.add("CostPerUnit" + i);
			list.add("CostPerHundredUnits" + i);
			list.add("CostPerThousandUnits" + i);
		}
		return list;
	}

	public ByteArrayInputStream exportFile(Integer projectId) throws IOException {
		int max = 0;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Records");
		int rowIdx = 1;
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(projectId);
		if (productVersionObj != null) {
			List<ProductComponents> productComponents = productVersionObj.getProductComponents();
			for (ProductComponents productComponentObj : productComponents) {
				Row row = sheet.createRow(rowIdx++);
				Components componentObj = productComponentObj.getComponents();
				int count = 0;
				row.createCell(count++).setCellValue(productComponentObj.getReferenceId());
				row.createCell(count++).setCellValue(componentObj.getComponentValue());
				row.createCell(count++).setCellValue(componentObj.getComponentDescription());
				max = Integer.max(max, componentObj.getComponentVendorDetails().size());
				List<ComponentVendorDetails> componentVendorDetails = componentObj.getComponentVendorDetails();
				for (ComponentVendorDetails componentVendorDetailObj : componentVendorDetails) {
					row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturer());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getManufacturerPartNumber());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getVendor());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getVendorPartNumber());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerUnit());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerHundredUnits());
					row.createCell(count++).setCellValue(componentVendorDetailObj.getCostPerThousandUnits());
				}
			}
		}
		Font headerFont = workbook.createFont();
		headerFont.setBold(true);
		headerFont.setColor(IndexedColors.BLUE.getIndex());
		CellStyle headerCellStyle = workbook.createCellStyle();
		headerCellStyle.setFont(headerFont);
		LinkedList<String> list = getColumnsForSingleProducts(max);
		Row row = sheet.createRow(0);
		for (int col = 0; col < list.size(); col++) {
			Cell cell = row.createCell(col);
			cell.setCellValue(list.get(col));
			cell.setCellStyle(headerCellStyle);
		}
		workbook.write(out);
		workbook.close();
		return new ByteArrayInputStream(out.toByteArray());
	}

	public LinkedList<String> getColumnsForSingleProducts(int count) {
		LinkedList<String> list = new LinkedList<>();
		list.add("Reference Id");
		list.add("Component Name");
		list.add("Component Description");
		for (int i = 0; i < count; i++) {
			list.add("Manufacturer" + i);
			list.add("Manufacturer Part Number" + i);
			list.add("Vendor" + i);
			list.add("Vendor Part Number" + i);
			list.add("CostPerUnit" + i);
			list.add("CostPerHundredUnits" + i);
			list.add("CostPerThousandUnits" + i);
		}
		return list;
	}

}
