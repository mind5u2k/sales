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
@RequestMapping("/ad")
public class AdminController {

	private static final Logger logger = LoggerFactory
			.getLogger(SuperAdminController.class);

	@Autowired
	private GlobalController globalController;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/salesManager")
	public ModelAndView Users(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User admin = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		mv.addObject("title", "SalesManager");
		mv.addObject("userClickSaledManagerManagement", true);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}
		User user = new User();
		user.setRole(Util.ROLE_SALESMANAGER);
		mv.addObject("user", user);
		List<UserMapping> salesManagers = userDAO.getSubUsersByUser(admin,
				Util.ROLE_SALESMANAGER);
		mv.addObject("salesManagers", salesManagers);
		return mv;
	}

	@RequestMapping(value = "/addSalesManager", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) {

		User admin = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		user.setRole(Util.ROLE_SALESMANAGER);
		user.setPassword(passwordEncoder.encode("admin@123"));
		User addeduser = userDAO.addUser(user);

		UserMapping userMapping = new UserMapping();
		userMapping.setSuperUser(admin);
		userMapping.setUser(addeduser);
		userMapping.setRole(Util.ROLE_SALESMANAGER);
		boolean status = userDAO.addUserMapping(userMapping);

		if (addeduser != null && status) {
			return "redirect:/ad/salesManager?status=success";
		} else {
			return "redirect:/ad/salesManager?status=failure";
		}
	}

	@RequestMapping("/salesOrganization")
	public ModelAndView saledOrganization(
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView mv = new ModelAndView("page");
		User admin = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		mv.addObject("title", "SalesOrganizer");
		mv.addObject("userClickSaledOrganizerManagement", true);
		if (status != null) {
			if (status.equals("success")) {
				mv.addObject("success", "User has been added successfully");
			} else if (status.equals("failure")) {
				mv.addObject("failure", "Getting Error while Adding a New User");
			}
		}
		User user = new User();
		user.setRole(Util.ROLE_SALESORGANIZER);
		mv.addObject("user", user);
		List<UserMapping> salesOrganizer = userDAO.getSubUsersByUser(admin,
				Util.ROLE_SALESORGANIZER);
		mv.addObject("salesOrganizer", salesOrganizer);
		return mv;
	}

	@RequestMapping(value = "/addSalesOrganizer", method = RequestMethod.POST)
	public String addSalesOrganizer(@ModelAttribute("user") User user) {

		User admin = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		user.setRole(Util.ROLE_SALESORGANIZER);
		user.setPassword(passwordEncoder.encode("admin@123"));
		User addeduser = userDAO.addUser(user);

		UserMapping userMapping = new UserMapping();
		userMapping.setSuperUser(admin);
		userMapping.setUser(addeduser);
		userMapping.setRole(Util.ROLE_SALESORGANIZER);
		boolean status = userDAO.addUserMapping(userMapping);

		if (addeduser != null && status) {
			return "redirect:/ad/salesOrganization?status=success";
		} else {
			return "redirect:/ad/salesOrganization?status=failure";
		}
	}
}
