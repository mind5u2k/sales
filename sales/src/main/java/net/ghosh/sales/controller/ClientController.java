package net.ghosh.sales.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.ProductDAO;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.Address;
import net.ghosh.salesBackend.dto.AssignedProducts;
import net.ghosh.salesBackend.dto.BillDetails;
import net.ghosh.salesBackend.dto.Company;
import net.ghosh.salesBackend.dto.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	public ModelAndView home(
			@RequestParam(name = "assignedProductId", required = false) Integer assignedProductId) {
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

		List<AssignedProducts> assignedProducts = productDAO
				.getAssignedProducts(client);

		System.out.println("---------------assigned product id is ["
				+ assignedProductId + "]");
		AssignedProducts assignedProduct = assignedProducts.get(0);
		if (assignedProductId != null) {
			assignedProduct = productDAO
					.getAssignedProductById(assignedProductId);
		}

		Calendar cal1 = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");
		String formatted = format1.format(cal1.getTime());
		mv.addObject("todaysDate", formatted);

		if (assignedProduct.getStatus().equals(Util.STATUS_ASSIGNED)) {
			mv.addObject("title", "Home");
			mv.addObject("userClinkClinetHomeAssigned", true);
			mv.addObject("assignedProducts", assignedProducts);
			mv.addObject("assignedProduct", assignedProduct);
		} else if (assignedProduct.getStatus().equals(Util.STATUS_TRIAL)) {
			mv.addObject("title", "Home");
			mv.addObject("userClickClientHome", true);
			Calendar cal = Calendar.getInstance();
			cal.setTime(assignedProduct.getStartdate());
			assignedProduct.setStartdate(cal.getTime());
			cal = Calendar.getInstance();
			cal.setTime(assignedProduct.getEndDate());
			assignedProduct.setEndDate(cal.getTime());
			mv.addObject("assignedProducts", assignedProducts);
			mv.addObject("assignedProduct", assignedProduct);
		} else if (assignedProduct.getStatus().equals(Util.STAUS_ACTIVE)) {
			mv.addObject("title", "Home");
			mv.addObject("userClickClientActiveHome", true);
			Calendar cal = Calendar.getInstance();
			cal.setTime(assignedProduct.getStartdate());
			assignedProduct.setStartdate(cal.getTime());
			cal = Calendar.getInstance();
			cal.setTime(assignedProduct.getEndDate());
			assignedProduct.setEndDate(cal.getTime());
			mv.addObject("assignedProducts", assignedProducts);
			mv.addObject("assignedProduct", assignedProduct);
		}
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

	@RequestMapping("/clientPaymentDeatils/{id}")
	public ModelAndView clientPaymentDeatilss(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(id);
		assignedProduct.setPaymentDuration(Util.DURATION_MONTHLY);
		productDAO.updateAssignedProduct(assignedProduct);

		Calendar cal = Calendar.getInstance();
		assignedProduct.setStartdate(cal.getTime());
		cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 1);
		assignedProduct.setEndDate(cal.getTime());
		assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
		double totalDue = assignedProduct.getMainPrice()
				+ (assignedProduct.getMainPrice() * assignedProduct.getTax() / 100);
		assignedProduct.setTotalPrice(totalDue);

		Company company = userDAO.getCompanyByUserId(client.getId());
		Address address = userDAO.getAddressByUser(client.getId());

		mv.addObject("assignedProduct", assignedProduct);
		mv.addObject("company", company);
		mv.addObject("address", address);
		mv.addObject("durations", Util.getAllPaymentDuration());
		mv.addObject("title", "Home");
		mv.addObject("userClickClientPaymentDetails", true);
		return mv;
	}

	@RequestMapping("/clientPaymentDeatils/{id}/{paymentDuration}")
	public ModelAndView clientPaymentDeatils(@PathVariable int id,
			@PathVariable String paymentDuration) {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(id);
		assignedProduct.setPaymentDuration(Util.DURATION_MONTHLY);
		productDAO.updateAssignedProduct(assignedProduct);
		Calendar calStart = Calendar.getInstance();
		Calendar calEnd = Calendar.getInstance();
		calEnd.add(Calendar.MONTH, 1);

		if (paymentDuration != null) {
			if (paymentDuration.equals(Util.DURATION_MONTHLY)) {
				assignedProduct.setPaymentDuration(Util.DURATION_MONTHLY);
				productDAO.updateAssignedProduct(assignedProduct);
				assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
				calEnd = Calendar.getInstance();
				calEnd.add(Calendar.MONTH, 1);
			} else if (paymentDuration.equals(Util.DURATION_QUARTERLY)) {
				assignedProduct.setPaymentDuration(Util.DURATION_QUARTERLY);
				productDAO.updateAssignedProduct(assignedProduct);
				assignedProduct.setMainPrice(assignedProduct
						.getQuarterlyPrice());
				calEnd = Calendar.getInstance();
				calEnd.add(Calendar.MONTH, 3);
			} else if (paymentDuration.equals(Util.DURATION_HAlF_YEARLY)) {
				assignedProduct.setPaymentDuration(Util.DURATION_HAlF_YEARLY);
				productDAO.updateAssignedProduct(assignedProduct);
				assignedProduct.setMainPrice(assignedProduct
						.getHalfYearlyPrice());
				calEnd = Calendar.getInstance();
				calEnd.add(Calendar.MONTH, 6);
			} else if (paymentDuration.equals(Util.DURATION_YEARLY)) {
				assignedProduct.setPaymentDuration(Util.DURATION_YEARLY);
				productDAO.updateAssignedProduct(assignedProduct);
				assignedProduct.setMainPrice(assignedProduct.getAnnualPrice());
				calEnd = Calendar.getInstance();
				calEnd.add(Calendar.YEAR, 1);
			}
		}
		assignedProduct.setStartdate(calStart.getTime());
		assignedProduct.setEndDate(calEnd.getTime());
		double totalDue = assignedProduct.getMainPrice()
				+ (assignedProduct.getMainPrice() * assignedProduct.getTax() / 100);
		assignedProduct.setTotalPrice(totalDue);

		Company company = userDAO.getCompanyByUserId(client.getId());
		Address address = userDAO.getAddressByUser(client.getId());

		mv.addObject("assignedProduct", assignedProduct);
		mv.addObject("company", company);
		mv.addObject("address", address);
		mv.addObject("durations", Util.getAllPaymentDuration());
		mv.addObject("title", "Home");
		mv.addObject("userClickClientPaymentDetails", true);
		return mv;
	}

	@RequestMapping("/clientPaymentConfirmation/{id}")
	public ModelAndView clientPaymentConfirmation(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		Company company = userDAO.getCompanyByUserId(client.getId());
		Address address = userDAO.getAddressByUser(client.getId());
		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(id);

		if (assignedProduct.getPaymentDuration().equals(Util.DURATION_MONTHLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_QUARTERLY)) {
			assignedProduct.setMainPrice(assignedProduct.getQuarterlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_HAlF_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getHalfYearlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getAnnualPrice());
		}
		double totalDue = assignedProduct.getMainPrice()
				+ (assignedProduct.getMainPrice() * assignedProduct.getTax() / 100);
		assignedProduct.setTotalPrice(totalDue);
		Calendar cal1 = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");
		String formatted = format1.format(cal1.getTime());
		mv.addObject("todaysDate", formatted);
		mv.addObject("assignedProduct", assignedProduct);
		mv.addObject("company", company);
		mv.addObject("address", address);
		mv.addObject("title", "Home");
		mv.addObject("userClickClientPaymentConfirmation", true);
		return mv;
	}

	@RequestMapping("/checkout/{id}")
	public ModelAndView checkout(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(id);

		if (assignedProduct.getPaymentDuration().equals(Util.DURATION_MONTHLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_QUARTERLY)) {
			assignedProduct.setMainPrice(assignedProduct.getQuarterlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_HAlF_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getHalfYearlyPrice());
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getAnnualPrice());
		}
		double totalDue = assignedProduct.getMainPrice()
				+ (assignedProduct.getMainPrice() * assignedProduct.getTax() / 100);
		assignedProduct.setTotalPrice(totalDue);
		Calendar cal1 = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");
		String formatted = format1.format(cal1.getTime());
		mv.addObject("todaysDate", formatted);
		mv.addObject("assignedProduct", assignedProduct);
		mv.addObject("title", "Home");
		mv.addObject("userClickClientCheckoutform", true);
		return mv;
	}

	@RequestMapping(value = "/paymentActivity/{id}")
	public ModelAndView paymentActivity(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		System.out.println("assigned product id is [" + id + "]");

		User client1 = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());
		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(id);
		Calendar calStart = Calendar.getInstance();
		Calendar calEnd = Calendar.getInstance();
		if (assignedProduct.getPaymentDuration().equals(Util.DURATION_MONTHLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
			calEnd = Calendar.getInstance();
			calEnd.add(Calendar.MONTH, 1);
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_QUARTERLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
			calEnd = Calendar.getInstance();
			calEnd.add(Calendar.MONTH, 3);
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_HAlF_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
			calEnd = Calendar.getInstance();
			calEnd.add(Calendar.MONTH, 6);
		} else if (assignedProduct.getPaymentDuration().equals(
				Util.DURATION_YEARLY)) {
			assignedProduct.setMainPrice(assignedProduct.getMonthlyPrice());
			calEnd = Calendar.getInstance();
			calEnd.add(Calendar.YEAR, 1);
		}
		double totalDue = assignedProduct.getMainPrice()
				+ (assignedProduct.getMainPrice() * assignedProduct.getTax() / 100);
		assignedProduct.setTotalPrice(totalDue);

		Calendar cal1 = Calendar.getInstance();
		assignedProduct.setLastPaymentDate(cal1.getTime());
		assignedProduct.setStartdate(calStart.getTime());
		assignedProduct.setEndDate(calEnd.getTime());
		assignedProduct.setStatus(Util.STAUS_ACTIVE);
		productDAO.updateAssignedProduct(assignedProduct);
		mv.addObject("userClickClientCheckoutConfirmationform", true);

		BillDetails billDetail = new BillDetails();
		billDetail.setAssignedProduct(assignedProduct);
		billDetail.setEndDate(assignedProduct.getEndDate());
		billDetail.setMainPrice(assignedProduct.getMainPrice());
		billDetail.setPaymentDate(assignedProduct.getLastPaymentDate());
		billDetail.setPaymentDuration(assignedProduct.getPaymentDuration());
		billDetail.setStartDate(assignedProduct.getStartdate());
		billDetail.setTax(assignedProduct.getTax());
		billDetail.setTotalPrice(assignedProduct.getTotalPrice());
		productDAO.saveBillDetails(billDetail);

		return mv;
	}

	@RequestMapping("/paymentHistory")
	public ModelAndView paymentHistory(
			@RequestParam(name = "assignedProductId", required = false) Integer assignedProductId) {
		User client = userDAO.getByEmail(globalController.getUserModel()
				.getEmail());

		List<AssignedProducts> assignedProducts = productDAO
				.getAssignedProducts(client);
		AssignedProducts assignedProduct = null;
		if (assignedProductId != null) {
			assignedProduct = productDAO
					.getAssignedProductById(assignedProductId);
		} else {
			if (assignedProducts != null && assignedProducts.size() > 0) {
				assignedProduct = assignedProducts.get(0);
			}
		}

		List<BillDetails> billDetails = new ArrayList<BillDetails>();
		if (assignedProduct != null) {
			billDetails = productDAO
					.getAllBillsbyAssignedProducts(assignedProduct);
		}

		for (BillDetails details : billDetails) {
			details.setPaymentDateStringFormat(Util
					.changeTimestampToString3(new Timestamp(details
							.getPaymentDate().getTime())));
		}

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickPaymentHistory", true);
		mv.addObject("title", "Payment History");
		mv.addObject("assignedProducts", assignedProducts);
		mv.addObject("assignedProduct", assignedProduct);
		mv.addObject("billDetails", billDetails);
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

	@RequestMapping(value = "/startTrail")
	public ModelAndView startTrail(
			@RequestParam(name = "assignedProductId", required = false) int assignedProductId) {
		AssignedProducts assignedProduct = productDAO
				.getAssignedProductById(assignedProductId);
		System.out.println("selected assigned product id is ["
				+ assignedProductId + "]");

		if (!assignedProduct.isTermsAndCondition()) {
			ModelAndView mv = new ModelAndView("acceptTermsAndcond");
			mv.addObject("assignedProduct", assignedProduct);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("startTrailPage");
			assignedProduct.setTrialPeriod(10);
			Calendar cStart = Calendar.getInstance();
			Calendar cEnd = Calendar.getInstance();
			cEnd.add(Calendar.DAY_OF_MONTH, 10);
			assignedProduct.setStartdate(cStart.getTime());
			assignedProduct.setEndDate(cEnd.getTime());
			mv.addObject("assignedProduct", assignedProduct);
			return mv;
		}
	}

	@RequestMapping(value = "/updateTrail", method = RequestMethod.POST)
	public String updateTrail(
			@ModelAttribute("assignedProduct") AssignedProducts assignedProduct) {
		AssignedProducts assignedProduct2 = productDAO
				.getAssignedProductById(assignedProduct.getId());
		System.out.println("selected assigned product id is ["
				+ assignedProduct.getId() + "] start date is ["
				+ assignedProduct.getStartdate() + "] and end date is ["
				+ assignedProduct.getEndDate() + "]");
		assignedProduct2.setTrialPeriod(assignedProduct.getTrialPeriod());
		Calendar cStart = Calendar.getInstance();
		Calendar cEnd = Calendar.getInstance();
		cEnd.add(Calendar.DAY_OF_MONTH, 10);
		assignedProduct2.setStartdate(cStart.getTime());
		assignedProduct2.setEndDate(cEnd.getTime());
		assignedProduct2.setStatus(Util.STATUS_TRIAL);
		productDAO.updateAssignedProduct(assignedProduct2);
		return "redirect:/cl/home?assignedProductId=" + assignedProduct.getId();
	}

	@RequestMapping(value = "/AcceptTermsAndCondition", method = RequestMethod.POST)
	public String AcceptTermsAndCondition(
			@ModelAttribute("assignedProduct") AssignedProducts assignedProduct) {
		AssignedProducts assignedProduct2 = productDAO
				.getAssignedProductById(assignedProduct.getId());
		assignedProduct2.setTermsAndCondition(true);
		productDAO.updateAssignedProduct(assignedProduct2);

		return "redirect:/cl/startTrail?assignedProductId="
				+ assignedProduct.getId();
	}
}
