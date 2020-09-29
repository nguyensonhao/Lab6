/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.UserModel;
import Object.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hao Nguyen
 */
@WebServlet(name = "addNEW", urlPatterns = {"/addNEW"})
public class addNEW extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addNEW</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addNEW at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            
        
        HttpSession session = request.getSession();
        String username = "";
        String password = "";
        String fname = "";
        String lname = "";
        int isSend = 1;
        String website = "";
        int Role = 1;
        String email = "";

        //get all information of new account
        if (request.getParameter("txtUser") != null) {
            username = request.getParameter("txtUser");
        }
        if (request.getParameter("password") != null) {
            password = request.getParameter("password");
        }
        if (request.getParameter("fname") != null) {
            fname = request.getParameter("fname");
        }
        if (request.getParameter("lname") != null) {
            lname = request.getParameter("lname");
        }
        if (request.getParameter("isSend") != null) {
            isSend = Integer.parseInt(request.getParameter("isSend"));
        }
        if (request.getParameter("website") != null) {
            website = request.getParameter("website");
        }
        if (request.getParameter("email") != null) {
            email = request.getParameter("email");
        }
        if (request.getParameter("role") != null) {
            Role = Integer.parseInt(request.getParameter("role"));
        }
        session.setAttribute("txtUser", username);
        session.setAttribute("fname", fname);
        session.setAttribute("lname", lname);
        session.setAttribute("website", website);
        session.setAttribute("email", email);

        //change password
        String md_password = MyUtils.PasswordUtilities.getEncryptPassword(password);

        UserModel um = new UserModel();
        ArrayList<User> listU = um.loadAccount(); //get all acocunt
        boolean checkUser = true;
        boolean checkEmail = true;
        //check username exits or not
        for (User u : listU) {
            if (username.equals(u.getUsername())) {
                checkUser = false;
            }
            if (email.equals(u.getEmail())) {
                checkEmail = false;
            }
        }
        //if not exist

        if (checkUser && checkEmail) {
            um.insertAccount(username, md_password, fname, lname, isSend, website, Role, email);
            session.removeAttribute("txtUser");
            session.removeAttribute("fname");
            session.removeAttribute("lname");
            session.removeAttribute("website");
            session.removeAttribute("email");
            response.sendRedirect("index.jsp");

        } else { // if exist
            if (!checkUser) { // if exist
                session.setAttribute("erorr","Username is duplicated");
                response.sendRedirect("CreateAccount.jsp?checkUser=false");
            } else if (!checkEmail) {
                response.sendRedirect("CreateAccount.jsp?checkEmail=false");
                session.setAttribute("erorr","Email is duplicated");
            }
        }
        } catch (IOException | NumberFormatException | NoSuchAlgorithmException | SQLException e) {
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
