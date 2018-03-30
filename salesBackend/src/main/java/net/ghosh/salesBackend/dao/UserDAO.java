package net.ghosh.salesBackend.dao;

import java.util.List;

import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.User;

public interface UserDAO {

	// user related operation
	User getByEmail(String email);

	User get(int id);

	boolean add(User user);

	List<User> getAllUsers();

	// adding and updating a new address
	Address getAddress(int addressId);

	boolean addAddress(Address address);

	boolean updateAddress(Address address);

	Address getBillingAddress(int userId);

	List<Address> listShippingAddresses(int userId);

}
