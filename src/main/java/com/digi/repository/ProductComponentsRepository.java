package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.Components;
import com.digi.domain.ProductComponents;
import com.digi.domain.ProductVersions;

public interface ProductComponentsRepository extends JpaRepository<ProductComponents, Integer> {

	ProductComponents findByReferenceIdAndProductVersion(String reference, ProductVersions productVersion);

	List<ProductComponents> findByComponents(Components components);

	List<ProductComponents> findByComponentsAndProductVersion(Components components, ProductVersions productVersion);
	
	ProductComponents findByProductComponentId(Integer productComponentId);

}
