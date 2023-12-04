package com.vendor.model;

import java.io.Serializable;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author T460
 */
public class VendorDAO implements Serializable {
    int vendor_id;
    String name , email , phone , address, campaignPhoto ,Password;
    
    public VendorDAO() {
    }

    public VendorDAO(int vendor_id, String name, String email, String phone, String address, String campaignPhoto, String Password) {
        this.vendor_id = vendor_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.campaignPhoto = campaignPhoto;
        this.Password = Password;
    }

    public VendorDAO(String name, String email, String phone, String address, String campaignPhoto, String Password) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.campaignPhoto = campaignPhoto;
        this.Password = Password;
    }


    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCampaignPhoto(String campaignPhoto) {
        this.campaignPhoto = campaignPhoto;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getCampaignPhoto() {
        return campaignPhoto;
    }

    public String getPassword() {
        return Password;
    }
    
    @Override
    public String toString() {
        return "VendorDAO{" + "vendor_id=" + vendor_id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address=" + address + ", campaignPhoto=" + campaignPhoto + ", Password=" + Password + '}';
    }
    
}
