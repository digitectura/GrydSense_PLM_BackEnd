package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.ComponentVendorDetails;
import com.digi.domain.Components;

public interface ComponentVendorDetailsRepository extends JpaRepository<ComponentVendorDetails, Integer> {

	List<ComponentVendorDetails> findByComponents(Components components);

	ComponentVendorDetails findByComponentVendorDetailId(Integer componentVendorDetailId);

}
