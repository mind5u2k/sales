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

}
