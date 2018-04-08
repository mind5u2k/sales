package net.ghosh.sales.controller;

import java.lang.Thread.State;
import java.util.List;

import net.ghosh.sales.model.PersonalDetails;
import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.ProductDAO;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.AssignedProducts;
import net.ghosh.salesBackend.dto.Company;
import net.ghosh.salesBackend.dto.Product;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cl")
public class ClientController {

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

		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		if (!client.isTwoStepVerfication()) {
			ModelAndView mv = new ModelAndView("verificationPage");
			return mv;
		} else if (!client.isAllDeatilsStatus()) {
			ModelAndView mv = new ModelAndView("profilePage");
			client.setPassword("");
			mv.addObject("client", client);
			return mv;
		}

		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Home");
		mv.addObject("userClickClientHome", true);
		return mv;
	}

	@RequestMapping("/sendOtp")
	public ModelAndView sendOtp() {

		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		ModelAndView mv = new ModelAndView("otpConfirmation");
		String otp = Util.generateVerificationCode();
		client.setVerificationCode(otp);
		userDAO.updateUser(client);
		mv.addObject("sentOtp", "OTP has been sent successfully");
		return mv;
	}

	@RequestMapping(value = "/checkOtp")
	public ModelAndView checkOtp(
			@RequestParam(name = "otpassword", required = false) String otpassword) {

		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		System.out.println(otpassword);
		if (otpassword.equals(client.getVerificationCode())) {
			client.setTwoStepVerfication(true);
			userDAO.updateUser(client);
			ModelAndView mv = new ModelAndView("otpConfirmed");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("otpConfirmation");
			mv.addObject("error", "You have entered wrong OTP");
			return mv;
		}

	}

	@RequestMapping("/clientPaymentDeatils")
	public ModelAndView clientPaymentDeatils() {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickClientPaymentDetails", true);
		return mv;
	}

	@RequestMapping("/clientPaymentConfirmation")
	public ModelAndView clientPaymentConfirmation() {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickClientPaymentConfirmation", true);
		return mv;
	}

	@RequestMapping("/checkout")
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		mv.addObject("title", "Home");
		mv.addObject("userClickClientCheckoutform", true);
		return mv;
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute("client") User client) {
		ModelAndView mv = new ModelAndView("addressPage");

		User client1 = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		client1.setFirstName(client.getFirstName());
		client1.setLastName(client.getLastName());
		client1.setContactNumber(client.getContactNumber());
		client1.setDob(client.getDob());
		client1.setEmail(client.getEmail());
		client1.setPassword(passwordEncoder.encode(client.getPassword()));
		userDAO.updateUser(client1);
		Address address = null;
		address = userDAO.getAddressByUser(client1.getId());
		if (address == null) {
			address = new Address();
			address.setUser(client1);
			mv.addObject("address", address);
		} else {
			mv.addObject("address", address);
		}
		return mv;
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public ModelAndView updateAddress(@ModelAttribute("address") Address address) {
		ModelAndView mv = new ModelAndView("companyPage");

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
		Company company = null;
		company = userDAO.getCompanyByUserId(client1.getId());
		if (company == null) {
			company = new Company();
			company.setClient(client1);
			mv.addObject("company", company);
		} else {
			mv.addObject("company", company);
		}

		return mv;
	}

	@RequestMapping(value = "/updateCompanyDetails", method = RequestMethod.POST)
	public ModelAndView updateCompanyDetails(
			@ModelAttribute("company") Company company) {

		ModelAndView mv = new ModelAndView("productDetailsPage");

		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		Company company2 = userDAO.getCompanyByUserId(client.getId());

		if (company2 == null) {
			company.setClient(client);
			userDAO.addCompany(company);
		} else {
			company2.setAddressLineOne(company.getAddressLineOne());
			company2.setAddressLineTwo(company.getAddressLineTwo());
			company2.setCity(company.getCity());
			company2.setCompanyName(company.getCompanyName());
			company2.setCompanyUrl(company.getCompanyUrl());
			company2.setCountry(company.getCountry());
			company2.setPostalCode(company.getPostalCode());
			company2.setState(company.getState());
			userDAO.updateCompany(company2);
		}

		List<AssignedProducts> assignedProduct = productDAO
				.getAssignedProducts(client);
		if (assignedProduct != null) {
			if (assignedProduct.size() > 0) {
				mv.addObject("assignedProduct", assignedProduct.get(0));
			} else {
				mv.addObject("assignedProduct", null);
			}
		} else {
			mv.addObject("assignedProduct", null);
		}

		return mv;
	}

	@RequestMapping(value = "/updateAssignedProducts", method = RequestMethod.POST)
	public ModelAndView updateAssignedProducts(
			@ModelAttribute("assignedProduct") AssignedProducts assignedProduct) {

		ModelAndView mv = new ModelAndView("updatedMsg");

		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		AssignedProducts assignedProduct2 = productDAO
				.getAssignedProductById(assignedProduct.getId());
		assignedProduct2.setTermsAndCondition(true);
		productDAO.updateAssignedProduct(assignedProduct2);

		client.setAllDeatilsStatus(true);
		userDAO.updateUser(client);

		return mv;
	}
}
