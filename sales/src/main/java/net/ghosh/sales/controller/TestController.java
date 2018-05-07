package net.ghosh.sales.controller;

import java.util.List;

import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	private static final Logger logger = LoggerFactory
			.getLogger(TestController.class);

	@Autowired
	private UserDAO userDAO;

	@GetMapping("/customers")
	public List<User> getCustomers() {
		return userDAO.getAllUsers();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping("/customers/{id}")
	public ResponseEntity<User> getCustomer(@PathVariable("id") int id) {

		User customer = userDAO.get(id);
		if (customer == null) {
			return new ResponseEntity("No Customer found for ID " + id,
					HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity(customer, HttpStatus.OK);
	}

}
