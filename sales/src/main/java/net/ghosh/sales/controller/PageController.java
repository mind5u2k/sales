package net.ghosh.sales.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ghosh.sales.util.Util;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;
import net.ghosh.salesBackend.dto.UserMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import UserDAO.ProductDAO;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory
			.getLogger(PageController.class);

	@Autowired
	private GlobalController globalController;

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

}
