package com.digi.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.ProductVersions;
import com.digi.domain.VersionFiles;

public interface VersionFilesRepository extends JpaRepository<VersionFiles, Integer> {

	List<VersionFiles> findByProductVersions(ProductVersions productVersions);

	VersionFiles findByProductVersionsAndCategory(ProductVersions productVersions, String category);

}
