package net.ghosh.sales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/su")
public class SuperAdminController {

	private static final Logger logger = LoggerFactory
			.getLogger(SuperAdminController.class);

	@Autowired
	private GlobalController globalController;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("page");
		User superAdmin = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickSuperAdminHome", true);
		return mv;
	}

	@RequestMapping("/user")
	public ModelAndView Users(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Users");
		mv.addObject("userClickUserManagement", true);
		List<String> roles = Util.superAdminRoles();
		mv.addObject("roles", roles);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}
		User user = new User();
		mv.addObject("user", user);
		List<User> users = userDAO.getAllUsers();
		mv.addObject("users", users);
		return mv;
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) {

		logger.debug("++++++++++++++++ [" + user + "]");

		user.setPassword(passwordEncoder.encode("admin@123"));
		boolean status = userDAO.add(user);
		if (status) {
			return "redirect:/su/user?status=success";
		} else {
			return "redirect:/su/user?status=failure";
		}
	}

	@RequestMapping("/{id}/product")
	public ModelAndView manageProductEdit(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page1");
		mv.addObject("title", "Product Management");
		mv.addObject("userClickManageProduct", true);
		return mv;

	}

	@RequestMapping("/product")
	public ModelAndView manageProduct(
			@RequestParam(name = "success", required = false) String success) {
		ModelAndView mv = new ModelAndView("page1");
		mv.addObject("title", "Product Management");
		mv.addObject("userClickManageProduct", true);
		if (success != null) {
			if (success.equals("product")) {
				mv.addObject("message", "Product submitted successfully!");
			} else if (success.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public String managePostProduct(
			@Valid @ModelAttribute("product") User mProduct,
			BindingResult results, Model model, HttpServletRequest request) {
		if (mProduct.getId() == 0) {
		} else {
		}
		if (results.hasErrors()) {
			model.addAttribute("message",
					"Validation fails for adding the product!");
			model.addAttribute("userClickManageProduct", true);
			return "page1";
		}

		if (mProduct.getId() == 0) {
		} else {
		}

		return "redirect:/manage/product?success=product";
	}
}
