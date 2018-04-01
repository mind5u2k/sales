package net.ghosh.salesBackend.dao;

import java.util.List;

import net.ghosh.salesBackend.dto.AssignedProducts;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;

public interface ProductDAO {

	Product get(int id);

	boolean add(Product product);

	Product addProduct(Product product);

	List<Product> getAllProducts();

	List<Product> getAllActiveProducts();

	List<Product> getAllActiveProductsByAdmin(User admin);

	List<AssignedProducts> getAllAssignedProductsBySalesRepresentative(
			User salesRepresentative);

	AssignedProducts assignProduct(AssignedProducts product);
}
