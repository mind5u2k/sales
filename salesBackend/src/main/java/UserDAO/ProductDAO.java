package UserDAO;

import java.util.List;

import net.ghosh.salesBackend.dto.Product;

public interface ProductDAO {

	Product get(int id);

	boolean add(Product product);

	Product addProduct(Product product);

	List<Product> getAllProducts();

	List<Product> getAllActiveProducts();
}
