package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.Products;

public interface ProductsRepository extends JpaRepository<Products, Integer> {

	Products findByProductId(Integer productId);

}
