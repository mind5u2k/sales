package net.ghosh.salesBackend;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Util {

	public static final String ROLE_SUPERADMIN = "SUPER ADMIN";
	public static final String ROLE_ADMIN = "ADMIN";
	public static final String ROLE_SALESMANAGER = "SALES MANAGER";
	public static final String ROLE_SALESORGANIZER = "SALES ORGANIZER";
	public static final String ROLE_SALESREPRESENTATIVE = "SALES REPRESENTATIVE";
	public static final String ROLE_CLIENT = "CLIENT";

	public static List<String> superAdminRoles() {
		List<String> roles = new ArrayList<String>();
		roles.add(ROLE_SUPERADMIN);
		roles.add(ROLE_ADMIN);
		return roles;
	}

	public static List<String> adminRoles() {
		List<String> roles = new ArrayList<String>();
		roles.add(ROLE_SALESMANAGER);
		roles.add(ROLE_SALESORGANIZER);
		return roles;
	}

	public static final String STATUS_TRIAL = "Trial";
	public static final String STAUS_ACTIVE = "Active";
	public static final String STATUS_DEACTIVATE = "Deactivated";

	private static final int MAX_VERIFICATION_CODE = 100000;
	private static final int MIN_VERIFICATION_CODE = 999999;

	public static String generateVerificationCode() {
		Random rand = new Random();
		Integer code = rand.nextInt(MIN_VERIFICATION_CODE
				- MAX_VERIFICATION_CODE + 1)
				+ MAX_VERIFICATION_CODE;
		return code.toString();
	}

	public static void main(String[] args) {
		System.out.println("generated verification code is ---");
		System.out.println(generateVerificationCode());
	}
}
