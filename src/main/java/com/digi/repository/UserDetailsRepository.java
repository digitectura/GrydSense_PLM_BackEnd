package com.digi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.digi.domain.UserDetails;

public interface UserDetailsRepository extends JpaRepository<UserDetails, Integer> {

	UserDetails findByEmail(String email);

}
