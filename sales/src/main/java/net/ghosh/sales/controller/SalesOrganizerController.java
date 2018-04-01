package net.ghosh.sales.controller;

import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/so")
public class SalesOrganizerController {

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
		User salesOrganizer = userDAO.getByEmail(globalController
				.getUserModel().getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickSalesOrganizerHome", true);
		return mv;
	}

}
