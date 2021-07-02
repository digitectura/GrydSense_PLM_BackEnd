package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.Components;

public interface ComponentsRepository extends JpaRepository<Components, Integer> {

	Components findByComponetId(Integer componetId);

}
