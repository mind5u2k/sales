package net.ghosh.sales.controller;

import java.util.ArrayList;
import java.util.List;

import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.ProductDAO;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.AssignedProducts;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;
import net.ghosh.salesBackend.dto.UserMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sr")
public class SalesRepresentativeController {

	private static final Logger logger = LoggerFactory
			.getLogger(SuperAdminController.class);

	@Autowired
	private GlobalController globalController;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("page");
		User salesRepresentative = userDAO.getByEmail(globalController
				.getUserModel().getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickSalesRepresentativeHome", true);
		return mv;
	}

	@RequestMapping("/clients")
	public ModelAndView clients(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User salesRepresentative = userDAO.getByEmail(globalController
				.getUserModel().getEmail());
		mv.addObject("title", "Clients");
		mv.addObject("userClickClientsManagement", true);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}
		User user = new User();
		user.setRole(Util.ROLE_CLIENT);
		mv.addObject("user", user);
		List<UserMapping> clients = userDAO.getSubUsersByUser(
				salesRepresentative, Util.ROLE_CLIENT);
		mv.addObject("clients", clients);
		return mv;
	}

	@RequestMapping(value = "/addClients", method = RequestMethod.POST)
	public String addClients(@ModelAttribute("user") User user) {

		User salesRepresentative = userDAO.getByEmail(globalController
				.getUserModel().getEmail());

		user.setRole(Util.ROLE_CLIENT);
		user.setPassword(passwordEncoder.encode("admin@123"));
		User addeduser = userDAO.addUser(user);

		UserMapping userMapping = new UserMapping();
		userMapping.setSuperUser(salesRepresentative);
		userMapping.setUser(addeduser);
		userMapping.setRole(Util.ROLE_CLIENT);
		boolean status = userDAO.addUserMapping(userMapping);

		if (addeduser != null && status) {
			return "redirect:/sr/clients?status=success";
		} else {
			return "redirect:/sr/clients?status=failure";
		}
	}

	@RequestMapping("/assignProducts")
	public ModelAndView assignProducts(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User salesRepresentative = userDAO.getByEmail(globalController
				.getUserModel().getEmail());
		mv.addObject("title", "Assign Products");

		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}

		// ====== Main Page ==================
		List<AssignedProducts> assignedProducts = productDAO
				.getAllAssignedProductsBySalesRepresentative(salesRepresentative);
		mv.addObject("assignedProducts", assignedProducts);

		// ================New assigned product ================
		AssignedProducts assignedProduct = new AssignedProducts();
		assignedProduct.setStatus(Util.STATUS_TRIAL);
		assignedProduct.setTrialPeriod(10);
		mv.addObject("assignedProduct", assignedProduct);
		List<UserMapping> userMappings = userDAO.getSubUsersByUser(
				salesRepresentative, Util.ROLE_CLIENT);
		List<User> clients = new ArrayList<User>();
		if (userMappings != null) {
			for (UserMapping m : userMappings) {
				clients.add(m.getUser());
			}
		}

		mv.addObject("clients", clients);
		User admin = userDAO.getAdminOfSalesManager(userDAO
				.getSalesManagerOfSalesRepresentative(salesRepresentative));
		List<Product> products = productDAO.getAllActiveProductsByAdmin(admin);
		mv.addObject("products", products);
		mv.addObject("userClickAssignProductManagementHome", true);
		return mv;
	}

	@RequestMapping(value = "/saveAssignedProduct", method = RequestMethod.POST)
	public String saveAssignedProduct(
			@ModelAttribute("assignedProduct") AssignedProducts assignedProduct) {

		User salesRepresentative = userDAO.getByEmail(globalController
				.getUserModel().getEmail());

		assignedProduct.setClient(userDAO.get(assignedProduct.getClient()
				.getId()));
		assignedProduct.setProduct(productDAO.get(assignedProduct.getProduct()
				.getId()));
		assignedProduct.setSalesRepresentative(salesRepresentative);
		assignedProduct.setStatus(Util.STATUS_TRIAL);
		AssignedProducts addedAssignedProduct = productDAO
				.assignProduct(assignedProduct);

		if (addedAssignedProduct != null) {
			return "redirect:/sr/assignProducts?status=success";
		} else {
			return "redirect:/sr/assignProducts?status=failure";
		}
	}
}
