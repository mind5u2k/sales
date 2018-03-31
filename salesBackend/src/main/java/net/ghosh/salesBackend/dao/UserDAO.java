package net.ghosh.salesBackend.dao;

import java.util.List;

import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.User;
import net.ghosh.salesBackend.dto.UserMapping;

public interface UserDAO {

	// user related operation
	User getByEmail(String email);

	User get(int id);

	boolean add(User user);

	boolean addUserMapping(UserMapping userMapping);

	User addUser(User user);

	List<User> getAllUsers();

	List<UserMapping> getSubUsersByUser(User admin, String role);

	// adding and updating a new address
	Address getAddress(int addressId);

	boolean addAddress(Address address);

	boolean updateAddress(Address address);

	Address getBillingAddress(int userId);

	List<Address> listShippingAddresses(int userId);

}
