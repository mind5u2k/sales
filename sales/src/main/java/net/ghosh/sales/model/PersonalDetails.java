package net.ghosh.sales.model;

import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.User;

public class PersonalDetails {

	private User user;
	private Address address;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
