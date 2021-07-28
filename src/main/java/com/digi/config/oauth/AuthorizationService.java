package com.digi.config.oauth;

import static org.springframework.security.core.authority.AuthorityUtils.createAuthorityList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.digi.repository.UserDetailsRepository;

@Service("userDetailsService")
public class AuthorizationService implements UserDetailsService {

	@Autowired
	private UserDetailsRepository userDetailsRepository;

	@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		com.digi.domain.UserDetails userDetails = userDetailsRepository.findByEmail(arg0);
		boolean status = true;
		if ((userDetails == null)) {
			status = false;
		} else {
			status = true;
		}
		if (status) {
			return new org.springframework.security.core.userdetails.User(arg0, userDetails.getPassword(),
					createAuthorityList("" + userDetails.getUserId()));
		} else {
			throw new UsernameNotFoundException(String.format("User '%s' not found", arg0));
		}
	}

}
