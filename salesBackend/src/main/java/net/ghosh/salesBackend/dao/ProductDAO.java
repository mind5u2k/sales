package net.ghosh.salesBackend.dao;

import java.util.List;

import net.ghosh.salesBackend.dto.AssignedProducts;
import net.ghosh.salesBackend.dto.Company;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;

public interface ProductDAO {

	Product get(int id);

	boolean add(Product product);

	Product addProduct(Product product);

	List<Product> getAllProducts();

	List<Product> getAllActiveProducts();

	List<Product> getAllActiveProductsByAdmin(User admin);

	AssignedProducts getAssignedProductById(int id);

	List<AssignedProducts> getAllAssignedProductsBySalesRepresentative(
			User salesRepresentative);

	List<AssignedProducts> getAssignedProducts(User client);

	AssignedProducts assignProduct(AssignedProducts product);

	boolean updateAssignedProduct(AssignedProducts assignedProduct);
}
