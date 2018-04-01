package net.ghosh.salesBackend.daoimpl;

import java.util.List;

import net.ghosh.salesBackend.dto.Product;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import UserDAO.ProductDAO;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Product get(int id) {
		try {
			return sessionFactory.getCurrentSession().get(Product.class, id);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public boolean add(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public Product addProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return product;
		} catch (Exception ex) {
			return null;
		}
	}

	@Override
	public List<Product> getAllProducts() {
		return sessionFactory.getCurrentSession()
				.createQuery("FROM Product", Product.class).getResultList();
	}

	@Override
	public List<Product> getAllActiveProducts() {
		String selectQuery = "FROM Product WHERE active = :active ORDER BY id DESC";
		return sessionFactory.getCurrentSession()
				.createQuery(selectQuery, Product.class)
				.setParameter("active", true).getResultList();

	}

}
