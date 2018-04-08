package net.ghosh.salesBackend.dto;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class AssignedProducts implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	private User salesRepresentative;

	@ManyToOne
	private User client;

	@ManyToOne
	private Product product;

	private String status;
	private Date startdate;
	private Date endDate;
	private int trialPeriod;
	private String paymentDuration;

	private boolean termsAndCondition;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getClient() {
		return client;
	}

	public void setClient(User client) {
		this.client = client;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getSalesRepresentative() {
		return salesRepresentative;
	}

	public void setSalesRepresentative(User salesRepresentative) {
		this.salesRepresentative = salesRepresentative;
	}

	public int getTrialPeriod() {
		return trialPeriod;
	}

	public void setTrialPeriod(int trialPeriod) {
		this.trialPeriod = trialPeriod;
	}

	public String getPaymentDuration() {
		return paymentDuration;
	}

	public void setPaymentDuration(String paymentDuration) {
		this.paymentDuration = paymentDuration;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public boolean isTermsAndCondition() {
		return termsAndCondition;
	}

	public void setTermsAndCondition(boolean termsAndCondition) {
		this.termsAndCondition = termsAndCondition;
	}
}
