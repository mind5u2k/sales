package net.ghosh.sales.util;

import java.util.ArrayList;
import java.util.List;

public class Util {

	public static final String ROLE_SUPERADMIN = "SUPER ADMIN";
	public static final String ROLE_ADMIN = "ADMIN";
	public static final String ROLE_SALESMANAGER = "SALES MANAGER";
	public static final String ROLE_SALESORGANIZATOIN = "SALES ORGANIZATOIN";
	public static final String ROLE_SALESREPRESENTATIVE = "SALES REPRESENTATIVE";
	public static final String ROLE_USER = "USER";

	public static List<String> superAdminRoles() {
		List<String> roles = new ArrayList<String>();
		roles.add(ROLE_SUPERADMIN);
		roles.add(ROLE_ADMIN);
		return roles;
	}
}
