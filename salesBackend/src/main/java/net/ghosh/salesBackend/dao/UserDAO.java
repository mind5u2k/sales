package net.ghosh.salesBackend.dao;

import java.util.List;

import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.Company;
import net.ghosh.salesBackend.dto.User;
import net.ghosh.salesBackend.dto.UserMapping;

public interface UserDAO {

	// user related operation
	User getByEmail(String email);

	User get(int id);

	boolean add(User user);

	boolean addUserMapping(UserMapping userMapping);

	User addUser(User user);

	boolean updateUser(User user);

	List<User> getAllUsers();

	List<UserMapping> getSubUsersByUser(User admin, String role);

	User getAdminOfSalesManager(User salesManager);

	User getSalesManagerOfSalesRepresentative(User salesRepresentative);

	User getSalesRepresentativeOfClient(User client);

	// adding and updating a new address
	Address getAddress(int addressId);

	boolean addAddress(Address address);

	boolean updateAddress(Address address);

	Address getAddressByUser(int userId);

	Company getCompanyByUserId(int userId);

	boolean addCompany(Company company);

	boolean updateCompany(Company company);

}
