/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vendor.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vendor.service.DBCon;

/**
 *
 * @author T460
 */
public class VendorDTO {
    public boolean updatedetails(VendorDAO vdao) throws SQLException {
    boolean b = false;
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DBCon.DBConnnection();
        String query = "UPDATE vendordetails SET name=?, email=?, phone=?, address=? WHERE vendor_Id=?";
        ps = con.prepareStatement(query);
        ps.setString(1, vdao.getName());
        ps.setString(2, vdao.getEmail());
        ps.setString(3, vdao.getPhone());
        ps.setString(4, vdao.getAddress());
        ps.setInt(5, vdao.getVendor_id());

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            // Update was successful, fetch updated data from the database
            b = true;
        }
    } finally {
        // Close resources in a finally block to ensure they are always closed
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }

    return b;
}
    public boolean passwordUpdate(VendorDAO vdao) throws SQLException{
         boolean b=false;
         Connection con=DBCon.DBConnnection();
         ResultSet rs;
         PreparedStatement ps;
         String query="update vendordetails set password=? where  vendor_Id=?";
         ps=con.prepareStatement(query);
         String pass = vdao.getPassword();
            byte[] enc = pass.getBytes();
            String encname = "";

            for (int i = 0; i < enc.length; i++) {
                if (!encname.isEmpty()) {
                    encname += "A";
                }
                int modi = enc[i] * 2;
                encname += modi;
            }
            ps.setString(1, encname);    
            ps.setInt(2,vdao.getVendor_id());
            if(ps.executeUpdate()>0){
                 b=true;
            }
         
         return b;
    
    }
    public static boolean venLogin(VendorDAO vdao) throws SQLException{
           boolean b=false;
           Connection con=DBCon.DBConnnection();
           PreparedStatement ps;
           String query="select * from vendordetails where email=? and password=?";
           ps=con.prepareStatement(query);
           ps.setString(1, vdao.getEmail());
           String pass = vdao.getPassword();
              byte[] enc = pass.getBytes();
              String encname = "";
              for (int i = 0; i < enc.length; i++) {
                if (!encname.isEmpty()) {
                    encname += "A";
                }
                int modi = enc[i] * 2;
                encname += modi;
             }
            
             ps.setString(2, encname);
             ResultSet rs=ps.executeQuery();
             
             if(rs.next()){
                 vdao.setEmail(rs.getString("email"));
                 vdao.setName(rs.getString("name"));
                 vdao.setAddress(rs.getString("address"));
                 vdao.setPhone(rs.getString("phone"));
                 vdao.setVendor_id(rs.getInt("vendor_Id"));
                 vdao.setPassword(rs.getString("password"));
                 vdao.setCampaignPhoto(rs.getString("campaignPhoto"));
                 
                  b=true;
             }
           
           return b;       
    }
    public static boolean insert(VendorDAO vdao) throws SQLException{
           boolean b=false;
           Connection con=DBCon.DBConnnection();
            //ResultSet rs;
            PreparedStatement ps;
             String query = "insert into vendordetails(name,email,phone,address,vendor_Id,campaignPhoto,password) values(?,?,?,?,?,?,?)";
        try {
              
              ps = con.prepareStatement(query);
              ps.setString(1,vdao.getName());
              ps.setString(2,vdao.getEmail());
              ps.setString(3, vdao.getPhone());
              ps.setString(4,vdao.getAddress());
              
              ps.setInt(5, vdao.getVendor_id());
              ps.setString(6, vdao.getCampaignPhoto());
              String pass = vdao.getPassword();
              byte[] enc = pass.getBytes();
              String encname = "";
              for (int i = 0; i < enc.length; i++) {
                if (!encname.isEmpty()) {
                    encname += "A";
                }
                int modi = enc[i] * 2;
                encname += modi;
             }
             ps.setString(7, encname);
            
             if(ps.executeUpdate()>0){
                 b=true;
             }                  
        } catch (SQLException ex) {
           
        }
           return b;
    }
    
}
