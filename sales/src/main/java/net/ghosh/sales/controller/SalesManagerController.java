package net.ghosh.sales.controller;

import java.util.List;

import net.ghosh.sales.util.Util;
import net.ghosh.salesBackend.dao.UserDAO;
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
@RequestMapping("/sm")
public class SalesManagerController {
	private static final Logger logger = LoggerFactory
			.getLogger(SuperAdminController.class);

	@Autowired
	private GlobalController globalController;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/salesRepresentatives")
	public ModelAndView salesRepresentatives(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User salesManager = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		mv.addObject("title", "SalesRepresentatives");
		mv.addObject("userClickSaledRepresentativeManagement", true);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}
		User user = new User();
		user.setRole(Util.ROLE_SALESREPRESENTATIVE);
		mv.addObject("user", user);
		List<UserMapping> salesRepresentatives = userDAO.getSubUsersByUser(
				salesManager, Util.ROLE_SALESREPRESENTATIVE);
		mv.addObject("salesRepresentatives", salesRepresentatives);
		return mv;
	}

	@RequestMapping(value = "/addSalesRepresentatives", method = RequestMethod.POST)
	public String addSalesRepresentatives(@ModelAttribute("user") User user) {

		User salesManager = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		user.setRole(Util.ROLE_SALESREPRESENTATIVE);
		user.setPassword(passwordEncoder.encode("admin@123"));
		User addeduser = userDAO.addUser(user);

		UserMapping userMapping = new UserMapping();
		userMapping.setSuperUser(salesManager);
		userMapping.setUser(addeduser);
		userMapping.setRole(Util.ROLE_SALESREPRESENTATIVE);
		boolean status = userDAO.addUserMapping(userMapping);

		if (addeduser != null && status) {
			return "redirect:/sm/salesRepresentatives?status=success";
		} else {
			return "redirect:/sm/salesRepresentatives?status=failure";
		}
	}
}
