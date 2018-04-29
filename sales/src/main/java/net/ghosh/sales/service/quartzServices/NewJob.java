package net.ghosh.sales.service.quartzServices;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.ghosh.sales.service.MailNotificationServices.MailNotification;
import net.ghosh.salesBackend.Util;
import net.ghosh.salesBackend.dao.ProductDAO;
import net.ghosh.salesBackend.dao.UserDAO;
import net.ghosh.salesBackend.dto.AssignedProducts;

import org.springframework.beans.factory.annotation.Autowired;

public class NewJob {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ProductDAO productDAO;

	public void execute() {

		List<AssignedProducts> assignedProducts = productDAO
				.getAllAssignedProducts();

		Date date = Calendar.getInstance().getTime();
		System.out.println("New job is printing");

		for (AssignedProducts ap : assignedProducts) {
			if (ap.getStatus().equals(Util.STATUS_TRIAL)) {
				if (date.after(ap.getEndDate())) {
					ap.setStatus(Util.STATUS_DEACTIVATE);
					ap.setPreviousState(Util.STATUS_TRIAL);
					productDAO.updateAssignedProduct(ap);
				}
			} else if (ap.getStatus().equals(Util.STAUS_ACTIVE)) {
				if (date.compareTo(ap.getEndDate()) < 10) {
					if (date.compareTo(ap.getEndDate()) % 2 == 0) {
						System.out.println("asdfsadfadsfasdf");
						MailNotification
								.sendMail(
										ap.getClient().getEmail(),
										"",
										"",
										"Payment Notification",
										"Hi,<br><br> This is an automated notification that your current outstanding payment for product '"
												+ ap.getProduct()
														.getProductName()
												+ " is - '"
												+ ap.getTotalPrice()
												+ "' <br> And the payment Due date is : "
												+ ap.getEndDate()
												+ " <br><br>Please make your payment before Due Date for continue use.<br><br><br>Thanks<br>SLATE Team");
					}

				}
				if (date.after(ap.getEndDate())) {
					ap.setStatus(Util.STATUS_DEACTIVATE);
					ap.setPreviousState(Util.STAUS_ACTIVE);
					productDAO.updateAssignedProduct(ap);
				}
			}
		}
	}
}
