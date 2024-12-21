package com.example;

public class Supplier {
    private int supplierID;
    private String supplierName;
    private String contactNumber;
    private String contactEmail;

    public Supplier() {}

    public Supplier(int supplierID, String supplierName, String contactNumber, String contactEmail) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.contactNumber = contactNumber;
        this.contactEmail = contactEmail;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }
}
