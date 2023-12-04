/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vendor.model;

import java.util.Date;

/**
 *
 * @author T460
 */
public class CampaignDAO {
    int maximum_appointment, vendor_Id;
    Date Campaign_Date;
    String name,email,address,image;

    public CampaignDAO(int maximum_appointment, Date Campaign_Date, String name, String email, String address, String image) {
        this.maximum_appointment = maximum_appointment;
        this.Campaign_Date = Campaign_Date;
        this.name = name;
        this.email = email;
        this.address = address;
        this.image =image;
    }
        public CampaignDAO() {
    }

    public CampaignDAO(int maximum_appointment, int vendor_Id, Date Campaign_Date, String name, String email, String address,String image) {
        this.maximum_appointment = maximum_appointment;
        this.vendor_Id = vendor_Id;
        this.Campaign_Date = Campaign_Date;
        this.name = name;
        this.email = email;
        this.address = address;
        this.image=image;
    }

    public void setMaximum_appointment(int maximum_appointment) {
        this.maximum_appointment = maximum_appointment;
    }

    public void setVendor_Id(int vendor_Id) {
        this.vendor_Id = vendor_Id;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setCampaign_Date(Date Campaign_Date) {
        this.Campaign_Date = Campaign_Date;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getMaximum_appointment() {
        return maximum_appointment;
    }

    public int getVendor_Id() {
        return vendor_Id;
    }

    public Date getCampaign_Date() {
        return Campaign_Date;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }
    
}
