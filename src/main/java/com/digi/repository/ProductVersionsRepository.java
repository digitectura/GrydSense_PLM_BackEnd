package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.ProductVersions;

public interface ProductVersionsRepository extends JpaRepository<ProductVersions, Integer> {

	ProductVersions findByProductVersionId(Integer productVersionId);

}
