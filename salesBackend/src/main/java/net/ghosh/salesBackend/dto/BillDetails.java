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
public class BillDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String billId;

	@ManyToOne
	private AssignedProducts assignedProduct;

	private Date paymentDate;
	@Transient
	private String paymentDateStringFormat;
	private Date startDate;
	private Date endDate;

	private String paymentDuration;
	private String paymentMethod;

	private double mainPrice;
	private double tax;
	private double totalPrice;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public AssignedProducts getAssignedProduct() {
		return assignedProduct;
	}

	public void setAssignedProduct(AssignedProducts assignedProduct) {
		this.assignedProduct = assignedProduct;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPaymentDuration() {
		return paymentDuration;
	}

	public void setPaymentDuration(String paymentDuration) {
		this.paymentDuration = paymentDuration;
	}

	public double getMainPrice() {
		return mainPrice;
	}

	public void setMainPrice(double mainPrice) {
		this.mainPrice = mainPrice;
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

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentDateStringFormat() {
		return paymentDateStringFormat;
	}

	public void setPaymentDateStringFormat(String paymentDateStringFormat) {
		this.paymentDateStringFormat = paymentDateStringFormat;
	}

}
