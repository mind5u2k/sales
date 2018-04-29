package net.ghosh.salesBackend.dto;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

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

	private double monthlyPrice;
	private double quarterlyPrice;
	private double halfYearlyPrice;
	private double annualPrice;
	private double mainPrice;
	private double tax;
	private double totalPrice;
	private String previousState;
	private String status;
	private Date startdate;
	private Date endDate;
	private Date lastPaymentDate;

	@Transient
	private Date StatementGenerationDate;

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

	public double getMonthlyPrice() {
		return monthlyPrice;
	}

	public void setMonthlyPrice(double monthlyPrice) {
		this.monthlyPrice = monthlyPrice;
	}

	public double getQuarterlyPrice() {
		return quarterlyPrice;
	}

	public void setQuarterlyPrice(double quarterlyPrice) {
		this.quarterlyPrice = quarterlyPrice;
	}

	public double getHalfYearlyPrice() {
		return halfYearlyPrice;
	}

	public void setHalfYearlyPrice(double halfYearlyPrice) {
		this.halfYearlyPrice = halfYearlyPrice;
	}

	public double getAnnualPrice() {
		return annualPrice;
	}

	public void setAnnualPrice(double annualPrice) {
		this.annualPrice = annualPrice;
	}

	public double getTax() {
		return tax;
	}

	public void setTax(double tax) {
		this.tax = tax;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getMainPrice() {
		return mainPrice;
	}

	public void setMainPrice(double mainPrice) {
		this.mainPrice = mainPrice;
	}

	public Date getLastPaymentDate() {
		return lastPaymentDate;
	}

	public void setLastPaymentDate(Date lastPaymentDate) {
		this.lastPaymentDate = lastPaymentDate;
	}

	public String getPreviousState() {
		return previousState;
	}

	public void setPreviousState(String previousState) {
		this.previousState = previousState;
	}

	public Date getStatementGenerationDate() {
		return StatementGenerationDate;
	}

	public void setStatementGenerationDate(Date statementGenerationDate) {
		StatementGenerationDate = statementGenerationDate;
	}
}
