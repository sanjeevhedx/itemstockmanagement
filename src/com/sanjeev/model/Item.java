package com.sanjeev.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="items")
public class Item {
	
	@Id
	@Column(name="item_code")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int itemCode;
	
	@Column(name="item_name")
	private String itemName;
	
	@Column(name="unit")
	private String unit;
	
	@Column(name="beginning_inventory")
	private int beginningInventory;
	
	@Column(name="quantity_on_hand")
	private int quantityOnHand;
	
	@Column(name="price_per_unit")
	private double pricePerUnit;
	
	@Column(name="date_of_manufacture")
	private Date dateOfManufacture;
	
	@Column(name="date_of_expiry")
	private Date dateOfExpiry;
	
	@Column(name="location")
	private String location;
	
	@Column(name="item_category")
	private String itemCategory;
	
	public Item() {
		
	}

	public Item(int itemCode, String itemName, String unit, int beginningInventory, int quantityOnHand,
			double pricePerUnit, Date dateOfManufacture, Date dateOfExpiry, String location, String itemCategory) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.unit = unit;
		this.beginningInventory = beginningInventory;
		this.quantityOnHand = quantityOnHand;
		this.pricePerUnit = pricePerUnit;
		this.dateOfManufacture = dateOfManufacture;
		this.dateOfExpiry = dateOfExpiry;
		this.location = location;
		this.itemCategory = itemCategory;
	}

	public Item(String itemName, String unit, int beginningInventory, int quantityOnHand, double pricePerUnit,
			Date dateOfManufacture, Date dateOfExpiry, String location, String itemCategory) {
		super();
		this.itemName = itemName;
		this.unit = unit;
		this.beginningInventory = beginningInventory;
		this.quantityOnHand = quantityOnHand;
		this.pricePerUnit = pricePerUnit;
		this.dateOfManufacture = dateOfManufacture;
		this.dateOfExpiry = dateOfExpiry;
		this.location = location;
		this.itemCategory = itemCategory;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getBeginningInventory() {
		return beginningInventory;
	}

	public void setBeginningInventory(int beginningInventory) {
		this.beginningInventory = beginningInventory;
	}

	public int getQuantityOnHand() {
		return quantityOnHand;
	}

	public void setQuantityOnHand(int quantityOnHand) {
		this.quantityOnHand = quantityOnHand;
	}

	public double getPricePerUnit() {
		return pricePerUnit;
	}

	public void setPricePerUnit(double pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}

	public Date getDateOfManufacture() {
		return dateOfManufacture;
	}

	public void setDateOfManufacture(Date dateOfManufacture) {
		this.dateOfManufacture = dateOfManufacture;
	}

	public Date getDateOfExpiry() {
		return dateOfExpiry;
	}

	public void setDateOfExpiry(Date dateOfExpiry) {
		this.dateOfExpiry = dateOfExpiry;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	@Override
	public String toString() {
		return "Item [itemCode=" + itemCode + ", itemName=" + itemName + ", unit=" + unit + ", beginningInventory="
				+ beginningInventory + ", quantityOnHand=" + quantityOnHand + ", pricePerUnit=" + pricePerUnit
				+ ", dateOfManufacture=" + dateOfManufacture + ", dateOfExpiry=" + dateOfExpiry + ", location="
				+ location + ", itemCategory=" + itemCategory + "]";
	}
	
	
}
