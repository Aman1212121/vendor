/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vendor.controller;

import com.vendor.model.CampaignDAO;
import com.vendor.model.CampaignDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author T460
 */
public class InsertCampaignTask extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String name = request.getParameter("name");
String email = request.getParameter("email");
String max_appointments = request.getParameter("max_appointments");
String Campaign_Date = request.getParameter("Campaign_Date");
String Address = request.getParameter("Address");
String vendorId = request.getParameter("VendorId");
String image=request.getParameter("image");

CampaignDAO cdao = new CampaignDAO();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

try {
    Date date = dateFormat.parse(Campaign_Date);
   // System.out.println("Converted Date: " + date);
    cdao.setCampaign_Date(date);
    cdao.setAddress(Address);
    cdao.setMaximum_appointment(Integer.parseInt(max_appointments));
    cdao.setName(name);
    cdao.setEmail(email);
    cdao.setVendor_Id(Integer.parseInt(vendorId));
    cdao.setImage(image);
    
   

    CampaignDTO cdto = new CampaignDTO();
    boolean b = false;
    try{
    b = cdto.CampaignsInsert(cdao);
    }catch(SQLException ex){
         out.println("This is my custom exception!");
    }
    if (b) {
        response.sendRedirect("VendorHomePage.jsp");
    } else {
        response.sendRedirect("AddCampaign.jsp");
    }
} catch (ParseException | NumberFormatException e) { 
           response.sendRedirect("AddCampaign.jsp"); // Redirect to an error page
}
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertCampaignTask.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(InsertCampaignTask.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertCampaignTask.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(InsertCampaignTask.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
