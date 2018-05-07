package net.ghosh.sales.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ghosh.sales.model.UpdatePassword;
import net.ghosh.sales.service.PdfGeneration.PdfGeneration;
import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.ProductDAO;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.BillDetails;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory
			.getLogger(PageController.class);

	@Autowired
	private GlobalController globalController;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public String index(
			@RequestParam(name = "logout", required = false) String logout) {

		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		if (logout != null) {
			return "redirect:/logout";
		}

		User user = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		if (user.getRole().equals(Util.ROLE_SUPERADMIN)) {
			return "redirect:/su/home";
		} else if (user.getRole().equals(Util.ROLE_ADMIN)) {
			return "redirect:/ad/home";
		} else if (user.getRole().equals(Util.ROLE_SALESMANAGER)) {
			return "redirect:/sm/home";
		} else if (user.getRole().equals(Util.ROLE_SALESORGANIZER)) {
			return "redirect:/so/home";
		} else if (user.getRole().equals(Util.ROLE_SALESREPRESENTATIVE)) {
			return "redirect:/sr/home";
		} else if (user.getRole().equals(Util.ROLE_CLIENT)) {
			return "redirect:/cl/home";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page1");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page1");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	/*
	 * Methods to load all the products and based on category
	 */

	/*
	 * Viewing a single product
	 */

	@RequestMapping(value = "/membership")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		logger.info("Page Controller membership called!");
		return mv;
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(
			@RequestParam(name = "error", required = false) String error,
			@RequestParam(name = "logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("title", "Login");
		if (error != null) {
			mv.addObject("message", "Username and Password is invalid!");
		}
		if (logout != null) {
			mv.addObject("logout", "You have logged out successfully!");
		}
		return mv;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Aha! Caught You.");
		mv.addObject("errorDescription",
				"You are not authorized to view this page!");
		mv.addObject("title", "403 Access Denied");
		return mv;
	}

	@RequestMapping("/products")
	public ModelAndView products(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User user = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		mv.addObject("title", "Products");
		mv.addObject("userClickProductManagement", true);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "Product has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure",
						"Getting Error while Adding a New Product");
			}
		}

		Product product = new Product();
		mv.addObject("product", product);

		List<Product> products = new ArrayList<Product>();

		if (user.getRole().equals(Util.ROLE_ADMIN)
				|| user.getRole().equals(Util.ROLE_SUPERADMIN)) {
			products = productDAO.getAllProducts();
		} else {
			products = productDAO.getAllActiveProducts();
		}

		mv.addObject("products", products);
		return mv;
	}

	@RequestMapping(value = "/downloadBill")
	public void downloadBill(HttpServletRequest request,
			HttpServletResponse response) {
		PdfGeneration generation = new PdfGeneration();
		try {
			generation.generateBill(request, response, new BillDetails());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/editProfile")
	public ModelAndView downloadBill(
			@RequestParam(name = "status", required = false) String status) {
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickProfilePage", true);
		mv.addObject("title", "Edit Profile");
		mv.addObject("client", client);

		Address address = null;
		address = userDAO.getAddressByUser(client.getId());
		if (address == null) {
			address = new Address();
			address.setUser(client);
			mv.addObject("address", address);
		} else {
			mv.addObject("address", address);
		}

		if (status != null) {
			if (status.equals("personalDeatilsUpdated")) {
				mv.addObject("personalDeatilsMsg",
						"Personal Deatils has been updated successfully");
			} else if (status.equals("addressUpdated")) {
				mv.addObject("addressMsg",
						"Address has been updated successfully");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("client") User client) {
		User client1 = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		client1.setFirstName(client.getFirstName());
		client1.setLastName(client.getLastName());
		client1.setContactNumber(client.getContactNumber());
		client1.setDob(client.getDob());
		client1.setEmail(client.getEmail());
		userDAO.updateUser(client1);
		return "redirect:/editProfile?status=personalDeatilsUpdated";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute("address") Address address) {

		User client1 = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		Address address2 = userDAO.getAddress(address.getId());
		if (address2 == null) {
			address.setUser(client1);
			userDAO.addAddress(address);
		} else {
			address2.setAddressLineOne(address.getAddressLineOne());
			address2.setAddressLineTwo(address.getAddressLineTwo());
			address2.setCity(address.getCity());
			address2.setCountry(address.getCountry());
			address2.setPostalCode(address.getPostalCode());
			address2.setState(address.getState());
			userDAO.updateAddress(address2);
		}
		return "redirect:/editProfile?status=addressUpdated";
	}

	@RequestMapping(value = "/updatePassword")
	public ModelAndView updatePassword(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickUpdatePassword", true);
		mv.addObject("title", "Update Password");
		UpdatePassword password = new UpdatePassword();
		mv.addObject("password", password);

		if (status != null) {
			if (status.equals("updated")) {
				mv.addObject("msg",
						"!! Password has been updated successfully !!");
			} else if (status.equals("failed")) {
				mv.addObject("errorMsg",
						"!! You have entered wrong password !!");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(
			@ModelAttribute("password") UpdatePassword password) {

		User client1 = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		String newPassword = passwordEncoder.encode(password.getPassword());
		boolean st = passwordEncoder.matches(password.getOldPassword(),
				client1.getPassword());

		System.out.println(st);

		if (st) {
			client1.setPassword(newPassword);
			userDAO.updateUser(client1);
			return "redirect:/updatePassword?status=updated";
		} else {
			return "redirect:/updatePassword?status=failed";
		}
	}

}
