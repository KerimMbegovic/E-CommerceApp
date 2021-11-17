/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.NarudzbaModel;
import Beans.Narudzbe;
import Beans.Proizvod;
import Beans.User;
import Utils.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.stream.Collectors;

/**
 *
 * @author Kerim
 */
@WebServlet(name = "Narudzba", urlPatterns = {"/Narudzba"})
public class NarudzbaServlet extends HttpServlet {

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
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            
            ArrayList<Proizvod> korpa_list = (ArrayList<Proizvod>) request.getSession().getAttribute("korpa-list");
            List<Proizvod> korpaProizvod = null;
            float total = 0;
            if(korpa_list != null) {
                Proizvod pr = new Proizvod(DB.getConnection());
                korpaProizvod = pr.getKorpaProducts(korpa_list);
                total = pr.getKorpaTotal(korpa_list);
                request.setAttribute("korpa_list", korpa_list);
                request.setAttribute("total", total);
            } else {
                response.sendRedirect("korpa.jsp");
            }
           
            StringJoiner proizvodi = new StringJoiner(", ");
            
            for(Proizvod pr:korpaProizvod){
                proizvodi.add(pr.getNaziv());
            }
            
            
           User user = (User) request.getSession().getAttribute("user");
           
           if(korpa_list != null) {
                NarudzbaModel narudzba = new NarudzbaModel();
                narudzba.setProizvodi(proizvodi.toString());
                narudzba.setTotal_cijena(total);
                narudzba.setUser_id(user.getId());
                narudzba.setStatus(0);
                narudzba.setDate(formatter.format(date));

                Narudzbe n = new Narudzbe(DB.getConnection());

                boolean result = n.insertNarudzba(narudzba);
                
                if(result){
                    korpa_list.clear();
                }
               
               
               response.sendRedirect("orders.jsp");
               
           } else {
               response.sendRedirect("korpa.jsp");
           }
        } catch (Exception e) {
            e.printStackTrace();
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
        doGet(request, response);
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
