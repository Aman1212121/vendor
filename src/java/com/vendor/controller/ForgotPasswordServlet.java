package com.vendor.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.vendor.model.VendorDAO;
import com.vendor.model.VendorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author T460
 */
public class ForgotPasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String msgSubject="";
    private String msgText="";
    private final String PASSSWORD = "ptrt evrs owsk krut";  //Password of the Goole(gmail) account
    private final String SENDER = "bhartiaman542@gmail.com";  //From addresss
    
    public String getMsgSubject() {
        return msgSubject;
    }

    public void setMsgSubject(String msgSubject) {
        this.msgSubject = msgSubject;
    }

    public String getMsgText() {
        return msgText;
    }

    public void setMsgText(String msgText) {
        this.msgText = msgText;
    }



    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("email");

        // Assuming you have a UserService class to handle user-related operations
        // UserService userService = new UserService();
        VendorDAO vdao=new VendorDAO();
        vdao.setEmail(email);
        VendorDTO vdto=new VendorDTO();
        boolean b=vdto.isEmailExists(vdao);        
        

        // Check if the email exists in the database
        // if (userService.isEmailExists(email)) {
            // Generate OTP
            
        if(b){    
            int otp = ForgotPasswordServlet.otpGenerat();

            // Save OTP in session for validation
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            // Send email
            
            ForgotPasswordServlet fp = new ForgotPasswordServlet();
             fp.createAndSendEmail(email ,"Forgot Password - OTP", "Your OTP is: " + otp);
            
            // Redirect to OTP verification pag
            response.sendRedirect("otp-verification.jsp");
            
        }else
        // } else {
            // Handle case where email does not exist
               response.sendRedirect("forgot-password.jsp?error=email_not_found");
        // }

        }
    }
    public static int otpGenerat() {
        int random = (int) (Math.random() * 999999);
        System.out.println("Random Number is: " + random);
        return random;
    }
    public boolean createAndSendEmail(String email, String msgSubject, String msgText) {
        boolean b=false;
        this.msgSubject = msgSubject;
        this.msgText = msgText;
         if(sendEmailMessage(email)){
           b=true;
         }
         return b;
    }
        private boolean sendEmailMessage(String email) {
        boolean b=false ;
        
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER, PASSSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER)); //Set from address of the email
            message.setContent(msgText, "text/html"); //set content type of the email

            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

            message.setSubject(msgSubject); //Set email message subject
            Transport.send(message); //Send email message

            System.out.println("sent email successfully!");
            b=true;
           

        } catch (MessagingException e) {

            System.out.println(e);
        }
        return b;
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
        } catch (SQLException ex) {
            Logger.getLogger(ForgotPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ForgotPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
