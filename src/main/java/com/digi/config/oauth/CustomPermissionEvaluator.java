package com.digi.config.oauth;

import java.io.Serializable;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

@Component
public class CustomPermissionEvaluator implements PermissionEvaluator {

	@Override
	public boolean hasPermission(Authentication authentication, Object accessType, Object permission) {
		return true;
	}

	@Override
	public boolean hasPermission(Authentication authentication, Serializable serializable, String targetType,
			Object permission) {
		return true;
	}

}
