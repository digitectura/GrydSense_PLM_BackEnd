package com.digi.restservices;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.digi.domain.ComponentVendorDetails;
import com.digi.domain.Components;
import com.digi.domain.ProductComponents;
import com.digi.domain.ProductVersions;
import com.digi.pojo.ComponentDisplay;
import com.digi.repository.ComponentVendorDetailsRepository;
import com.digi.repository.ComponentsRepository;
import com.digi.repository.ProductComponentsRepository;

@RestController
@RequestMapping("/components-management")
public class ComponentsManagement {

	@Autowired
	private ComponentsRepository componentsRepository;

	@Autowired
	private ProductComponentsRepository productComponentsRepository;

	@Autowired
	private ComponentVendorDetailsRepository componentVendorDetailsRepository;

	@GetMapping("/")
	private ResponseEntity<?> getAllAvailableComponent() {
		return ResponseEntity.status(HttpStatus.OK).body(componentsRepository.findAll());
	}

	@PostMapping("/")
	private ResponseEntity<?> addComponent(@RequestBody Components componentObj) {
		componentsRepository.saveAndFlush(componentObj);
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@GetMapping("/vendor/{componentId}")
	private ResponseEntity<?> getAllAvailableComponentVendors(@PathVariable Integer componentId) {
		Components componentObj = componentsRepository.findByComponetId(componentId);
		List<ComponentVendorDetails> componentVendorDetails = componentVendorDetailsRepository
				.findByComponents(componentObj);
		return ResponseEntity.status(HttpStatus.OK).body(componentVendorDetails);
	}

	@PostMapping("/vendor/{componentId}")
	private ResponseEntity<?> addComponentVendors(@PathVariable Integer componentId,
			@RequestBody ComponentVendorDetails componentVendorDetails) {
		Components componentObj = componentsRepository.findByComponetId(componentId);
		componentVendorDetails.setComponents(componentObj);
		componentVendorDetailsRepository.saveAndFlush(componentVendorDetails);
		return ResponseEntity.status(HttpStatus.OK).body("saved");
	}

	@DeleteMapping("/vendor/{componentVendorDetailId}")
	private ResponseEntity<?> deletreComponentVendors(@PathVariable Integer componentVendorDetailId) {
		ComponentVendorDetails componentVendorDetails = componentVendorDetailsRepository
				.findByComponentVendorDetailId(componentVendorDetailId);
		if (componentVendorDetails != null) {
			componentVendorDetailsRepository.delete(componentVendorDetails);
		}
		return ResponseEntity.status(HttpStatus.OK).body("deleted");
	}

	@GetMapping("/component/{componentId}")
	private ResponseEntity<?> getComponentVersions(@PathVariable Integer componentId) {
		Components componentObj = componentsRepository.findByComponetId(componentId);
		List<ProductComponents> ProductComponents = productComponentsRepository.findByComponents(componentObj);
		List<ComponentDisplay> componentDisplayList = new ArrayList<>();
		Map<Integer, String> projectNameMap = new HashMap<>();
		Map<Integer, String> projectVersionMap = new HashMap<>();
		Map<Integer, Integer> sensorCount = new HashMap<>();
		for (ProductComponents productComponentObj : ProductComponents) {
			ProductVersions productVersionObj = productComponentObj.getProductVersion();
			projectVersionMap.put(productVersionObj.getProductVersionId(), productVersionObj.getVersionNumber());
			projectNameMap.put(productVersionObj.getProductVersionId(),
					productVersionObj.getProduct().getProductName());
			int count = 0;
			if (sensorCount.get(productVersionObj.getProductVersionId()) != null) {
				count = sensorCount.get(productVersionObj.getProductVersionId());
			}
			count++;
			sensorCount.put(productVersionObj.getProductVersionId(), count);
		}
		for (Map.Entry<Integer, String> entry : projectNameMap.entrySet()) {
			ComponentDisplay componentDisplayObj = new ComponentDisplay();
			componentDisplayObj.setProjectName(entry.getValue());
			componentDisplayObj.setProjectVersion(projectVersionMap.get(entry.getKey()));
			componentDisplayObj.setSensorCount(sensorCount.get(entry.getKey()));
			componentDisplayList.add(componentDisplayObj);
		}
		return ResponseEntity.status(HttpStatus.OK).body(componentDisplayList);
	}

	@DeleteMapping("/component/{componentId}")
	private ResponseEntity<?> deleteComponentVersions(@PathVariable Integer componentId) {
		Components componentObj = componentsRepository.findByComponetId(componentId);
		if (componentObj != null) {
			componentsRepository.delete(componentObj);
		}
		return ResponseEntity.status(HttpStatus.OK).body("deleted");
	}

}
