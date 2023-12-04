/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vendor.model;

import com.vendor.service.DBCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T460
 */
public class CampaignDTO {
   public List<CampaignDAO> getAllCampaigns() {
    List<CampaignDAO> campaignList = new ArrayList<>();

    try (Connection con = DBCon.DBConnnection();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM CampaignDetails");
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            CampaignDAO campaign = new CampaignDAO();
            campaign.setVendor_Id(rs.getInt("vendor_Id"));
            campaign.setMaximum_appointment(rs.getInt("maximum_appointment"));
            campaign.setName(rs.getString("name"));
            campaign.setEmail(rs.getString("email"));
            campaign.setAddress(rs.getString("address"));
            campaign.setCampaign_Date(rs.getDate("Campaign_Date"));
            campaign.setImage(rs.getString("image"));
            campaignList.add(campaign);
        }

    } catch (SQLException e) {
        // Log the exception or handle it more appropriately
        e.printStackTrace(); // Logging or replace with appropriate handling
    }

    return campaignList;
}
     public boolean CampaignsInsert(CampaignDAO cdao) throws SQLException {
    boolean b = false;
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DBCon.DBConnnection();
        String query = "INSERT INTO campaigndetails (name, email, maximum_appointment, Campaign_Date, Address, vendor_Id , image) VALUES (?, ?, ?, ?, ?, ?, ? )";
        ps = con.prepareStatement(query);
        ps.setString(1, cdao.getName());
        ps.setString(2, cdao.getEmail());
        ps.setInt(3, cdao.getMaximum_appointment());
        ps.setDate(4, new java.sql.Date(cdao.getCampaign_Date().getTime())); // Convert to java.sql.Date
        ps.setString(5, cdao.getAddress());
        ps.setInt(6, cdao.getVendor_Id());
        ps.setString(7, cdao.getImage());
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
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
     public boolean removecamp(CampaignDAO cdao) throws SQLException{
            boolean b=false;
            Connection con = null;
            PreparedStatement ps = null;
            con=DBCon.DBConnnection();
            String query="delete from campaigndetails where vendor_Id=? and name=?";
            ps=con.prepareStatement(query);
            ps.setInt(1,cdao.getVendor_Id());
            ps.setString(2,cdao.getName());
            if(ps.executeUpdate()>0){
                b=true;           
            }            
            return b;
     }
     public List<CampaignDAO> searchByName(String searchName) throws SQLException {
        List<CampaignDAO> searchResults = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Connection connection=DBCon.DBConnnection();

        try {
            // SQL query to search for persons by name
            String sql = "SELECT * FROM campaigndetails WHERE name LIKE ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + searchName + "%");

            // Execute the query
            rs = preparedStatement.executeQuery();

            // Process the result set
            while (rs.next()) {
                CampaignDAO campaign = new CampaignDAO(); 
               campaign.setVendor_Id(rs.getInt("vendor_Id"));
               campaign.setMaximum_appointment(rs.getInt("maximum_appointment"));
               campaign.setName(rs.getString("name"));
               campaign.setEmail(rs.getString("email"));
               campaign.setAddress(rs.getString("address"));
               campaign.setCampaign_Date(rs.getDate("Campaign_Date"));
               campaign.setImage(rs.getString("image")); 
                searchResults.add(campaign);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the reverse order of their creation
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }

}
