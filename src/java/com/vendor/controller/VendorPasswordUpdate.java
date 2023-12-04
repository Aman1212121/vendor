/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vendor.controller;

import com.vendor.model.VendorDAO;
import com.vendor.model.VendorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author T460
 */
public class VendorPasswordUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet VendorPasswordUpdate</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet VendorPasswordUpdate at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
              String pass=request.getParameter("oldpass");
              byte[] enc = pass.getBytes();
            String encname = "";

            for (int i = 0; i < enc.length; i++) {
                if (!encname.isEmpty()) {
                    encname += "A";
                }
                int modi = enc[i] * 2;
                encname += modi;
            }
            out.println(encname);
              String newPass=request.getParameter("npass");
              String confirmpass=request.getParameter("cpass");
               VendorDAO vdao = (VendorDAO) request.getSession().getAttribute("vdao");
            if(encname.equals(vdao.getPassword())){ 
            if(newPass.equals(confirmpass)){
           
            vdao.setPassword(newPass);
            VendorDTO udto=new VendorDTO();
            try {
                out.println(newPass);
                boolean b=udto.passwordUpdate(vdao);
                if(b){
                    response.sendRedirect("VendorHomePage.jsp");
                }else{
                    out.println("password not updated");
                    out.println("<a href='VendorHomePage.jsp'>go back to HomePage</a>");
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(VendorPasswordUpdate.class.getName()).log(Level.SEVERE, null, ex);
            }

            }else{
                response.sendRedirect("VendorHomePage.jsp");
            }
            }else{
                out.println(vdao.getPassword());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
