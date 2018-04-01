package net.ghosh.salesBackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	private User admin;

	private String productName;

	@Column(length = 65535, columnDefinition = "text")
	private String description;
	private double monthlyPrice;
	private double quarterlyPrice;
	private double halfYearlyPrice;
	private double annualPrice;
	private boolean active;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public User getAdmin() {
		return admin;
	}

	public void setAdmin(User admin) {
		this.admin = admin;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
