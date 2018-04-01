package net.ghosh.salesBackend.daoimpl;

import java.util.List;

import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.User;
import net.ghosh.salesBackend.dto.UserMapping;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User getByEmail(String email) {
		String selectQuery = "FROM User WHERE email = :email";
		try {
			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, User.class)
					.setParameter("email", email).getSingleResult();
		} catch (Exception ex) {
			return null;
		}

	}

	@Override
	public boolean add(User user) {
		try {
			sessionFactory.getCurrentSession().persist(user);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public boolean addUserMapping(UserMapping userMapping) {
		try {
			sessionFactory.getCurrentSession().persist(userMapping);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public User addUser(User user) {
		try {
			sessionFactory.getCurrentSession().persist(user);
			return user;
		} catch (Exception ex) {
			return null;
		}
	}

	@Override
	public boolean addAddress(Address address) {
		try {
			// will look for this code later and why we need to change it
			sessionFactory.getCurrentSession().persist(address);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public boolean updateAddress(Address address) {
		try {
			sessionFactory.getCurrentSession().update(address);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public List<Address> listShippingAddresses(int userId) {
		String selectQuery = "FROM Address WHERE userId = :userId AND shipping = :isShipping ORDER BY id DESC";
		return sessionFactory.getCurrentSession()
				.createQuery(selectQuery, Address.class)
				.setParameter("userId", userId)
				.setParameter("isShipping", true).getResultList();

	}

	@Override
	public Address getBillingAddress(int userId) {
		String selectQuery = "FROM Address WHERE userId = :userId AND billing = :isBilling";
		try {
			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, Address.class)
					.setParameter("userId", userId)
					.setParameter("isBilling", true).getSingleResult();
		} catch (Exception ex) {
			return null;
		}
	}

	@Override
	public User get(int id) {
		try {
			return sessionFactory.getCurrentSession().get(User.class, id);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public Address getAddress(int addressId) {
		try {
			return sessionFactory.getCurrentSession().get(Address.class,
					addressId);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public List<User> getAllUsers() {
		return sessionFactory.getCurrentSession()
				.createQuery("FROM User", User.class).getResultList();
	}

	@Override
	public List<UserMapping> getSubUsersByUser(User admin, String role) {
		String selectQuery = "FROM UserMapping WHERE superUser.id = :userId AND role = :role";
		return sessionFactory.getCurrentSession()
				.createQuery(selectQuery, UserMapping.class)
				.setParameter("userId", admin.getId())
				.setParameter("role", role).getResultList();
	}

	@Override
	public User getAdminOfSalesManager(User salesManager) {
		String selectQuery = "FROM UserMapping WHERE user.id = :userId AND role = :role";
		try {
			UserMapping userMapping = sessionFactory.getCurrentSession()
					.createQuery(selectQuery, UserMapping.class)
					.setParameter("userId", salesManager.getId())
					.setParameter("role", Util.ROLE_SALESMANAGER)
					.getSingleResult();
			if (userMapping != null) {
				return userMapping.getSuperUser();
			} else {
				return null;
			}
		} catch (Exception ex) {
			return null;
		}
	}

	@Override
	public User getSalesManagerOfSalesRepresentative(User salesRepresentative) {
		String selectQuery = "FROM UserMapping WHERE user.id = :userId AND role = :role";
		try {
			UserMapping userMapping = sessionFactory.getCurrentSession()
					.createQuery(selectQuery, UserMapping.class)
					.setParameter("userId", salesRepresentative.getId())
					.setParameter("role", Util.ROLE_SALESREPRESENTATIVE)
					.getSingleResult();
			if (userMapping != null) {
				return userMapping.getSuperUser();
			} else {
				return null;
			}
		} catch (Exception ex) {
			return null;
		}
	}

	@Override
	public User getSalesRepresentativeOfClient(User client) {
		String selectQuery = "FROM UserMapping WHERE user.id = :userId AND role = :role";
		try {
			UserMapping userMapping = sessionFactory.getCurrentSession()
					.createQuery(selectQuery, UserMapping.class)
					.setParameter("userId", client.getId())
					.setParameter("role", Util.ROLE_CLIENT).getSingleResult();
			if (userMapping != null) {
				return userMapping.getSuperUser();
			} else {
				return null;
			}
		} catch (Exception ex) {
			return null;
		}
	}

}
